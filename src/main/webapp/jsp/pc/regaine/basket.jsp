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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/pc/regaine/basket_mpupa.1.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/pc/regaine/basket_function.js"></script>
<script
	src="${pageContext.request.contextPath}/jquery/scroll/nice.scroll.js"
	type="text/javascript"></script>
	
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/pc/regaine/create_account.js"></script>
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
	 		displayBasketItems();
	 		$("#basketList").niceScroll({
				cursorcolor : "#59608a",
				autohidemode : false,
				backgroundborderdisable:true
			});
	 		
			$("#popUpUl").niceScroll({
				cursorcolor : "#59608a",
				autohidemode : false,
				backgroundborderdisable:true
			});
	 		
	 	});
</script>
<script type="text/javascript">
	$(document).ready(function(){
	});

	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
	  _gaq.push(['_trackPageview', 'Basket']);
	  
	  _gaq.push(['b._setAccount', 'UA-35779257-7']);
	  _gaq.push(['b._trackPageview', 'Basket']);
	  
	  

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
piwikTracker.setDocumentTitle('Basket');
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
						<li class="header_lib" style="font-size: 16px; padding-left:22px;">Your basket</li>
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

				<table width="568" border="0" cellpadding="0" cellspacing="0"
					class="bsk_con_single" id="exampleData" style="display: none;">
					<tr>
						<td width="484" class="bsk_pro_name">3 month’s supply (3 x
							73ml can) of REGAINE® for Men Foam</td>
						<td width="57" align="right">£59.95</td>
						<td width="25" align="right" ><img onMouseOver="showTipInfo(this);" onMouseOut="hideTipInfo()" 
							src="${pageContext.request.contextPath}/images/pc/regaine/icon_del.png"
							border="0">
						</td>
					</tr>
					<tr>
						<td class="bsk_pro_qty">x1</td>
					</tr>
				</table>
			<div class="bsk_con" id="basketList">
			</div>
			<div class="bsk_total">
				<ul>
					<li class="bsk_total_title">TOTAL</li>
					<li class="bsk_total_price" id="totalPrice">£0.00</li>
				</ul>
			</div>
				<div class="new_text" style="height:50px;">Based on offers and prices as of
				today. Prices may have changed when your order is confirmed and/or
				put together for delivery
				
				<div style="padding-top:6px;font-family:arial; font-size:9px; color: #929292; font-weight:normal; line-height:13px;">
				<c:if test="${fn:toLowerCase(defaultRetailer) == 'amazon'}">
				 Eligible for FREE Super Saver Delivery.
				<a href="http://www.amazon.co.uk/gp/help/customer/display.html/ref=footer_shiprates?ie=UTF8&nodeId=492868" target="_blank"> 
				<span style="text-decoration:underline; color: #929292;"> Amazon terms and conditions apply</span></a> 	
				</c:if>
				<c:if test="${fn:toLowerCase(defaultRetailer) == 'asda'}">				
				Prices quoted don't include any delivery charges that may apply. Asda minimum order value £35. 
				<br/>Delivery from £2.50.  Free Click & Collect from selected stores. 
				<a href="http://groceries.asda.com/asda-estore/common/static/terms-and-conditionscontainer.jsp" target="_blank"> 
				<span style="text-decoration:underline; color: #929292;"> Asda terms and conditions apply</span></a> 
				</c:if>
				<c:if test="${fn:toLowerCase(defaultRetailer) == 'boots'}">	
				Prices quoted don't include any delivery charges that may apply. Deliver from £2.95 - free on orders over £45.00.
        <br/>Collect in store £1.95 – free on orders over £20.00. 
		 <a href="http://www.boots.com/en/Help/Delivery-information/" target="_blank"> 
				<span style="text-decoration:underline; color: #929292;">Boots terms and conditions apply</span></a> 
               </c:if>
                <c:if test="${fn:toLowerCase(defaultRetailer) == 'pharmacy'}">	
				Prices quoted don't include any delivery charges that may apply.Delivery from £3.45. Free on orders over £40.00.
        <br/><a href="http://www.pharmacy2u.co.uk/static/delivery.aspx" target="_blank"> 
				<span style="text-decoration:underline; color: #929292;">Pharmacy2U terms and conditions apply</span></a> 
               </c:if>
			   	<c:if test="${fn:toLowerCase(defaultRetailer) == \"sainsbury's\"}">
				Prices quoted don't include any delivery charges that may apply. Sainsbury's minimum order £25.00. Deliver from £2.95.
      <br/> Free on orders over £100 – selected time slots.  Free Click & Collect – selected stores. 
		 <a href="http://www.sainsburys.co.uk/sol/iw_container_page.jsp?pageRef=sites/www/site_furniture/Site_Furniture_DI.page" target="_blank"> 
				<span style="text-decoration:underline; color: #929292;">Sainsbury’s terms and conditions apply</span></a> 
               </c:if>
			   		<c:if test="${fn:toLowerCase(defaultRetailer) == 'tesco'}">	
		Prices quoted don't include any delivery charges that may apply. Deliver from £3.00.
		<br/> Click & Collect from £2.00 – selected stores.  
		 <a href="http://www.tesco.com/termsandconditions/termsconditionsGroc.htm?rel=help#Delivery" target="_blank"> 
				<span style="text-decoration:underline; color: #929292;">Tesco terms and conditions apply</span></a> 
               </c:if>

				
				
				</div>
				
				
				
				</div>
		
			<div class="bsk_login" style="padding-top:3px;">
				<ul>
				<c:if test="${fn:toLowerCase(defaultRetailer) == 'pharmacy'}">
					<li><input class="new_input" id="userName"
						placeholder="${fn:toUpperCase(defaultRetailer)}2U username" name="" onChange="saveUserName('userName')" />
					</li>
					<li><input class="new_input" name="password" id="password"
						placeholder="${fn:toUpperCase(defaultRetailer)}2U password" type="password" />
					</li>
				</c:if>
				<c:if test="${fn:toLowerCase(defaultRetailer) != 'pharmacy'}">
					<li><input class="new_input" id="userName"
						placeholder="${fn:toUpperCase(defaultRetailer)} username" name="" onChange="saveUserName('userName')" />
					</li>
					<li><input class="new_input" name="password" id="password"
						placeholder="${fn:toUpperCase(defaultRetailer)} password" type="password" />
					</li>
				</c:if>
					
					<c:if test="${defaultRetailer == 'Boots' || defaultRetailer == 'Pharmacy'}">
					
					<li
						style="text-align: left; float: right; margin-top: -30px; margin-right: 20px; position: relative; z-index: 1000;"
						class="bsk_create_text">
						<c:if test="${fn:toLowerCase(defaultRetailer) == 'pharmacy'}">
						Don’t have a ${fn:toUpperCase(defaultRetailer)}2U account?
						</c:if>
						<c:if test="${fn:toLowerCase(defaultRetailer) != 'pharmacy'}">
						Don’t have a ${fn:toUpperCase(defaultRetailer)} account?
						</c:if>
						 <br />
						You can quickly and easily <a
						style="text-decoration: underline; cursor: pointer;"
						onclick="startCreatAccount();">create one here</a></li>
					</c:if>
					
					<li style="font-size: 9px; color: #1b1b1b;padding-top:5px;">
					
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
					<li style="padding-top: 3px;">
					
						<div  class="store_botton_basket" style="margin: 10px auto;">
								<ul style=" text-align: center;">
								<c:if test="${fn:toLowerCase(defaultRetailer) == 'pharmacy'}">
								<li  style="cursor: pointer;" onclick='login(0);'>
								ADD TO ${fn:toUpperCase(defaultRetailer)}2U
							<img src="${pageContext.request.contextPath}/images/pc/regaine/icon_arrow.png" border="0" >
								</li>
								</c:if>
								<c:if test="${fn:toLowerCase(defaultRetailer) != 'pharmacy'}">
								<li  style="cursor: pointer;" onclick='login(0);'>
								ADD TO ${fn:toUpperCase(defaultRetailer)}
							<img src="${pageContext.request.contextPath}/images/pc/regaine/icon_arrow.png" border="0" >
								</li>
								
								</c:if>
								
								
		                         
								</ul>
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


	<c:import url="/jsp/pc/regaine/new_account.jsp"></c:import>
<!-- 	<div style="display: none;"> -->
		<div class="errors_con" id="errors_con_addingToBasketAnimation" style="display: none;">
			<div class="basket_con_text">PRODUCTS ADDING TO<br />
			<c:if test="${fn:toLowerCase(defaultRetailer) == 'pharmacy'}">YOUR ${defaultRetailerUpperCase}2U BASKET...</c:if>
			<c:if test="${fn:toLowerCase(defaultRetailer) != 'pharmacy'}">YOUR ${defaultRetailerUpperCase} BASKET...</c:if>
							 </div>
		   <div class="basket_con_lodding">
							<img
								src="${pageContext.request.contextPath}/images/pc/regaine/animation_all.gif"
								height="211" name="" border="0">
						</div>
		</div>

		<div class="errors_con" id="errors_con_animationChecking" style="display: none;">
			<div class="basket_con_text">CHECKING STOCK <br /> 
			<c:if test="${fn:toLowerCase(defaultRetailer) == 'pharmacy'}">AVAILABILITY AT ${defaultRetailerUpperCase}2U</c:if>
			<c:if test="${fn:toLowerCase(defaultRetailer) != 'pharmacy'}">AVAILABILITY AT ${defaultRetailerUpperCase}</c:if>
		</div>
		   <div class="basket_con_lodding">
							<img
								src="${pageContext.request.contextPath}/images/pc/regaine/animation_all.gif"
								height="211" name="" border="0">
						</div>
		</div>

		<div class="errors_con" id="errors_con_secondInputUserNameAndPassword" style="display: none;">
			<br />
			<br />
			<ul>
				<li style="font-size: 13px; color: #ffffff;">SORRY YOUR
					USERNAME AND PASSWORD COMBINATION<br /> 
					<c:if test="${fn:toLowerCase(defaultRetailer) == 'pharmacy'}">
					IS NOT RECOGNISED BY ${fn:toUpperCase(defaultRetailer)}2U.
					PLEASE TRY AGAIN...
					</c:if>
					<c:if test="${fn:toLowerCase(defaultRetailer) != 'pharmacy'}">
					IS NOT RECOGNISED BY ${fn:toUpperCase(defaultRetailer)}.
					PLEASE TRY AGAIN...
					</c:if>
					</li>
				<br />
				<c:if test="${fn:toLowerCase(defaultRetailer) == 'pharmacy'}">
				<li><input class="new_input"  id="SecondUserName"
					placeholder="${fn:toUpperCase(defaultRetailer)}2U username" name="" onChange="saveUserName('SecondUserName')" />
				</li>
				<li><input class="new_input" id="SecondPassword"
					placeholder="${fn:toUpperCase(defaultRetailer)}2U password" type="password" name="rePassword"  />
				</li>
				</c:if>
				<c:if test="${fn:toLowerCase(defaultRetailer) != 'pharmacy'}">
				<li><input class="new_input"  id="SecondUserName"
					placeholder="${fn:toUpperCase(defaultRetailer)} username" name="" onChange="saveUserName('SecondUserName')"/>
				</li>
				<li><input class="new_input" id="SecondPassword"
					placeholder="${fn:toUpperCase(defaultRetailer)} password" type="password" name="rePassword"  />
				</li>
				</c:if>
				
				<c:if test="${fn:toLowerCase(defaultRetailer) == 'pharmacy'}">
				<li><div class="store_btn"
						style="width: 220px; margin: 0 auto;" onclick='login(1);'>ADD TO ${fn:toUpperCase(defaultRetailer)}2U BASKET</div>
				</li>
				</c:if>
				<c:if test="${fn:toLowerCase(defaultRetailer) != 'pharmacy'}">
				<li><div class="store_btn"
						style="width: 220px; margin: 0 auto;" onclick='login(1);'>ADD TO ${fn:toUpperCase(defaultRetailer)} BASKET</div>
				</li>
				</c:if>
			</ul>
		</div>

		<div class="errors_con" id="errors_con_unvalid_userName_password" style="display: none;">
			<br />
			<br />
			<br />
			
			<ul>
				<li style="font-size: 13px; color: #ffffff;">PLEASE INPUT A
					VALID USERNAME AND<br /> PASSWORD FOR YOUR CHOSEN RETAILER</li>
				<br />
				<li><div class="store_btn"
						style="width: 220px; margin: 0 auto;" onClick="BackToLogin();">CLOSE</div>
				</li>
			</ul>
		</div>

		<div class="errors_con" id="errors_con_SecondInputUserNameAndPasswordFailure" style="display: none;">
			<br />
			<br />
			<ul>
				<li style="font-size: 13px; color: #ffffff;">SORRY, YOUR
					USERNAME AND PASSWORD<br />
						<c:if test="${fn:toLowerCase(defaultRetailer) == 'pharmacy'}">COMBINATION IS NOT RECOGNISED BY ${fn:toUpperCase(defaultRetailer)}2U.</c:if>
						<c:if test="${fn:toLowerCase(defaultRetailer) != 'pharmacy'}">COMBINATION IS NOT RECOGNISED BY ${fn:toUpperCase(defaultRetailer)}.</c:if>
					 
				</li>
				<li style="font-size: 11px; line-height: 22px; color: #ffffff;">
				<c:if test="${fn:toLowerCase(defaultRetailer) == 'pharmacy'}">Please
					visit the ${fn:toUpperCase(defaultRetailer)}2U website to retrieve your username and password:</c:if>
				<c:if test="${fn:toLowerCase(defaultRetailer) != 'pharmacy'}">Please
					visit the ${fn:toUpperCase(defaultRetailer)} website to retrieve your username and password:</c:if>
				</li>
				<li style="height: 60px;"><img
					src="${pageContext.request.contextPath}/images/pc/regaine/logo_${defaultRetailer}.png"
					height="60px;" name="" border="0"></li>
				<li style="padding-top: 10px;"><div class="store_btn"
						style="width: 220px; margin: 0 auto;" onClick="clearUserNameAndPassword();">CONTINUE</div>
				</li>
			</ul>
		</div>


		<div class="errors_con" id="errors_con_emptyBasket" style="display: none;">
			<br />
			<br />
			<br />
			<br />
			<ul>
				<li style="font-size: 13px; color: #ffffff;">YOUR BASKET IS
					EMPTY. PLEASE GO<br /> BACK AND SELECT SOME PRODUCTS</li>
				<br />
				<li><div class="store_btn"
						style="width: 220px; margin: 0 auto;" onClick="BackToLogin();">BACK</div>
				</li>
			</ul>
		</div>


		<div class="errors_con" id="errors_con_displayOutOfStockProducts" style="display: none;">
			<br />
			
			<ul>
				<li style="font-size: 13px; color: #ffffff;">SORRY THE
					FOLLOWING ITEMS ARE<br /> CURRENTLY OUT OF STOCK:</li>
				
				<div id="failureListMsg"  style=" height:65px;margin-top:5px"></div>
				
			
				<li style="font-size: 11px; color: #ffffff;height:20px">
				<c:if test="${fn:toLowerCase(defaultRetailer) == 'pharmacy'}">Other products
					have been successfully added to your ${fn:toUpperCase(defaultRetailer)}2U basket</c:if>
				<c:if test="${fn:toLowerCase(defaultRetailer) != 'pharmacy'}">Other products
					have been successfully added to your ${fn:toUpperCase(defaultRetailer)} basket</c:if>
				</li>
				<li><div class="store_btn"
						style="width: 380px; margin: 0 auto;" id="goBackAndChooseAnother">GO BACK AND CHOOSE
						ANOTHER PRODUCT</div>
				</li>
				<li><div class="store_btn"
						style="width: 380px; margin: 0 auto;" id="finishShopping">FINISH SHOPPING</div>
				</li>
			</ul>
		</div>
		<div id="delBasketTip" style="display: none">
		<img
			src="${pageContext.request.contextPath}/images/pc/regaine/pic_delbsk.png"></img>
	</div>

<div class="errors_con" id="popUpOutOfStockProductListDiv" style="display: none; z-index:200000000;">
		
		   <ul id="popUpUl" style="height:110px; padding-top: 40px;overflow:auto;"> </ul>
		   <div class="store_btn" id="popUpOutOfStockClose"
						style="width: 220px; margin: 0 auto; margin-top: 10px;" >CLOSE</div>
					
				</div>
			
<!-- 	</div> -->

</body>
</html>