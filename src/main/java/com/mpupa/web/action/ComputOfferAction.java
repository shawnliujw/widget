package com.mpupa.web.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mpupa.model.OfferModel;
import com.mpupa.service.IOfferService;
import com.mpupa.utils.WebAppUtil;

@Controller
@RequestMapping("/offer")
public class ComputOfferAction {

	private Logger logger = Logger.getLogger(ComputOfferAction.class);

	@Resource(name = "offerService")
	private IOfferService offerService;

	/**
	 * 参数： 1，购买数量： buyNum 2, 购买单价： singlePrice 3，优惠价格： offerPrice 4,
	 * 购买个数优惠：offerNum buy any * for #:
	 * totalPrice=(buyNum-buyNum%offerNum)/offerNum
	 * *offerPrice+buyNum%offerNum*singlePrice Buy any 2, you add 3rd free:
	 * totalPrice=(buyNum-buyNum%3)/3*singlePrice*2+buyNum%3*singlePrice
	 * 
	 * price+"~~"+quantity+"~~"+offerType+"~~"+productUrl
	 */

	@RequestMapping("/catulateOffer")
	public void catulateOffer(HttpServletRequest request, String array,
			HttpSession session, HttpServletResponse response) {
		double totalPrice = 0.00;
		if ("".equals(array) || null == array) {
			totalPrice = 0.00;
		} else {
			String[] arrays = array.split("@@");
			String retailerUrl=arrays[0].split("~~")[3];
			if(retailerUrl.indexOf("tesco")!=-1){
				totalPrice=getTotalPriceForTesco(arrays);
			}else if(retailerUrl.indexOf("ocado")!=-1){
				totalPrice=getTotalPriceForOcado(arrays);
			}else{
				Map<String, List<String>> sort = getSort(arrays);
				totalPrice = getTotalPrice(sort);
			}
		}
		WebAppUtil.outputJSONResult(totalPrice, response);
	}

	private double getTotalPriceForTesco(String[] arrays) {
		Map<String, List<String>> map = new HashMap<String, List<String>>();// 保存带有offer的记录
		List<String> noOfferList=new ArrayList<String>();//保存没有offer的记录，对于没有offer的记录，其offerID=-1;
		for (int i = 0; i < arrays.length; i++) {
			System.out.println(arrays[i]);
			String tempOffer = arrays[i].split("~~")[2];
			//如果该记录offerID为-1， 不进入map,而放到noOfferList.
			if(tempOffer.equals("-1")){
				noOfferList.add(arrays[i]);
				continue;
			}
			//放到map.
			String key = tempOffer;
			if (map.containsKey(key)) {
				List<String> temp = map.get(key);
				temp.add(arrays[i]);
			} else {
				List<String> temp = new ArrayList<String>();
				temp.add(arrays[i]);
				map.put(key, temp);
			}
		}
		if(null==map||"".equals(map))return 0.00;
		Iterator iter = map.keySet().iterator();
		double totalPrice = 0;
		//计算带offer的商品的价格
		while (iter.hasNext()) {
			String tempKey = iter.next().toString();
			List<String> list = map.get(tempKey);
			int tempTotalNUum = 0;
			String offerId = tempKey;
			String singlePrice=getMaxPrice(list);//同一offer下多种商品，取最大的价格作为非优惠之外的价格。
			for (String item : list) {
				String buyNum = item.split("~~")[1];
				tempTotalNUum += Integer.parseInt(buyNum);
			}
			System.out.println(tempTotalNUum + "-------" + singlePrice
					+ "------" + offerId);
			totalPrice += catulateSingle(tempTotalNUum + "", singlePrice,
					offerId);
		}
		
		//计算没有offer的商品的价格
		if(null==noOfferList||noOfferList.size()==0){
			return totalPrice;
		}
		
		for(String noOffer:noOfferList){
			String buyNum = noOffer.split("~~")[1];
			String singlePrice = noOffer.split("~~")[0];
			totalPrice += catulateSingle(buyNum + "", singlePrice,
					"-1");
		}
		System.out.println(totalPrice);
		return totalPrice;
	}

	private double getTotalPriceForOcado(String[] arrays) {
		Map<String, List<String>> map = new HashMap<String, List<String>>();// 保存带有offer的记录
		List<String> noOfferList=new ArrayList<String>();//保存没有offer的记录，对于没有offer的记录，其offerID=-1;
		for (int i = 0; i < arrays.length; i++) {
			System.out.println(arrays[i]);
			String tempOffer = arrays[i].split("~~")[2];
			//如果该记录offerID为-1， 不进入map,而放到noOfferList.
			if(tempOffer.equals("-1")){
				noOfferList.add(arrays[i]);
				continue;
			}
			//放到map.
			String key = tempOffer;
			if (map.containsKey(key)) {
				List<String> temp = map.get(key);
				temp.add(arrays[i]);
			} else {
				List<String> temp = new ArrayList<String>();
				temp.add(arrays[i]);
				map.put(key, temp);
			}
		}
		
		Iterator iter = map.keySet().iterator();
		double totalPrice = 0;
		//计算带offer的商品的价格
		while (iter.hasNext()) {
			String tempKey = iter.next().toString();
			List<String> list = map.get(tempKey);
			int tempTotalNUum = 0;
			for (String item : list) {
				String buyNum = item.split("~~")[1];
				tempTotalNUum += Integer.parseInt(buyNum);
			}
			String offerId = tempKey;
			if("1020".equalsIgnoreCase(offerId)){
				List<Double> price_sorted=getMinPrice(list);//同一offer下多种商品，排序所有价格
				totalPrice+=getTempOcadoPrice(price_sorted);
			}else{
				String singlePrice=getMaxPrice(list);
				totalPrice += catulateSingle(tempTotalNUum + "", singlePrice,
					offerId);
			}
		}
		
		//计算没有offer的商品的价格
		if(null==noOfferList||noOfferList.size()==0){
			return totalPrice;
		}
		
		for(String noOffer:noOfferList){
			String buyNum = noOffer.split("~~")[1];
			String singlePrice = noOffer.split("~~")[0];
			totalPrice += catulateSingle(buyNum + "", singlePrice,
					"-1");
		}
		System.out.println(totalPrice);
		return totalPrice;
		
	}

	private double getTempOcadoPrice(List<Double> list) {
		int totalNum=list.size();
		double totalPrice=sumList(list);
		int minusNum=totalNum/3;
		for(int i=0;i<minusNum;i++){
			totalPrice=totalPrice-list.get(i);
		}
		return totalPrice;
	}

	private double sumList(List<Double> list) {
		double result=0.00;
		for(Double temp:list){
			result+=temp;
		}
		return result;
	}

	private List<Double> getMinPrice(List<String> list) {
		List<Double> tempList=new ArrayList<Double>();
		//get all price list
		for(String item:list){
			double tempPrice=Double.parseDouble(item.split("~~")[0]);
			int num=Integer.parseInt(item.split("~~")[1]);
			for(int i=0;i<num;i++){
				tempList.add(tempPrice);
			}
		}
		Collections.sort(tempList);
		return tempList;
	}

	private String getMaxPrice(List<String> list) {
		System.out.println("list size:\t"+list.size());
		double max=0;
		for(int i=0;i<list.size();i++){
			double tempPrice=Double.parseDouble(list.get(i).split("~~")[0]);
			if(max<tempPrice){
				max=tempPrice;
			}
		}
		return max+"";
	}

	private double getTotalPrice(Map<String, List<String>> sort) {
		@SuppressWarnings("rawtypes")
		Iterator iter = sort.keySet().iterator();
		double totalPrice = 0;
		while (iter.hasNext()) {
			String tempKey = iter.next().toString();
			List<String> list = sort.get(tempKey);
			int tempTotalNUum = 0;
			String offerId = tempKey.split("_")[1];
			String singlePrice = tempKey.split("_")[0];
			for (String item : list) {
				String buyNum = item.split("~~")[1];
				tempTotalNUum += Integer.parseInt(buyNum);
			}
			System.out.println(tempTotalNUum + "-------" + singlePrice
					+ "------" + offerId);
			totalPrice += catulateSingle(tempTotalNUum + "", singlePrice,
					offerId);
		}
		System.out.println(totalPrice);
		return totalPrice;
	}

	private Map<String, List<String>> getSort(String[] arrays) {
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		for (int i = 0; i < arrays.length; i++) {
			String tempPrice = arrays[i].split("~~")[0];
			String tempOffer = arrays[i].split("~~")[2];
			String key = tempPrice + "_" + tempOffer;
			if (map.containsKey(key)) {
				List<String> temp = map.get(key);
				temp.add(arrays[i]);
			} else {
				List<String> temp = new ArrayList<String>();
				temp.add(arrays[i]);
				map.put(key, temp);
			}
		}
		return map;
	}

	public double catulateSingle(String buyNum, String singlePrice,
			String offerId) {
		double price = 0.00;
		String formu = getFormu(offerId);
		if (!"".equals(formu) && null != formu) {
			formu = formu.replaceAll("buyNum", buyNum);
			formu = formu.replaceAll("singlePrice", singlePrice);

			ScriptEngineManager manager = new ScriptEngineManager();
			ScriptEngine engine = manager.getEngineByName("js");
			try {
				System.out.println(formu);
				price = Double.parseDouble(engine.eval(formu).toString());
			} catch (ScriptException e) {
				e.printStackTrace();
			}
		} else {
			price = Integer.parseInt(buyNum) * Double.parseDouble(singlePrice);
		}
		return price;
	}

	private String getFormu(String offerId) {
		// no offer.
		if (offerId.equals("-1")) {
			return "";
		}
		System.out.println(offerId);
		OfferModel offer = this.offerService.getOfferById(offerId);
		String formu = "";
		try {
			formu = offer.getOffer_formula();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return formu;
	}
	
}
