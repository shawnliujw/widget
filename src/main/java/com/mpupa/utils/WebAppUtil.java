package com.mpupa.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.context.support.WebApplicationContextUtils;
import com.mpupa.model.ProductModel;
import com.mpupa.model.ProductRetailersModel;
import com.mpupa.model.SearchProductModel;

public class WebAppUtil {

	private static Logger logger = Logger.getLogger(WebAppUtil.class);

	private static Set<String> userAgents = new HashSet<String>();

	private static Map<String, String> remodeAddress;
	
	private static List<String> autoCompleteConditions;

	public static Set<String> getAllAgents() {
		if (userAgents.size() == 0) {
			userAgents.add("Mac OS");
			userAgents.add("Windows");
			userAgents.add("Android 2.");
			userAgents.add("Android 3.");
			userAgents.add("Android 4.");
			// userAgents.add("Mac OS");
		}

		return userAgents;
	}

	public static String checkUserDvice(HttpServletRequest request) {
		
		
		
		String version = "";
		if(null != request) {
			
			String userAgent = request.getHeader("user-agent").toLowerCase();  
			//System.out.println(userAgent);
			
			// (iPhone; U; CPU iPhone OS 4_0_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A306 Safari/6531.22.7
			//uagent = "(iPad; U; CPU OS  3_1 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8F190 Safari/6533.18.5".toLowerCase()
			//uagent = "(Linux; U; Android 2.3.4; zh-cn; HTC Sensation Z710e Build/GRJ22) UC AppleWebKit/530+ (KHTML, like Gecko) Mobile Safari/530".toLowerCase()
			//uagent = "Mozilla/4.0 (compatible; MSIE 7.0; Windows Phone OS 7.0; Trident/3.1; IEMobile/7.0; HTC; 7 Trophy)".toLowerCase()
			//uagent = "Mozilla/5.0 (webOS/2.1.2; U; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Version/1.0 Safari/532.2 P160UNA/1.0".toLowerCase()
			//uagent = "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; HTC_Sensation_Z710e; zh-cn) AppleWebKit/533.16 (KHTML, like Gecko) Version/5.0 Safari/533.16".toLowerCase()
			//uagent = "Mozilla/5.0 (SAMSUNG; SAMSUNG-GT-S8500/S8500XXJE7; U; Bada/1.0; sl-sl) AppleWebKit/533.1 (KHTML, like Gecko) Dolfin/2.0 Mobile WVGA SMM-MMS/1.2.0 OPN-B".toLowerCase()
			//Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.13) Gecko/20101206 Ubuntu/10.04 (lucid) Firefox/3.6.13
			//Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/22.0.1229.94 Safari/537.4
			//Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/536.26.14 (KHTML, like Gecko) Version/6.0.1 Safari/536.26.14
			//Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; ARM; Touch; IEMobile/10.0; <Manufacturer>; <Device> [;<Operator>])
			//Mozilla/5.0 (Linux; U; Android 2.3.4; en-us; Kindle Fire Build/GINGERBREAD) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1
			if(userAgent.indexOf("mobile") != -1) {
				//mobile 除了opera和火狐之外的常见浏览器的mobile版本
				//让ipad和kindle链接到pc版本
				if(userAgent.indexOf("ipad") != -1 || userAgent.indexOf("kindle") != -1) {
					version = "pc";
				} else {
					version = "mobile";
				}
				
			} else if(userAgent.indexOf("opera mini/") != -1 || userAgent.indexOf("opera mobi/") != -1) {
				//opera 在ios和android的浏览器判断	
				version = "mobile";
			} else if(userAgent.indexOf("android") != -1 && userAgent.indexOf("firefox/") != -1) {
				//android版本的firefox粗略判断
				version = "mobile";
			} else {
				//暂时都设为 pc版本
				version = "pc";
			}
		}
		
		return version;
//		/**电脑上的IE或Firefox浏览器等的User-Agent关键词*/  
//	    String[] pcHeaders=new String[]{  
//	    "Windows 98",  
//	    "Windows ME",  
//	    "Windows 2000",  
//	    "Windows XP",  
//	    "Windows NT",  
//	    "Ubuntu",
//	    "Linux i",
//	    "Intel Mac OS",
//	    "iPad",
//	    "Kindle"
//	    };  
//	    /**手机浏览器的User-Agent里的关键词*/  
//	    String[] mobileUserAgents=new String[]{  
//	    		"iPhone",
//	    		"Windows Phone",
//	    		"webOS",
//	    		"Android"
//	    }; 
		
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
//			 System.out.println(mapper.writeValueAsString(obj));
			if(null != obj && !"".equals(obj)) {
				
				mapper.writeValue(pw, obj);
			} else {
				mapper.writeValue(pw, "");
				
			}
//			pw.write(result);
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
//	
//
//	/**
//	 * 防止hibernate 配置双向关联关系后，重复去对象，导致转换JSON数据时报错或者导致取得太多双向关联的数据到前台
//	 * 
//	 * @param hObject 从hibernate得到的数据对象
//	 * @param originalClass 最顶层对象的Class
//	 * @param level 需要取得数据关联的层次， 一般都是两层， 即 A对象中包括B，B对象中包括C、A，那么如果设置成2，那么可以取得 C但是不会取到B中的A或者跟A相关的Set
//	 * @return
//	 * @author shawn
//	 */
//	private static Object _proceedHibernateObject(Object hObject,Class originalClass,int  level) {
//		
//		
//		if(null != hObject && originalClass != null) {
//			
//			Field[] fields = hObject.getClass().getDeclaredFields();
//			Class parentClass = hObject.getClass();
//			
//			for (Field field : fields) {
//				
//				if (field.getName().equalsIgnoreCase("serialVersionUID")) {
//					continue;
//				}
//				
//				String getMethodName = WebAppUtil.getMethodName("get", field);
//				String setMethodName = WebAppUtil.getMethodName("set", field);
//				Method getMethod = null;
//				Method setMethod = null;
//				try {
//					
//					Object fieldObject = null;
//					getMethod = parentClass.getDeclaredMethod(getMethodName, null);
//					
//					if(null != getMethod) {
//						fieldObject = getMethod.invoke(hObject, null);
//					}
//					//如果flag = true 或者该字段类型已经跟 最上层对象相同那么到这一层为止，把对应的字段赋值为 null
//						setMethod = parentClass.getDeclaredMethod(setMethodName, field.getType());
//						
//						if(null != setMethod) {
//							
//							if(level == 0) {
//								if(fieldObject instanceof HibernateJSONObject) {
//									fieldObject = WebAppUtil.clearHibernateFromObject(fieldObject);
//									setMethod.invoke(hObject, fieldObject);
//								} else if(fieldObject instanceof Collection) {
////									Collection collection = (Collection) fieldObject;
////									collection.clear();
//									setMethod.invoke(hObject, new HashSet());
//								} 
//							} else {
//								if(field.getType().equals(originalClass)) {
//									fieldObject = null;
//									setMethod.invoke(hObject, fieldObject);
//								} else if(fieldObject instanceof Collection) {
//									Collection collection = (Collection) fieldObject;
//									for (Object object : collection) {
//										
//										if(object.getClass().equals(originalClass)) {
//											setMethod.invoke(hObject, new HashSet());
//											break;
//										} else {
//											object = WebAppUtil._proceedHibernateObject(object, originalClass, level - 1);
//										}
//										
//									}
//								} else if(fieldObject instanceof HibernateJSONObject) {
//									fieldObject = WebAppUtil._proceedHibernateObject(fieldObject, originalClass, level - 1);
//									
//								}
//							}
//							
//						}
//					
//					
//				} catch (NoSuchMethodException e1) {
//					// TODO Auto-generated catch block
//					//e1.printStackTrace();
//				}  catch (IllegalArgumentException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				} catch (IllegalAccessException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				} catch (InvocationTargetException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				
//			}
//		}
//		
//		return hObject;
//	}
//	
//	/**
//	 * 移除对象中所有跟hibernate有关的字段，给这些赋值为 null或者空
//	 * @param hibernateObject
//	 * @return
//	 * @author shawn
//	 */
//	private static Object clearHibernateFromObject(Object hibernateObject) {
//		
//		if(null != hibernateObject) {
//			
//			Field[] fields = hibernateObject.getClass().getDeclaredFields();
//			Class parentClass = hibernateObject.getClass();
//			if(null != fields) {
//				for (Field field : fields) {
//					if (field.getName().equalsIgnoreCase("serialVersionUID")) {
//						continue;
//					}
//					String getMethodName = WebAppUtil.getMethodName("get", field);
//					String setMethodName = WebAppUtil.getMethodName("set", field);
//					Method getMethod = null;
//					Method setMethod = null;
//					
//					Object fieldObject = null;
//					try {
//						getMethod = parentClass.getDeclaredMethod(getMethodName, null);
//						setMethod = parentClass.getDeclaredMethod(setMethodName, field.getType());
//					
//						if(null != getMethod) {
//							fieldObject = getMethod.invoke(hibernateObject, null);
//						}
//						
//						if (fieldObject instanceof HibernateJSONObject) {
//							if (null != setMethod) {
//								fieldObject = null;
//								setMethod.invoke(hibernateObject, fieldObject);
//								
//							}
//						} else if(fieldObject instanceof Collection) {
//							Collection collection = (Collection) fieldObject;
//							
//							for (Object object : collection) {
//								
//								if(object instanceof HibernateJSONObject) {
//									setMethod.invoke(hibernateObject, new HashSet());
//									break;
//								} 
//								
//							}
//							
//							
//						}
//						
//					} catch (SecurityException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					} catch (NoSuchMethodException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					} catch (IllegalArgumentException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					} catch (IllegalAccessException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					} catch (InvocationTargetException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					} 
//				}
//			}
//		}
//		
//		return hibernateObject;
//	}
//	
//	/**
//	 * 防止hibernate 配置双向关联关系后，重复去对象，导致转换JSON数据时报错或者导致取得太多双向关联的数据到前台
//	 *
//	 * @author shawn
//	 * @date 2012 2012-9-17 上午12:07:32
//	 */
//	public static <T> List<T> proceedHibernateObjectRelation(List<T> list) {
//		
//		if(null != list && list.size() > 0) {
//			for (T object : list) {
//				object = (T) WebAppUtil._proceedHibernateObject(object,list.get(0).getClass(),2);
//			}
//		}
//		
//		return list;
//	}
//	/**
//	 * 防止hibernate 配置双向关联关系后，转换成json字符串
//	 *
//	 * @author shawn
//	 * @date 2012 2012-9-17 上午12:07:32
//	 */
//	public static String parseHibernateObjectToJson(List<Object> list) {
//		
//		String resultString = "";
//		
//		try {
//			if(null != list && list.size() > 0) {
//				for (Object object : list) {
//					object =  WebAppUtil._proceedHibernateObject(object,list.get(0).getClass(),2);
//				}
//			}
//			ObjectMapper mapper = new ObjectMapper();
//			resultString = mapper.writeValueAsString(list);
//		} catch (JsonGenerationException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (JsonMappingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return resultString;
//	}
//	/**
//	 * 处理 hibernateObject
//	 *
//	 * @author shawn
//	 * @date 2012 2012-9-17 上午12:07:32
//	 */
//	public static Object proceedHibernateObjectRelation(HibernateJSONObject hibernateJSONObject) {
//		
//		return WebAppUtil._proceedHibernateObject(hibernateJSONObject, hibernateJSONObject.getClass(), 2);
//	}
//	/**
//	 * 处理 hibernateObject,转换成json
//	 *
//	 * @author shawn
//	 * @date 2012 2012-9-17 上午12:07:32
//	 */
//	public static String parseHibernateObjectToJson(HibernateJSONObject hibernateJSONObject) {
//		
//		String resultString = "";
//		
//		try {
//			Object object = WebAppUtil._proceedHibernateObject(hibernateJSONObject, hibernateJSONObject.getClass(), 2);
//			ObjectMapper mapper = new ObjectMapper();
//			resultString = mapper.writeValueAsString(object);
//		} catch (JsonGenerationException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (JsonMappingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return resultString;
//		
//	}
	public static void main(String a[]) {
//		WebAppUtil webAppUtil = new WebAppUtil();
//		
//		List<ProductModel> list = new ArrayList<ProductModel>();
//		ProductModel productModel = new ProductModel();
//		list.add(productModel);
//		webAppUtil.outputHibernateJSONResult(list, null);
		
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
	public static <T>T parseJsonToModel(String jsonString, Class<T> clz) {
		Object object = null;
		if (null != jsonString && !"".equals(jsonString) && clz != null) {
			ObjectMapper mapper = new ObjectMapper();
				try {
					object = clz.newInstance();
					System.out.println(jsonString);
					object = mapper.readValue(jsonString, clz);
				} catch (InstantiationException e) {
					// TODO Auto-generated catch block
					logger.error("parseJsonToModel error:", e);
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					logger.error("parseJsonToModel error:", e);
				}
				catch (JsonParseException e) {
					// TODO Auto-generated catch block
					logger.error("parseJsonToModel error:", e);
				} catch (JsonMappingException e) {
					// TODO Auto-generated catch block
					logger.error("parseJsonToModel error:", e);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					logger.error("parseJsonToModel error:", e);
				}
		}
		return (T)object;
	}
	
	/**
	 * 把json转换成List<?>
	 * @param jsonString
	 * @param clz 泛型中包含的对象
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
				if(jsonString.indexOf("retailer")!=-1&&jsonString.indexOf("product")!=-1){
					jsonString=jsonString.replace("}},","}}----");
				}else
					jsonString = jsonString.replace("},", "}----");
				String[] array = jsonString.split("----");
				
				for (String string : array) {
					object = mapper.readValue(string, clz);
					list.add(object);
				}
				
			} else {
				throw new Exception("All params for method parseJsonToBean() can not be null!");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			logger.error(e.getMessage(), e);
		}
		
		return list;
	}
	
	/*public static boolean checkHost(String remoteAddr) {
		boolean flag = false;

		if (null != remoteAddr && !"".equals(remoteAddr)) {

			if (remoteAddr.startsWith("84.")) {
				// 84.57.113.0 ---84.61.96.255
				String tempString = remoteAddr.substring(3);
				int index = tempString.indexOf(".");
				String second = tempString.substring(0, index);

				int secondInt = Integer.parseInt(second);
				if (secondInt >= 57 && secondInt <= 61) {
					if (secondInt == 61 || secondInt == 57) {
						tempString = tempString.substring(index + 1);
						index = tempString.indexOf(".");
						String third = tempString.substring(0, index);
						int thirdInt = Integer.parseInt(third);

						if ((secondInt == 61 && thirdInt <= 96)
								|| (secondInt == 57 && thirdInt >= 57)) {
							flag = true;
						}

					} else {
						flag = true;
					}
				}
			} else if (remoteAddr.startsWith("82.133.100.")) {
				// 82.133.100.0 --- 82.133.100.255
				flag = true;
			} else if (remoteAddr.startsWith("80.187.")) {
				// 80.187.0.0---80.187.111.255
				// 第三位要求在0刄1�71之间

				String tempString = remoteAddr.substring(7);
				int index = tempString.indexOf(".");
				String third = tempString.substring(0, index);

				int thirdInt = Integer.parseInt(third);

				if (thirdInt <= 111) {
					flag = true;
				}

			} else if (remoteAddr.startsWith("139.7.")) {
				// 139.7.0.0---139.7.255.255
				flag = true;
			}
		}

		return flag;
	}
*/
	public static String getHql(String searchKey, String category) {
		StringBuffer hql = new StringBuffer("from ProductModel tp where tp.category = '"+category+"'");
		
		
		if (searchKey.indexOf(",") != -1) {
			searchKey = searchKey.replaceAll(",", " ");
		}

		if (null != searchKey && !"".equals(searchKey)) {
			String[] array = searchKey.split(" ");
			System.out.println(array.length);
			
			for (int i = 0; i < array.length; i++) {
				hql.append("and  (tp.price  like '%" + array[i]
						+ "%' or tp.album like '" + array[i]
						+ "%'or tp.stock like '%" + array[i]
						+ "%'or tp.rating like '%" + array[i]
						+ "%' or tp.technical like '" + array[i]
						+ "%' or tp.artist like '%" + array[i]
						+ "%'" +"or tp.description like '%" + array[i]+"%'"
//						" or tp.country like '" + array[i]
//								+ "%'" +
								+")");
			}

		}
		//System.out.println(hql.toString());
		return hql.toString();
	}
	
	/**
	 * 发送sms
	 *
	 * @author shawn
	 * @date 2012 2012-2-6 上午11:57:38
	 */
	public static String sendSms(String sToPhoneNo, String sMessage) {

try {
			
			if(null == sToPhoneNo || "".endsWith(sToPhoneNo)) {
				throw new Exception("To phone no can not be null");
			} else {
				if(!sToPhoneNo.startsWith("+")) {
					sToPhoneNo = "+" + sToPhoneNo;
				}
			}
			sMessage=sMessage.trim();
			String data = "https://secure.adiqglobal.com/gateway?userName=histscotapi&password=x9fag7Fu&mode=send&action=longsms&campaignId=10643&keywordId=45600&consumerNumber="+
					URLEncoder.encode(sToPhoneNo,"utf-8")+"&message="+URLEncoder.encode(sMessage,"utf-8");
			URL url = new URL(data);
			java.net.HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			BufferedReader rd = new BufferedReader(new InputStreamReader(
					conn.getInputStream()));
			String line;
			String sResult = "";
			while ((line = rd.readLine()) != null) {
				sResult = sResult + line + " ";
			}
			rd.close();
			logger.debug("SMS function:"+sToPhoneNo+"	:"+sResult);
			return sResult;
		} catch (Exception e) {
			logger.error("Error SMS " + e);
			System.out.println("Error SMS " + e);
			return "Error " + e;
		}
	}
	
	public static String getCureDate() {
		return new SimpleDateFormat("dd-MM-yyyy")
				.format(new Date());
	}
	
	public static void sendMessage(String content, ServletContext context, File f, File fyes) {
		//ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(context);
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		JavaMailSender   sender = (JavaMailSender) ctx.getBean("mailSender");
		JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
		MimeMessage msg = senderImpl.createMimeMessage();
		try {
//			if(content.toString().startsWith("There's no transaction in this day!")){
//				return;
//		}else{
			MimeMessageHelper helper = new MimeMessageHelper(msg, true);
			
//			helper.setTo("toni@m-pupa.com");
			helper.setTo("shawn@m-pupa.com");
			String[] ccArray={"steve@m-pupa.com","toni@m-pupa.com","antony@m-pupa.com","mike.turbutt@m-pupa.com"};
			helper.setCc(ccArray);
			helper.setSubject("MUniversal Statistik:" + getCureDate());
			helper.setText(content);
		    helper.addAttachment(f.getName(), f);
		    helper.addAttachment(fyes.getName(), fyes);
			sender.send(msg);
				//}
		} catch (MessagingException e) {
			logger.error(e.getMessage(), e);
		}
}
	
	
	/**
	 * 合并两个对象的property值
	 * @param original 合并后返回的对象
	 * @param source   被合并的对象
	 * @author shawn
	 * @param <T>
	 * @param <T>
	 * @date 2012-6-12下午1:29:30
	 */
	public static  <T> Object copyProperties(T original, T source) {
		
		if(null != original && null != source) {
			
			//Method[] methods = source.getClass().getDeclaredMethods();
			if(original.getClass().equals(source.getClass())) {
				
				Field[] fields = source.getClass().getDeclaredFields();
				Class clz1 = original.getClass();
				Class clz2 = source.getClass();
				for (Field field2 : fields) {
					String methodName = WebAppUtil.getMethodName("get", field2);
					Class clz = field2.getType();
					try {
						T value =  (T) clz2.getMethod(methodName, null).invoke(source, null);
						
						if(null != value && !"".equals(value)) {
							methodName = WebAppUtil.getMethodName("set", field2);
							clz1.getMethod(methodName, clz).invoke(original, value);
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
	private static String getMethodName(String methodStart,Field field) {
		
		String methodName = "";
		
		if(null != methodStart && null != field) {
			String nameString = field.getName();
			String teString = nameString.substring(0, 1).toUpperCase();
			nameString = nameString.substring(1);
			nameString = teString + nameString;
			
			if(field.getType().equals(Boolean.class) && methodStart.equalsIgnoreCase("get")) {
				
				methodName = "is"+nameString;
			} else {
				
				methodName = methodStart+nameString;
			}
			
		}
		
		return methodName;
	}
	
	/**
	 * 动态判断有多少个 productBreakdown 然后按照级别分组，每一个大的分类（即productBreakdown1）都是<code>SearchProductModel</code>对象   
	 * 然后往下每一个都是一个<code>SearchProductModel</code>对象， 利用对象间的关系来标识分类的层次
	 * @param list
	 * @param level 需要分类的层数
	 * @return
	 */
	public static Set<SearchProductModel> sortProductByProductBreakDown(Collection<ProductModel> list, int level) {
		
		
		if(level<1) level=1;
		
		Set<SearchProductModel> catalogSiteList = new HashSet<SearchProductModel>();
		if(list == null) return catalogSiteList;
		 Class productClass = ProductModel.class;
		
	/*	
		Field[] fields = productClass.getDeclaredFields();
		int count = 0;
		for (Field field : fields) {
			if (field.getName().startsWith("productBreakdown")) {
				count++;
			}
		}*/
		
		
		
		for (ProductModel productModel : list) {
			
			int loop = level;
			
			SearchProductModel searchProductModel = new SearchProductModel();
			String breakDown1 = productModel.getProductBreakdown1();
			if(!"".equalsIgnoreCase(breakDown1)) {
				loop--;
				searchProductModel.setSortName(breakDown1);
				//searchProductModel.setCatalogImage(productModel.getImageUrl());
				
				if(catalogSiteList.contains(searchProductModel)) {
					for (SearchProductModel searchProductModel2 : catalogSiteList) {
						if (searchProductModel2.equals(searchProductModel)) {
							searchProductModel = searchProductModel2;
						}
					}
				}
				
				
				
				if(loop < 1) {
					searchProductModel.getProductModels().add(productModel);
					searchProductModel.setFlag(false);
					catalogSiteList.add(searchProductModel);
					break;
				} else {
					//对应多个 breakdown
					List<SearchProductModel> tempList = new ArrayList<SearchProductModel>();
					tempList.add(searchProductModel);
					for (int i = 2; i < level + 1; i++) {
						tempList.add(new SearchProductModel());
					}
					
					for(int i=2;i<level+1;i++) {
						loop--;
						String methodName = "getProductBreakdown"+i;
						Method getMethod = null;
						try {
							getMethod = productClass.getMethod(methodName, null);
							if(getMethod != null) {
								String temp = (String) getMethod.invoke(productModel, null);
								SearchProductModel currentModel = tempList.get(i-1);
								SearchProductModel preModel = tempList.get(i-2);
								if(!temp.equalsIgnoreCase("")) {
									currentModel.setSortName(temp);
									preModel.setFlag(true);
									Set<SearchProductModel> set1 =preModel.getChildNodes();
									set1.add(currentModel);
									preModel.setChildNodes(set1);
									Set<ProductModel> set = currentModel.getProductModels();
									set.add(productModel);
									currentModel.setProductModels(set);
									Set<ProductModel> set2 = preModel.getProductModels();
									set2.add(productModel);
									preModel.setProductModels(set2);
									
								} else {
									preModel.setFlag(false);
									Set<ProductModel> set = preModel.getProductModels();
									set.add(productModel);
									preModel.setProductModels(set);
									break;
								}
							} else {
								break;
							}
						} catch (SecurityException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (NoSuchMethodException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IllegalArgumentException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IllegalAccessException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (InvocationTargetException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
				}
				
				}
				//Method getMethod = 
			} else {
				searchProductModel.setSortName("Others");
				searchProductModel.getProductModels().add(productModel);
			}
			
			catalogSiteList.add(searchProductModel);
		}
		
		return catalogSiteList;
	}
	
	private static SearchProductModel _proceedProductBreakDown(int total,int current, ProductModel productModel,SearchProductModel parentSearchModel) {
		
		return null;
	}
	
	public static String proceedSingleQuote(String s) {
		
		if(null == s || "".equals(s)) {
			return "";
		}
		
		if(s.indexOf("'") != -1) {
			s = s.replaceAll("'", "~");
		}
		return s;
		
	}
}

