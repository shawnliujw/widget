package com.mpupa.web.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mpupa.model.ProductModel;
import com.mpupa.service.IBrandService;


@Controller
@RequestMapping("/{brandName}/{retailerName}")
public class RegisterAction {

	private Logger logger = Logger.getLogger(ProductAction.class);
	@Resource(name="brandService")
	private IBrandService brandService;
	
	/**
	 * update or create new account
	 * 
	 * @param productModel
	 * @param session
	 * @param response
	 * @author Shawn
	 * 2013-1-16
	 */
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public void create(@PathVariable String brandName,@PathVariable String retailerName,HttpSession session,HttpServletResponse response,HttpServletRequest request) {
		request.setAttribute("defaultRetailer", retailerName);
		request.setAttribute("defaultRetailerUpperCase", retailerName.toUpperCase());
		
		Map<String, Object> brandModel = (Map<String, Object>) session.getAttribute("brandModel"+brandName);

		if(null == brandModel) {
			brandModel = this.brandService.getBrandDetailByBrandName(brandName, null);
			session.setAttribute("brandModel"+brandName, brandModel);
			if (brandModel == null) {
				logger.error("can not find Brand :'" + brandName
						+ "' from database!");
				//return "/jsp/error";
			}
		}	
		request.setAttribute("brandModel", brandModel);
		
		//return brandModel.get("templateFolder")+"/basket";
		
	}
	
	/**
	 * go to init page
	 * @param session
	 * @param response
	 * @author Shawn
	 * 2013-1-16
	 */
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String init(@PathVariable String brandName,@PathVariable String retailerName,HttpSession session,HttpServletResponse response,HttpServletRequest request) {
		request.setAttribute("defaultRetailer", retailerName);
		request.setAttribute("defaultRetailerUpperCase", retailerName.toUpperCase());
		
		Map<String, Object> brandModel = (Map<String, Object>) session.getAttribute("brandModel"+brandName);

		if(null == brandModel) {
			brandModel = this.brandService.getBrandDetailByBrandName(brandName, null);
			session.setAttribute("brandModel"+brandName, brandModel);
			if (brandModel == null) {
				logger.error("can not find Brand :'" + brandName
						+ "' from database!");
				return "/jsp/error";
			}
		}	
		request.setAttribute("brandModel", brandModel);
		
		return brandModel.get("templateFolder")+"/new_account";
	}
}
