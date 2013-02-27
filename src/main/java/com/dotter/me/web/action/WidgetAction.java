package com.dotter.me.web.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dotter.me.utils.WebAppUtil;


@Controller
@RequestMapping("/")
public class WidgetAction {

	/**
	 * get data from http://proto.dotter.me accord familyId
	 * 
	 * @param familyId
	 * @param response
	 * @return
	 * @author Shawn 2013-2-26
	 */
	@RequestMapping("/{familyId}")
	public String showFamily(@PathVariable String familyId,
			HttpServletResponse response,HttpServletRequest request) {
		String string = WebAppUtil.getDataFromPrototypeDB("family", "1d1a95cf-f00e-42b3-b702-31c2efe562a6");
		
		request.setAttribute("familyId", familyId);
		request.setAttribute("family", string);
		
		return "home";
	}
}
