package com.mpupa.web.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.Header;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mpupa.model.CategoryModel;
import com.mpupa.model.ProductModel;
import com.mpupa.service.IBrandService;
import com.mpupa.service.ICategoryService;
import com.mpupa.service.IFlashService;
import com.mpupa.service.IProductService;
import com.mpupa.utils.WebAppUtil;

@Controller
@RequestMapping("/flash")
public class ProductActionForAS {

	@Resource(name="flashService")
	IFlashService flashService;
	
	/**
	 * 根据brandName和categoryName取得对应的youtube视频链接，同时取到 对应有效的retailer
	 * @param brandName
	 * @param categoryName
	 * @param response
	 * @author Shawn
	 * 2012-11-29
	 */
	@RequestMapping("/{brandName}/{categoryName}/youtube")
	public void getYoutube(@PathVariable String brandName,@PathVariable String categoryName,HttpServletResponse response) {
		//List<CategoryModel> list = this.categoryService.getCategoryByBrand(brandName);
		//WebAppUtil.outputJSONResult(list, response);
		String string = this.flashService.getYoutubeLink(brandName, categoryName);
		WebAppUtil.outputJSONResult(string, response);
	}
	
	/**
	 * 取得对应的商品
	 * @param brandName
	 * @param retailerName
	 * @param categoryName
	 * @param response
	 * @author Shawn
	 * 2012-11-29
	 */
	@RequestMapping("/{brandName}/{retailerName}/{categoryName}/product")
	public void getAllProductsByRetailerCategory(@PathVariable String brandName,@PathVariable String retailerName,@PathVariable String categoryName,HttpServletResponse response) {
		List<ProductModel> list = this.flashService.searchProductModelsForAs(brandName, retailerName, categoryName);
		WebAppUtil.outputJSONResult(list, response);
	}
	
	@RequestMapping("/{brandName}/{categoryName}/retailers")
	public void getRetailers(@PathVariable String brandName,@PathVariable String categoryName,HttpServletResponse response) {
		List<String> list = this.flashService.getRetailers(brandName, categoryName);
		WebAppUtil.outputJSONResult(list, response);
	}
	
	
	/*@RequestMapping("/{brandName}/category")
	public void getCategoryByBrandName(@PathVariable String brandName,HttpServletResponse response) {
		//List<CategoryModel> list = this.categoryService.getCategoryByBrand(brandName);
		//WebAppUtil.outputJSONResult(list, response);
	}
	
	@RequestMapping("/{brandName}/{retailerName}/product")
	public void getAllProductsByRetailer(@PathVariable String brandName,@PathVariable String retailerName,HttpServletResponse response) {
		//System.out.println("as products");
		List<ProductModel> list = productService.getProducts(brandName, WebAppUtil.proceedSingleQuote(retailerName));
		List<CategoryModel> list1 = this.categoryService.getCategoryByBrand(brandName);
		
//		List<Object> list2 = new ArrayList<Object>();
//		list2.add(list);
//		list2.add(list1);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("product", list);
		map.put("category", list1);
		WebAppUtil.outputJSONResult(map, response);
	}
	@RequestMapping("/{brandName}/{retailerName}/{categoryName}/product")
	public void getAllProductsByRetailerCategory(@PathVariable String brandName,@PathVariable String retailerName,@PathVariable String categoryName,HttpServletResponse response) {
		//System.out.println("as products");
		List<ProductModel> list = productService.searchProductModels(brandName, retailerName, categoryName);
		WebAppUtil.outputJSONResult(list, response);
	}*/
	
	
	@RequestMapping("/getSessionId")
	public void getSessionId(HttpSession session,HttpServletResponse response){
		WebAppUtil.outputJSONResult(session.getId(), response);
	}
	
	public static final String Session_URL="https://securepay.mpupa.com/fmcg-api-2/session/getSessionId.action";
	public static final String Login_URL="https://securepay.mpupa.com/fmcg-api-2/loginFor{Retailer}.action";
	public static final String AddBasket_URL="https://securepay.mpupa.com/fmcg-api-2/addTo{Retailer}BasketEachProduct.action";
	
	private HttpClient client = new DefaultHttpClient();
	private ResponseHandler<String> responseHandler = new BasicResponseHandler();
	
	

	@RequestMapping("/loginFor{retailer}")
	public void loginForRetailer(@PathVariable String retailer,String email,String password,HttpServletRequest request,HttpServletResponse response){
		initSessionId(request);
		String retMsg="";
		if(checkRetailer(retailer)){
			String tmpUrl=getUrl(Login_URL,retailer,request);
			HttpPost post = getPost(tmpUrl,request);
			String[] paramsName={"email","password"};
			try{
				post.setEntity(getForm(paramsName,email,password));
				retMsg=client.execute(post,responseHandler);
				System.out.println(retMsg);
				
				Header[] headers = post.getAllHeaders();
				for (Header h : headers) {
					response.setHeader(h.getName(), h.getValue());
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				post.releaseConnection();
			}
			
		}else
			retMsg="Failure, bad retailer: "+retailer;
		output(retMsg,response);
	}
	
	@RequestMapping("/addTo{retailer}BasketEachProduct")
	public void addToBasketForRetailer(@PathVariable String retailer,String productsArray,String clearBasket,String addToWhereStr,HttpServletRequest request,HttpServletResponse response){
		String retMsg="";
		if(checkRetailer(retailer)){
			String tmpUrl=getUrl(AddBasket_URL,retailer,request);
			HttpPost post=getPost(tmpUrl,request);
			String[] a={"productsArray","clearBasket"};
			String[] b={"productsArray","clearBasket","addToWhereStr"};
			String[] paramsName="Boots".equals(retailer)?b:a;
			try{
				post.setEntity(getForm(paramsName,productsArray,clearBasket,addToWhereStr));
				retMsg=client.execute(post,responseHandler);
				System.out.println(retMsg);
				
				Header[] headers = post.getAllHeaders();
				for (Header h : headers) {
					response.setHeader(h.getName(), h.getValue());
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				post.releaseConnection();
			}
		}else
			retMsg="Failure, bad retailer: "+retailer;
		output(retMsg, response);
	}
	
	
	
	
	private void initSessionId(HttpServletRequest request){
		String tmpUrl=Session_URL;
		HttpGet get=new HttpGet(tmpUrl);
		try {
			String body=client.execute(get,responseHandler);
			body=body.replace("\"", "");
			System.out.println(body);
			request.getSession().setAttribute("apiSessionId", body);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void output(String outData,HttpServletResponse response){
		PrintWriter pw=null;
		try {
			pw=response.getWriter();
			pw.write(outData);
			pw.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try{if(pw!=null){pw.close();}}catch(Exception e){}
		}
	}
	
	private boolean checkRetailer(String retailer){
		return "Amazon".equals(retailer) || "Asda".equals(retailer) || "Bestbuy".equals(retailer)
				|| "Boots".equals(retailer) || "Ocado".equals(retailer) || "Sainsburys".equals(retailer)
				|| "Superdrug".equals(retailer) || "Target".equals(retailer) || "Tesco".equals(retailer)
				|| "Waitrose".equals(retailer) || "Walmart".equals(retailer)||"SainsburysMobile".equals(retailer);
	}
	
	private String getUrl(String url, String retailer, HttpServletRequest request) {
		return url.replace("{Retailer}", retailer)+";jsessionid="+request.getSession().getAttribute("apiSessionId");
	}
	
	@SuppressWarnings("unchecked")
	private HttpPost getPost(String tmpUrl,HttpServletRequest request){
		System.out.println("execute-->"+tmpUrl);
		HttpPost post=new HttpPost(tmpUrl);
		Enumeration<String> em = request.getHeaderNames();
		while (em.hasMoreElements()) {
			String t = String.valueOf(em.nextElement());
			if(!"content-length".equalsIgnoreCase(t)&&!"accept-encoding".equalsIgnoreCase(t)){
				if("accept".equalsIgnoreCase(t)){
					post.setHeader(t,"text/json");
				}else{
					post.setHeader(t,request.getHeader(t));
				}
//				System.out.println(t + "-->" + request.getHeader(t));
			}
		}
		return post;
	}
	
	private UrlEncodedFormEntity getForm(String[] paramsName,String... params)throws Exception{
		List<NameValuePair> list=new ArrayList<NameValuePair>();
		list.add(new BasicNameValuePair("developerKey","TVRNME56VXdNVFU0TkRNME1nPT1CbG93ZmlzaA=="));
		if(paramsName!=null&&params.length!=0){
			int len=paramsName.length<=params.length?paramsName.length:params.length;
			for(int i=0;i<len;i++)list.add(new BasicNameValuePair(paramsName[i],params[i]));
		}
		return (new UrlEncodedFormEntity(list));
	}
}
