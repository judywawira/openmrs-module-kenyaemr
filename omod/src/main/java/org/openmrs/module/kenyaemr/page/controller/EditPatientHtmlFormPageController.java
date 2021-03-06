/**
 * The contents of this file are subject to the OpenMRS Public License
 * Version 1.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://license.openmrs.org
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * Copyright (C) OpenMRS, LLC.  All Rights Reserved.
 */
package org.openmrs.module.kenyaemr.page.controller;

import java.util.Collections;
import java.util.List;

import org.openmrs.Encounter;
import org.openmrs.Form;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;


/**
 *
 */
public class EditPatientHtmlFormPageController {
	
	public String controller(@RequestParam("patientId") Patient patient,
	                         @RequestParam("formUuid") String formUuid,
	                         @RequestParam("returnUrl") String returnUrl,
	                         PageModel model) {
			Form form = Context.getFormService().getFormByUuid(formUuid);
			if (form == null) {
				throw new IllegalArgumentException("Cannot find form with uuid = " + formUuid);
			}
			List<Encounter> encounters = Context.getEncounterService().getEncounters(patient, null, null, null, Collections.singleton(form), null, null, null, null, false);
			if (encounters.size() == 0) {
				return "redirect:enterHtmlForm.page?patientId=" + patient.getId() + "&formUuid=" + formUuid + "&returnUrl=" + java.net.URLEncoder.encode(returnUrl);
			} else {
				// in case there are more than one, we pick the last one
				Encounter encounter = encounters.get(encounters.size() - 1);
				return "redirect:editHtmlForm.page?patientId=" + patient.getId() + "&encounterId=" + encounter.getEncounterId() + "&returnUrl=" + java.net.URLEncoder.encode(returnUrl);
			}
		}
	
}
