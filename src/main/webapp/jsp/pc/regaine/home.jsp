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
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" /> -->
<link href="${pageContext.request.contextPath}/css/pc/main_regaine.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	var sessionId='${pageContext.session.id}';
var path = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pc/regaine/common.js"></script>
<script type="text/javascript">
	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
	  _gaq.push(['_trackPageview', 'Home']);
	  
	  _gaq.push(['b._setAccount', 'UA-35779257-7']);
	  _gaq.push(['b._trackPageview', 'Home']);
	  
	  

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
piwikTracker.setDocumentTitle('Home');
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=6" style="border:0" alt="" /></p></noscript>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pc/regaine/track.js"></script>
</head>
<body id="Home Page">
	<div class="store_page">
		<div class="store_header">
			<div class="header_left">
				<div class="header_item">
					<span>RETAILER SELECTION&nbsp;</span> > &nbsp;PRODUCT SELECTION
					&nbsp;> &nbsp;ADD TO BASKET
				</div>
				<div class="header_text">Add REGAINE<span>&reg;</span> to your shopping basket
				</div>
			</div>
			<div class="header_right">
				<ul>
					<li style="margin-bottom: 16px;">
					<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/help;jsessionid=${pageContext.session.id}">
					<div class="store_btn">HELP</div></a>
					</li>
					<li><a href="${pageContext.request.contextPath}/jsp/pc/regaine/terms.jsp;jsessionid=${pageContext.session.id}"><div class="store_btn">SITE TERMS</div></a>
					</li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
		<div class="store_home_content">
			<div class="home_title">Check prices, availability and add
				REGAINE<span>&reg;</span> directly to your shopping basket – just click on your
				retailer of choice below.</div>
			<div class="home_retailer">
				<ul>
					<li>
					<c:choose>
						<c:when test="${fn:contains(retailerString,'amazon')}">
						
<%-- 						<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/Amazon/product" onClick='trackHomeEvent("Amazon");'> --%>
							<img
								src="${pageContext.request.contextPath}/images/pc/regaine/logo_Amazon_comingsoon.png"
								name="" border="0">
<!-- 						</a> -->
						</c:when>
						<c:otherwise>
							<img
								src="${pageContext.request.contextPath}/images/pc/regaine/logo_Amazon01.png"
								name="" border="0">
							
						</c:otherwise>
					</c:choose>
					
					</li>
					<li style="margin-right: 0px;">
					<c:choose>
						<c:when test="${fn:contains(retailerString,'asda')}">
						<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/Asda/product;jsessionid=${pageContext.session.id}" onClick='trackHomeEvent("ASDA");'>
							<img
								src="${pageContext.request.contextPath}/images/pc/regaine/logo_Asda.png"
								name="" border="0"> </a>
						</c:when>
						<c:otherwise>
							<img
								src="${pageContext.request.contextPath}/images/pc/regaine/logo_Asda01.png"
								name="" border="0">
							
						</c:otherwise>
					</c:choose>
					</li>
					<li>
					<c:choose>
						<c:when test="${fn:contains(retailerString,'boots')}">
						<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/Boots/product;jsessionid=${pageContext.session.id}" onClick='trackHomeEvent("Boots");'>
							<img
								src="${pageContext.request.contextPath}/images/pc/regaine/logo_Boots.png"
								name="" border="0"></a>
						</c:when>
						<c:otherwise>
							<img
								src="${pageContext.request.contextPath}/images/pc/regaine/logo_Boots01.png"
								name="" border="0">
							
						</c:otherwise>
					</c:choose>
					</li>
					<li style="margin-right: 0px;">
					
					<c:choose>
						<c:when test="${fn:contains(retailerString,'pharmacy')}">
						
						<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/Pharmacy/product;jsessionid=${pageContext.session.id}" onClick='trackHomeEvent("Pharmacy");'>
							<img
								src="${pageContext.request.contextPath}/images/pc/regaine/logo_Pharmacy.png"
								name="" border="0"> </a>
						</c:when>
						<c:otherwise>
							<img
								src="${pageContext.request.contextPath}/images/pc/regaine/logo_Pharmacy01.png"
								name="" border="0">
							
						</c:otherwise>
					</c:choose>
					</li>
					<li>
					
					<c:choose>
						<c:when test="${fn:contains(retailerString,'sainsbury')}">
						<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/Sainsbury's/product;jsessionid=${pageContext.session.id}" onClick='trackHomeEvent("Sainsbury~s");'>
							<img
								src="${pageContext.request.contextPath}/images/pc/regaine/logo_Sainsbury's.png"
								name="" border="0"></a>
						</c:when>
						<c:otherwise>
							<img
								src="${pageContext.request.contextPath}/images/pc/regaine/logo_Sainsbury's01.png"
								name="" border="0">
							
						</c:otherwise>
					</c:choose>
					
					</li>
					<li style="margin-right: 0px;">
					
					<c:choose>
						<c:when test="${fn:contains(retailerString,'tesco')}">
						
						<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/Tesco/product;jsessionid=${pageContext.session.id}" onClick='trackHomeEvent("Tesco");'>
							<img
								src="${pageContext.request.contextPath}/images/pc/regaine/logo_Tesco.png"
								name="" border="0"></a>
						</c:when>
						<c:otherwise>
							<img
								src="${pageContext.request.contextPath}/images/pc/regaine/logo_Tesco01.png"
								name="" border="0">
							
						</c:otherwise>
					</c:choose>
					
					</li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
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