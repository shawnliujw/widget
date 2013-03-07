package com.mpupa.web.action;

import java.util.HashMap;
import java.util.List;
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

import com.mpupa.model.CategoryModel;
import com.mpupa.model.ProductModel;
import com.mpupa.service.IBrandService;
import com.mpupa.service.ICategoryService;
import com.mpupa.service.IProductService;
import com.mpupa.service.IRetailerService;

@Controller
@RequestMapping("/{brandName}/{retailerName}")
public class ProductActionRegaine {

private Logger logger = Logger.getLogger(ProductAction.class);
	
	@Resource(name = "productService")
	private IProductService productService;
	
	@Resource(name="brandService")
	private IBrandService brandService;
	
	@Resource(name="retailerService")
	private IRetailerService retailerService;
	
	@Resource(name="categoryService")
	private ICategoryService categoryService;
	
	
	@RequestMapping("/unifiedRediect")
	public String unifiedRediect(@PathVariable String brandName,@PathVariable String retailerName,HttpServletResponse response,HttpServletRequest request){
		request.setAttribute("defaultRetailer", retailerName);
		Map<String, Object> brandModel = this.brandService.getBrandDetailByBrandName(brandName, request);
		return brandModel.get("templateFolder")+"/unified_email_rediect";
	}
	
	
	@RequestMapping("/product")
	public String getAllProducts(@PathVariable String brandName,@PathVariable String retailerName,HttpSession session,HttpServletResponse response,HttpServletRequest request) {
		
		request.setAttribute("defaultRetailer", retailerName);
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
		
		Map<String, List<ProductModel>> products = new HashMap<String, List<ProductModel>>();
		for (CategoryModel categoryModel : categoryModels) {
			List<ProductModel> list = this.productService.searchProductModels(brandName, retailerName, categoryModel.getName());
			if(null != list && list.size() > 0) {
				products.put(categoryModel.getName(), list);
			}
		}
		
		if(products.get("Foam").size() > 0) {
			ProductModel productModel = products.get("Foam").get(0);
			request.setAttribute("selectedBrandId", productModel.getBrandId());
			request.setAttribute("selectedRetailerId", productModel.getRetailerId());
			request.setAttribute("selectedClientId", productModel.getClientId());
		} else if(products.get("Solution").size() > 0) {
			ProductModel productModel = products.get("Solution").get(0);
			request.setAttribute("selectedBrandId", productModel.getBrandId());
			request.setAttribute("selectedRetailerId", productModel.getRetailerId());
			request.setAttribute("selectedClientId", productModel.getClientId());
		}
		
		request.setAttribute("products", products);
		
		return brandModel.get("templateFolder")+"/multiple_product";
	}
	
	@RequestMapping(value = "/basket")
	public String basket(@PathVariable String brandName,@PathVariable String retailerName,HttpServletResponse response,HttpServletRequest request,HttpSession session,String basketType){
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
		
		
		if(null != basketType && !"".equalsIgnoreCase(basketType)) {
			
			return brandModel.get("templateFolder")+"/basket_"+basketType.toLowerCase();
		} else {
			
			return brandModel.get("templateFolder")+"/basket";
		}
		
	}
	
	@RequestMapping("/terms")
	public String terms(@PathVariable String brandName,HttpServletRequest request,HttpSession session){
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
		if("nesquik".equalsIgnoreCase(brandName)){
			return "/jsp/mobile_terms";
		}else
			return "/jsp/pc_terms";
	}
	@RequestMapping("/help")
	public String help(@PathVariable String brandName,@PathVariable String retailerName,@PathVariable String categoryName,HttpServletRequest request,HttpSession session){
		request.setAttribute("defaultCategory", categoryName);
		request.setAttribute("defaultRetailer", retailerName);
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
		return brandModel.get("templateFolder") + "/help";
	}
	
	@RequestMapping("/thanks")
	public String thankYou1(@PathVariable String brandName,@PathVariable String retailerName,HttpServletRequest request,HttpSession session) {
		
		String basketUrlString = "/"+brandName+"/"+retailerName+"/product";
		request.setAttribute("basketUrl", basketUrlString);
		request.setAttribute("retailerName", retailerName);
		request.setAttribute("defaultRetailer", retailerName);
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
		return brandModel.get("templateFolder")+"/thanks";
	}
}
