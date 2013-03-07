package com.mpupa.web.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import com.mpupa.model.RetailerModel;
import com.mpupa.model.SearchProductModel;
import com.mpupa.service.IBrandService;
import com.mpupa.service.ICategoryService;
import com.mpupa.service.IProductService;
import com.mpupa.service.IRetailerService;
import com.mpupa.utils.WebAppUtil;

@Controller
@RequestMapping("/{brandName}/{retailerName}/{categoryName}")
public class ProductAction {
	
	private Logger logger = Logger.getLogger(ProductAction.class);
	
	@Resource(name = "productService")
	private IProductService productService;
	
	@Resource(name="brandService")
	private IBrandService brandService;
	
	@Resource(name="retailerService")
	private IRetailerService retailerService;
	
	@Resource(name="categoryService")
	private ICategoryService categoryService;
	
	@RequestMapping(value="/product",method = RequestMethod.POST)
	public void create(ProductModel productModel,HttpSession session,HttpServletResponse response) {
		
		
	}
	
	
	@RequestMapping(value = "/basket",method = RequestMethod.GET)
	public String basket(@PathVariable String brandName,@PathVariable String retailerName,HttpServletResponse response,HttpServletRequest request,HttpSession session){
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
		
		return brandModel.get("templateFolder")+"/basket";
	}
	
	
	@RequestMapping(value = "/product/{id}",method = RequestMethod.GET)
	public String show(@PathVariable Integer id ,@PathVariable String brandName,@PathVariable String retailerName,@PathVariable String categoryName,HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		
		
		try {
			
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
			//Set<CategoryModel> categoryModels = brandModel.getCategoryModels();
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
			
			for (CategoryModel categoryModel : categoryModels) {
				if(categoryModel.getName().equalsIgnoreCase(categoryName)) {
					request.setAttribute("defaultCategorySecondName", categoryModel.getSecondName());
					break;
				}
			}
			
			request.setAttribute("categoryList", categoryModels);
			//Collections.sort(list);
			//request.setAttribute("retailerList", list);
			List<RetailerModel> retailerList = (List<RetailerModel>) session.getAttribute("etailerList"+brandName);
			if(retailerList == null) {
				retailerList = this.retailerService.searchRetailersByBrandName(brandName);
				if(null == retailerList || retailerList.size() == 0) {
					logger.error("can not find any Retailers for Brand :'"+brandName+"' from database!");
					return "/error";
					
				} else {
					
					session.setAttribute("retailerList"+brandName, retailerList);
				}
			}
			request.setAttribute("retailerList", retailerList);
			
			
			request.setAttribute("defaultRetailerUpperCase", retailerName.toUpperCase());
			request.setAttribute("defaultCategory", categoryName);
			request.setAttribute("defaultRetailer", retailerName);
			
			
			ProductModel product = this.productService.getProductModel(id, retailerName);
			
			if (null == product) {
				try {
					response.sendRedirect("");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			request.setAttribute("product", product);
			return brandModel.get("templateFolder")+"/single_product";
		} catch (Exception e) {
			logger.error(e);
			return "/error";
		}
		
		//return brandModel.getTemplate().getFolderName()+"/single_product";
	}
	
	
	@RequestMapping(value="/product",method = RequestMethod.GET)
	public String list(@PathVariable String brandName,@PathVariable String retailerName,@PathVariable String categoryName,HttpSession session,HttpServletResponse response,HttpServletRequest request) {
		
		
		try {
			request.setAttribute("defaultCategory", categoryName);
			request.setAttribute("defaultRetailer", retailerName);
			request.setAttribute("defaultRetailerUpperCase", retailerName.toUpperCase());
			
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
			
			if(null ==  session.getAttribute("fromHomePage") || !((String)session.getAttribute("fromHomePage")).equals("true")) {
				session.setAttribute("fromHomePage", "true");
				request.setAttribute("firstTime", "true");
			}
			
			request.setAttribute("brandModel", brandModel);
			//Set<CategoryModel> categoryModels = brandModel.getCategoryModels();
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
			
			for (CategoryModel categoryModel : categoryModels) {
				if(categoryModel.getName().equalsIgnoreCase(categoryName)) {
					request.setAttribute("defaultCategorySecondName", categoryModel.getSecondName());
					break;
				}
			}
			
			request.setAttribute("categoryList", categoryModels);
			//Collections.sort(list);
			//request.setAttribute("retailerList", list);
			List<RetailerModel> retailerList = (List<RetailerModel>) session.getAttribute("retailerList"+brandName);
			if(retailerList == null) {
				retailerList = this.retailerService.searchRetailersByBrandName(brandName);
				if(null == retailerList || retailerList.size() == 0) {
					logger.error("can not find any Retailers for Brand :'"+brandName+"' from database!");
					return "/error";
					
				} else {
					
					session.setAttribute("retailerList"+brandName, retailerList);
				}
			}
			request.setAttribute("retailerList", retailerList);
			String toWhere="/multiple_product";
			if("all".equalsIgnoreCase(categoryName)){//for nesquik
				List<List<ProductModel>> reqList=new ArrayList<List<ProductModel>>();
				Map<Object,List<ProductModel>> reqMap=new HashMap<Object,List<ProductModel>>();
				for(CategoryModel cm:categoryModels){
//					reqList.add();
					System.out.println(cm.getImageUrl());
					reqMap.put(cm, this.productService.searchProductModels(brandName, retailerName, cm.getName()));
				}
				request.setAttribute("requestProductList", reqMap);
			}else{
				List<ProductModel> list = new ArrayList<ProductModel>();
				list = this.productService.searchProductModels(brandName, retailerName, categoryName);
				
				if(brandName.equalsIgnoreCase("schwartz")) {//for schwartz
					
					boolean b=true;
					for(int i=0;i<list.size();i++){
						for(int j=i;j<list.size();j++){
							ProductModel p=list.get(i);
							ProductModel p2=list.get(j);
							b=isSameOffer(p,p2);
							if(!b)break;
						}
						if(!b)break;
					}
					if(b&&list.size()>0){
						request.setAttribute("groupOfferName",list.get(0).getOfferName());
						toWhere="/multiple_product_so";
					}
				} 
				
				if(((String)brandModel.get("description")).indexOf("sub-category") != -1) {// for categories that have sub-categories
					
					try {
						Set<SearchProductModel> set = new HashSet<SearchProductModel>();
						set = WebAppUtil.sortProductByProductBreakDown(list, 2);
						
						Set<SearchProductModel> set1 = new HashSet<SearchProductModel>();
						for (SearchProductModel searchProductModel : set) {
							searchProductModel = SearchProductModel.sort(searchProductModel);
							set1.add(searchProductModel);
						}
						
						request.setAttribute("productSet", set1);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				} else {
					
					request.setAttribute("productList", list);
				}
				
				
			}
			System.out.println(toWhere);
			request.setAttribute("test", null);
			return brandModel.get("templateFolder")+toWhere;
		} catch (Exception e) {
			logger.error(e);
			return "/error";
		}
	}
	
	private boolean isSameOffer(ProductModel p, ProductModel p2) {
		Integer o1=p.getOfferId();
		Integer o2=p2.getOfferId();
		if(o1==null&&o2==null)return true;
		if(o1==null&&o2!=null)return false;
		if(o1!=null&&o2==null)return false;
		return o1.equals(o2);
	}

	/**
	 * 
	 * @return
	 */
	@RequestMapping("/thanks/{productId}")
	public String thankYou(@PathVariable String brandName,@PathVariable String retailerName,@PathVariable String categoryName,@PathVariable Integer productId,HttpServletRequest request,HttpSession session) {
		
		String basketUrlString = "/"+brandName+"/"+retailerName+"/"+categoryName+ "/product/"+productId;
		request.setAttribute("basketUrl", basketUrlString);
		request.setAttribute("retailerName", retailerName);
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
		return brandModel.get("templateFolder")+"/thanks";
		//return null;
	}
	@RequestMapping("/thanks")
	public String thankYou1(@PathVariable String brandName,@PathVariable String retailerName,@PathVariable String categoryName,HttpServletRequest request,HttpSession session) {
		
		String basketUrlString = "/"+brandName+"/"+retailerName+"/"+categoryName+"/product";
		request.setAttribute("basketUrl", basketUrlString);
		request.setAttribute("retailerName", retailerName);
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
		return brandModel.get("templateFolder")+"/thanks";
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
	
}
