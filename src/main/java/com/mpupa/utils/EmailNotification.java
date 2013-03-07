package com.mpupa.utils;

import java.io.File;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import com.mpupa.model.Report;
import com.mpupa.utils.ExcelUtil;
import com.mpupa.dao.IBaseDao;
import com.mpupa.model.StatistikModel;

public class EmailNotification implements ServletContextAware{

	private ServletContext servletContext;
	
	@Resource(name="myBatisDao")
	IBaseDao myBatisDao;
	
	/***
	 * 发送Email
	 *
	 * @author shawn
	 * @date 2012-6-18上午10:26:28
	 */
	@SuppressWarnings({ "unchecked", "unused" })
	public void sendEmail() {
		System.out.println(new Date().toString()+"--------执行 定时发送email");
		
		String lastday=this.getLastDay();
		System.out.println("lastDay:\t"+lastday);
		String hql = "from StatistikModel s where s.createDate like'" +lastday+"%'" ;

		// TODO  
		List<StatistikModel> list=(List<StatistikModel>) myBatisDao.getObjectList("sqlKey", new HashMap<String, Object>());
		String content=getMailContent(list);
		//System.out.println("*************Mail***********");
//        System.out.println(content);
        //System.out.println("***********Mail*************");
        //System.out.println(context);
        File f=getExcelFile();
        File fyes=getExcelFileYesterdy();
        System.out.println(f.getAbsolutePath()+"---------------------------------------file path");
        WebAppUtil.sendMessage(content, servletContext,f,fyes);
	}

	private String curPath() {
		URL path = this.getClass().getResource(this.getClass().getName().substring(this.getClass().getName().lastIndexOf(".") + 1)+ ".classs");
		if (path == null) {
			String name = this.getClass().getName().replaceAll("[.]", "/");
			path = this.getClass().getResource("/" + name + ".class");
		}
		File f = new File(path.getFile());
		String str = f.getAbsolutePath();
		str=str.substring(0, str.lastIndexOf("WEB-INF"));
		if(str.lastIndexOf(File.separator)!=-1){
			str=str.substring(0,str.length()-1);
		}
		return str;
	}
	
	private File getExcelFileYesterdy() {
		SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
		Calendar c=Calendar.getInstance();
		c.set(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH),Calendar.getInstance().get(Calendar.DAY_OF_MONTH)-1);
		String tmpDate=sdf.format(c.getTime());
		
		File file=new File(curPath()+"/reports");
		if(!file.exists())file.mkdirs();
		String name=curPath()+"/reports/universal_report"+tmpDate;
		
		name+=".xls";
		File f=new File(name);
		List<String> header = new ArrayList<String>();
		header.add("DEALSERIALNO");
		header.add("DEALDATE");
		header.add("DEALSTATUS");
		header.add("Card Type");
		header.add("User Email");
		header.add("Platform");
		header.add("OS");
		header.add("Confirm Number");
		
		List<Report> list=null;
		List<List<String>> data = new ArrayList<List<String>>();
		
		for(int i=0;i<list.size();i++){
			Report rt=list.get(i);
			String dt=rt.getDealDate();
			if(dt.startsWith(tmpDate)){
				List<String> inlist = new ArrayList<String>();
				inlist.add(rt.getId().toString());
				inlist.add(rt.getDealDate());
				inlist.add(rt.getDealStatus());
				inlist.add(rt.getCardType());
				inlist.add(rt.getUserEmail());
				inlist.add(rt.getPlatForm());
				inlist.add(rt.getOs());
				inlist.add(rt.getConfirmNumber());
				data.add(inlist);
			}
		}
		
		ExcelUtil ef = new ExcelUtil(header, data);
		try{
			ef.save(f);
		}catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}
	private File getExcelFile() {
		File file=new File(curPath()+"/reports");
		if(!file.exists())file.mkdirs();
		String fileName=curPath()+"/reports/universal_report.xls";
		File f=new File(fileName);
		List<String> header = new ArrayList<String>();
		header.add("DEALSERIALNO");
		header.add("DEALDATE");
		header.add("DEALSTATUS");
		header.add("Card Type");
		header.add("User Email");
		header.add("Platform");
		header.add("OS");
		header.add("Confirm Number");
		
		List<Report> list= null;
		List<List<String>> data = new ArrayList<List<String>>();
		
		for(int i=0;i<list.size();i++){
			Report rt=list.get(i);
			List<String> inlist = new ArrayList<String>();
			inlist.add(rt.getId().toString());
			inlist.add(rt.getDealDate());
			inlist.add(rt.getDealStatus());
			inlist.add(rt.getCardType());
			inlist.add(rt.getUserEmail());
			inlist.add(rt.getPlatForm());
			inlist.add(rt.getOs());
			inlist.add(rt.getConfirmNumber());
			data.add(inlist);
		}
		
		ExcelUtil ef = new ExcelUtil(header, data);
		try{
			ef.save(f);
		}catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}

	private String getMailContent(List<StatistikModel> list) {
		int sVisaELectron = 0,svisa=0,smaster=0,sVisaDelta=0,sSolo=0,sJCB=0;
		List<StatistikModel> slist=new ArrayList<StatistikModel>();
		List<StatistikModel> elist=new ArrayList<StatistikModel>();

		//存放 失败信息
		List<StatistikModel> visaELectron=new ArrayList<StatistikModel>();
		List<StatistikModel> visa=new ArrayList<StatistikModel>();
		List<StatistikModel> master=new ArrayList<StatistikModel>();
		List<StatistikModel> visaDelta=new ArrayList<StatistikModel>();
		List<StatistikModel> solo=new ArrayList<StatistikModel>();
		List<StatistikModel> jcb=new ArrayList<StatistikModel>();
		

		
		String content = this.getLastDay();
		if (list.size() == 0) {
			content = "There's no transaction in yesterday!";
		} else {
			for (int i = 0; i < list.size(); i++) {
				String msg = list.get(i).getErrorMsg();
				if (msg.startsWith("Success")) {
                    slist.add(list.get(i));
				} else {
                    elist.add(list.get(i));  
				}
			}
		}
		
		for(int i=0;i<slist.size();i++){
			String cardName = slist.get(i).getCardName();
			if(cardName.equalsIgnoreCase("32")){
				sVisaELectron++;
			}else if(cardName.equalsIgnoreCase("31")){
				svisa++;
			}else if(cardName.equalsIgnoreCase("35")){
				smaster++;
			}else if(cardName.equalsIgnoreCase("36")){
				sVisaDelta++;
			}else if(cardName.equalsIgnoreCase("37")){
				sSolo++;				
			}else if(cardName.equalsIgnoreCase("39")){
				sJCB++;				
			}
		}
		
		for(int i=0;i<elist.size();i++){
			String cardName = elist.get(i).getCardName();
			if(cardName.equalsIgnoreCase("32")){
				visaELectron.add(elist.get(i));
			}else if(cardName.equalsIgnoreCase("31")){
				visa.add(elist.get(i));
			}else if(cardName.equalsIgnoreCase("35")){
				master.add(elist.get(i));
			}else if(cardName.equalsIgnoreCase("36")){
				visaDelta.add(elist.get(i));
			}else if(cardName.equalsIgnoreCase("37")){
				solo.add(elist.get(i));				
			}else if(cardName.equalsIgnoreCase("39")){
				jcb.add(elist.get(i));				
			}
		}
       content+="\n***********************************\nVISA\n\t";
       content+="success:"+svisa+"\n\t";
       content+="failure:"+visa.size()+"\n\t\t";
       if(visa.size()>0){
    	   for(int i=0;i<visa.size();i++){
    		   content+="Time:"+visa.get(i).getCreateDate()+"\t\t";
    		   content+="Message:"+visa.get(i).getErrorMsg()+"\n";
    		   if(i!=visa.size()-1){
    			   content+="\t\t";
    		   }
    	   }
       }
      
       content+="-----\nMaster\n\t";
       content+="success:"+smaster+"\n\t";
       content+="failure:"+master.size()+"\n\t\t";
       if(master.size()>0){
    	   for(int i=0;i<master.size();i++){
    		   content+="Time:"+master.get(i).getCreateDate()+"\t\t";
    		   content+="Message:"+master.get(i).getErrorMsg()+"\n";
    		   if(i!=master.size()-1){
    			   content+="\t\t";
    		   }
    	   }
       }
       content+="-----\nVisa ELectron\n\t";
       content+="success:"+sVisaELectron+"\n\t";
       content+="failure:"+visaELectron.size()+"\n\t\t";
       if(visaELectron.size()>0){
    	   for(int i=0;i<visaELectron.size();i++){
    		   content+="Time:"+visaELectron.get(i).getCreateDate()+"\t\t";
    		   content+="Message:"+visaELectron.get(i).getErrorMsg()+"\n";
    		   if(i!=visaELectron.size()-1){
    			   content+="\t\t";
    		   }
    	   }
       }
       content+="-----\nVisa Delta\n\t";
       content+="success:"+sVisaDelta+"\n\t";
       content+="failure:"+visaDelta.size()+"\n\t\t";
       if(visaDelta.size()>0){
    	   for(int i=0;i<visaDelta.size();i++){
    		   content+="Time:"+visaDelta.get(i).getCreateDate()+"\t\t";
    		   content+="Message:"+visaDelta.get(i).getErrorMsg()+"\n";
    		   if(i!=visaDelta.size()-1){
    			   content+="\t\t";
    		   }
    	   }
       }
       content+="-----\nSolo\n\t";
       content+="sucess:"+sSolo+"\n\t";
       content+="failure:"+solo.size()+"\n\t\t";
       if(solo.size()>0){
    	   for(int i=0;i<solo.size();i++){
    		   content+="Time:"+solo.get(i).getCreateDate()+"\t\t";
    		   content+="Message:"+solo.get(i).getErrorMsg()+"\n";
    		   if(i!=solo.size()-1){
    			   content+="\t\t";
    		   }
    	   }
       }
       content+="-----\nJCB\n\t";
       content+="sucess:"+sJCB+"\n\t";
       content+="failure:"+jcb.size()+"\n\t\t";
       if(jcb.size()>0){
    	   for(int i=0;i<jcb.size();i++){
    		   content+="Time:"+jcb.get(i).getCreateDate()+"\t\t";
    		   content+="Message:"+jcb.get(i).getErrorMsg()+"\n";
    		   if(i!=jcb.size()-1){
    			   content+="\t\t";
    		   }
    	   }
       }
       return content;
		
	}
		
		

	private  String getLastDay(){
		Long lasttime=System.currentTimeMillis()-24*60*60000;
		return new SimpleDateFormat("dd-MM-yyyy")
		.format(new Date(lasttime));
	}
	
	@Override
	public void setServletContext(ServletContext arg0) {
		// TODO Auto-generated method stub
		this.servletContext = arg0;
	}
}
