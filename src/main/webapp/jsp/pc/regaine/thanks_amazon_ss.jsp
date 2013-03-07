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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/pc/main_regaine.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
	var sessionId='${pageContext.session.id}';
var path = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/pc/regaine/common.js"></script>
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
					<li  style="font-size: 45px; line-height: 220px;text-align: center;padding-top:40px; font-family: Helvetica, Arial, sans-serif;">THANK YOU</li>
					
					<li class="store_xina"></li>
					<li class="store_thankslie">Why not download the free REGAINE<sup>&reg;</sup>
						iPhone app the ultimate advice and support tool for using REGAINE<sup>&reg;</sup>
						and tracking your progress over the first 16 weeks.</li>
					<li class="store_thankslif"><a target="_blank"
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