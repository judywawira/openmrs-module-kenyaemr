<%
	// config supports "page", which will set up a clickFunction, that will have userId=... appended
	// provides a default numResultsFormatter to widget/panelList unless you override it 
	
	if (!config.numResultsFormatter) {
		config.numResultsFormatter = """function(listOfItems) { return listOfItems.length + " user(s)"; }""" 
	}
	
	def clickFunction = null
	if (config.page) {
		clickFunction = """function userPanelClicked() {
				location.href = pageLink('${ config.page }', { userId: jq(this).find('input[name=userId]').val() });
			}"""
	}
%>
<script>
	var userPanelOpts = {
		icon: '<img width="32" height="32" src="${ ui.resourceLink('uilibrary', 'images/user_32.png') }"/>',
		title: function(user) {
			return user.personName + '<input type="hidden" name="userId" value="' + user.userId + '"/>';
		},
		leftDetails: function(user) {
			var ret = '';
			if (user.username)
				ret += user.username + ' ';
			if (user.systemId)
				ret += user.systemId;
			return ret;
		},
		right: function(user) {
			return user.roles;
		}
	};
	
	function formatUserAsPanel(user) {
		return kenyaemr.threeColumnPanelFormatter(user, userPanelOpts);
	}
</script>

<%= ui.includeFragment("widget/panelList", config.merge([
		itemFormatter: "formatUserAsPanel",
		clickFunction: clickFunction
	])) %>