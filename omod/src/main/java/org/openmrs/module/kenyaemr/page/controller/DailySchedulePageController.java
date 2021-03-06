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

import java.util.Date;

import org.openmrs.module.reporting.common.DateUtil;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 */
public class DailySchedulePageController {

	public void controller(@RequestParam(required = false, value = "date") Date date,
	                       PageModel model) {
		if (date == null) {
			date = new Date();
		}
		date = DateUtil.getStartOfDay(date);
		model.addAttribute("date", date);
	}

}