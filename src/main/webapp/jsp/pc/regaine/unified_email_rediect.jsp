<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UNIFIED REDIECT INTERFACE</title>
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	var sessionId='${pageContext.session.id}';
var path = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pc/regaine/common.js"></script>
<script type="text/javascript">
	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
	  _gaq.push(['_trackPageview', 'Unified Rediect']);
	  
	  _gaq.push(['b._setAccount', 'UA-35779257-7']);
	  _gaq.push(['b._trackPageview', 'Unified Rediect']);

	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();


</script>
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://piwik.dotter.me/" : "http://piwik.dotter.me/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php",6);
piwikTracker.setDocumentTitle('Unified Rediect');
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=6" style="border:0" alt="" /></p></noscript>
<script type="text/javascript">
	var retailer="${defaultRetailer}";
	
	$(document).ready(function(){
		var tmpUrl="http://www.regaine.co.uk";
		var g="regaine";
		var rtlUrl={"Boots":"http://www.boots.com/webapp/wcs/stores/servlet/OrderItemDisplay?URL=OrderItemDisplay%3ForderType%3Dregular&storeId=10052&orderType=regular&updatePrices=1&calculationUsageId=-1&langId=-1&catalogId=11051",
				"Pharmacy2U":"http://www.pharmacy2u.co.uk/ssl/checkout/basket.aspx",
				"Asda":"http://groceries.asda.com/asda-estore/checkout/regularviewtrolleycontainer.jsp?requestedURL=/asda-estore/home/basket-greyedout-hero.jsp",
				"Sainsbury's":"http://www.sainsburys.co.uk/groceries/trolley/trolley.jsp",
				"Amazon":"http://www.amazon.co.uk/gp/cart/view.html/ref=gno_cart",
				"Tesco":"http://www.tesco.com/groceries/Basket/"};
		if("appstore" == retailer){
			tmpUrl="https://itunes.apple.com/gb/app/regaine/id441554382?mt=8#";
			g="app";
		}else if("home" ==retailer){
			
		}else if("faq" ==retailer){
			tmpUrl="http://www.regaine.co.uk/faqs.aspx";
			g="faq";
		}else{
			g=retailer;
			tmpUrl=rtlUrl[retailer];
		}
		g=g.toLowerCase();
		_gaq.push(['_trackevent', 'email link', 'click',g]);
		_gaq.push(['b._trackevent', 'email link', 'click',g]);

		window.location.href=tmpUrl;
	});
</script>
</head>
<body>
	
</body>
</html>