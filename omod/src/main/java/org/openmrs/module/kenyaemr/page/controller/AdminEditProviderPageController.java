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

import org.openmrs.Provider;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * Editing a provider, in the admin app
 */
public class AdminEditProviderPageController {
	
	public void controller(@RequestParam(value="providerId", required=false) Provider provider,
	                       PageModel model) {
		model.addAttribute("provider", provider);
	}
	
}
