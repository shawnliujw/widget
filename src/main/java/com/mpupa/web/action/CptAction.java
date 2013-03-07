package com.mpupa.web.action;

import java.text.SimpleDateFormat;
import java.util.Date;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.mpupa.model.CptModel;
import com.mpupa.service.ICptService;
import com.mpupa.utils.CipherKey;
import com.mpupa.utils.WebAppUtil;

@Controller
@RequestMapping("/")
public class CptAction {
	@Resource(name = "cptService")
	private ICptService cptService;

	@RequestMapping("/checkCouponEmail")
	public void checkCouponEmail(HttpServletRequest request,
			HttpServletResponse response, String email) {
		CptModel cm = this.cptService.getCouponEmail(email);
		if (null == cm) {
			// 将此email 加入到表里。生成cpt 连接。
			saveEmailIntoDb(email);
			String url = getCptPrintUrl(email);
			String send_result = sendEmailToCustomer(request, email,
					getHtmlContent(url));
			if (send_result.equals("200")) {
				WebAppUtil.outputJSONResult(
						"success,has insert into db and send email"
								.toLowerCase(), response);
			} else {
				WebAppUtil.outputJSONResult(
						"failure,404 email address can not be reached."
								.toLowerCase(), response);
			}
			return;
		}
		WebAppUtil.outputJSONResult("failure,has exist in db.".toLowerCase(),
				response);
	}

	private String sendEmailToCustomer(HttpServletRequest request,
			String email, String content) {
		String result = "200";
		ApplicationContext ctx = WebApplicationContextUtils
				.getRequiredWebApplicationContext(request.getSession()
						.getServletContext());
		JavaMailSender sender = (JavaMailSender) ctx.getBean("mailSenderFotSpkCoupon");
		JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
		MimeMessage msg = senderImpl.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
			// helper.setFrom(new InternetAddress("something@kelloggs.co.uk"));
			//helper.setReplyTo(new InternetAddress("something@kelloggs.co.uk"));
			helper.setTo(email);
			helper.setSubject("50p off your next purchase of Special K");
			helper.setText(content, true);
			sender.send(msg);
			System.out.println("success send.....");
		} catch (Exception e) {
			e.printStackTrace();
			result = "404";// email address can not be reached.
		}
		return result;
	}

	private String getCptPrintUrl(String email) {
		String key = CipherKey
				.encodeCPT(email, 9239, "9oa48ysw56",
						"8UuvFYH9fAzyjRWwxqQ4tdeMNBcs5ZGk2pbIKgV6iaOlEnSJ3or7hmD1LXCTP");
		String url = "http://bricks.couponmicrosite.net/javabricksweb/Index.aspx?o=9239&c=SK&p="
				+ email + "&cpt=" + key + "&ct=Special+K  ";
		return url;
	}

	private void saveEmailIntoDb(String email) {
		CptModel cp = new CptModel();
		cp.setCoupon_email(email);
		cp.setSave_time(new SimpleDateFormat("dd-MM-yyyy hh:mm:ss")
				.format(new Date(System.currentTimeMillis())));
		this.cptService.saveCpt(cp);
	}

	private String getHtmlContent(String url) {
		String result = "<html xmlns=\"http://www.w3.org/1999/xhtml\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><title>Why not use your coupon to try our delicious new chocolate range?</title></head><body><div style=\"width:701px;margin:0 auto;\"><div><img src=\"http://apps.dotter.me/store/images/pc/kellogg/cpt_01.png\" width=\"701\" height=\"442\"  border=\"0\"/></div><div> <table width=\"701\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td><img src=\"http://apps.dotter.me/store/images/pc/kellogg/cpt_02.png\" width=\"142\" height=\"88\"  border=\"0\" /></td><td><a href=\""
				+ url
				+ "\"><img src=\"http://apps.dotter.me/store/images/pc/kellogg/cpt_03.png\" width=\"424\" height=\"88\"   border=\"0\"/></a></td><td><img src=\"http://apps.dotter.me/store/images/pc/kellogg/cpt_04.png\" width=\"135\" height=\"88\"   border=\"0\"/></td></tr></table><p style=\" font-family: arial; font-size: 9px\">Coupons can only be printed using Internet Explorer, Firefox or Chrome on a Windows PC and Safari on a Mac.  Mobile devices are not supported.</p></div></div></body></html>";
		return result;
	}
}
