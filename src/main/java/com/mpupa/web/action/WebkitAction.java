package com.mpupa.web.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.Header;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mpupa.utils.WebAppUtil;

@Controller
@RequestMapping("/")
public class WebkitAction {
	
//	public static final String Session_URL="https://securepay.mpupa.com/fmcg-api-2/session/getSessionId.action";
	public static final String Base_Url="https://securepay.mpupa.com/fmcg-api-2";
	public static final String Login_URL=Base_Url+"/loginFor{Retailer}.action";
	public static final String AddBasket_URL=Base_Url+"/addTo{Retailer}BasketEachProduct.action";
	public static final String Register_URL=Base_Url+"/registerFor{Retailer}.action";
	public static final String Get_AddressIds_URL=Base_Url+"/getAddressIdsByPostCodeFor{Retailer}.action";
	
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
	
	@RequestMapping("/getAddressIdsByPostCodeFor{retailer}")
	public void getAddressIdsByPostCodeForRetailer(@PathVariable String retailer, String postCode,HttpServletRequest request,HttpServletResponse response){
		String retMsg="";
		if("Tesco".equals(retailer)||"Asda".equals(retailer)){
			String tmpUrl=getUrl(Get_AddressIds_URL,retailer,request);
			HttpPost post=getPost(tmpUrl,request);
			String[] paramsName={"postCode"};
			try{
				post.setEntity(getForm(paramsName,postCode));
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
	
	/**
	 * For regaine create account, 6 rtl
	 * @param retailer
	 * @param personalDetailStr
	 * @param shipAddrStr
	 * @param request
	 * @param response
	 */
	@RequestMapping("/registerFor{retailer}")
	public void registerForRetailer(@PathVariable String retailer, String personalDetailStr,String shipAddrStr,HttpServletRequest request,HttpServletResponse response){
		String retMsg="";
		if("Amazon".equals(retailer)||"Asda".equals(retailer)||"Boots".equals(retailer)||"Tesco".equals(retailer)||"Pharmacy".equals(retailer)||"Sainsburys".equals(retailer)){
			String tmpUrl=getUrl(Register_URL,retailer,request);
			HttpPost post=getPost(tmpUrl,request);
			String[] paramsName={"personalDetailStr","shipAddrStr"};
			try{
				post.setEntity(getForm(paramsName,personalDetailStr,shipAddrStr));
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
			retMsg="Failure, ["+retailer+"] not support register now.";
		output(retMsg, response);
	}
	
	@RequestMapping("/getSessionId")
	public void getSessionId(HttpServletRequest request,HttpServletResponse response){
		WebAppUtil.outputJSONResult(request.getSession().getId(), response);
	}
	
	private void initSessionId(HttpServletRequest request){
//		String tmpUrl=Session_URL;
//		HttpGet get=new HttpGet(tmpUrl);
//		try {
//			String body=client.execute(get,responseHandler);
//			body=body.replace("\"", "");
//			System.out.println(body);
//			request.getSession().setAttribute("apiSessionId", body);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
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
				|| "Waitrose".equals(retailer) || "Walmart".equals(retailer)||"SainsburysMobile".equals(retailer)
				||"Ooshop".equals(retailer)||"Monoprix".equals(retailer)||"Auchan".equals(retailer)||"Pharmacy".equals(retailer);
	}
	
	private String getUrl(String url, String retailer, HttpServletRequest request) {
		return url.replace("{Retailer}", retailer);//+";jsessionid="+request.getSession().getAttribute("apiSessionId");
	}
	
	@SuppressWarnings("unchecked")
	private HttpPost getPost(String tmpUrl,HttpServletRequest request){
		System.out.println("execute-->"+tmpUrl);
		HttpPost post=new HttpPost(tmpUrl);
		Enumeration<String> em = request.getHeaderNames();
		while (em.hasMoreElements()) {
			String t = String.valueOf(em.nextElement());
			if(!"content-length".equalsIgnoreCase(t)&&!"accept-encoding".equalsIgnoreCase(t)){
				post.setHeader(t,request.getHeader(t));
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
