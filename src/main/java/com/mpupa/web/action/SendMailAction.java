package com.mpupa.web.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.support.WebApplicationContextUtils;

import sun.util.logging.resources.logging;

import com.mpupa.model.UserAlertModel;
import com.mpupa.service.IUserAlertService;
import com.mpupa.utils.WebAppUtil;


@Controller
@RequestMapping("/")
public class SendMailAction {
	
	@Resource(name="userAlertService")
	private IUserAlertService userAlertService;
	
	private final String SYSTEMERRORMSG="Webkit is down,please restart!";
	
	@RequestMapping("/sendSystemError")
	public void sendSystemErrorMsg(HttpServletRequest request,HttpServletResponse response){
		String ip=request.getRemoteAddr();
		String content=SYSTEMERRORMSG+"\r\n"+"ip:\t"+ip;
		System.out.println("Start send...");
		WebAppUtil.sendMessage(content,request.getSession().getServletContext(), null, null);
		System.out.println("Success send...");
	}
	
	@RequestMapping("/saveAlertUser")
	public void saveAlertUser(String userName,Integer clientId, Integer brandId,Integer retailerId) {
		UserAlertModel userAlertModel =  new UserAlertModel();
			userAlertModel.setUserName(userName);
			userAlertModel.setBrandId(brandId);
			userAlertModel.setClientId(clientId);
			userAlertModel.setRetailerId(retailerId);
			userAlertModel.setFromProject("openstore");
			userAlertService.saveUserAlert(userAlertModel);
	}
	
	@RequestMapping("/sendBriefEmail")
	public void sendBriefEmail(String toEmail,String retailer,String subject,HttpServletRequest request,HttpServletResponse response){
		if(toEmail==null||""==toEmail||retailer==null||""==retailer){
			System.out.println("email is null");
		}else{
			String context=briefContent;
			context=context.replace("[RETAILER NAME]",retailer.toUpperCase());
			context=context.replace("unifiedRetailerName",retailer);
			System.out.println("Start send...");
			ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext());
			JavaMailSender   sender = (JavaMailSender) ctx.getBean("mailSender4Regaine");
			JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
			MimeMessage msg = senderImpl.createMimeMessage();
			try {
				if(subject==null||"".equals(subject))subject="Regaine breif email";
				MimeMessageHelper helper = new MimeMessageHelper(msg, true,"UTF-8");
				helper.setFrom(new InternetAddress("info@email.regaine.co.uk"));
				 helper.setValidateAddresses(false);
//				helper.setFrom("info@email.regaine.co.uk");
				helper.setReplyTo("info@email.regaine.co.uk");
				helper.setTo(toEmail);
				helper.setSubject(subject);
				helper.setText(context,true);
				sender.send(msg);
			} catch (MessagingException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("Success send...");
		}
	}
	
	private String briefContent="<html>"+
			"<body>"+
			"	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"+
			"		<tr>"+
			"			<td align=\"center\" style=\"font-family: Arial, Helvetica, sans-serif; font-size: 100%;\"><table width=\"790\" height=\"724px\" border=\"0\" align=\"center\" cellspacing=\"0\">"+
			"					<tr height=\"94px\" style=\"background: #292f53; /* Old browsers */ background: -moz-linear-gradient(top, #292f53 0%, #181e37 100%); /* FF3.6+ */ background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #292f53), color-stop(100%, #181e37) ); /* Chrome,Safari4+ */ background: -webkit-linear-gradient(top, #292f53 0%, #181e37 100%); /* Chrome10+,Safari5.1+ */ background: -o-linear-gradient(top, #292f53 0%, #181e37 100%); /* Opera 11.10+ */ background: -ms-linear-gradient(top, #292f53 0%, #181e37 100%); /* IE10+ */ background: linear-gradient(to bottom, #292f53 0%, #181e37 100%); /* W3C */ filter: progid:DXImageTransform.Microsoft.gradient(  startColorstr='#292f53', endColorstr='#181e37', GradientType=0 );\">"+
			"						<td style=\"border-bottom: 6px solid #a19e9f;\">"+
			"							<table cellspacing=\"18\">"+
			"								<tr>"+
			"									<td><img src=\"http://apps.dotter.me/store/images/pc/regaine/regaine_logo_email.png\" alt=\"regaine logo\" height=\"53px\" width=\"167px\" border=\"0\" style=\"margin-left: 30px;\" /></td>"+
			"								</tr>"+
			"							</table>"+
			"						</td>"+
			"						<td style=\"border-bottom: 6px solid #a19e9f; text-align: right;\"><a href=\"http://apps.dotter.me/store/Regaine/home/unifiedRediect.action\" target=\"_blank\"><img src=\"http://apps.dotter.me/store/images/pc/regaine/regaine-email-btn.png\" alt=\"regaine button\" height=\"55px\" width=\"210px\" border=\"0\" style=\"margin-right: 30px;\" /></a></td>"+
			"					</tr>"+
			"					<tr height=\"530px\" style=\"background: #313a65; /* Old browsers */ background: -moz-radial-gradient(center, ellipse cover, #313a65 0%, #292f53 100%); /* FF3.6+ */ background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, #313a65), color-stop(100%, #292f53) ); /* Chrome,Safari4+ */ background: -webkit-radial-gradient(center, ellipse cover, #313a65 0%, #292f53 100%); /* Chrome10+,Safari5.1+ */ background: -o-radial-gradient(center, ellipse cover, #313a65 0%, #292f53 100%); /* Opera 12+ */ background: -ms-radial-gradient(center, ellipse cover, #313a65 0%, #292f53 100%); /* IE10+ */ background: radial-gradient(ellipse at center, #313a65 0%, #292f53 100%); /* W3C */ filter: progid:DXImageTransform.Microsoft.gradient(  startColorstr='#313a65', endColorstr='#292f53', GradientType=1 );\">"+
			"						<td align=\"center\" valign=\"centre\" style=\"border-bottom: 6px solid #a19e9f;\">"+
			"							<table width=\"85%\" height=\"80%\">"+
			"								<tr>"+
			"									<td valign=\"top\" style=\"color: #FFFFFF;font-size:16px;line-height: 110%;\">Dear Valued Customer,<br /> <br /> Thank you for adding REGAINE<span style=\"font-size: 8px; vertical-align: text-top;\">&reg;</span>"+
			"										to your shopping basket at [RETAILER NAME]<br />"+
			"									<br /> Please remember you need to complete the purchase process and checkout. You can do that now by <a href=\"http://apps.dotter.me/store/Regaine/unifiedRetailerName/unifiedRediect.action\" style=\"color: #ffffff; text-decoration: underline;\">clicking here</a><br />"+
			"									<br /> If you have any questions about REGAINE<span style=\"font-size: 8px; vertical-align: text-top;\">&reg;</span> please visit the REGAINE<span style=\"font-size: 8px; vertical-align: text-top;\">&reg;</span>"+
			"										<a href=\"http://apps.dotter.me/store/Regaine/faq/unifiedRediect.action\" style=\"color: #ffffff;\" target=\"_blank\"><span style=\"color: #ffffff; text-decoration: none;\">website</span></a><br /> <br /> Many thanks,<br /> <br /> The REGAINE<span style=\"font-size: 8px; vertical-align: text-top;\">&reg;</span> Team"+
			"									</td>"+
			"								</tr>"+
			"							</table>"+
			"						</td>"+
			"						<td style=\"border-bottom: 6px solid #a19e9f;\" align=\"center\">"+
			"							<table cellspacing=\"18\" style=\"width: 300px; height: 518px; background: #b0a380;\">"+
			"								<tr>"+
			"									<td><img src=\"http://apps.dotter.me/store/images/pc/regaine/regaine_lifestyle.png\" height=\"342\" width=\"290\" style=\"margin: 5px;\" border=\"0\" /> <span style=\"width: 265px; margin: 5px auto; font-size: 15px; text-align: left; color: #ffffff; line-height: 115%;\">The"+
			"											REGAINE<span style=\"font-size: 8px; vertical-align: text-top;\">&reg;</span> iPhone app is the ultimate advice and support tool for using"+
			"											REGAINE<span style=\"font-size: 8px; vertical-align: text-top;\">&reg;</span> and tracking your progress over the first 16 weeks. If you haven't done so already, you can download it here for free"+
			"									</span><br />"+
			"									<br /> <a href=\"http://apps.dotter.me/store/Regaine/appstore/unifiedRediect.action\" target=\"_blank\"><img src=\"http://apps.dotter.me/store/images/pc/regaine/app-img.png\" width=\"150\" height=\"42\" style=\"margin: 5px 75px;\" border=\"0\" /></a>"+
			"									</td>"+
			"								</tr>"+
			"							</table>"+
			"						</td>"+
			"					</tr>"+
			"					<tr height=\"100px\" style=\"background: #141b38;\">"+
			"						<td style=\"border-left: 3px;\" colspan=\"2\">"+
			"							<table cellspacing=\"18\">"+
			"								<tr>"+
			"									<td><span style=\"width: 750px; font-size: 9px; color: #ffffff; margin-left: 20px;\">ESSENTIAL INFORMATION: REGAINE<span style=\"position: relative; font-size: 6px; vertical-align: top;\">&reg;</span>"+
			"											for Men Extra Strength Scalp Foam 5% w/w cutaneous foam, REGAINE<span style=\"position: relative; font-size: 6px; vertical-align: top;\">&reg;</span>"+
			"											for Men Extra Strength 5% Solution and REGAINE<span style=\"position: relative; font-size: 6px; vertical-align: top;\">&reg;</span>"+
			"											for Women Regular Strength 2% Solution contain Minoxidil. Always read the label. For Hereditary Hair Loss. Use Continually"+
			"									</span><br />"+
			"									<br /> <span style=\"width: 750px; font-size: 9px; color: #ffffff; margin-left: 20px;\">DISCLAIMER: The retailer link above takes you to an independent"+
			"											retailer's website to which this <a href=\"http://www.regaine.co.uk/privacy-policy\" style=\"color: #ffffff;\" target=\"_blank\">Privacy Policy</a>"+
			"											does not apply. We encourage you to read the privacy policy of the retailer's website. If you proceed to enter and/or"+
			"											purchase from them, you do so on the terms and conditions that relate to their site. This service is provided by Dotter"+
			"											and the products are being offered for sale by retailers and not McNeil Healthcare (UK) Ltd. For more information including Dotter's privacy policy - <a href=\"http://dotter.me/terms.php\" style=\"color: #ffffff;\" target=\"_blank\">see terms</a>"+
			"									</span></td> </tr> </table> </td> </tr> </table></td> </tr> </table>"+
			"</body> </html>";


	
	
}
