<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld"%>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld"%>
<!DOCTYPE html >
<html>
<head>
<title>Open Store</title>
<meta name="description" content="" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/pc/main_regaine.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	var sessionId='${pageContext.session.id}';
var path = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pc/regaine/common.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	});

	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
	  _gaq.push(['_trackPageview', 'Thanks']);
	  
	  _gaq.push(['b._setAccount', 'UA-35779257-7']);
	  _gaq.push(['b._trackPageview', 'Thanks']);
	  
	  

	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();

	  function gaAppLink(){
		  _gaq.push(['_trackevent', 'ext link', 'click', 'app' , , 'true']);
		  _gaq.push(['b._trackevent', 'ext link', 'click', 'app' , , 'true']);
	  }

</script>
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://piwik.dotter.me/" : "http://piwik.dotter.me/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php",6);
piwikTracker.setDocumentTitle('Thanks');
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=6" style="border:0" alt="" /></p></noscript>
<script type="text/javascript">
	var rtl="${defaultRetailer}";
	var path='${pageContext.request.contextPath}';
	$(document).ready(function(){
		remoteStorage.removeItem(rtl+"RegaineBasket");
		if(remoteStorage.getItem('addBasketSuccess')=="addBasketSuccess"){
			remoteStorage.removeItem('addBasketSuccess');
			var tmpUrl=encodeUrl("/sendBriefEmail.action");
// 			var tmpUrl=path+"/sendBriefEmail.action";
			var em=remoteStorage.getItem("Regaine"+rtl+"_userName");
			if(rtl=="Pharmacy")rtl="Pharmacy2U";
			var tmpName="Thank you for adding REGAINE® to your basket at "+rtl.toUpperCase();
			$.post(tmpUrl,{'toEmail':em,'retailer':rtl,'subject':tmpName});
		}
		remoteStorage.save();
	});

</script>
</head>
<body id="Thanks Page">

<div class="store_page">

		<div class="store_content">
			<div class="store_thanks">
				<ul style="width: 100%; height: 20px;">
				<li  class="store_thanksli01" ><a href="${pageContext.request.contextPath}/regaine;jsessionid=${pageContext.session.id}"><font color="#252c4c"> BACK TO HOME PAGE</font></a>
				</li>
				</ul>
				<ul>
					<li class="store_thankslia">THANK YOU</li>
					<li class="store_thankslib">
					<c:if test="${fn:toLowerCase(defaultRetailer) == 'pharmacy'}">
					Your selected products have been
						added to your ${fn:toUpperCase(defaultRetailer)}2U basket.
					</c:if>
					<c:if test="${fn:toLowerCase(defaultRetailer) != 'pharmacy'}">
					Your selected products have been
						added to your ${fn:toUpperCase(defaultRetailer)} basket.
					</c:if>
					 <br />
					<br /> To view your basket and complete the purchase process click
						here:
					</li>
					<li class="store_thankslic"><img onClick="goToRetailer(this)"  style="cursor:pointer;"
						class="${defaultRetailer}"
						src="${pageContext.request.contextPath}/images/pc/regaine/logo_${defaultRetailer}.png"
						height="90" border="0"></li>
					<li class="store_thankslid"><span> DISCLAIMER </span><br />
						The link above takes you to an independent retailer's website to
						which this <a target="_blank"
						href="http://www.regaine.co.uk/privacy-policy " style="text-decoration:underline;color:#1b1b1b;">Privacy Policy</a>
						does not apply.  We encourage you to read the privacy policy of
						the retailer’s website. If you proceed to enter and/or purchase
						from them, you do so on the terms and conditions that relate to
						their site.</li>

					<li class="store_xina"></li>
					<li class="store_thankslie">Why not download the free REGAINE<span style="font-size: 8px;vertical-align:super;">&reg;</span>
						iPhone app the ultimate advice and support tool for using REGAINE<span style="font-size: 8px;vertical-align:super;">&reg;</span>
						and tracking your progress over the first 16 weeks.</li>
					<li class="store_thankslif"><a target="_blank" onclick="gaAppLink();"
						href="http://www.regaine.co.uk/new-iphone-app"> <img
							src="${pageContext.request.contextPath}/images/pc/regaine/app_store.png"
							height="52" border="0" style="padding-top: 15px;"></a></li>
					<li class="store_xinb"></li>
				</ul>
			</div>

		</div>


		<div class="home_footer">
			<div class="footer_ess">
				<b><font color="#252c4c"> ESSENTIAL INFORMATION</font></b><br /> REGAINE<span>&reg;</span> for Men Extra
				Strength Scalp Foam 5% w/w cutaneous foam, REGAINE<span>&reg;</span> for Men Extra
				Strength 5% Solution and REGAINE<span>&reg;</span> for Women Regular Strength 2%
				Solution contain Minoxidil. Always read the label. For
				Hereditary Hair Loss. Use Continually
			</div>
			<div class="footer_about">
				<span> ABOUT THIS SITE</span><br /> This service is provided by
				Dotter and the products are being offered for sale by retailers and
				not McNeil Healthcare (UK) Ltd. For more information including
				Dotter’s privacy policy – <a href="${pageContext.request.contextPath}/jsp/pc/regaine/terms.jsp;jsessionid=${pageContext.session.id}"><span  style="color: #1b1b1b;"> SEE TERMS</span></a>
			</div>
			<div class="clear"></div>
			<div class="footer_logo">
				<img
					src="${pageContext.request.contextPath}/images/pc/regaine/logo_dotter.png"
					name="" border="0">
			</div>
		</div>
	</div>




	
</body>
</html>