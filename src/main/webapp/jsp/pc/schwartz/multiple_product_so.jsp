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
<link href="${pageContext.request.contextPath}/css/pc/main_schwartz.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/jquery/scroll/jquery.mCustomScrollbar_sch.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/jquery/scroll/jquery.mousewheel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/jquery/scroll/jquery.mCustomScrollbar.js"></script>
<script src="${pageContext.request.contextPath}/js/pc/schwartz/common.js"></script>
<script src="${pageContext.request.contextPath}/js/pc/schwartz/basket_multiply.js"></script>
<script
	src="${pageContext.request.contextPath}/js/pc/schwartz/basket_mpupa.1.0.js"></script>
</head>
<script>
	$(document).ready(
			function() {
				//display the userName and password what user input.
				if(isNotEmpty(localStorage.getItem("schwartz"+retailerName+"_userName"))){
					$("#userName").val(localStorage.getItem("schwartz"+retailerName+"_userName"));
				}
// 				if(isNotEmpty(localStorage.getItem("schwartz"+retailerName+"_password"))){
// 					$("#password").val(localStorage.getItem("schwartz"+retailerName+"_password"));
// 					$("#password").focus();
// 				}
				
				displayDefaultBasketInfo();
				//alert($("#hiddenDefaultCategoryImg").val());
				$("#defaultCategoryImg").attr("src",
						$("#hiddenDefaultCategoryImg").val());
				$("#basketList").mCustomScrollbar({
					advanced : {
						updateOnBrowserResize : true,
						updateOnContentResize : true,
						autoExpandHorizontalScroll : true
					}
				});
				$(".sch_pro_add").mCustomScrollbar({
					advanced : {
						updateOnBrowserResize : true,
						updateOnContentResize : true,
						autoExpandHorizontalScroll : true
					}
				});
				if(sessionStorage.getItem("clickFromHome") != 'true') {
					showFirstTimeDiv();
				}

			});
	
	

	function showFirstTimeDiv() {
		sessionStorage.setItem("clickFromHome","true");
		var divHeight = $("#floatMsgDiv3").height();
		var divWidth = $("#floatMsgDiv3").width();
		
		var screenW = document.body.clientWidth ;
		var divLeft = Math.round((screenW-divWidth)/2);
		var scrollH = document.body.scrollTop;
		var screenH = document.body.clientHeight;
		
		if(screenH > 600) {
			screenH = 600;
		}
		var divTop = Math.abs(Math.round((screenH-divHeight)/2)+scrollH);
		var div = '<div id="floatMaskLayerDiv" style="position: absolute; top:0; left: 0px; width: 100%; height: 200%; text-align:center; filter: Alpha(Opacity =         30); opacity: 0.3; background-color: #000000;z-index:100000; ">';
		div+='</div>';
		$("body").append($(div));
		
		$("#floatMsgDiv3").offset({
					"left":divLeft,
					"top":divTop
				}).css("display","");
	}
	
	function closeMsgDiv2() {
		//$("#floatMsgDiv3").remove();
		$("#floatMsgDiv3").hide();
		$("#floatMaskLayerDiv").remove();
		
	}
	var firstTime = '${firstTime}';
	var brandName = "${brandModel['brandName']}";
	var retailerName = "${defaultRetailer}";
	var categoryName = "${defaultCategory}";
	var productId = "";
	var path = '${pageContext.request.contextPath}';
	var retailerNameUpperCase = "${defaultRetailerUpperCase}";
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', '${brandModel["gaNumber"]}' ]);
	_gaq.push([ '_trackPageview', retailerName + "/" + categoryName ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
	
	function showOfferInfo(obj){
		var basketName = retailerName + brandName + "Basket";
		var current = getBasketListForLocal(basketName, true);
		var flag = 0;
		for ( var v = 0; v < current.length; v++) {
			if (isNotEmpty(current[v].siteType)) {
				flag = 1;
				break;
			}
		}
		if (flag == 1) {
			$(obj).attr("style", "cursor: pointer");
			var left = $(obj).offset().left;
			var top = $(obj).offset().top;
			$("#mulitiple_product_so_offer").css("position", "absolute");
			$("#mulitiple_product_so_offer").offset({
				"left" : left - 75.5,
				"top" : top - 60
			}).css("display", "block");
			// }
		} else {
			$(obj).removeAttr("style");
		}
		$("#mulitiple_product_so_offer").show();
	}
	
// 	document.addEventListener("click",function(){
// 		closeMsgDiv2();
// 		});
	
	function hideOfferInfo(obj){
		$("#mulitiple_product_so_offer").removeAttr("style").hide();
	}
	
</script>
<!-- Piwik --> 
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://piwik.dotter.me/" : "http://piwik.dotter.me/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 2);
piwikTracker.setDocumentTitle(retailerName + "/" + categoryName);
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=2" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->
<body id="multiple_product Page">
<div id="popUpOutOfStockProductListDiv" class="basket_panel_con_popUP" style="display:none; font-family:Arial; font-size:14px; line-height:22px; z-index:100000;position: absolute;width: 300px;list-style: none; text-shadow: none;">
			<ul id="popUpUl">
			
			</ul>
			<div style="width:100%; text-align: center; margin-top: 10px;">
			 <input class="input_btn02" style="width:170px;" type="button" value="CLOSE" name="" />
			</div>
	</div>


	<c:if test="${fn:length(productList) > 0}">
		<input type="hidden" value="${productList[0].brandId}"
			id="defaultBrandId">
		<input type="hidden" value="${productList[0].clientId}"
			id="defaultClientId">
		<input type="hidden" value="${productList[0].retailerId}"
			id="defaultRetailerId">
	</c:if>

	<input type="hidden" value="${defaultRetailer}" id="defaultReatiler">
	<input type="hidden" value="${pageContext.request.contextPath}"
		id="context">
	<div id="" class="blowfish_page">
		<div class="blowfish_header">

			<a
				href="${pageContext.request.contextPath}/${brandModel['brandName']}">
				<img
				src="${pageContext.request.contextPath}/blowfish_images/schwartz/logo_schwartz.png"
				height="69" name="" border="0"> </a>
		</div>

		<div class="blowfish_content">
			<div class="openstore_retailer">
				<div class="sch_retailer_title">MY SELECTED RETAILER:</div>
				<div class="sch_retailer_logo">
					<ul>
						<!-- 
		                <li><img src="${pageContext.request.contextPath}/images/logo_asda01.png" height="17"  name="" border="0"></li>
		                <li><img src="${pageContext.request.contextPath}/images/logo_ocado01.png" height="17"  name="" border="0"></li>
		                <li class="sch_retailer_active"><img src="${pageContext.request.contextPath}/images/logo_sain01.png" height="17"  name="" border="0"></li>
		                <li><img src="${pageContext.request.contextPath}/images/logo_tesco01.png" height="17"  name="" border="0"></li>
		                <li><img src="${pageContext.request.contextPath}/images/logo_waitrose01.png" height="17"  name="" border="0"></li>
		              -->


						<c:forEach items="${retailerList}" var="retailer">

							<c:choose>
								<c:when test="${retailer.name eq defaultRetailer}">
									<li class="sch_retailer_active"
										style="width: 98px; padding-top: 2px;" onclick="closeMsgDiv2();"><img
										src="${pageContext.request.contextPath}/images/logo_${fn:toLowerCase(retailer['name'])}01.png"
										height="17" name="" border="0"></li>
								</c:when>
								<c:otherwise>

									<li onclick="closeMsgDiv2();"><a
										href="${pageContext.request.contextPath}/${brandModel['brandName']}/${retailer.name}/${defaultCategory}/product">
											<img
											src="${pageContext.request.contextPath}/images/logo_${fn:toLowerCase(retailer['name'])}01.png"
											height="17" name="" border="0" /> </a></li>

								</c:otherwise>
							</c:choose>

						</c:forEach>

					</ul>
				</div>
				<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/help"><div
						class="sch_retailer_help">HELP</div>
				</a>
			</div>
			<div class="clear"></div>
			<div class="openstore_show">
				<div class="sch_show_title">SHOW ME:</div>
				<div class="sch_show_item">
					<ul>
						<!-- <li class="sch_show_active">Slow Cookers</li>
		                <li>Bag ‘N’ Season</li>
		                <li>Winter Warmers</li>
		                <li>Recipe Inspiration</li> -->

						<c:forEach items="${categoryList}" var="category1">
							<c:choose>
								<c:when test="${category1.name eq defaultCategory}">

									<li class="sch_show_active" style="width:128px;">${fn:toUpperCase(category1.name)}
									</li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${category1.name}/product">
											${fn:toUpperCase(category1.name)} </a></li>

								</c:otherwise>
							</c:choose>

						</c:forEach>

					</ul>
				</div>
			</div>


			<div class="openstore_block">
				<div class="sch_block_left">
					<div class="block_left_con">
						<table class="sch_addpro_title" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<td width="225px" style="padding-left: 15px;" align="left">PRODUCT</td>
								<td width="54px;" align="left">PRICE</td>
								<td align="left">QUANTITY</td>
							</tr>
						</table>

						<div class="sch_addpro_top">${defaultCategory}<span style="font-weight: normal;color: #AAAAAA;"> | ${defaultCategorySecondName}</span></div>

						<c:if test="${fn:length(groupOfferName)>0}">
							<div class="sch_addpro_note">
								
								<span> ${groupOfferName}</span>
							</div>
						</c:if>




						<div class="sch_pro_add">



							<c:if test="${fn:length(productList) > 0}">

								<c:forEach items="${productList}" var="product">

								<c:choose>
									<c:when test="${fn:length(product.productName)>36}">
										<ul style="height: 50px;"
										onmouseover='showProductImage("${pageContext.request.contextPath}/${product.imageUrl}");'
										onmouseout="showProductImage('','Y');">
										
										<li class="sch_pro_info"><a
											href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}"><img
												src="${pageContext.request.contextPath}/images/pc/schwartz//info_btn.png"
												height="14" name="" border="0"> </a>
										</li>
										<li class="sch_pro_title" title="${product.productName}" style="max-height: 44px;"><a
											href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}">${product.productName}</a>
										</li>
										<li class="sch_pro_price">£${product.nowPrice}</li>
										<li class="sch_pro_qty">
											<table width="100%" height="24px;" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<input type="hidden" value="${product.productId}"
														class="productId" id="${product.productId}">
													<input type="hidden" value="${product.productUrl}"
														class="productUrl">
													<input type="hidden" value="${product.nowPrice}"
														class="productPrice">
													<input type="hidden" value="${product.productName}"
														class="productName">
													<input type="hidden" value="${product.offerId}"
														class="productOfferName">
													<td align="right" valign="top" style="cursor: pointer;"><img
														src="${pageContext.request.contextPath}/images/pc/schwartz/reduce_btn.png"
														alt="" name="" border="0" class="minus"
														onclick="changeSelectNum(this);">
													</td>
													<td align="center" valign="top"><input
														id="${product.productId}Quantity" class="sch_input_qty"
														name="ipt_quantity" value="0" type="text"
														readonly="readonly" />
													</td>
													<td align="left" valign="top" style="cursor: pointer;"><img
														src="${pageContext.request.contextPath}/images/pc/schwartz/add_btn.png"
														alt="" name="" border="0" class="add"
														onclick="changeSelectNum(this);">
													</td>
												</tr>
											</table></li>
									</ul>
									</c:when>
									<c:otherwise>
									<ul
										onmouseover='showProductImage("${pageContext.request.contextPath}/${product.imageUrl}");'
										onmouseout="showProductImage('','Y');">
										<li class="sch_pro_info"><a
											href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}"><img
												src="${pageContext.request.contextPath}/images/pc/schwartz//info_btn.png"
												height="14" name="" border="0"> </a>
										</li>
										<li class="sch_pro_title" style="max-height:44px;" title="${product.productName}"><a
											href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}">${product.productName}</a>
										</li>
										<li class="sch_pro_price">£${product.nowPrice}</li>
										<li class="sch_pro_qty">
											<table width="100%" height="24px;" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<input type="hidden" value="${product.productId}"
														class="productId" id="${product.productId}">
													<input type="hidden" value="${product.productUrl}"
														class="productUrl">
													<input type="hidden" value="${product.nowPrice}"
														class="productPrice">
													<input type="hidden" value="${product.productName}"
														class="productName">
													<input type="hidden" value="${product.offerId}"
														class="productOfferName">
													<td align="right" valign="top" style="cursor: pointer;"><img
														src="${pageContext.request.contextPath}/images/pc/schwartz/reduce_btn.png"
														alt="" name="" border="0" class="minus"
														onclick="changeSelectNum(this);">
													</td>
													<td align="center" valign="top"><input
														id="${product.productId}Quantity" class="sch_input_qty"
														name="ipt_quantity" value="0" type="text"
														readonly="readonly" />
													</td>
													<td align="left" valign="top" style="cursor: pointer;"><img
														src="${pageContext.request.contextPath}/images/pc/schwartz/add_btn.png"
														alt="" name="" border="0" class="add"
														onclick="changeSelectNum(this);">
													</td>
												</tr>
											</table></li>
									</ul>
									</c:otherwise>
								</c:choose>

									
										

<%-- 									<c:if test="${fn:length(product.offerName) > 0}"> --%>
<!-- 										<div class="clear"></div> -->
<!-- 										<div id="offerTipDiv" class="del_bsk_block01"> -->
<!-- 											<ul> -->
<!-- 												<li -->
<%-- 													onmouseover='showProductImage("${pageContext.request.contextPath}/${product.imageUrl}");' --%>
<!-- 													onmouseout="showProductImage('','Y');" class="del_bsk_bg01" -->
<%-- 													id="offerMsgLi">${product.offerName}</li> --%>

<!-- 											</ul> -->
<!-- 										</div> -->
<%-- 									</c:if> --%>
<!-- 									<div class="clear"></div> -->
								</c:forEach>
							</c:if>

							<c:if test="${fn:length(productList) <= 0}">
								<span class="sch_pro_text">Not currently stocked at your selected retailer. Please try another retailer</span>
							</c:if>


						</div>

					</div>
					<div class="sch_footer">
						<img
							src="${pageContext.request.contextPath}/images/logo_dotter.png"
							height="18" name="" border="0"> POWERED BY DOTTER IN
						ASSOCIATION WITH SCHWARTZ | <a style="color: #ffffff;"
							href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span>SEE
								TERMS</span> </a>
					</div>
				</div>
				<!-- -----------------------------左侧结束------------------------------------- -->
				<div class="sch_block_right">
					<div class="sch_pro_image" id="sss_p_img">
						<c:forEach items="${categoryList}" var="category1">
							<c:if test="${category1.name eq defaultCategory}">

								<img
									src="${pageContext.request.contextPath}/${category1.imageUrl}"
									height="240px;" alt="" name="" border="0" id="">
							</c:if>

						</c:forEach>
					</div>
					<div class="clear"></div>

					<div class="basket_panel_con">
						<div class="sch_basket_panel">
							<div class="sch_bsk_title">SELECTED PRODUCTS</div>
							<br />
							<table width="90%" border="0" cellspacing="0" cellpadding="0"
								style="margin-bottom: 40px; display: none;" id="exampleData">

								<tr valign="bottom">
									<td width="108px" colspan="2" align="left" valign="middle">schwartz's
										Special K Biscuit Moments</td>
									<td width="22px" align="right" valign="top"><img
										onmouseover="showTipInfo(this);" onmouseout="hideTipInfo();"
										onclick="removeItemById(this);"
										src="${pageContext.request.contextPath}/images/pc/schwartz/icon_del.png"
										height="14" name="" border="0" /> <input type="hidden" /></td>
								</tr>
								<tr>
									<td width="80px" align="left" style="font-weight: bold;">x2</td>
									<td width="10" align="left" style="cursor: pointer;">
<%-- 										<img onmouseover="showOfferInfo(this);" onmouseout="hideOfferInfo(this);" src="${pageContext.request.contextPath}/images/pc/schwartz/info_btn2.png" height="14" name="" border="0"> --%>
									</td>
									<td width="20" align="right" style="font-weight: bold;">£0.99</td>
								</tr>
							</table>
							<div
								style="height: 75px; margin-bottom: 10px; overflow-x: hidden; overflow-y: auto;"
								id="basketList"></div>
							<div
								style="border-top: 1px solid #c1232f; height: 1px; width: 136px; margin-bottom: 5px;"></div>
							
							<table width="136" border="0" cellspacing="0" cellpadding="0"
								onmouseover="showTotalMsgDiv(this)"
								onmouseout="hideTotalMsgDiv(this)">
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
									<td width="84px" align="left" valign="middle"
										class="sch_bsk_title" style="color: #000000;">Total</td>
									<td width="42px" align="right" id="totalPrice"
										style="font-weight: bold;">£0.99</td>
								</tr>
							</table>
						</div>
						<div class="sch_login_block">
							<div>
								<span id="tipInfo">Add to your next online shop by
									entering the following details.</span>
							</div>
							<div class="sch_login_acc">
								<ul>
									<li><input class="sch_input_acc" name=""
										placeholder="${fn:toUpperCase(defaultRetailer)} username" id="userName" onchange="saveUserName('userName')" />
									</li>
									<li><input class="sch_input_acc" name="password"
										placeholder="${fn:toUpperCase(defaultRetailer)} password" type="password"
										id="password"  />
									</li>
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
										value="ADD TO ${defaultRetailerUpperCase} BASKET" name=""
										onclick="login(0);" /></li>
								</ul>
							</div>
						</div>
					</div>

					<!-- 					<div class="basket_panel_con2" style="display: none"> -->
					<!-- 						<div class="basket_con2_lodding"> -->
					<!-- 							<img -->
					<%-- 								src="${pageContext.request.contextPath}/images/lodding_01.gif" --%>
					<!-- 								height="176" name="" border="0"> -->
					<!-- 						</div> -->
					<!-- 						<div class="basket_con2_text">ESTABLISHING SECURE<br /> -->
					<%-- 							CONNECTION WITH ${defaultRetailerUpperCase}...</div> --%>
					<!-- 					</div> -->
					<div class="basket_panel_con2" style="display: none;">
						<div class="basket_con2_lodding">
							<img
								src="${pageContext.request.contextPath}/images/lodding_sch.gif"
								height="176" name="" border="0">
						</div>
						<div id="productsBasket" class="basket_con2_text">
							PRODUCTS ADDING TO<br /> YOUR ${defaultRetailerUpperCase}
							BASKET...
						</div>
					</div>
					<div class="basket_panel_con2" style="display: none;">
						<div class="basket_con2_lodding">
							<img
								src="${pageContext.request.contextPath}/images/lodding_sch.gif"
								height="176" name="" border="0">
						</div>
						<div id="checkArea" class="basket_con2_text">
							CHECKING AVAILABILITY<br /> AT ${defaultRetailerUpperCase} IN
							YOUR AREA...
						</div>
					</div>

					<div class="basket_panel_con3" style="display: none;">
						<ul class="basket_con3_ula" style="margin-top: -20px;">
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
						<ul class="basket_con3_ula"
							style="margin-top: -15px; padding-bottom: 10px;">
							<li class="basket_con3_li01"
								style="font-weight: bold;">
								SORRY YOUR USERNAME AND PASSWORD COMBINATION IS NOT RECOGNISED
								BY ${defaultRetailerUpperCase}, PLEASE TRY AGAIN.</li>
						</ul>

						<ul style="width: 164px; margin: 0 auto;">
							<li>
								<div class="sch_login_acc">
									<ul>
										<li><input class="sch_input_acc" name=""
											placeholder="${defaultRetailerUpperCase} username"
											id="SecondUserName" onchange="saveUserName('SecondUserName')"/>
										</li>
										<li><input class="sch_input_acc" name="password"
											placeholder="${defaultRetailerUpperCase} password"
											type="password" id="SecondPassword"  />
										</li>

										<li style="margin-top: 3px;"><input class="input_btn02"
											type="button"
											value="ADD TO ${defaultRetailerUpperCase} BASKET" name=""
											onclick="login(1);" /></li>
									</ul>
								</div></li>
						</ul>
					</div>


					<div class="basket_panel_con5" style="display: none;">
						<ul class="basket_con3_ula"
							style="margin-top: -15px; padding-bottom: 10px;">
							<li class="basket_con3_li01"
								style="font-weight: bold;">
								SORRY YOUR USERNAME AND PASSWORD COMBINATION IS NOT RECOGNISED
								BY ${defaultRetailerUpperCase}.</li>

							<li class="basket_con3_li02"
								style="font-size: 11px; margin-left: 3px;">Please visit the
								${defaultRetailer} website to retrieve your username and
								password:</li>
						</ul>

						<ul style="text-align: center; margin: 0 auto; margin-bottom: 5px;">
							<li style="cursor: pointer;">
								<%-- 									<a href="${pageContext.request.contextPath}/${basketUrl}"> --%>
								<img
								src="${pageContext.request.contextPath}/images/logo_${defaultRetailer}.png"
								width="144px;" border="0" onclick="goToRetailer(this)"
								class="${defaultRetailer}"> <!-- 						</a> --></li>
						</ul>
						<ul style="text-align: center;">
						  <li><input class="input_btn02" style="width:170px;" type="button" value="CONTINUE" name=""  onclick="BackToLogin();"/></li>
						</ul>
					</div>

					<div class="basket_panel_con5" style="display: none" id="test">
						<ul class="basket_con3_ula" style="margin: 15px 40px 35px 40px;">
							<li class="basket_con3_li01"
								style="margin: 0 auto; text-align: center; font-weight: bold;">
								PLEASE INPUT A VALID USERNAME AND PASSWORD FOR YOUR CHOSEN
								RETAILER</li>
						</ul>

						<ul style="width: 164px; margin: 0 auto;">
							<li>
								<div class="sch_login_acc">
									<ul>
										<li style="margin-top: 3px;"><input class="input_btn02"
											type="button" value="CLOSE" name="" onclick="displayLogin();" />
										</li>
									</ul>
								</div></li>
						</ul>
					</div>



				</div>

				<!-- -----------------------------右侧结束------------------------------------- -->
			</div>


		</div>


	</div>

	<div id="delBasketTip" style="display: none">
		<img
			src="${pageContext.request.contextPath}/images/pc/schwartz/del_basket.png"></img>
	</div>
	<div id="offerTipDiv" style="display: none" class="del_bsk_block">
		<ul>
			<li class="del_bsk_bg01" id="offerMsgLi">Delete this product
				from basket</li>
			<li
				style="height: 7px; display: block; line-height: 0px; padding-left: 10px;"><img
				src="${pageContext.request.contextPath}/images/pc/schwartz/icon_tri.png"
				style="padding: 0; margin: 0px;" width="12px;" height="7px;">
			</li>
		</ul>
	</div>
	<div class="del_bsk_block02" style="display: none" id="TotalMsgTip">
		<ul>
			<li class="del_bsk_bg02">Based on offers and prices as of today.  Prices may have changed when your order is confirmed and put together for delivery</li>
			<li
				style="height: 7px; display: block; line-height: 0px; text-align: center;"><img
				src="${pageContext.request.contextPath}/images/pc/schwartz/icon_tri.png"
				style="padding: 0; margin: 0px;" width="12px;" height="7px;">
			</li>
		</ul>
	</div>
	<div class="offer_bsk_block02" style="display:none;" id="mulitiple_product_so_offer">
		<ul>
			<li class="offer_bsk_bg02">Offer applied to Total<br/> ${groupOfferName} on all ${defaultCategory}</li>
			<li
				style="height: 7px; display: block; line-height: 0px; text-align: center;"><img
				src="${pageContext.request.contextPath}/images/pc/schwartz/icon_tri.png"
				style="padding: 0; margin: 0px;" width="12px;" height="7px;">
			</li>
		</ul>
	</div>
	
		 <div id="floatMsgDiv3" style="display:none; font-family:Arial; z-index:100001;position: absolute;width: 352px;list-style: none;background:#fff;-moz-box-shadow:2px 3px 6px 3px #c6c6c4;-webkit-box-shadow:2px 3px 6px 3px #c6c6c4;box-shadow: 2px 3px 6px 3px #c6c6c4;">
	<li  class="font_title" >Welcome to the Schwartz Web Store</li>
	<li   class="font_title2"> Please select your retailer to start shopping</li>
	<li  class="openstore_retailer" style="margin: 15px 0 20px 0;"> 
	<div class="sch_retailer_logo2">
					<ul>
		<c:forEach items="${retailerList}" var="retailer">

							<c:choose>
								<c:when test="${retailer.name eq defaultRetailer}">
									<li class=""
										style="width: 86px; padding-top: 2px;">
										<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${retailer.name}/${defaultCategory}/product"><img
										src="${pageContext.request.contextPath}/images/logo_${fn:toLowerCase(retailer['name'])}01.png"
										height="17" name="" border="0"></li>
								</c:when>
								<c:otherwise>

									<li><a
										href="${pageContext.request.contextPath}/${brandModel['brandName']}/${retailer.name}/${defaultCategory}/product">
											<img
											src="${pageContext.request.contextPath}/images/logo_${fn:toLowerCase(retailer['name'])}01.png"
											height="17" name="" border="0" />
									</a></li>

								</c:otherwise>
							</c:choose>

						</c:forEach>

					</ul>
				</div></li>
	</div>
	
</body>
</html>