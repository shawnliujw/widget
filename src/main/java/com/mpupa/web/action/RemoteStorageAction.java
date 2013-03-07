package com.mpupa.web.action;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mpupa.utils.WebAppUtil;

/**
 * Used to process interaction of storage data with consumer browser
 * 
 * @author Shawn
 * 
 */
@Controller
@RequestMapping("/")
public class RemoteStorageAction {

	private static Logger logger = Logger.getLogger(RemoteStorageAction.class);

	/**
	 * save consumer data into session
	 * 
	 * @param key
	 * @param jsonData
	 * @author Shawn 2013-3-1
	 */
	@RequestMapping(value = "/storage", method = RequestMethod.POST)
	public void saveStorage(String key, String jsonData, HttpSession session,
			HttpServletResponse response) {
		String result = this.validAndSave(session, jsonData);
		//logger.error("post:"+session.getId()+"---------:"+session.getAttribute("remoteStorage"));
		WebAppUtil.outputJSONResult(result, response);
	}

	/**
	 * Fetch storage from session
	 * 
	 * @param key
	 * @param session
	 * @param response
	 * @author Shawn 2013-3-1
	 * @throws IOException
	 * @throws JsonMappingException
	 * @throws JsonGenerationException
	 */
	@RequestMapping(value = "/storage", method = RequestMethod.GET)
	public void fetchStorage(HttpSession session, HttpServletResponse response) {
		//logger.error("get:"+session.getId()+"---------:"+session.getAttribute("remoteStorage"));
		WebAppUtil.outputJSONResult(session.getAttribute("remoteStorage"),response);
	}

	/**
	 * save remote consumer data into session
	 * 
	 * @param session
	 * @param key
	 * @param storageJSON
	 * @return
	 * @author Shawn 2013-3-1
	 */
	private String validAndSave(HttpSession session, String storageJSON) {

		String resultString = "";

		if (null == storageJSON) {
			resultString = "Failed to save storage,  value can not be null";
		} else {
			Map<Object, Object> dataMap = (Map<Object, Object>) session
					.getAttribute("remoteStorage");
		
			long originalTime = 0l;
			if(null != dataMap) {
				originalTime = (Long) dataMap.get("timestamp");
			}  else {
				dataMap = new HashMap<Object, Object>();
			}

			if (new Date().getTime() >= originalTime) {
				ObjectMapper mapper = new ObjectMapper();
				Map<Object, Object> tMap;
				try {
					tMap = mapper.readValue(storageJSON, Map.class);
					dataMap.putAll(tMap);
					session.setAttribute("remoteStorage", dataMap);
					resultString = "Success to save storage";
				} catch (JsonParseException e) {
					// TODO Auto-generated catch block
					resultString = "Invalid JSON Data";
					logger.error(resultString, e);
				} catch (JsonMappingException e) {
					// TODO Auto-generated catch block
					resultString = "Invalid JSON Data";
					logger.error(resultString, e);
				} catch (IOException e) {
					resultString = "Invalid JSON Data";
					logger.error(resultString, e);
				}
			} else {
				resultString = "Current data is older ,failed to save";
			}


		}

		return resultString;

	}
}
