package com.mpupa.web.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import com.mpupa.model.BrandModel;
import com.mpupa.model.CategoryModel;
import com.mpupa.model.ProductModel;
import com.mpupa.model.ProductRetailersModel;
import com.mpupa.model.RetailerModel;
import com.mpupa.model.TemplateModel;
import com.mpupa.service.IBrandService;
import com.mpupa.service.ICategoryService;
import com.mpupa.service.IRetailerService;
import com.mpupa.utils.WebAppUtil;

@Controller
@RequestMapping("/")
public class InitAction {

	private Logger logger = Logger.getLogger(InitAction.class);

	@Resource(name = "brandService")
	private IBrandService brandService;

	@Resource(name = "retailerService")
	private IRetailerService retailerService;
	
	@Resource(name="categoryService")
	private ICategoryService categoryService;

	// @Resource(name="categoryService")
	// private ICategoryService categoryService;

	@RequestMapping("/")
	public String init(HttpServletRequest request) {
        
		return "index";
	}

	@RequestMapping("/{brandName}")
	public String home(HttpServletRequest request,
			@PathVariable String brandName, HttpSession session) {
		System.out.println("------------------------------------------------------:"+request.getSession().getAttribute("version"));
		Map<String, Object> brandModel = (Map<String, Object>) session.getAttribute("brandModel"+brandName);

		if(null == brandModel) {
			brandModel = this.brandService.getBrandDetailByBrandName(brandName, request);
			session.setAttribute("brandModel"+brandName, brandModel);
			if (brandModel == null) {
				logger.error("can not find Brand :'" + brandName
						+ "' from database!");
				return "/jsp/error";
			}
		}
		
		session.setAttribute("fromHomePage", "true");
		request.setAttribute("brandModel", brandModel);
				

		List<RetailerModel> retailerList = (List<RetailerModel>) session.getAttribute(brandName + "RetailerList");
		if (retailerList == null) {
			retailerList = this.retailerService.searchRetailersByBrandName(brandName);
			if (null == retailerList || retailerList.size() == 0) {
				logger.error("can not find any Retailers for Brand :'" + brandName
						+ "' from database!");
				return "/error";
				
			} else {
				session.setAttribute(brandName + "RetailerList", retailerList);
				
			}
		}
		
		
		request.setAttribute("defaultRetailer", retailerList.get(0).getName());
		request.setAttribute("retailerList", retailerList);
		request.setAttribute("retailerString", retailerList.toString().toLowerCase());


		List<CategoryModel> categoryModels = (List<CategoryModel>) session.getAttribute("categoryList"+brandName);
		
		
		if (null == categoryModels || categoryModels.size() == 0) {
			
			categoryModels = this.categoryService.getCategoryByBrand(brandName);
			if (null == categoryModels || categoryModels.size() == 0) {
				logger.error("can not find categories for Brand :'" + brandName
						+ "'!");
				return "/jsp/error";
			} else {
				session.setAttribute("categoryList"+brandName, categoryModels);
			}
		}
		request.setAttribute("categoryList", categoryModels);

		String defaultCategory = "";
		for (CategoryModel categoryModel : categoryModels) {
			if (categoryModel.isDefaultSelected()) {
				defaultCategory = categoryModel.getName();
				request.setAttribute("defaultCategory", defaultCategory);
				break;
			}
		}
		List<Map<String, String>> list = this.brandService.getCategoryByBrandName(brandName);
		List<String> retailerStrings = new ArrayList<String>();
		for (RetailerModel retailer : retailerList) {
			String retailerName = retailer.getName();
			retailerStrings.add(retailerName);
			List<String> list1 = new ArrayList();
			boolean flag = false;
			for (Map<String, String> map : list) {
				String retailerName1 = map.get("retailerName");
				String categoryName = map.get("categoryName");
				
				if(WebAppUtil.proceedSingleQuote(retailerName).equalsIgnoreCase(retailerName1)) {
					
					if(WebAppUtil.proceedSingleQuote(categoryName).equalsIgnoreCase(defaultCategory)) {
						flag = true;
						//request.setAttribute(retailerName+"DefaultCategory", defaultCategory);
						retailer.setDefaultCategory(defaultCategory);
						break;
					} else {
						list1.add(categoryName);
					}
				}
				
			}
			if(brandName.equalsIgnoreCase("schwartz")) {
				retailer.setDefaultCategory(defaultCategory);
				//request.setAttribute(retailerName+"DefaultCategory", list1.get(0));
			} else if(!flag || defaultCategory.equals("")){
				retailer.setDefaultCategory(list1.get(0));
				
			}
		}

		request.setAttribute("retailerString", retailerStrings.toString().toLowerCase());
		
		return brandModel.get("templateFolder") + "/home";
		//return brandModel.getTemplate().getFolderName() + "/home";
		// session.setAttribute("brandModelJson",
		// WebAppUtil.proceedHibernateObjectRelation(brandModel));
		// session.setAttribute("retailerListJson",
		// WebAppUtil.proceedHibernateObjectRelation(retailerList));
		// List<Object> list =
		// this.categoryService.getCategorySiteByBrand(brandName);
		// System.out.println(list);
	}
	
	@RequestMapping("/{brandName}/{categoryName}/track")
	public String track(@PathVariable String brandName,@PathVariable String categoryName,HttpSession session,HttpServletRequest request) {
		Map<String, Object> brandModel = (Map<String, Object>) session.getAttribute("brandModel"+brandName);

		if(null == brandModel) {
			brandModel = this.brandService.getBrandDetailByBrandName(brandName, request);
			session.setAttribute("brandModel"+brandName, brandModel);
			if (brandModel == null) {
				logger.error("can not find Brand :'" + brandName
						+ "' from database!");
				return "/jsp/error";
			}
		}
		request.setAttribute("brandModel", brandModel);
		request.setAttribute("categoryName", categoryName);
		return brandModel.get("templateFolder")  + "/track";
	}

}
