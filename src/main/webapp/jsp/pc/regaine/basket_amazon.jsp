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
<script type="text/javascript">
	var brandName = "${brandModel['brandName']}";
	var retailerName = "${defaultRetailer}";
	 	$(document).ready(function() {
	 		try{
	 			if (isNotEmpty(remoteStorage.getItem(brandName + retailerName + "_userName"))) {
					$("#userName").val( remoteStorage.getItem(brandName + retailerName + "_userName"));
					$("#SecondUserName").val( remoteStorage.getItem(brandName + retailerName + "_userName"));
				}
	 		}catch(e){
	 			window.console.log("User has disabled storing local content");
	 			alert("Sorry, you must allow this site to store local data to continue. You can change this policy in your browser's security settings.");
	 		}
	 		/* displayBasketItems();
	 		$("#basketList").niceScroll({
				cursorcolor : "#59608a",
				autohidemode : false,
				backgroundborderdisable:true
			}); */
	 		showItems();
	 	});
	 	
	 	function saveUserName(userName){
	 		try{
		 		remoteStorage.setItem(brandName + retailerName + "_userName",$("#"+userName).val());
	 		}catch(e){
	 			window.console.log("User has disabled storing local content");
	 			alert("Sorry, you must allow this site to store local data to continue. You can change this policy in your browser's security settings.");
	 		}
	 	}
	 	
	 	function showItems() {
	 		var product = getModel("regaineamazonssbasket",true);
	 		
	 		if(isNotEmpty(product)) {
	 			
		 		var exampleDate = $("#exampleData");
		 		exampleDate.find("td:eq(0)").text(product.name);
		 		exampleDate.find("td:eq(1)").text("£" + product.price);
		 		
		 		$("#amazonSubmitButton").click(function(){
		 			var url1 = path + "/jsp/pc/regaine/thanks_amazon_ss.jsp;jsessionid=${pageContext.session.id}" ;
				window.location.href = url1;
		 			//alert(product.productUrl);
		 			var v=product.productUrl;
		 			var vU="";
		 			if(v.indexOf("B004QIWUFK")!=-1){
		 				vU="https://www.amazon.co.uk/gp/subscribe-and-save/pipeline/subscribe.html?ie=UTF8&ASIN=B004QIWUFK&app-loading-dialog-title=Building%2520your%2520subscription%2520order&app-nav-type=redirect&merchantID=A3P5ROKL5A1OLE&rcxOrdFreq=1&rcxsubsQuan=1";
		 			}else{
			 			vU="https://www.amazon.co.uk/gp/subscribe-and-save/pipeline/start-sns-purchase.html?ie=UTF8&ASIN=B004QIYX5K&app-loading-dialog-title=Building%20your%20subscription%20order&app-nav-type=redirect&merchantID=A3P5ROKL5A1OLE&rcxOrdFreq=1&rcxsubsQuan=1";
		 			}
		 			window.open(vU);
		 		});
	 		} else {
	 			$("#amazonSubmitButton").click(function(){
		 			alert("Select product firstly!");
		 		});
	 		}
	 		
	 	}
	 	
	 	function showDelInfo(obj) {
	 		
	 	}
	 	function hideDelInfo() {
	 		
	 	}
</script>
<script type="text/javascript">
	$(document).ready(function(){
	});

	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
	  _gaq.push(['_trackPageview', 'Basket Amazon']);
	  
	  _gaq.push(['b._setAccount', 'UA-35779257-7']);
	  _gaq.push(['b._trackPageview', 'Basket Amazon']);
	  
	  

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
piwikTracker.setDocumentTitle('Basket Amazon');
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=6" style="border:0" alt="" /></p></noscript>
</head>
<body id="Basket Page">
	<div class="store_page">
		<div class="store_header">
			<div class="header_left">
				<div class="header_item">
					<span><a href="${pageContext.request.contextPath}/${brandModel['brandName']};jsessionid=${pageContext.session.id}"><font color="#252c4c">RETAILER SELECTION</font></a> &nbsp;> &nbsp;<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/product;jsessionid=${pageContext.session.id}"><font color="#252c4c">PRODUCT SELECTION</font></a> </span><span>
						&nbsp;> &nbsp;ADD TO BASKET</span>
				</div>
				<div class="header_about">
					<ul>
						<li class="header_lia"><a
							href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/product;jsessionid=${pageContext.session.id}">
								<img
								src="${pageContext.request.contextPath}/images/pc/regaine/back.png"
								border="0"> </a>
						</li>
						<li class="header_lib" style="font-size: 18px;">Selected products</li>
						<li class="header_lic"><img
							src="${pageContext.request.contextPath}/images/pc/regaine/logo_${fn:toLowerCase(defaultRetailer)}02.png"
							height="40" border="0"></li>
					</ul>

				</div>
			</div>
			<div class="header_right">
				<ul>
					<li style="margin-bottom: 16px;"><a href="${pageContext.request.contextPath}/jsp/pc/regaine/help.jsp;jsessionid=${pageContext.session.id}">
					<div class="store_btn">HELP</div></a>
					</li>
					<li><a href="${pageContext.request.contextPath}/jsp/pc/regaine/terms.jsp;jsessionid=${pageContext.session.id}"><div class="store_btn">SITE TERMS</div></a></li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>

		<div class="store_content">

			<div class="bsk_con" id="basketList">
				<table width="568" border="0" cellpadding="0" cellspacing="0"
					class="bsk_con_single" id="exampleData" >
					<tr>
						<td width="484" class="bsk_pro_name"></td>
						<td width="57" align="right"></td>
						<td width="25" align="right" >
						</td>
					</tr>
					<tr>
						<td class="bsk_pro_qty">x1</td>
					</tr>
				</table>
			</div>
			<div class="bsk_total2">
			
			</div>
			<div class="new_text">Based on offers and prices as of
				today. Prices may have changed when your order is confirmed and/or
				put together for delivery</div>
		
			<div class="bsk_login"  style="padding-top: 61px;">
				<ul>
					<li><input class="new_input"  id="userName"
						placeholder="${fn:toUpperCase(defaultRetailer)} username" name="" onChange="saveUserName('userName')" />
					</li>
					<li><input class="new_input" id=""
						placeholder="${fn:toUpperCase(defaultRetailer)} password" name="password"  type="password"/>
					</li>
					
					
					<li style="font-size: 9px; color: #1b1b1b;padding-top: 17px;">
							<div class="bsk_login_text">
				<label> <ul  style="text-align: center; margin:0 auto;">
				
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
 				 <tr>  
 				 <td align="left" >
				<table border="0" cellspacing="0" cellpadding="0" style="padding-left:85px;">
 				 <tr>  
 				 <td> 				
  				  <td height="15" style="font-size:11px;">To receive support and the latest news and offers from REGAINE<span style="font-size: 5px;vertical-align:super;">&reg;</span>, please tick here
					</td>
					<td width="5"></td>
 				   <td   align="left"  valign="bottom"><div style="margin-top:2px;"><input  type="checkbox"  id="offerCheckBox" /></div></td> 			
 				 </tr>
				</table>
				</td></tr></table>
				
				</ul>	</label>
					<ul style="text-align: center;color: #929292;">By clicking here you agree to the McNeil Healthcare (UK) Ltd. 
					<a href="http://www.regaine.co.uk/privacy-policy" target="_blank"> 
					<span style="text-decoration: underline; color: #929292;">privacy policy</span> </a> and 
					<a href="http://www.regaine.co.uk/terms-conditions" target="_blank">
					<span  style="text-decoration: underline;color: #929292;">terms and conditions</span></a>
                </ul>
					</div>
					</li>
					<li style="padding-top: 5px;">
					<div style="width: 265px; margin: 10px auto;" id="amazonSubmitButton"
							class="new_brown_btn">
							<span>SUBSCRIBE & SET DELIVERY SCHEDULE  </span> <img
								src="${pageContext.request.contextPath}/images/pc/regaine/icon_arrow.png"
								name="" border="0">
						</div>
					</li>
				</ul>
			</div>
		</div>

		
		<div class="clear"></div>
		<div class="home_footer" style="padding-top: 30px;">
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