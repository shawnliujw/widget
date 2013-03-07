<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld" %>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Open Store</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/mobile/main_nesquik.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/jquery/scroll/jquery.mCustomScrollbar2.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/scroll/jquery.mousewheel.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/scroll/jquery.mCustomScrollbar.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/cufon.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/defineCufon.js"></script>
</head>
<script>
	$(document).ready(function() {
	
		$(".terms_text").mCustomScrollbar({
			autoDraggerLength:true,
		});
		//alert($("#defaultRetailerPrice").val())
		//displayDefaultBasketInfo();
		 var _gaq = _gaq || [];
		 _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
		  _gaq.push(['_trackPageview','Terms']);

		  (function() {
		    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();
});
		</script>
<body id="Term Page" >
	<div id="BlowFishHomePage" class="blowfish_page" >
          <div class="blowfish_term_header">
          
        <a href="${pageContext.request.contextPath}/${brandModel['brandName']}">
				<img src="${pageContext.request.contextPath}/images/dotter_logo.png"
				height="32" name="" border="0"> </a></div>
          <div class="clear"></div>
          <div class="terms_content">
								          <div class="terms_content_title" style="padding-left:15px;"><h2>Dotter Terms and Policies</h2></div>
                       <div class="terms_text">
							
							This page (together with the documents referred to on it) tells you the terms of use and policies for the Dotter service (the Dotter service), Please read these terms of use carefully before you start to use the Dotter service. By using the Dotter service, you indicate that you accept our terms and policies. 
							<br/></br/>
							<h3>Information about us</h3>
							The Dotter service is operated by M.Pupa Ltd ("We").  We are registered in England and Wales under company number 07487210 and have our registered office at 13D The Stables Sansaw Business Park, Hadnall, Shrewsbury, Shropshire, England, SY4 4AS.  
							<br/><br/>
							<h3>Description of the Dotter service</h3>
							The Dotter service is intended to allow you to obtain information about products and to buy products from third parties. The Dotter service will be provided on ‘Host Sites’ such as a brand manufacturer’s website, Facebook page, YouTube site or any other site a brand manufacturer may use for marketing purposes . 
							<br/><br/>
							<h3>Accessing the Dotter service</h3> 
							Access to the Dotter service is permitted on a temporary basis, and we reserve the right to withdraw or amend the service we provide on the Dotter service without notice. We will not be liable if for any reason the Dotter service is unavailable at any time or for any period.
							<br/><br/>
							<h3>Buying products bought through the Dotter service</h3>
							To buy products through the Dotter service you will need to have an account with the third party retailer shown on the Dotter service or provide permission for us to create an account for you.  You acknowledge that while the Dotter service facilitates you to buy products, you are not buying products from us but from third party retailers under your account terms with them.  
							<br/><br/>
							<h3>Privacy Policy</h3>
							We are committed to protecting your privacy. We will only use the information that we collect about you lawfully (in accordance with the Data Protection Act 1998 and other applicable data protection laws in the UK). 
							<br/><br/>
							We also ensure the security of your data. We work to the highest security standards and are PCI DSS compliant – for more on PCI DSS see <a href="https://www.pcisecuritystandards.org/" target="_blank" style="color:#666666;">https://www.pcisecuritystandards.org/</a>. 
							<br/><br/>
							
							<div style="padding-left: 15px;">
									<h4>a.Information Collected</h4>
									We collect information to provide better services to all of our users. This information can be broken down into two areas:
									<div style="padding-left: 30px;">
									<ul>
									<li>i.	Information you provide<br/>
									<div style="padding-left:8px;">In using the Dotter service you may be required to provide us personal data such as usernames and passwords to third party retailers’ sites. In addition we may require an email address, postal address or credit card details. 
									We may store your usernames to make using the Dotter service quicker to use in future, we will not store any other personal data. </div>
									<br/>
									<li>ii.	Information that we get from use of our services<br/>
									<div style="padding-left:8px;">In using the service we may collect additional information such as:<br/>
									●	Device information. For example if you are using a PC, Mobile device or tablet. <br/>
									●	Purchase information. The goods and services you purchased from retailers<br/>
									●	Log information. 
									<div style="padding-left:8px;">
									○	details of how you used our service, such as your product queries<br/>
									○	Internet protocol address<br/>
									○	device event information, such as crashes, system activity, hardware settings, browser type, browser language, the date and time of your request and referral URL<br/>
									</div>
									●	User communications. When you send email or other communications to us, we may retain those communications in order to process your enquiries, respond to your requests and improve our services.<br/>
						           </div>
						            </li>
						            </ul>
						            </div>
						  </div>
						  <br/>
						  <div style="padding-left: 15px;">
							<h4>b.	What we do with the information we collect</h4>
							We use the information that we collect from all of our services to provide, maintain, protect and improve them, to develop new ones and to protect us and our users. <br/><br/>
							If you ever contact us, we may keep a record of your communication to help resolve issues. <br/><br/>
							We use information collected from cookies and other technologies to improve user experience and the overall quality of our services. <br/><br/>
							We will always ask for your consent before using information for a purpose other than those set out in this Privacy Policy.
						  </div>
						  <br/>
						  <div style="padding-left: 15px;">
							<h4>c.	What information do we share</h4>
							We may share anonymous aggregated data with our third party retail and brand partners to enable them to better improve their services. The information shared will <strong>never</strong>  enable our partners to identify you or contact you unless we have explicitly asked for and you have provided consent. 
							<br/><br/>
							We may disclose your personal data to third parties without obtaining your prior consent if we are required to do so by law. We reserve the right to investigate suspected violations of the Terms & Policies of the Dotter service or illegal, fraudulent or inappropriate behaviour. We will fully cooperate with any law enforcement authorities or any court order requesting or directing us to disclose the identity and data of anyone believed to have violated the Dotter service Terms and Policies or to have engaged in illegal or fraudulent behaviour. 
							<br/><br/>
							</div>
							<h3>Cookies</h3>
							The Dotter service use "cookies" technology to store data in your computer using the functionality of your browser. A lot of services do this, because cookies allow service providers to do useful things like find out whether the computer (and probably its user) has used the service before and simplify the process of using the service again. 
							<br/><br/>
							Cookies enable us to operate an efficient service and to track the patterns of behaviour of visitors to the website. We use the information stored in the cookies to identify you, in order to:
							<div style="padding-left: 15px;">
							●	implement any personalised settings and preferences that you have indicated in the past,<br/>
							●	keep track of your activity as you use the Service<br/>
							●	take other actions designed to personalise your use of the Service and make it more convenient and efficient.
					        </div>
					        <br/>
							You can usually modify your web browser to notify you of cookie placement requests or decline cookies completely. If you do this the Service will still work properly but will be less convenient to use. 
							<br/><br/>
							Otherwise, your use of the Service (including any functionality that allows the Website to recall your past history and personalised settings) constitutes your express consent to allow us to use cookies in such manner. Furthermore, by choosing any personalised settings, you are giving us express consent to use cookies to remember your choices. 
							<br/><br/>
							In addition, we use third party web analytics services, such as Google Analytics, to help analyse use of our website. These analytical tools use cookies to collect standard internet log information and visitor behaviour information in an anonymous form. Other third party services which you use in conjunction with the Service (such as Host Sites, Facebook, YouTube) may have their own policies regarding cookies. Your use of such third party services is subject to such policies. Please read and be aware of all such policies. If you want to delete any cookies or web beacons that are already on your computer or stop future cookies or web beacons, please go to the instructions for your file management software or look at <a href="http://www.AboutCookies.org" target="_blank" style="color:#666666;">www.AboutCookies.org</a>.
							<br/><br/>
							
							<h3>Intellectual property rights</h3>
							We are the owner or the licensee of all intellectual property rights in the Dotter service, and in the Dotter material published via the Dotter service.  The owner of the Host Site you visited owns or is the licensee of all intellectual property rights on its site (such as its brand names and any images of its products).  Third party retailers or its licensees own intellectual property rights in information and other materials accessible via the Dotter service regarding the products.  Those works are protected by trademark and copyright laws and treaties around the world.  All such rights are reserved. 
							<br/><br/>
							<h3>Reliance on information posted</h3>
							Where we present you with information and pricing about products, we have obtained this information and pricing from the Host Site or the retailers shown.  We have used reasonable skill and care to ensure that we accurately present such information and that, in any comparison of products between retailers, the Dotter service accurately displays products from retailers on an identical or like-for-like basis.  However, we cannot guarantee accuracy and you acknowledge that you are responsible for verifying the information and pricing about the product before you buy and that the product you buy is the one you want to buy.
							Commentary and other materials posted on the Dotter service are not intended to amount to advice on which reliance should be placed.  We therefore disclaim all liability and responsibility arising from any reliance placed on such materials by any visitor to the Dotter service, or by anyone who may be informed of any of its contents. 
							<br/><br/>
							<h3>The Dotter service changes regularly</h3>
							We aim to update the Dotter service regularly, and may change the content at any time including the third party retailers featured. If the need arises, we may suspend access to the Dotter service, or close it indefinitely. Any of the material on the Dotter service may be out of date at any given time, and we are under no obligation to update such material. 
							<br/><br/>
							<h3>Our liability</h3>
							Neither we, nor the Host Site have any liability in respect of products you buy via the Dotter service.  Your contract for products is with the retailer from whom you have bought the product and you should contact them regarding any issues regarding products.
							<br/><br/>
							The material displayed on the Dotter service is provided without any guarantees, conditions or warranties as to its accuracy. To the extent permitted by law, we, other members of our group of companies and third parties connected to us expressly exclude:
							<div style="padding-left:15px;">
							●	All conditions, warranties and other terms which might otherwise be implied by statute, common law or the law of equity.<br/>
							●	Any liability for any direct, indirect or consequential loss or damage incurred by any user in connection with the Dotter service or in connection with the use, inability to use, or results of the use of the Dotter service, any websites linked to it and any materials posted on it, including: loss of income or revenue, loss of business, loss of profits or contracts, loss of anticipated savings, loss of data, loss of goodwill, wasted management or office time, and<br/>
							●	whether caused by tort (including negligence), breach of contract or otherwise, even if foreseeable, provided that this condition shall not prevent claims for loss of or damage to your tangible property or any other claims for direct financial loss that are not excluded by any of the categories set out above.<br/>
							</div>
							This does not affect our liability for death or personal injury arising from our negligence, nor our liability for fraudulent misrepresentation or misrepresentation as to a fundamental matter, nor any other liability which cannot be excluded or limited under applicable law.
							<br/><br/>
							<h3>Viruses, hacking and other offences</h3>
							You must not misuse the Dotter service by knowingly introducing viruses, trojans, worms, logic bombs or other material which is malicious or technologically harmful. You must not attempt to gain unauthorised access to the Dotter service, the server on which the Dotter service is stored or any server, computer or database connected to the Dotter service. You must not attack the Dotter service via a denial-of-service attack or a distributed denial-of service attack. 
							<br/><br/>
							By breaching this provision, you would commit a criminal offence under the Computer Misuse Act 1990. We will report any such breach to the relevant law enforcement authorities and we will co-operate with those authorities by disclosing your identity to them. In the event of such a breach, your right to use the Dotter service will cease immediately.
							<br/><br/>
							We will not be liable for any loss or damage caused by a distributed denial-of-service attack, viruses or other technologically harmful material that may infect your computer equipment, computer programs, data or other proprietary material due to your use of the Dotter service or to your downloading of any material posted on it, or on any website linked to it.
							<br/><br/>
							
							<h3>Jurisdiction and applicable law</h3>
							The English courts will have exclusive jurisdiction over any claim arising from, or related to, a visit to the Dotter service although we retain the right to bring proceedings against you for breach of these conditions in your country of residence or any other relevant country.  
							These terms of use and any dispute or claim arising out of or in connection with them or their subject matter or formation (including non-contractual disputes or claims) shall be governed by and construed in accordance with the law of England.
							<br/><br/>
							<h3>Variations</h3>
							We may revise these terms of use at any time by amending this page. You are expected to check this page from time to time to take notice of any changes we made, as they are binding on you. Some of the provisions contained in these terms of use may also be superseded by provisions or notices published elsewhere on the Dotter service.
							<br/><br/>
							<h3>Your concerns</h3>
							If you have any concerns about material which appears on the Dotter service, please contact <a href="mailto:enquiries@dotter.me" style="color:#666666;">enquiries@dotter.me</a>
							<br/><br/>
							Thank you for visiting the Dotter service.
					</div>	          
	      </div>
		     
		     <div style="float: right; margin-right: 15px; margin-bottom: 20px;">
	                     <input class="input_btn04" style="width: 100px; margin-top:20px; " type="button" value="BACK" name="" onclick="javascript:window.history.go(-1);"/>
	                  </div>
	                  <div class="clear"></div>
		      <div class="home_footer">
                 <div class="home_footercon">
                   <div class="home_footerlogo"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/dotter_logo.png" width="22" name="" border="0"></div>
                   <div class="home_footertext">POWERED BY DOTTER IN ASSOCIATION<br/> WITH NESTLE   |   <a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/all/terms"><span>SEE TERMS</span></a></div>
                 </div>
             </div>
   </div>
</body>
</html>