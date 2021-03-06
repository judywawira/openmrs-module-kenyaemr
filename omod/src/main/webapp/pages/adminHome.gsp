<%
	ui.decorateWith("standardKenyaEmrPage")
	
	def formatMap = { map ->
		def ret = "<table>"
		map.each {
			ret += '<tr valign="top">'
			ret += "<th>${ it.key }</th>"
			ret += "<td>${ ui.format(it.value) }</td>"
			ret += "</tr>"
		}
		ret += "</table>"
		return ret
	}
%>

<script>
	jq(function() {
		jq('.accordion').accordion();
	});
</script>

<div style="float: right; width: 30%;">
	<fieldset>
		<legend>Actions</legend>
		${ ui.includeFragment("widget/button", [
				iconProvider: "uilibrary",
				icon: "users_business_32.png",
				label: "Manage Accounts",
				href: ui.pageLink("adminManageAccounts")
			]) }
		<br/>
				
		${ ui.includeFragment("widget/button", [
				iconProvider: "uilibrary",
				icon: "application32.png",
				label: "Redo<br/>First-time Setup",
				href: ui.pageLink("adminFirstTimeSetup")
			]) }
		<br/>

		<hr/>

		${ ui.includeFragment("widget/button", [
				iconProvider: "uilibrary",
				icon: "refresh.png",
				label: "Install New<br/>Software Version",
				href: ui.pageLink("adminSoftwareVersion")
			]) }
		<br/>
				
	</fieldset>
</div>

<div style="float: left; width: 65%">
	<div class="accordion">
		<% info.each { %>
			<h3><a href="#">${ it.key }</a></h3>
			<div>
				<% if (it.value instanceof java.util.Map) { %>
					${ formatMap(it.value) }
				<% } else { %>
					${ ui.format(it.value) }
				<% } %>
			</div>
		<% } %>
	</div>
</div>