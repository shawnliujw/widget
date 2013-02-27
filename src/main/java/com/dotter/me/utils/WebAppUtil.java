package com.dotter.me.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class WebAppUtil {

	private static Logger logger = Logger.getLogger(WebAppUtil.class);
	
	/**
	 * check user device
	 * 
	 * @param request
	 * @return
	 * @author Shawn 2013-2-26
	 */
	public static String checkUserDvice(HttpServletRequest request) {
		String version = "";
		if (null != request) {

			String userAgent = request.getHeader("user-agent").toLowerCase();
			// System.out.println(userAgent);

			// (iPhone; U; CPU iPhone OS 4_0_1 like Mac OS X; en-us)
			// AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A306
			// Safari/6531.22.7
			// uagent =
			// "(iPad; U; CPU OS  3_1 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8F190 Safari/6533.18.5".toLowerCase()
			// uagent =
			// "(Linux; U; Android 2.3.4; zh-cn; HTC Sensation Z710e Build/GRJ22) UC AppleWebKit/530+ (KHTML, like Gecko) Mobile Safari/530".toLowerCase()
			// uagent =
			// "Mozilla/4.0 (compatible; MSIE 7.0; Windows Phone OS 7.0; Trident/3.1; IEMobile/7.0; HTC; 7 Trophy)".toLowerCase()
			// uagent =
			// "Mozilla/5.0 (webOS/2.1.2; U; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Version/1.0 Safari/532.2 P160UNA/1.0".toLowerCase()
			// uagent =
			// "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; HTC_Sensation_Z710e; zh-cn) AppleWebKit/533.16 (KHTML, like Gecko) Version/5.0 Safari/533.16".toLowerCase()
			// uagent =
			// "Mozilla/5.0 (SAMSUNG; SAMSUNG-GT-S8500/S8500XXJE7; U; Bada/1.0; sl-sl) AppleWebKit/533.1 (KHTML, like Gecko) Dolfin/2.0 Mobile WVGA SMM-MMS/1.2.0 OPN-B".toLowerCase()
			// Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.13)
			// Gecko/20101206 Ubuntu/10.04 (lucid) Firefox/3.6.13
			// Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.4 (KHTML,
			// like Gecko) Chrome/22.0.1229.94 Safari/537.4
			// Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2)
			// AppleWebKit/536.26.14 (KHTML, like Gecko) Version/6.0.1
			// Safari/536.26.14
			// Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0;
			// Trident/6.0; ARM; Touch; IEMobile/10.0; <Manufacturer>; <Device>
			// [;<Operator>])
			// Mozilla/5.0 (Linux; U; Android 2.3.4; en-us; Kindle Fire
			// Build/GINGERBREAD) AppleWebKit/533.1 (KHTML, like Gecko)
			// Version/4.0 Mobile Safari/533.1
			if (userAgent.indexOf("mobile") != -1) {
				// mobile 除了opera和火狐之外的常见浏览器的mobile版本
				// 让ipad和kindle链接到pc版本
				if (userAgent.indexOf("ipad") != -1
						|| userAgent.indexOf("kindle") != -1) {
					version = "pc";
				} else {
					version = "mobile";
				}

			} else if (userAgent.indexOf("opera mini/") != -1
					|| userAgent.indexOf("opera mobi/") != -1) {
				// opera 在ios和android的浏览器判断
				version = "mobile";
			} else if (userAgent.indexOf("android") != -1
					&& userAgent.indexOf("firefox/") != -1) {
				// android版本的firefox粗略判断
				version = "mobile";
			} else {
				// 暂时都设为 pc版本
				version = "pc";
			}
		}

		return version;
		// /**电脑上的IE或Firefox浏览器等的User-Agent关键词*/
		// String[] pcHeaders=new String[]{
		// "Windows 98",
		// "Windows ME",
		// "Windows 2000",
		// "Windows XP",
		// "Windows NT",
		// "Ubuntu",
		// "Linux i",
		// "Intel Mac OS",
		// "iPad",
		// "Kindle"
		// };
		// /**手机浏览器的User-Agent里的关键词*/
		// String[] mobileUserAgents=new String[]{
		// "iPhone",
		// "Windows Phone",
		// "webOS",
		// "Android"
		// };

	}

	/**
	 * Transform and output json data.
	 * 
	 * @param obj
	 * @param response
	 * @author Liu Jianwei
	 */
	public static void outputJSONResult(Object obj, HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			response.setHeader("ContentType", "text/json");
			response.setCharacterEncoding("utf-8");

			ObjectMapper mapper = new ObjectMapper();
			pw = response.getWriter();
			// System.out.println(mapper.writeValueAsString(obj));
			if (null != obj && !"".equals(obj)) {

				mapper.writeValue(pw, obj);
			} else {
				mapper.writeValue(pw, "");

			}
			// pw.write(result);
			pw.flush();
			// mapper.
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
		} finally {
			if (pw != null) {
				pw.close();
			}
		}
	}

	/**
	 * 把json字符串转换成model
	 * 
	 * @author shawn
	 * @throws
	 * @throws Exception
	 * @date 2011-12-30下午2:35:06
	 */
	@SuppressWarnings("unchecked")
	public static <T> T parseJsonToModel(String jsonString, Class<T> clz)
			throws Exception {
		Object object = new Object();
		if (null != jsonString && !"".equals(jsonString) && clz != null) {
			ObjectMapper mapper = new ObjectMapper();
			object = clz.newInstance();
			// System.out.println(jsonString);
			// jsonString = jsonString.replaceAll(" ", "");
			System.out.println(jsonString);
			object = mapper.readValue(jsonString, clz);
		}
		return (T) object;
	}

	/**
	 * 把json转换成List<?>
	 * 
	 * @param jsonString
	 * @param clz
	 *            泛型中包含的对象
	 * @return
	 * @author Shawn
	 */
	public static List<?> parseJsonToList(String jsonString, Class clz) {
		List<Object> list = new ArrayList<Object>();

		try {
			if (null != jsonString && !"".equals(jsonString) && clz != null) {
				Object object = new Object();
				ObjectMapper mapper = new ObjectMapper();
				System.out.println(jsonString);
				jsonString = jsonString.replaceAll(" ", "");
				jsonString = jsonString.replace("[", "").replace("]", "");
				if (jsonString.indexOf("retailer") != -1
						&& jsonString.indexOf("product") != -1) {
					jsonString = jsonString.replace("}},", "}}----");
				} else
					jsonString = jsonString.replace("},", "}----");
				String[] array = jsonString.split("----");

				for (String string : array) {
					object = mapper.readValue(string, clz);
					list.add(object);
				}

			} else {
				throw new Exception(
						"All params for method parseJsonToBean() can not be null!");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			logger.error(e.getMessage(), e);
		}

		return list;
	}


	/**
	 * 发送sms
	 * 
	 * @author shawn
	 * @date 2012 2012-2-6 上午11:57:38
	 */
	public static String sendSms(String sToPhoneNo, String sMessage) {

		try {

			if (null == sToPhoneNo || "".endsWith(sToPhoneNo)) {
				throw new Exception("To phone no can not be null");
			} else {
				if (!sToPhoneNo.startsWith("+")) {
					sToPhoneNo = "+" + sToPhoneNo;
				}
			}
			sMessage = sMessage.trim();
			String data = "https://secure.adiqglobal.com/gateway?userName=histscotapi&password=x9fag7Fu&mode=send&action=longsms&campaignId=10643&keywordId=45600&consumerNumber="
					+ URLEncoder.encode(sToPhoneNo, "utf-8")
					+ "&message="
					+ URLEncoder.encode(sMessage, "utf-8");
			URL url = new URL(data);
			java.net.HttpURLConnection conn = (HttpURLConnection) url
					.openConnection();
			BufferedReader rd = new BufferedReader(new InputStreamReader(
					conn.getInputStream()));
			String line;
			String sResult = "";
			while ((line = rd.readLine()) != null) {
				sResult = sResult + line + " ";
			}
			rd.close();
			logger.debug("SMS function:" + sToPhoneNo + "	:" + sResult);
			return sResult;
		} catch (Exception e) {
			logger.error("Error SMS " + e);
			System.out.println("Error SMS " + e);
			return "Error " + e;
		}
	}

	public static String getCureDate() {
		return new SimpleDateFormat("dd-MM-yyyy").format(new Date());
	}

	public static void sendMessage(String content, ServletContext context,
			File f, File fyes) {
		ApplicationContext ctx = WebApplicationContextUtils
				.getRequiredWebApplicationContext(context);
		JavaMailSender sender = (JavaMailSender) ctx.getBean("mailSender");
		JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
		MimeMessage msg = senderImpl.createMimeMessage();
		try {
			// if(content.toString().startsWith("There's no transaction in this day!")){
			// return;
			// }else{
			MimeMessageHelper helper = new MimeMessageHelper(msg, true);

			// helper.setTo("toni@m-pupa.com");
			helper.setTo("shawn@m-pupa.com");
			String[] ccArray = { "steve@m-pupa.com", "toni@m-pupa.com",
					"antony@m-pupa.com", "mike.turbutt@m-pupa.com" };
			helper.setCc(ccArray);
			helper.setSubject("MUniversal Statistik:" + getCureDate());
			helper.setText(content);
			helper.addAttachment(f.getName(), f);
			helper.addAttachment(fyes.getName(), fyes);
			sender.send(msg);
			// }
		} catch (MessagingException e) {
			logger.error(e.getMessage(), e);
		}
	}

	/**
	 * 合并两个对象的property值
	 * 
	 * @param original
	 *            合并后返回的对象
	 * @param source
	 *            被合并的对象
	 * @author shawn
	 * @param <T>
	 * @param <T>
	 * @date 2012-6-12下午1:29:30
	 */
	public static <T> Object copyProperties(T original, T source) {

		if (null != original && null != source) {

			// Method[] methods = source.getClass().getDeclaredMethods();
			if (original.getClass().equals(source.getClass())) {

				Field[] fields = source.getClass().getDeclaredFields();
				Class clz1 = original.getClass();
				Class clz2 = source.getClass();
				for (Field field2 : fields) {
					String methodName = WebAppUtil.getMethodName("get", field2);
					Class clz = field2.getType();
					try {
						T value = (T) clz2.getMethod(methodName, null).invoke(
								source, null);

						if (null != value && !"".equals(value)) {
							methodName = WebAppUtil
									.getMethodName("set", field2);
							clz1.getMethod(methodName, clz).invoke(original,
									value);
						}

					} catch (IllegalArgumentException e) {
						// TODO Auto-generated catch block
						logger.error(e.getMessage(), e);
					} catch (SecurityException e) {
						// TODO Auto-generated catch block
						logger.error(e.getMessage(), e);
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						logger.error(e.getMessage(), e);
					} catch (InvocationTargetException e) {
						// TODO Auto-generated catch block
						logger.error(e.getMessage(), e);
					} catch (NoSuchMethodException e) {
						// TODO Auto-generated catch block
						logger.error(e.getMessage(), e);
					}
				}

				return original;
			} else {
				return null;
			}

		} else {
			return null;
		}

	}

	/**
	 * 根据字段名称取得对应的 get set方法
	 * 
	 * @author shawn
	 * @date 2012 2012-9-16 下午9:30:14
	 */
	private static String getMethodName(String methodStart, Field field) {

		String methodName = "";

		if (null != methodStart && null != field) {
			String nameString = field.getName();
			String teString = nameString.substring(0, 1).toUpperCase();
			nameString = nameString.substring(1);
			nameString = teString + nameString;

			if (field.getType().equals(Boolean.class)
					&& methodStart.equalsIgnoreCase("get")) {

				methodName = "is" + nameString;
			} else {

				methodName = methodStart + nameString;
			}

		}

		return methodName;
	}

	public static String proceedSingleQuote(String s) {

		if (null == s || "".equals(s)) {
			return "";
		}

		if (s.indexOf("'") != -1) {
			s = s.replaceAll("'", "~");
		}
		return s;

	}
	
	
	/**
	 * fetch data from http://proto.dotter.me
	 * 
	 * @param type  family or product
	 * @param id    familyId or productId
	 * @return
	 * @author Shawn
	 * 2013-2-26
	 */
	public static String getDataFromPrototypeDB(String type,String id) {
		
		String result = "";
		if(null == type || "".equalsIgnoreCase(type) || null == id || "".equalsIgnoreCase(id)) {
			logger.error("WebAppUtil.getDataFromPrototypeDB:Please ensure type or id is not null");
		} else {
			String url = "";
			if(type.equalsIgnoreCase("family")) {
				url = Constants.PROTOTYPE_FAMILY_URL;
			} else if(type.equalsIgnoreCase("product")) {
				url = Constants.PROTOTYPE_PRODUCT_URL;
			}
			
			url += "/"+id;
			
			DefaultHttpClient httpclient = new DefaultHttpClient();
			HttpGet httpget = new HttpGet(url);
			ResponseHandler<String> responseHandler = new BasicResponseHandler();
			 
			try {
				result = httpclient.execute(httpget, responseHandler);
				System.out.println(result);
			} catch (ClientProtocolException e) {
				// TODO Auto-generated catch block
				logger.error(e.getMessage(),e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				logger.error(e.getMessage(),e);
			}
	        // 关闭连接.   
			httpclient.getConnectionManager().shutdown();   
		}
		return result;
	}
	
	
	public static void main(String a[]) {
	}
	
}
