<script>
	function enterHtmlForm(htmlFormId, title) {
		/*
		showDialog({
			title: title,
			fragment: "enterHtmlForm",
			config: {
				patient: ${ patient.id },
				htmlFormId: htmlFormId
			}
		});
		*/
		location.href = ui.pageLink('enterHtmlForm', {
				patientId: ${ patient.id },
				htmlFormId: htmlFormId,
				returnUrl: '${ ui.thisUrl() }'
			});
	}
</script>

<% if (availableForms) { %>
	<fieldset>
		<legend>Fill Out a Form</legend>
		
		<% availableForms.each { %>
			${ ui.includeFragment("widget/button", [
				iconProvider: it.iconProvider,
				icon: it.icon,
				label: it.label,
				onClick: "enterHtmlForm(" + it.htmlFormId + ", '" + it.label + "');"
			]) }
			<br/>
		<% } %>
	</fieldset>
<% } %>

<% if (encounters) { %>
	<fieldset>
		<legend>This Visit</legend>

		${ ui.includeFragment("viewableEncounters", [ encounters: encounters ]) }
	</fieldset>
<% } %>