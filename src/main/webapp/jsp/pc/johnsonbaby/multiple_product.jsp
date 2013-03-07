<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld"%>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld"%>
<!DOCTYPE html >
<html>
<head>
<title>JOHNSON&#39;S&reg; Baby</title>
<meta name="description"
	content="Say ‘YES’ to Special K Biscuit Moments and other delicious   snacks using our Special K Snack Store." />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link
	href="${pageContext.request.contextPath}/css/pc/main_johnsonbaby.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/jquery/json2.js" type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/jquery/scroll/nice.scroll.js" type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/js/pc/johnsonbaby/common.js" type="text/javascript"></script>
<script type="text/javascript" charset="UTF-8"
	src="${pageContext.request.contextPath}/js/pc/johnsonbaby/basket_multiply.js"  ></script>
<script
	src="${pageContext.request.contextPath}/js/pc/johnsonbaby/basket_mpupa.1.0.js" type="text/javascript"></script>

<script>
	$(document).ready(
			function() {
				//display the userName and password what user input.
				if (isNotEmpty(localStorage.getItem("specialK_" + retailerName
						+ "_userName"))) {
					$("#userName").val(
							localStorage.getItem("specialK_" + retailerName
									+ "_userName"));
				}
//alert(window.navigator.userAgent);
				displayDefaultBasketInfo();
				//alert($("#hiddenDefaultCategoryImg").val());
				$("#defaultCategoryImg").attr("src",
				$("#hiddenDefaultCategoryImg").val());
				
				
				 $("#basketList").niceScroll({cursorcolor:"#F7a6B4",autohidemode:false});
				 $(".sch_pro_add").niceScroll({cursorcolor:"#F7a6B4",autohidemode:false});
				/* $("#basketList").mCustomScrollbar({
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
				});  */
				setTimeout(q, 10000);
			});

	function q() {
		$("#multiplePageCookieDiv").hide();
		$("#multiplePagePowerDiv").show();
	}
	

	function showFirstTimeDiv() {
		var divHeight = $("#floatMsgDiv2").height();
		var divWidth = $("#floatMsgDiv2").width();

		var screenW = document.body.clientWidth;
		var divLeft = Math.round((screenW - divWidth) / 2);
		var scrollH = document.body.scrollTop;
		var screenH = window.innerHeight;

		if (screenH > 600) {
			screenH = 600;
		}

		var divTop = Math.abs(Math.round((screenH - divHeight) / 2) + scrollH);

		$("#floatMsgDiv2").offset({
			"left" : divLeft,
			"top" : divTop
		}).css("display", "");
	}

	function closeMsgDiv2() {
		$("#floatMsgDiv2").remove();

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

	_gaq.push([ 'b._setAccount', 'UA-35779257-5' ]);
	_gaq.push([ 'b._trackPageview', retailerName + "/" + categoryName ]);

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

	WebFontConfig = {
		fontdeck : {
			id : '27833'
		}
	};

	(function() {
		var wf = document.createElement('script');
		wf.src = ('https:' == document.location.protocol ? 'https' : 'http')
				+ '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
		wf.type = 'text/javascript';
		wf.async = 'true';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(wf, s);
	})();
</script>
<!-- Piwik  -->
<script type="text/javascript">
	var pkBaseURL = (("https:" == document.location.protocol) ? "https://piwik.dotter.me/"
			: "http://piwik.dotter.me/");
	document.write(unescape("%3Cscript src='" + pkBaseURL
			+ "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
	try {
		var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 5);
		piwikTracker.setDocumentTitle(retailerName + "/" + categoryName);
		piwikTracker.trackPageView();
		piwikTracker.enableLinkTracking();
	} catch (err) {
	}
</script>
<noscript>
	<p>
		<img src="http://piwik.dotter.me/piwik.php?idsite=5" style="border: 0"
			alt="" />
	</p>
</noscript>
<!--End Piwik Tracking Code -->
</head>
<body id="multiple_product Page">
	<div id="popUpOutOfStockProductListDiv" class="basket_panel_con_popUP"
		style="display: none; font-family: Arial; font-size: 14px; line-height: 22px; z-index: 100000; position: absolute; width: 300px; list-style: none; text-shadow: none;">
		<ul id="popUpUl">

		</ul>
		<div style="width: 100%; text-align: center; margin-top: 10px;">
			<span onclick="popUpOutOfStockProductListDivSpanClose(this);"
				class="input_btn02" style="margin: 0 auto;" />close</span>
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
			<div class="header_logo">
				<a
					href="${pageContext.request.contextPath}/${brandModel['brandName']}">
					<img
					src="${pageContext.request.contextPath}/${brandModel['logoUrl']}"
					height="129" name="" border="0">
				</a>
			</div>
			<div class="header_help">
				<ul>
					<li class="head_right_a"><a
						href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/help">
							<span style="color: #ffffff;"> help</span>

					</a></li>
					<li class="head_right_b"><a
						href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms">
							<span style="color: #ffffff;"> site terms</span>

					</a></li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
		<div class="blowfish_content">

			<div class="openstore_block">
				<div class="sch_block_left">
					<div class="block_left_con">
						<table class="sch_addpro_title" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<td width="214px" style="padding-left: 31px;" align="left">product</td>
								<td width="52px;" align="left">price</td>
								<td align="left">quantity</td>
							</tr>
						</table>
						<!-- 	                     <div class="sch_addpro_note"> -->
						<!-- 	                        Buy one, get one free on all Slow Cookers Recipe Mixes -->
						<!-- 	                     </div> -->
						<div class="sch_pro_add">



							<c:if test="${fn:length(productList) > 0}">

								<c:forEach items="${productList}" var="product">
									<c:choose>
										<c:when
											test="${fn:length(product.productBreakdown1)+fn:length(product.unitWeightVol)>36}">
											<ul style="height: 44px;"
												onmouseover='showProductImage("${pageContext.request.contextPath}/${product.imageUrl}");'
												onmouseout="showProductImage('','Y');">
												<li class="sch_pro_info"><a
													href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}"><img
														src="${pageContext.request.contextPath}/images/pc/johnsonbaby/info_btn.png"
														height="14" name="" border="0"> </a></li>
												<li class="sch_pro_title"
													title="${product.productBreakdown1} ${product.unitWeightVol}"
													style="max-height: 44px;"><a style="color: #383838;"
													href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}">${product.productBreakdown1}
														${product.unitWeightVol}</a></li>
												<li class="sch_pro_price">£${product.nowPrice}</li>
												<li class="sch_pro_qty" style="height: 22px;">
													<table width="100%" height="24px;" border="0"
														cellspacing="0" cellpadding="0">
														<tr>
															<input type="hidden" value="${product.productId}"
																class="productId" id="${product.productId}">
															<input type="hidden" value="${product.productUrl}"
																class="productUrl">
															<input type="hidden" value="${product.nowPrice}"
																class="productPrice">
															<input type="hidden"
																value="${product.productBreakdown1} ${product.unitWeightVol}"
																class="productName">
															<input type="hidden" value="${product.offerId}"
																class="productOfferName">
															<td align="right" valign="top" style="cursor: pointer;"><img
																src="${pageContext.request.contextPath}/images/pc/johnsonbaby/reduce_btn.png"
																alt="" name="" border="0" class="minus"
																onclick="changeSelectNum(this);"></td>
															<td align="center" valign="top"><input
																id="${product.productId}Quantity" class="sch_input_qty"
																name="ipt_quantity" value="0" type="text"
																readonly="readonly" /></td>
															<td align="left" valign="top" style="cursor: pointer;"><img
																src="${pageContext.request.contextPath}/images/pc/johnsonbaby/add_btn.png"
																alt="" name="" border="0" class="add"
																onclick="changeSelectNum(this);"></td>
														</tr>
													</table>
												</li>
											</ul>

											<c:if test="${fn:length(product.offerName) > 0}">
												<div class="clear"></div>
												<div id="offerTipDiv" class="del_bsk_block01">
													<ul>
														<li
															onmouseover='showProductImage("${pageContext.request.contextPath}/${product.imageUrl}");'
															onmouseout="showProductImage('','Y');"
															class="del_bsk_bg01" id="offerMsgLi">${fn:substringBefore(product.offerName,
															"<br/>")}</li>
														<li class="text_wasprice" style="font-size: 9px;">${fn:substringAfter(product.offerName,
															"<br/>")}</li>
													</ul>
												</div>
											</c:if>
											<div class="clear"></div>
										</c:when>
										<c:otherwise>
											<ul
												onmouseover='showProductImage("${pageContext.request.contextPath}/${product.imageUrl}");'
												onmouseout="showProductImage('','Y');">
												<li class="sch_pro_info"><a
													href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}"><img
														src="${pageContext.request.contextPath}/images/pc/johnsonbaby/info_btn.png"
														height="14" name="" border="0"> </a></li>
												<li class="sch_pro_title"
													title="${product.productBreakdown1} ${product.unitWeightVol}"><a
													style="color: #383838;"
													href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}">${product.productBreakdown1}
														${product.unitWeightVol}</a></li>
												<li class="sch_pro_price">£${product.nowPrice}</li>
												<li class="sch_pro_qty" style="height: 22px;">
													<table width="100%" height="24px;" border="0"
														cellspacing="0" cellpadding="0">
														<tr>
															<input type="hidden" value="${product.productId}"
																class="productId" id="${product.productId}">
															<input type="hidden" value="${product.productUrl}"
																class="productUrl">
															<input type="hidden" value="${product.nowPrice}"
																class="productPrice">
															<input type="hidden"
																value="${product.productBreakdown1} ${product.unitWeightVol}"
																class="productName">
															<input type="hidden" value="${product.offerId}"
																class="productOfferName">
															<td align="right" valign="top" style="cursor: pointer;"><img
																src="${pageContext.request.contextPath}/images/pc/johnsonbaby/reduce_btn.png"
																alt="" name="" border="0" class="minus"
																onclick="changeSelectNum(this);"></td>
															<td align="center" valign="top"><input
																id="${product.productId}Quantity" class="sch_input_qty"
																name="ipt_quantity" value="0" type="text"
																readonly="readonly" /></td>
															<td align="left" valign="top" style="cursor: pointer;"><img
																src="${pageContext.request.contextPath}/images/pc/johnsonbaby/add_btn.png"
																alt="" name="" border="0" class="add"
																onclick="changeSelectNum(this);"></td>
														</tr>
													</table>
												</li>
											</ul>

											<c:if test="${fn:length(product.offerName) > 0}">
												<div class="clear"></div>
												<div id="offerTipDiv" class="del_bsk_block01">
													<ul>
														<li
															onmouseover='showProductImage("${pageContext.request.contextPath}/${product.imageUrl}");'
															onmouseout="showProductImage('','Y');"
															class="del_bsk_bg01" id="offerMsgLi">${fn:substringBefore(product.offerName,
															"<br/>")}</li>
														<li class="text_wasprice" style="font-size: 9px;">${fn:substringAfter(product.offerName,
															"<br/>")}</li>
													</ul>
												</div>
											</c:if>
											<div class="clear"></div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>

							<c:if test="${fn:length(productList) <= 0}">
								<span class="sch_pro_text">Not currently stocked at your
									selected retailer</span>
							</c:if>

							<div style="height: 25px;"></div>
						</div>
						<div class="bashe_pro_zhe"
							style="width: 358px; margin-top: -25px; margin-left: 0px;"></div>
					</div>
				
					<div  class="sch_footer1">
					<ul>
					<li style="width: 22px; height: 30px; float: left; padding-top: 2px;">
					<img
								src="${pageContext.request.contextPath}/images/logo_dotter.png"
								height="18" name="" border="0">
					</li>
					<li style="float: left;margin-top:0px;font-size:7px; width: 335px;line-height: 9px;">
					
					THIS SERVICE IS PROVIDED BY DOTTER AND THE PRODUCTS ARE BEING OFFERED FOR SALE BY TESCO AND NOT JOHNSON & JOHNSON LTD. FOR MORE INFORMATION, INCLUDING DOTTER’S PRVICACY POLICY,  <a
								style="color: #ffffff;"
								href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span>SEE
									TERMS</span> </a>
					</li>
					</ul>
						
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
							<div class="sch_bsk_title_slt"
								style="font-size: 15px; font-family: 'FS Albert Web Regular', Verdana, sans-serif; font-size-adjust: 0.48; font-weight: normal; font-style: normal;">selected
								products</div>
							<br />
							<table width="90%" border="0" cellspacing="0" cellpadding="0"
								style="margin-bottom: 40px; display: none;" id="exampleData">

								<tr valign="bottom">
									<td width="108px" colspan="2" align="left" valign="middle">Kellogg's
										Special K Biscuit Moments</td>
									<td width="22px" align="right" valign="top"><img
										onmouseover="showTipInfo(this);" onmouseout="hideTipInfo();"
										onclick="removeItemById(this);"
										src="${pageContext.request.contextPath}/images/pc/johnsonbaby/icon_del.png"
										height="14" name="" border="0" /> <input type="hidden" /></td>
								</tr>
								<tr>
									<td width="80px" align="left" style="font-weight: bold;">x2</td>
									<td width="10" align="left" style="cursor: pointer;">
										<%-- 										<img onmouseover="showOfferInfo(this);" onmouseout="hideOfferInfo(this);" src="${pageContext.request.contextPath}/images/pc/kellogg/info_btn2.png" height="14" name="" border="0"> --%>
									</td>
									<td width="20" align="right" style="font-weight: bold;">£0.99</td>
								</tr>
							</table>
							<div
								style="height: 75px; margin-bottom: 10px; overflow-x: hidden; overflow-y: auto;"
								id="basketList"></div>
							<div
								style="border-top: 1px solid #FF4B6C; height: 1px; width: 136px; margin-bottom: 5px;"></div>
							<table width="136" border="0" cellspacing="0" cellpadding="0"
								onmouseover="showTotalMsgDiv(this);"
								onmouseout="hideTotalMsgDiv(this);">
								<tr id="savingsTr" style="display: none;" height="14px;">
									<td width="84px" align="left" valign="middle"
										class="sch_bsk_title"
										style="font-family: Helvetica; display: none;">SAVINGS</td>
									<td width="42px" style="display: none;" align="right"
										id="savingsPrice">- £0.78</td>
								</tr>
								<tr>
									<td width="84px" align="left" valign="middle"
										class="sch_bsk_title02">TOTAL</td>
									<td width="42px" align="right" style="font-weight: bold;"
										id="totalPrice">£0.99</td>
								</tr>
							</table>
						</div>
						<div class="sch_login_block">
							<div>
								<span id="tipInfo">Add to your next Tesco shop<br /> by
									entering the following details
								</span>
							</div>
							<div class="sch_login_acc">
								<ul>
									<li><input class="sch_input_acc" name=""
										placeholder="${defaultRetailer} username" id="userName"
										onblur="saveUserName(this);" /></li>
									<li><input class="sch_input_acc" name="password"
										placeholder="${defaultRetailer} password" type="password"
										id="password" /></li>

									<div class="clear"></div>
									<li><span class="input_btn02" onclick="login(0);">add
											to ${defaultRetailerUpperCase} basket</span></li>
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
					<div class="basket_panel_con2" style="display: none; z-index: 1009;"
						id="productsBasket">
						<div>
							<img
								src="${pageContext.request.contextPath}/images/pc/johnsonbaby/Checkout_Web_Animation_v2_P02.gif"
								name="" border="0" />
						</div>
					</div>
					<div class="basket_panel_con2" style="display: none; z-index: 1009;"
						id="checkArea">
						<div>
							<img
								src="${pageContext.request.contextPath}/images/pc/johnsonbaby/Checkout_Web_Animation_v1_P02.gif"
								name="" border="0" />
						</div>
					</div>

					<div class="basket_panel_con3" style="display: none; z-index: 1009;">
						<ul class="basket_con3_ula">
							<li class="basket_con3_li01">Sorry, the fllowing products
								are not available in your area:</li>
						</ul>
						<ul class="basket_con3_uld" id="failureListMsg">
						</ul>


						<ul class="basket_con3_ula">
							<li class="basket_con3_li01">All other products have been
								successfully added to your <span>${defaultRetailerUpperCase}</span>
								basket.
						</ul>
						<ul class="basket_con3_ulc">
							<li class="input_con02">go back and choose anther product</li>
							<li class="input_con02" style="margin-top: 5px;">finish
								shopping</li>
						</ul>
					</div>


					<div class="basket_panel_con4" style="display: none; z-index: 1009;">
						<ul class="basket_con3_ula" style="padding-bottom: 10px;">
							<li class="basket_con3_li01"
								style="font-family: Arial; font-weight: normal;">Sorry.
								Your username and password combination<br /> is not recognised
								by ${defaultRetailer}. Please try again.
							</li>
						</ul>

						<ul style="width: 164px; margin: 0 auto;">
							<li>
								<div class="sch_login_acc">
									<ul>
										<li><input class="sch_input_acc" name=""
											placeholder="${defaultRetailer} username" id="SecondUserName"
											onblur="saveUserName(this);" /></li>
										<li><input class="sch_input_acc" name="password"
											placeholder="${defaultRetailer} password" type="password"
											id="SecondPassword" /></li>

										<li style="margin-top: 3px;"><span class="input_btn02"
											onclick="login(1);">add to
												${defaultRetailerUpperCase} basket</span></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>


					<div class="basket_panel_con5" style="display: none; z-index: 1009;">
						<ul class="basket_con3_ula" style="padding-bottom: 10px;">
							<li class="basket_con3_li01" style="font-weight: normal;">
								Sorry. Your username and password combination is not recognised
								by ${defaultRetailer}. Please visit their website to retrieve
								your details.</li>
						</ul>
						<br />
						<ul
							style="text-align: center; margin: 0 auto; margin-bottom: 10px;">
							<li style="cursor: pointer;">
								<%-- 									<a href="${pageContext.request.contextPath}/${basketUrl}"> --%>
								<img
								src="${pageContext.request.contextPath}/images/logo_${defaultRetailer}.png"
								width="170px;" border="0" onclick="goToRetailer(this)"
								class="${defaultRetailer}"> <!-- 						</a> -->
							</li>
						</ul>
						<ul>
							<li style="text-align: center; width: 100%;"><span
								class="input_btn02" style="margin: 0 auto;"
								onclick="BackToLogin();">continue</span></li>
						</ul>
					</div>

					<div class="basket_panel_con5" style="display: none; z-index: 1009;" id="test">
						<ul class="basket_con3_ula" style="margin: 35px 40px 15px 40px;">
							<li class="basket_con3_li01"
								style="margin: 0 auto; text-align: center;">Please input a
								valid username and password.</li>
						</ul>

						<ul style="width: 164px; margin: 0 auto;">
							<li>
								<div class="sch_login_acc">
									<ul>
										<li><span class="input_btn02" onclick="displayLogin();">close</span>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</div>



				</div>

				<!-- -----------------------------右侧结束------------------------------------- -->
			</div>


		</div>


	</div>

	<div id="delBasketTip" style="display: none; z-index: 1009;">
		<img
			src="${pageContext.request.contextPath}/images/pc/johnsonbaby/del_basket.png"></img>
	</div>
	<div id="offerTipDiv" style="display: none" class="del_bsk_block">
		<ul>
			<li class="del_bsk_bg01" id="offerMsgLi">Delete this product
				from basket</li>
			<li
				style="height: 7px; display: block; line-height: 0px; padding-left: 10px;"><img
				src="${pageContext.request.contextPath}/images/pc/johnsonbaby/icon_tri.png"
				style="padding: 0; margin: 0px;" width="12px;" height="7px;">
			</li>
		</ul>
	</div>
	<div class="del_bsk_block02"
		style="display: none; position: absolute; z-index: 1009;"
		id="TotalMsgTip">
		<ul>
			<li class="del_bsk_bg02">Based on offers and prices as of today.
				Prices may have changed when your order is confirmed and put
				together for delivery</li>
			<li
				style="width: 213px; height: 7px; display: block; line-height: 0px; text-align: center;"><img
				src="${pageContext.request.contextPath}/images/pc/johnsonbaby/icon_tri.png"
				style="padding: 0; margin: 0px;" width="12px;" height="7px;">
			</li>
		</ul>
	</div>
	<div class="offer_bsk_block02" style="display: none; z-index: 1009;"
		id="mulitiple_product_offer">
		<ul>
			<li class="offer_bsk_bg02">Offer applied to Total<br /> Buy one,
				get one free on all Slow Cookers Recipe Mixes
			</li>
			<li
				style="height: 7px; display: block; line-height: 0px; text-align: center;"><img
				src="${pageContext.request.contextPath}/images/pc/johnsonbaby/icon_tri.png"
				style="padding: 0; margin: 0px;" width="12px;" height="7px;">
			</li>
		</ul>
	</div>

	<div id="floatMsgDiv2"
		style="display: none; z-index: 100001; position: absolute; width: 340px; list-style: none; background: #ba1836; background: -webkit-gradient(linear, 0 0, 0 100%, from(#f7454a), to(#a12525) ); background: -moz-linear-gradient(top, #f7454a, #a12525); filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0, startColorstr=#f7454a, endColorstr=#a12525 ); -moz-border-radius: 7px; -webkit-border-radius: 7px; border-radius: 7px; -moz-box-shadow: 2px 3px 6px 3px #c6c6c4; -webkit-box-shadow: 2px 3px 6px 3px #c6c6c4; box-shadow: 2px 3px 6px 3px #c6c6c4; text-shadow: none;">
		<li class="font_title">Say ‘yes’ to delicious Special K snacks
			using our Snack Store</li>
		<li class="font_title2">Fill your shopping backet with the range
			of tempting sweet and savoury snacks you don’t have to say ‘no’ to</li>
		<li onclick="closeMsgDiv2();"
			style="padding: 10px 0px 20px 0px; text-align: center;"><span
			class="input_btn03" style="width: 120px; font-weight: normal;">Start
				shopping</span></li>
	</div>

</body>
</html>