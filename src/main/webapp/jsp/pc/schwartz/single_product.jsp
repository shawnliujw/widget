<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld"%>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld"%>
<!DOCTYPE html >
<html  xmlns:og="http://ogp.me/ns#" 
xmlns:fb="https://www.facebook.com/2008/fbml"> 
<head> 
            <title>Schwartz Web Store</title> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/pc/main_schwartz.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/jquery/scroll/jquery.mCustomScrollbar_sch.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/scroll/jquery.mousewheel.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/scroll/jquery.mCustomScrollbar.js"></script>

<script src="${pageContext.request.contextPath}/js/pc/schwartz/common.js"></script>
<script src="${pageContext.request.contextPath}/js/pc/schwartz/single_product_1.js"></script>
<script src="${pageContext.request.contextPath}/js/pc/schwartz/basket_mpupa.1.0.js"></script>

<script>
	$(document).ready(function() {
		//display the userName and password what user input.
		if(isNotEmpty(localStorage.getItem("schwartz"+retailerName+"_userName"))){
			$("#userName").val(localStorage.getItem("schwartz"+retailerName+"_userName"));
		}
// 		if(isNotEmpty(localStorage.getItem("schwartz"+retailerName+"_password"))){
// 			$("#password").val(localStorage.getItem("schwartz"+retailerName+"_password"));
// 			$("#password").focus();
// 		}
		
		
		$("#price").text($("#defaultRetailerPrice").val());
		$(".bashe_pro_text").mCustomScrollbar({
			advanced:{
			    updateOnBrowserResize:true, 
			    updateOnContentResize:true, 
			    autoExpandHorizontalScroll:true 
			  }
		});
		//alert($("#defaultRetailerPrice").val())
			displayDefaultBasketInfo();
			$("#basketList").mCustomScrollbar({
				advanced:{
				    updateOnBrowserResize:true, 
				    updateOnContentResize:true, 
				    autoExpandHorizontalScroll:true 
				  }
			});
			
	});
	
	function changeInfoShow(obj) {
		var curObj = $(obj);
		var currentClz = curObj.attr("class");
		//detail_active
		if(!isNotEmpty(currentClz) && currentClz == 'detail_active') {
			return;
		} else {
			//currentClz = currentClz.replace("detail_active","detail_normal");
			var currentActive = $(obj).parent().find("li[class='detail_active']");
			currentActive.attr("class","detail_normal");
			curObj.attr("class","detail_active");
			
			$("#"+currentActive.attr("aimDiv")).hide();
			$("#"+curObj.attr("aimDiv")).show();
		}
	}
	
	var brandName = "${brandModel['brandName']}";
	var retailerName = "${defaultRetailer}";
	var categoryName = "${defaultCategory}";
	var productId = "${product.productId}";
	var path = '${pageContext.request.contextPath}';
	var retailerNameUpperCase="${defaultRetailerUpperCase}";
	
	 var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
	  _gaq.push(['_trackPageview',retailerName+"/"+categoryName+"/"+retailerName+"/"+categoryName+"/"+'${product.productName}']);

	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	  
	  function showOfferInfo(obj){
			var id=$(obj).parent().parent().parent().find("input:eq(0)").val();
			var basketName = retailerName + brandName + "Basket";
			var vb=new BasketObject();
			vb.setSaveName(basketName);
//	 		var current = getBasketListForLocal(basketName, true);
			
			if(isNotEmpty(vb.getItemList())){
				var v=vb.getItemById(id);
				if(isNotEmpty(v)){
					v=v.siteType;
					if(isNotEmpty(v)){
						var desp="OFFER APPLIED<br/>";
						if(v==1)desp+="any 2 for 2";
						if(v==2)desp+="Save 99p was £1.99 now £1.00";
						if(v==3)desp+="Save 49p was £1.99 now £1.50";
						if(v==4)desp+="Any 2 for £1.50";
						if(v==5)desp+="Better Than Half Price Was £2.49 Now £1.00";
						if(v==6)desp+="Better Than Half Price Was £2.75 Now £1.00";
						if(v==7)desp+="Buy any 2 for £1.20";
						if(v==8)desp+="Any 2 for £3.00";
						if(v==10)desp+="Save 39p was £2.39 now £2.00";
						if(v==11)desp+="Buy any 2, and add 3rd free";
						$("#s_product_offer").find("li:eq(0)").html(desp);
					}else
						$("#s_product_offer").find("li:eq(0)").html("OFFER APPLIED<br/> No offer");
				}else
					$("#s_product_offer").find("li:eq(0)").html("OFFER APPLIED<br/> No offer");
			}else{
				$("#s_product_offer").find("li:eq(0)").html("OFFER APPLIED<br/> No offer");
			}
//	 		for ( var v = 0; v < current.length; v++) {
//	 			if (isNotEmpty(current[v].siteType)) {
//	 				flag = 1;
//	 				break;
//	 			}
//	 		}
//	 		if (flag == 1) {
				$(obj).attr("style", "cursor: pointer");
				var left = $(obj).offset().left;
				var top = $(obj).offset().top;
				$("#s_product_offer").css("position", "absolute");
				$("#s_product_offer").offset({
					"left" : left - 75.5,
					"top" : top - 45
				}).css("display", "block");
				// }
//	 		} else {
//	 			$(obj).removeAttr("style");
//	 		}
			$("#s_product_offer").show();
		}
		
		function hideOfferInfo(obj){
			$("#s_product_offer").removeAttr("style").hide();
		}
</script>
<!-- Piwik --> 
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://piwik.dotter.me/" : "http://piwik.dotter.me/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 2);
piwikTracker.setDocumentTitle(retailerName+"/"+categoryName+"/"+'${product.productName}');
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=2" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->
</head>
<body id="single_product Page">
	<input type="hidden" value="${product.productId}"
		id="defaultReatilerId">
	<input type="hidden" value="${defaultRetailer}" id="defaultReatiler">
	<input type="hidden"
		value="${product.productName}"
		id="defaultRetailerTitle">
	<input type="hidden" value="${product.offerId}"
		id="defaultOffer" />
	<input type="hidden" value="${product.nowPrice}"
		id="defaultRetailerPrice" />
	<input type="hidden" value="${product.productUrl}"
		id="defaultRetailerUrl">
	<input type="hidden" value="${pageContext.request.contextPath}"
		id="context">
		
		
	<input type="hidden" value="${product.brandId}" id="defaultBrandId">
		<input type="hidden" value="${product.clientId}" id="defaultClientId">
		<input type="hidden" value="${product.retailerId}" id="defaultRetailerId">
		
	<div id="popUpOutOfStockProductListDiv" class="basket_panel_con_popUP" style="display:none; font-family:Arial; font-size:14px; line-height:22px; z-index:100000;position: absolute;width: 300px;list-style: none; text-shadow: none;">
			<ul id="popUpUl">
			
			</ul>
			<div style="width:100%; text-align: center; margin-top: 10px;">
			 <input class="input_btn02" style="width:170px;" type="button" value="CLOSE" name="" />
			 </div>
	</div>
		
		
	<div id="BlowFishHomePage" class="blowfish_page">

		<div class="blowfish_header">
			
				<a href="${pageContext.request.contextPath}/${brandModel['brandName']}">
					<img src="${pageContext.request.contextPath}/blowfish_images/schwartz/logo_schwartz.png"
					height="69" name="" border="0">
			
			</a>
		</div>

		<div class="blowfish_content">
			<div class="openstore_retailer">
				<div class="sch_retailer_title">MY SELECTED RETAILER:</div>
				<div class="sch_retailer_logo">
					<ul>
						<c:forEach items="${retailerList}" var="retailer">

							<c:choose>
								<c:when test="${retailer.name eq defaultRetailer}">
									<li class="sch_retailer_active" style="width:98px; padding-top:2px;"><img
										src="${pageContext.request.contextPath}/images/logo_${fn:toLowerCase(retailer.name)}01.png"
										height="17" name="" border="0">
									</li>
								</c:when>
								<c:otherwise>

									<li><a
										href="${pageContext.request.contextPath}/${brandModel['brandName']}/${retailer.name}/${defaultCategory}/product/${product.productId}">
											<img
											src="${pageContext.request.contextPath}/images/logo_${fn:toLowerCase(retailer.name)}01.png"
											height="17" name="" border="0" /> </a>
									</li>

								</c:otherwise>
							</c:choose>

						</c:forEach>
					</ul>
				</div>
				<a 	href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/help"><div class="sch_retailer_help">
					HELP
				</div></a>
			</div>
			<div class="clear"></div>
			<div class="openstore_show">
				<div class="sch_show_title">SHOW ME:</div>
				<div class="sch_show_item">
					<ul>
						<c:forEach items="${categoryList}" var="category1">
							<c:choose>
								<c:when test="${category1.name eq defaultCategory}">

									<li class="sch_show_active" style="width:128px;">${fn:toUpperCase(category1.name)}</li>

								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${category1.name}/product">
											${fn:toUpperCase(category1.name)} </a>
									</li>

								</c:otherwise>
							</c:choose>

						</c:forEach>
					</ul>
				</div>
			</div>


			<div class="openstore_block">
				<div class="sch_block_left">
					<div class="block_left_con2">
						<div class="bashe_pro_menu">
							<ul>
								<li class="detail_active" aimDiv='ourPrice' onClick="changeInfoShow(this);" >OUR RECIPE
								</li>
								<li class="detail_kong">&nbsp;
								</li>
								<li class="detail_normal" aimDiv='ingredients'  onclick="changeInfoShow(this);">OTHER INFORMATION
								</li>
							<!-- 	<li class="detail_kong">&nbsp;
								</li>
								<li class="detail_normal"  aimDiv='nutrition' onClick="changeInfoShow(this);" style="display: none;"> INGREDIENTS   NUTRITION 
								</li> -->
							</ul>
						</div>
                         <div class="clear"></div>
						<div class="bashe_pro_main">

							<a style="color:#bf314f;cursor:pointer;"
									href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/">
							<div class="bashe_pro_all">
							BACK TO PRODUCTS
							</div></a>


							<div id="ourPrice" >
								<div class="bashe_pro_sh" >
									<c:choose>
										<c:when test="${fn:length(product.productName)>36}">
										<ul class="bashe_pro_shul01" style="height: 48px;">
										<li class="bashe_pro_shli01" title="${product.productName}" style="max-height: 44px;">
											${product.productName}</li>
										<li class="bashe_pro_shli02">
											£${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th align="right" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/schwartz/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/schwartz/add_btn.png"
														alt="" name="" border="0"></th>
												</tr>
											</table>
										</li>
									</ul>
										
										</c:when>
										<c:otherwise>
										<ul class="bashe_pro_shul01" style="heigh:22px;">
										<li class="bashe_pro_shli01" style="overflow:hidden;max-height:20px;" title="${product.productName}">
											${product.productName}</li>
										<li class="bashe_pro_shli02">
											£${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th align="right" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/schwartz/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/schwartz/add_btn.png"
														alt="" name="" border="0"></th>
												</tr>
											</table>
										</li>
									</ul>
										</c:otherwise>
									</c:choose>
								
									
								
									<c:if test="${fn:length(product.offerName) > 0}">
									
									<!--  <ul class="bashe_pro_shul02">-->
									<ul class="sch_addpro_note2">${product.offerName}</ul>
									</c:if>
									<!-- <ul class="sch_addpro_note2"> BUY ONE, GET ONE FREE</ul> -->
									
									
								</div>
								<div class="bashe_pro_text" style="overflow:hidden;">
									${product.description} <br /> <br />
									${product.usage}
									<br/>
								</div>
                              
							</div>
							
							
						<div id="ingredients" style="display: none;">
						
						<div class="bashe_pro_sh" >
									<c:choose>
										<c:when test="${fn:length(product.productName)>36}">
										<ul class="bashe_pro_shul01" style="height: 48px;">
										<li class="bashe_pro_shli01" title="${product.productName}" style="max-height: 44px;">
											${product.productName}</li>
										<li class="bashe_pro_shli02">
											£${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th align="right" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/schwartz/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity_ingredients" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="ingredients_cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/schwartz/add_btn.png"
														alt="" name="" border="0"></th>
												</tr>
											</table>
										</li>
									</ul>
										
										</c:when>
										<c:otherwise>
										<ul class="bashe_pro_shul01" style="heigh:22px;">
										<li class="bashe_pro_shli01" style="overflow:hidden;max-height:20px;" title="${product.productName}">
											${product.productName}</li>
										<li class="bashe_pro_shli02">
											£${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th align="right" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/schwartz/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity_ingredients" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="ingredients_cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/schwartz/add_btn.png"
														alt="" name="" border="0"></th>
												</tr>
											</table>
										</li>
									</ul>
										</c:otherwise>
									</c:choose>
								
									<c:if test="${fn:length(product.offerName) > 0}">
									
									<!--  <ul class="bashe_pro_shul02">-->
									<ul class="sch_addpro_note2">${product.offerName}</ul>
									</c:if>
									<!-- <ul class="sch_addpro_note2"> BUY ONE, GET ONE FREE</ul> -->
									
									
								</div>
												
							<div class="bashe_pro_text" style="overflow:hidden;">
					                <span style="font-weight: bold;color: black;">${fn:toUpperCase('ingredients')}</span> <br/>
									${product.ingredients}
									<c:if test="${fn:length(product.nutrition)>0}">
									<br />
					                <span style="font-weight: bold;color: black;">${fn:toUpperCase('nutrition')}</span> <br/>
								  ${product.nutrition}
									</c:if>
									 
								 </div>
						</div>
						
		<!-- 			<div id="nutrition" style="display: none;">
							<div class="bashe_pro_text2" style="overflow:hidden;" id="nutritionDiv">
									${product.nutrition} 
									
								</div>
							
						</div>	
					 -->			
							
  					</div>
						
					</div>			
					<div class="bashe_pro_zhe"></div>		
					<div class="sch_footer">
						<img
							src="${pageContext.request.contextPath}/images/logo_dotter.png"
							height="14" name="" border="0"></a> POWERED BY DOTTER IN ASSOCIATION WITH SCHWARTZ | <a style="color:#ffffff;" href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span>SEE TERMS</span></a>
					</div>
				</div>


				<!-- -----------------------------左侧结束------------------------------------- -->
				<div class="sch_block_right">
					<div class="sch_pro_image2">
					
					<c:choose>
						<c:when test="${product.imageUrl == ''}">
						<img src="${pageContext.request.contextPath}/images/pc/pro02.jpg"
							height="250px" alt="" name="" border="0">
						</c:when>
						<c:otherwise>
						<img src="${pageContext.request.contextPath}/${product.imageUrl}"
							height="240px" alt="" name="" border="0">
						
						</c:otherwise>
					</c:choose>
					
					</div>
					<div class="clear"></div>
					<div class="basket_panel_con" >
						<div class="sch_basket_panel">
							<div class="sch_bsk_title">SELECTED PRODUCTS</div>
							<br />
							<table width="90%" border="0" cellspacing="0" cellpadding="0"
								style="margin-top: 5px; display: none;" id="exampleData">
								<tr height="20px">
									<td width="108px" colspan="2" align="left" valign="middle">schwartz's
										Special K Biscuit Moments</td>
									<td width="22px" align="right" valign="top"><img
										onmouseover="showTipInfo(this);" onmouseout="hideTipInfo();"
										onclick="removeItemById(this);"
										src="${pageContext.request.contextPath}/images/pc/schwartz/icon_del.png"
										height="14" name="" border="0" /> <input type="hidden" /></td>
								</tr>
								<tr height="20px;">
									<td width="80px" align="left" style="font-weight: bold;">x2</td>
									<td width="10" align="left" style="cursor: pointer;">
<%-- 										<img onmouseover="showOfferInfo(this);" onmouseout="hideOfferInfo(this);"  src="${pageContext.request.contextPath}/images/pc/schwartz/info_btn2.png" height="14" name="" border="0"> --%>
									</td>
									<td width="20" align="right" style="font-weight: bold;">£0.99</td>
								</tr>
							</table>
							<div
								style="height: 75px;  margin-bottom: 10px; overflow-x: hidden; overflow-y: auto;" id="basketList">
								
							</div>
							<div style=" border-top:1px solid #c1232f; height: 1px;width: 136px; margin-bottom: 5px;"></div>
							<table width="136" border="0" cellspacing="0" cellpadding="0" onmouseover="showTotalMsgDiv(this)" onmouseout="hideTotalMsgDiv(this)">
								<tr style="display:none;">
									<td width="84px" align="left" valign="middle"
										class="sch_bsk_title" style="color: #000000;">Full Price</td>
									<td width="42px" align="right" id="fullPrice"
										style="font-weight: bold;">£9.78</td>
								</tr>
								<tr id="savingsTr" height="14px;">
									<td width="84px" align="left" valign="middle"
										class="sch_bsk_title" style="color: #000000;display:none;">Savings</td>
									<td width="42px" align="right" id="savingsPrice"
										style="font-weight: bold;display:none;">- £0.78</td>
								</tr>
								<tr>
									<td width="84px" style="font-family: Helvetica; color: #000000;" align="left" valign="middle"   class="sch_bsk_title" >Total</td>
									<td width="42px" align="right" id="totalPrice" style="font-weight: bold;">£0.99</td>
								</tr>
							</table>
						</div>
						<div class="sch_login_block">
							<div><span id="tipInfo">Add to your next online shop by entering the
								following details.</span></div>
							<div class="sch_login_acc">
								<ul>
									<li><input class="sch_input_acc" name="" id="userName" placeholder="${fn:toUpperCase(defaultRetailer)} username"  name="" onchange="saveUserName('userName')" /></li>
									<li><input class="sch_input_acc" id="password" placeholder="${fn:toUpperCase(defaultRetailer)} password" name="password" type="password" /></li>
									<li style="font-size:9px;">
 									<label>
									<table width="170" border="0" cellspacing="0" cellpadding="0">
 									     <tr>
 									   <td width="10" height="20" align="center"><input id="offerCheckBox"
											type="checkbox"  /></td>
 									   <td width="160" style="padding-left: 4px;">Subscribe to Schwartz newsletters</td>
									  </tr>
									 </table>							
									 </label>
									</li>
									<li><input class="input_btn02" type="button"
										value="ADD TO ${defaultRetailerUpperCase} BASKET" name="" onclick="login(0);" />
									</li>
								</ul>
							</div>
						</div>
					</div>
					
<!-- 					<div class="basket_panel_con2" style="display:none" > -->
<!-- 							<div  class="basket_con2_lodding"> -->
<%-- 							<img src="${pageContext.request.contextPath}/images/lodding_01.gif" height="176" name="" border="0"> --%>
<!-- 							</div> -->
<!-- 							<div  class="basket_con2_text"> -->
							
<%-- 					ESTABLISHING SECURE<br /> CONNECTION WITH ${defaultRetailerUpperCase}... --%>
<!-- 							</div> -->
<!-- 					</div> -->
					<div class="basket_panel_con2" style="display:none; ">
						<div class="basket_con2_lodding">
							<img
								src="${pageContext.request.contextPath}/images/lodding_sch.gif"
								height="176" name="" border="0">
						</div>
						<div id="productsBasket" class="basket_con2_text">PRODUCTS ADDING TO<br />
							 YOUR ${defaultRetailerUpperCase} BASKET...</div>
					</div>
					<div class="basket_panel_con2" style="display:none; ">
						<div class="basket_con2_lodding">
							<img
								src="${pageContext.request.contextPath}/images/lodding_sch.gif"
								height="176" name="" border="0">
						</div>
						<div id="checkArea" class="basket_con2_text">CHECKING AVAILABILITY<br />
							AT ${defaultRetailerUpperCase} IN YOUR AREA...</div>
					</div>
					
<!-- 					<div class="basket_panel_con3" style="display:none"> -->
<!-- 					  <ul class="basket_con3_ula"> -->
<!-- 					    <li class="basket_con3_li01"> -->
<%-- 						SORRY, <span>${productRetailerModel.product.productName} </span>IS OUT OF STOCK IN YOUR AREA --%>
<!--                     	</li> -->
<!-- 					 </ul> -->
<!-- 					<ul class="basket_con3_ulb"> -->
<!-- 						<li  class="input_con01" > -->
<!-- 					REPLACE WITH ANOTHER PRODUCT -->
<!--                      	</li> -->
<!-- 						<li class="input_con01" > -->
<%-- 						CONTINUE TO ADD OTHER PRODUCTS TO <span>${defaultRetailerUpperCase}</span> BASKET --%>
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 					</div> -->
					
						<div class="basket_panel_con3" style="display: none">
						<ul class="basket_con3_ula" style="margin-top: -15px;">
							<li class="basket_con3_li01" style="font-weight: bold;">SORRY, THE FOLLOWING PRODUCTS ARE
								NOT AVAILABLE IN YOUR AREA</li>
						</ul>
						<ul class="basket_con3_uld" id="failureListMsg">
                   			</ul>
						

						<ul class="basket_con3_ula">
							<li class="basket_con3_li01" style="font-weight: bold;">ALL OTHER PRODUCTS HAVE BEEN
								SUCCESSFULLY ADDED TO YOUR <span>${defaultRetailerUpperCase}</span>
								BASKET</li>
						</ul>
						<ul class="basket_con3_ulc">
							<li class="input_con02">GO BACK AND CHOOSE ANOTHER PRODUCT</li>
							<li class="input_con02">FINISH SHOPPING</li>
						</ul>
					</div>
					
					<div class="basket_panel_con4" style="display: none">
						<ul class="basket_con3_ula" style="margin-top: -15px; padding-bottom: 10px;">
							<li class="basket_con3_li01" style="font-weight: bold;">
							SORRY YOUR USERNAME AND PASSWORD COMBINATION IS NOT RECOGNISED BY ${defaultRetailerUpperCase}, PLEASE TRY AGAIN.</li>
						</ul>
						
						<ul style="width: 164px;margin: 0 auto;">
							<li>
							<div class="sch_login_acc">
								<ul>
									<li><input class="sch_input_acc" name=""
										placeholder="${defaultRetailerUpperCase} username"
										id="SecondUserName"  onchange="saveUserName('SecondUserName')"/></li>
									<li><input class="sch_input_acc" name="password"
										placeholder="${defaultRetailerUpperCase} password"
										type="password" id="SecondPassword" /></li>
								
									<li style="margin-top: 3px;"><input class="input_btn02" type="button"
										value="ADD TO ${defaultRetailerUpperCase} BASKET" name=""
										onclick="login(1);" />
									</li>
								</ul>
							</div>
						</li>
						</ul>
					</div>
					
					<div class="basket_panel_con5"  style="display: none">
						<ul class="basket_con3_ula" style="margin-top: -15px; padding-bottom: 10px;">
							<li class="basket_con3_li01" style="font-weight: bold;">
							SORRY YOUR USERNAME AND PASSWORD COMBINATION IS NOT RECOGNISED BY ${defaultRetailerUpperCase}.</li>
							
							<li class="basket_con3_li02" style="font-size: 11px; margin-left:3px;">Please visit the ${defaultRetailer} website to retrieve your username and password:
							</li>
						</ul>
						
						<ul style="text-align:center; margin: 0 auto;">
							<li style="cursor: pointer;">
<%-- 									<a href="${pageContext.request.contextPath}/${basketUrl}"> --%>
						<img  
							src="${pageContext.request.contextPath}/images/logo_${defaultRetailer}.png"
							width="180px;" border="0" onclick="goToRetailer(this)" class="${defaultRetailer}">
<!-- 						</a> -->
						</li>
						</ul>
						<ul style="text-align: center;">
						  <li><input class="input_btn02" style="width:170px;" type="button" value="CONTINUE" name="" onclick="BackToLogin();" /></li>
						</ul>
				</div>
					
				<div class="basket_panel_con5"  style="display: none" id="test">
						<ul class="basket_con3_ula" style="margin:15px 40px 35px 40px;">
							<li class="basket_con3_li01" style="margin:0 auto; text-align:center; font-family:Arial; font-weight: bold;">
							PLEASE INPUT A VALID USERNAME AND PASSWORD FOR YOUR CHOSEN RETAILER</li>
						</ul>
						
						<ul style="width: 164px;margin: 0 auto;">
							<li>
							<div class="sch_login_acc">
								<ul>		<li style="margin-top: 3px;"><input class="input_btn02" type="button"
										value="CLOSE" name="" onclick="displayLogin();"/>
									</li>
								</ul>
							</div>
						</li>
						</ul>
					</div>	
					
				</div>
				</div>

				<!-- -----------------------------右侧结束------------------------------------- -->
			</div>


		</div>


	</div>
	
	<div id="delBasketTip" style="display: none">
		<img src="${pageContext.request.contextPath}/images/pc/schwartz/del_basket.png"></img>
	</div>
	<div class="del_bsk_block02" style="display: none" id="TotalMsgTip">
		<ul>
			<li class="del_bsk_bg02">Based on offers and prices as of today.  Prices may have changed when your order is confirmed and put together for delivery
</li>
			<li
				style="height: 7px; display: block; line-height: 0px; text-align: center;"><img
				src="${pageContext.request.contextPath}/images/pc/schwartz/icon_tri.png"
				style="padding: 0; margin: 0px;" width="12px;" height="7px;">
			</li>
		</ul>
	</div>
	<div class="offer_bsk_block02" style="display:none;" id="s_product_offer">
		<ul>
			<li class="offer_bsk_bg02">Offer applied to Total<br/> Buy one, get one free on all Slow Cookers Recipe Mixes</li>
			<li
				style="height: 7px; display: block; line-height: 0px; text-align: center;"><img
				src="${pageContext.request.contextPath}/images/pc/schwartz/icon_tri.png"
				style="padding: 0; margin: 0px;" width="12px;" height="7px;">
			</li>
		</ul>
	</div>
</body>
</html>