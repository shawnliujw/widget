<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld"%>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld"%>
<!DOCTYPE html >
<html>
<head>
<title>Kellogg’s Special K Store</title>
<meta name="description"
	content="Say ‘YES’ to Special K Biscuit Moments and other delicious   snacks using our Special K Snack Store." />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/pc/main_kellogg.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/jquery/scroll/jquery.mCustomScrollbar.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/jquery/scroll/jquery.mousewheel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/jquery/scroll/jquery.mCustomScrollbar.js"></script>
<script src="${pageContext.request.contextPath}/js/pc/kellogg/common.js"></script>
<script
	src="${pageContext.request.contextPath}/js/pc/kellogg/basket_multiply.js"></script>
<script
	src="${pageContext.request.contextPath}/js/pc/kellogg/basket_mpupa.1.0.js"></script>
<script
	src="${pageContext.request.contextPath}/js/pc/kellogg/cpt.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/cufon/cufon.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/cufon/Caecilia_LT_Std-Roman_italic_400.font.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/cufon/defineCufon.js"></script>

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
				// 				if(isNotEmpty(localStorage.getItem("specialK_"+retailerName+"_password"))){
				// 					$("#password").val(localStorage.getItem("specialK_"+retailerName+"_password"));
				// 					$("#password").focus();
				// 				}

				if(sessionStorage.getItem("clickFromHome") != 'true') {
					showFirstTimeDiv();
				}

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

				$(".sub_category_name").each(function(idx,item){
// 					if(idx==0){
						foldProducts(item);
// 					}
				});
				
			});

	function showFirstTimeDiv() {
		sessionStorage.setItem("clickFromHome","true");
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

	document.addEventListener("click", function() {
		closeMsgDiv2();
	});
	
	
	function foldProducts(obj) {
		
		var current = $(obj).attr("status");
		if(current == 'reduce') {
			current = 'add';
		} else if(current = "add") {
			current = 'reduce';
		}
		
		$(obj).attr("status",current);
		$(obj).find("img").attr("src",path + "/images/pc/kellogg/btn_"+current+".png");
		
		var div = $($(obj).parent().find("div")[0]);
		div.slideToggle(div.height()*3);
	}
</script>
<!-- Piwik -->
<script type="text/javascript">
	var pkBaseURL = (("https:" == document.location.protocol) ? "https://piwik.dotter.me/"
			: "http://piwik.dotter.me/");
	document.write(unescape("%3Cscript src='" + pkBaseURL
			+ "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
	try {
		var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 1);
		piwikTracker.setDocumentTitle(retailerName + "/" + categoryName);
		piwikTracker.trackPageView();
		piwikTracker.enableLinkTracking();
	} catch (err) {
	}
</script>
<noscript>
	<p>
		<img src="http://piwik.dotter.me/piwik.php?idsite=1" style="border: 0"
			alt="" />
	</p>
</noscript>
<!-- End Piwik Tracking Code -->
</head>
<body id="multiple_product Page">
	<div id="popUpOutOfStockProductListDiv" class="basket_panel_con_popUP"
		style="display: none; font-family: Arial; font-size: 14px; line-height: 22px; z-index: 100000; position: absolute; width: 300px; list-style: none; text-shadow: none;">
		<ul id="popUpUl">

		</ul>
		<div style="width: 100%; text-align: center; margin-top: 10px;">
			<input class="input_btn02" style="width: 170px;" type="button"
				value="CLOSE" name="" />
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
				src="${pageContext.request.contextPath}/${brandModel['logoUrl']}"
				height="69" name="" border="0"> </a>
		</div>

		<div class="blowfish_content">
			<div class="openstore_retailer">
				<div class="sch_retailer_title">My selected retailer:</div>
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
									<li class="sch_retailer_active"><img
										src="${pageContext.request.contextPath}/images/logo_${fn:toLowerCase(retailer['name'])}01.png"
										height="17" name="" border="0"></li>
								</c:when>
								<c:otherwise>

									<li class="retailerLink"><a
										href="${pageContext.request.contextPath}/${brandModel['brandName']}/${retailer.name}/${defaultCategory}/product" >
											<img
											src="${pageContext.request.contextPath}/images/logo_${fn:toLowerCase(retailer['name'])}01.png"
											height="17" name="" border="0"  /> </a></li>

								</c:otherwise>
							</c:choose>

						</c:forEach>

					</ul>
				</div>
				<a
					href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/help"><div
						class="sch_retailer_help">
						<input class="input_btn02" style="height: 22px;" type="button"
							value="HELP" name="" />
					</div>
				</a>
			</div>
			<div class="clear"></div>
			<div class="openstore_show">
				<div class="sch_show_title">Show me:</div>
				<div class="sch_show_item">
					<ul>
						<!-- <li class="sch_show_active">Slow Cookers</li>
		                <li>Bag ‘N’ Season</li>
		                <li>Winter Warmers</li>
		                <li>Recipe Inspiration</li> -->

						<c:forEach items="${categoryList}" var="category1">
							<c:choose>
								<c:when test="${category1.name eq defaultCategory}">

									<li style="width: 166px;" class="sch_show_active" id="sch_show_active">${category1.name}</li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${category1.name}/product" class="categoryLink">
											${category1.name} </a></li>

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
								<td width="230px" style="padding-left: 15px;" align="left">PRODUCT</td>
								<td width="50px;" align="left">PRICE</td>
								<td align="left">QUANTITY</td>
							</tr>
						</table>
						<!-- 	                     <div class="sch_addpro_note"> -->
						<!-- 	                        Buy one, get one free on all Slow Cookers Recipe Mixes -->
						<!-- 	                     </div> -->
						<div class="sch_pro_add" style="margin-top: 14px;">


						<c:if test="${fn:length(productSet) > 0}"><!-- for specialk with sub-categories -->
							
							<c:forEach items="${productSet}" var="set" varStatus="status">
								<div  style="padding-top: 8px;">
								
								
							
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${status.index < 1}"> --%>
<!-- 									<ul class="sub_category_name" status="reduce" onClick="foldProducts(this);" style="height:30px;"> -->
<%-- 								<li>  <img	src="${pageContext.request.contextPath}/images/pc/kellogg/btn_reduce.png" height="16" name="" border="0"></li> --%>
<!-- 		2013年2月1日 去掉加粗  --line:312,322.						font-weight: bold; -->
<%-- 								<li style="padding-left: 5px; font-size: 13px;  color: #c52e30; ">${set.sortName}</li> --%>
								
<!-- 								</ul> -->
<!-- 										<div> -->
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
									<ul class="sub_category_name" status="add" onClick="foldProducts(this);" style="height:30px;">
								<li>  <img	src="${pageContext.request.contextPath}/images/pc/kellogg/btn_add.png" height="16" name="" border="0"></li>
								
								<li style="padding-left: 5px; font-size: 13px;  color: #c52e30; ">${set.sortName}</li>
								
								</ul>
										<div style="display: none;">
									
<%-- 									</c:otherwise> --%>
<%-- 								</c:choose> --%>
								<c:forEach items="${set.productList}" var="product">
									<c:choose>
										<c:when test="${fn:length(product.productName4Specialk)>30}">
											<ul style="height: 44px;"
												onmouseover='showProductImage("${pageContext.request.contextPath}/${product.imageUrl}");'
												onmouseout="showProductImage('','Y');">
												<li class="sch_pro_info"><a
													href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}"><img
														src="${pageContext.request.contextPath}/images/pc/kellogg/info_btn.png"
														height="14" name="" border="0"> </a>
												</li>
												<li class="sch_pro_title" title="${product.productName4Specialk}"
													style="max-height: 44px;"><a
													href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}">${product.productName4Specialk}</a>
												</li>
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
															<input type="hidden" value="${product.productName4Specialk}"
																class="productName">
															<input type="hidden" value="${product.offerId}"
																class="productOfferName">
															<td align="right" valign="top" style="cursor: pointer;"><img
																src="${pageContext.request.contextPath}/images/pc/kellogg/reduce_btn.png"
																alt="" name="" border="0" class="minus"
																onclick="changeSelectNum(this);">
															</td>
															<td align="center" valign="top"><input
																id="${product.productId}Quantity" class="sch_input_qty"
																name="ipt_quantity" value="0" type="text"
																readonly="readonly" />
															</td>
															<td align="left" valign="top" style="cursor: pointer;"><img
																src="${pageContext.request.contextPath}/images/pc/kellogg/add_btn.png"
																alt="" name="" border="0" class="add"
																onclick="changeSelectNum(this);">
															</td>
														</tr>
													</table></li>
											</ul>

											<c:if test="${fn:length(product.offerName) > 0}">
												<div class="clear"></div>
												<div id="offerTipDiv" class="del_bsk_block01">
													<ul>
														<li
															onmouseover='showProductImage("${pageContext.request.contextPath}/${product.imageUrl}");'
															onmouseout="showProductImage('','Y');"
															class="del_bsk_bg01" id="offerMsgLi">${product.offerName}</li>

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
														src="${pageContext.request.contextPath}/images/pc/kellogg//info_btn.png"
														height="14" name="" border="0"> </a>
												</li>
												<li class="sch_pro_title" title="${product.productName4Specialk}"><a
													href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}">${product.productName4Specialk}</a>
												</li>
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
															<input type="hidden" value="${product.productName4Specialk}"
																class="productName">
															<input type="hidden" value="${product.offerId}"
																class="productOfferName">
															<td align="right" valign="top" style="cursor: pointer;"><img
																src="${pageContext.request.contextPath}/images/pc/kellogg/reduce_btn.png"
																alt="" name="" border="0" class="minus"
																onclick="changeSelectNum(this);">
															</td>
															<td align="center" valign="top"><input
																id="${product.productId}Quantity" class="sch_input_qty"
																name="ipt_quantity" value="0" type="text"
																readonly="readonly" />
															</td>
															<td align="left" valign="top" style="cursor: pointer;"><img
																src="${pageContext.request.contextPath}/images/pc/kellogg/add_btn.png"
																alt="" name="" border="0" class="add"
																onclick="changeSelectNum(this);">
															</td>
														</tr>
													</table></li>
											</ul>

											<c:if test="${fn:length(product.offerName) > 0}">
												<div class="clear"></div>
												<div id="offerTipDiv" class="del_bsk_block00"  >
													<ul>
														<li
															onmouseover='showProductImage("${pageContext.request.contextPath}/${product.imageUrl}");'
															onmouseout="showProductImage('','Y');"
															class="del_bsk_bg01" id="offerMsgLi">${product.offerName}</li>

													</ul>
												</div>
											</c:if>
											<div class="clear"></div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
</div>
							</div>	
							</c:forEach>
							
							
							</c:if>


							<c:if test="${fn:length(productList) > 0}"> <!-- for specialk prodcuts without sub-categories -->
							
							
							
							

								<c:forEach items="${productList}" var="product">
									<c:choose>
										<c:when test="${fn:length(product.productName4Specialk)>30}">
											<ul style="height: 44px;"
												onmouseover='showProductImage("${pageContext.request.contextPath}/${product.imageUrl}");'
												onmouseout="showProductImage('','Y');">
												<li class="sch_pro_info"><a
													href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}"><img
														src="${pageContext.request.contextPath}/images/pc/kellogg/info_btn.png"
														height="14" name="" border="0"> </a>
												</li>
												<li class="sch_pro_title" title="${product.productName4Specialk}"
													style="max-height: 44px;"><a
													href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}">${product.productName4Specialk}</a>
												</li>
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
															<input type="hidden" value="${product.productName4Specialk}"
																class="productName">
															<input type="hidden" value="${product.offerId}"
																class="productOfferName">
															<td align="right" valign="top" style="cursor: pointer;"><img
																src="${pageContext.request.contextPath}/images/pc/kellogg/reduce_btn.png"
																alt="" name="" border="0" class="minus"
																onclick="changeSelectNum(this);">
															</td>
															<td align="center" valign="top"><input
																id="${product.productId}Quantity" class="sch_input_qty"
																name="ipt_quantity" value="0" type="text"
																readonly="readonly" />
															</td>
															<td align="left" valign="top" style="cursor: pointer;"><img
																src="${pageContext.request.contextPath}/images/pc/kellogg/add_btn.png"
																alt="" name="" border="0" class="add"
																onclick="changeSelectNum(this);">
															</td>
														</tr>
													</table></li>
											</ul>

											<c:if test="${fn:length(product.offerName) > 0}">
												<div class="clear"></div>
												<div id="offerTipDiv" class="del_bsk_block01" >
													<ul>
														<li
															onmouseover='showProductImage("${pageContext.request.contextPath}/${product.imageUrl}");'
															onmouseout="showProductImage('','Y');"
															class="del_bsk_bg01" id="offerMsgLi">${product.offerName}</li>

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
														src="${pageContext.request.contextPath}/images/pc/kellogg//info_btn.png"
														height="14" name="" border="0"> </a>
												</li>
												<li class="sch_pro_title" title="${product.productName4Specialk}"><a
													href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}">${product.productName4Specialk}</a>
												</li>
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
															<input type="hidden" value="${product.productName4Specialk}"
																class="productName">
															<input type="hidden" value="${product.offerId}"
																class="productOfferName">
															<td align="right" valign="top" style="cursor: pointer;"><img
																src="${pageContext.request.contextPath}/images/pc/kellogg/reduce_btn.png"
																alt="" name="" border="0" class="minus"
																onclick="changeSelectNum(this);">
															</td>
															<td align="center" valign="top"><input
																id="${product.productId}Quantity" class="sch_input_qty"
																name="ipt_quantity" value="0" type="text"
																readonly="readonly" />
															</td>
															<td align="left" valign="top" style="cursor: pointer;"><img
																src="${pageContext.request.contextPath}/images/pc/kellogg/add_btn.png"
																alt="" name="" border="0" class="add"
																onclick="changeSelectNum(this);">
															</td>
														</tr>
													</table></li>
											</ul>

											<c:if test="${fn:length(product.offerName) > 0}">
												<div class="clear"></div>
												<div id="offerTipDiv" class="del_bsk_block00">
													<ul>
														<li
															onmouseover='showProductImage("${pageContext.request.contextPath}/${product.imageUrl}");'
															onmouseout="showProductImage('','Y');"
															class="del_bsk_bg01" id="offerMsgLi">${product.offerName}</li>

													</ul>
												</div>
											</c:if>
											<div class="clear"></div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>

							<c:if test="${fn:length(productList) <= 0 && fn:length(productSet) <= 0}">
								<span class="sch_pro_text">Not currently stocked at your
									selected retailer</span>
							</c:if>


						</div>

					</div>
					<div class="sch_footer">
						<img
							src="${pageContext.request.contextPath}/images/logo_dotter.png"
							height="18" name="" border="0"> POWERED BY DOTTER IN
						ASSOCIATION WITH KELLOGG'S | <a style="color: #ffffff;"
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
									<td width="108px" colspan="2" align="left" valign="middle"
										style="max-height: 45px;">Kellogg's Special K Biscuit
										Moments</td>
									<td width="22px" align="right" valign="top"><img
										onmouseover="showTipInfo(this);" onMouseOut="hideTipInfo();"
										onclick="removeItemById(this);"
										src="${pageContext.request.contextPath}/images/pc/kellogg/icon_del.png"
										height="14" name="" border="0" /> <input type="hidden" /></td>
								</tr>
								<tr>
									<td width="80px" align="left">x2</td>
									<td width="10" align="left" style="cursor: pointer;">
										<%-- 										<img onmouseover="showOfferInfo(this);" onmouseout="hideOfferInfo(this);" src="${pageContext.request.contextPath}/images/pc/kellogg/info_btn2.png" height="14" name="" border="0"> --%>
									</td>
									<td width="20" align="right">£0.99</td>
								</tr>
							</table>
							<div
								style="height: 72px; margin-bottom: 10px; overflow-x: hidden; overflow-y: auto;"
								id="basketList"></div>
							<div
								style="border-top: 1px solid #c1232f; height: 1px; width: 136px; margin-bottom: 5px;"></div>
							<table width="136" border="0" cellspacing="0" cellpadding="0"
								onmouseover="showTotalMsgDiv(this)"
								onmouseout="hideTotalMsgDiv(this)">
								<tr id="savingsTr" height="16px;">
									<td width="84px" align="left" valign="middle"
										class="sch_bsk_title" style="display: none;">SAVINGS</td>
									<td width="42px" style="display: none;" align="right"
										id="savingsPrice">- £0.78</td>
								</tr>
								<tr>
									<td width="84px" align="left" valign="middle"
										class="sch_bsk_title">TOTAL</td>
									<td width="42px" align="right" id="totalPrice">£0.99</td>
								</tr>
							</table>
						</div>
						<div class="sch_login_block">
							<div style="font-size: 10px;">
								<span id="tipInfo">Add to your next online shop by
									entering the following details.</span>
							</div>
							<div class="sch_login_acc">
								<ul>
									<li><input class="sch_input_acc" name=""
										placeholder="${defaultRetailerUpperCase} username"
										id="userName" onChange="saveUserName('userName')" />
									</li>
									<li><input class="sch_input_acc" name="password"
										placeholder="${defaultRetailerUpperCase} password"
										type="password" id="password" />
									</li>
									<li style="font-size: 9px;"><label><input
											id="offerCheckBox" type="checkbox" /> Yes to Kellogg's
											exclusive offers</label></li>
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
								src="${pageContext.request.contextPath}/images/lodding_01.gif"
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
								src="${pageContext.request.contextPath}/images/lodding_01.gif"
								height="176" name="" border="0">
						</div>
						<div id="checkArea" class="basket_con2_text">
							CHECKING AVAILABILITY<br /> AT ${defaultRetailerUpperCase} IN
							YOUR AREA...
						</div>
					</div>

					<div class="basket_panel_con3" style="display: none;">
						<ul class="basket_con3_ula" style="margin-top: -20px;">
							<li class="basket_con3_li01">SORRY, THE FOLLOWING SNACKS ARE
								NOT AVAILABLE IN YOUR AREA</li>
						</ul>
						<ul class="basket_con3_uld" id="failureListMsg">
						</ul>


						<ul class="basket_con3_ula">
							<li class="basket_con3_li01">ALL OTHER SNACKS HAVE BEEN
								SUCCESSFULLY ADDED TO YOUR <span>${defaultRetailerUpperCase}</span>
								BASKET</li>
						</ul>
						<ul class="basket_con3_ulc">
							<li class="input_con02">GO BACK AND CHOOSE ANOTHER PRODUCT</li>
							<li class="input_con02" style="margin-top: 5px;">FINISH
								SHOPPING</li>
						</ul>
					</div>


					<div class="basket_panel_con4" style="display: none">
						<ul class="basket_con3_ula"
							style="margin-top: -15px; padding-bottom: 10px;">
							<li class="basket_con3_li01"
								style="font-family: Georgia, 'Times New Roman', Serif; font-weight: normal;">
								SORRY YOUR USERNAME AND PASSWORD COMBINATION IS NOT RECOGNISED
								BY ${defaultRetailerUpperCase}, PLEASE TRY AGAIN.</li>
						</ul>

						<ul style="width: 164px; margin: 0 auto;">
							<li>
								<div class="sch_login_acc">
									<ul>
										<li><input class="sch_input_acc" name=""
											placeholder="${defaultRetailerUpperCase} username"
											id="SecondUserName" onChange="saveUserName('SecondUserName')" />
										</li>
										<li><input class="sch_input_acc" name="password"
											placeholder="${defaultRetailerUpperCase} password"
											type="password" id="SecondPassword" />
										</li>

										<li style="margin-top: 3px;"><input class="input_btn02"
											type="button"
											value="ADD TO ${defaultRetailerUpperCase} BASKET" name=""
											onclick="login(1);" /></li>
									</ul>
								</div></li>
						</ul>
					</div>


					<div class="basket_panel_con5" style="display: none">
						<ul class="basket_con3_ula"
							style="margin-top: -15px; padding-bottom: 10px;">
							<li class="basket_con3_li01"
								style="font-family: Georgia, 'Times New Roman', Serif; font-weight: normal;">
								SORRY YOUR USERNAME AND PASSWORD COMBINATION IS NOT RECOGNISED
								BY ${defaultRetailerUpperCase}.</li>

							<li class="basket_con3_li02"
								style="font-size: 11px; margin-left: 3px;">Please visit the
								${defaultRetailer} website to retrieve your username and
								password:</li>
						</ul>

						<ul
							style="text-align: center; margin: 0 auto; margin-bottom: 5px;">
							<li style="cursor: pointer;">
								<%-- 									<a href="${pageContext.request.contextPath}/${basketUrl}"> --%>
								<img
								src="${pageContext.request.contextPath}/images/logo_${defaultRetailer}.png"
								width="144px;" border="0" onClick="goToRetailer(this)"
								class="${defaultRetailer}"> <!-- 						</a> --></li>
						</ul>
						<ul style="text-align: center;">
							<li><input class="input_btn02" style="width: 170px;"
								type="button" value="CONTINUE" name="" onClick="BackToLogin();" />
							</li>
						</ul>
					</div>

					<div class="basket_panel_con5" style="display: none" id="test">
						<ul class="basket_con3_ula" style="margin: 15px 40px 35px 40px;">
							<li class="basket_con3_li01"
								style="margin: 0 auto; text-align: center; font-family: Georgia, 'Times New Roman', Serif; font-weight: bold;">
								PLEASE INPUT A VALID USERNAME AND PASSWORD FOR YOUR CHOSEN
								RETAILER</li>
						</ul>

						<ul style="width: 164px; margin: 0 auto;">
							<li>
								<div class="sch_login_acc">
									<ul>
										<li style="margin-top: 3px;"><input class="input_btn02"
											type="button" value="CLOSE" name="" onClick="displayLogin();" />
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
			src="${pageContext.request.contextPath}/images/pc/kellogg/del_basket.png"></img>
	</div>
	<div id="offerTipDiv" style="display: none" class="del_bsk_block">
		<ul>
			<li class="del_bsk_bg01" id="offerMsgLi">Delete this product
				from basket</li>
			<li
				style="height: 7px; display: block; line-height: 0px; padding-left: 10px;"><img
				src="${pageContext.request.contextPath}/images/pc/kellogg/icon_tri.png"
				style="padding: 0; margin: 0px;" width="12px;" height="7px;">
			</li>
		</ul>
	</div>
	<div class="del_bsk_block02" style="display: none" id="TotalMsgTip">
		<ul>
			<li class="del_bsk_bg02">Based on offers and prices as of today.
				Prices may have changed when your order is confirmed and put
				together for delivery</li>
			<li
				style="height: 7px; display: block; line-height: 0px; text-align: center;"><img
				src="${pageContext.request.contextPath}/images/pc/kellogg/icon_tri.png"
				style="padding: 0; margin: 0px;" width="12px;" height="7px;">
			</li>
		</ul>
	</div>
	<div class="offer_bsk_block02" style="display: none;"
		id="mulitiple_product_offer">
		<ul>
			<li class="offer_bsk_bg02">Offer applied to Total<br /> Buy one,
				get one free on all Slow Cookers Recipe Mixes</li>
			<li
				style="height: 7px; display: block; line-height: 0px; text-align: center;"><img
				src="${pageContext.request.contextPath}/images/pc/kellogg/icon_tri.png"
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
		<li onClick="closeMsgDiv2();"
			style="padding: 10px 0px 20px 0px; text-align: center;"><input
			class="input_btn03" style="width: 120px; font-weight: normal;"
			type="button" value="Start shopping" name="" />
		</li>
	</div>
	<div id="cpt_confrim" style="display: none;" class="pup_panel_mail">
	
	<ul>
	<li>
	<img src="${pageContext.request.contextPath}/images/pc/kellogg/spk_pup01.png"
				width="480px">
	</li>
	<li class="spkpup_text01">
	As a thank you for visiting the Kellogg's Special K<br /> store, we’d like to send you a <span>50p off coupon</span><br />
to use next time you go shopping.
	
	</li>
	<li class="spkpup_text02">
	<table width="430" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="120" align="right">Email Address:</td>
    <td width="170" align="center"><input type="email" id="cpt_confrim_email"  class="sch_input_acc"/></td>
    <td width="30" valign="top" align="right"><input type="checkbox"/></td>
    <td width="130" class="spkpup_text03">Yes to Kellogg’s other<br /> exclusive offers</td>
  </tr>
</table>
</li>
</ul>
<ul style="padding-top:20px;">
											
<li style="float:left;padding-left:35px;"  id="cpt_confrim_noThanks">

<input class="spkpup_btn01" type="button" value="No thanks" name=""
											onclick="closeWindowForCpt('cpt_confrim');"/> </li>											
<li style="float:left;padding-left:35px;" id="cpt_confrim_receive">

<input class="spkpup_btn01" type="button" value="Send my coupon" name=""
										 onclick="checkCouponEmail();" /> </li>
	</ul>
		
	
		
	
	</div>
	
	<div id="cpt_loading" style="display: none;"  class="pup_panel_mail" >
	 <div class="spkpup_lodding">
							<img
								src="${pageContext.request.contextPath}/images/lodding_02.gif"
								height="176" name="" border="0">
						</div>
						<div  class="spkpup_con_text">
							Please wait...<br /> We are processing your request
						</div>  
						
						</div>
	
	
	
	
<div id="cpt_success" style="display: none;"  class="pup_panel_mail">
	<ul>
	<li>
	<img src="${pageContext.request.contextPath}/images/pc/kellogg/spk_pup02.png"
				width="480px">
	</li>
	<li  class="spkpup_text_02">
	Success!<br /> 
Your printable coupon is on its way to your inbox.<br /> 
Thank you
	</li>
	
	</ul>		
	<ul  style="padding-top:130px;">
	<li style="float:left;padding-left:90px;">

<input class="spkpup_btn02" type="button" value="BACK TO STORE" name="" onclick="closeMaskLayerWithCenterDiv('cpt_success');"
										 /> </li>
											
<li style="float:right;padding-right:90px;">

<input class="spkpup_btn02" type="button" value="CLOSE" name="" onclick="closeWindowForCpt('cpt_success');"
										/> </li>
	
	</ul>	 </div>
	
	
	
	
<div id="cpt_error_msg_1" style="display: none;" class="pup_panel_mail" >
<ul>
	<li>
	<img src="${pageContext.request.contextPath}/images/pc/kellogg/spk_pup03.png"
				width="480px">
	</li>
	<li  class="spkpup_text_03">

Sorry, a coupon has already been<br /> 
sent to this email address.
	</li>
	
	</ul>		
	<ul  style="padding-top:130px;">
	<li style="float:left;padding-left:90px;">

<input class="spkpup_btn02" type="button" value="BACK TO STORE" name="" onclick="closeMaskLayerWithCenterDiv('cpt_error_msg_1');"
										 /> </li>
											
<li style="float:right;padding-right:90px;">

<input class="spkpup_btn02" type="button" value="CLOSE" name="" onclick="closeWindowForCpt('cpt_error_msg_1');"
										/> </li>
	
	</ul>	
	  </div>
	
	
	
	
<div id="cpt_error_msg_2" style="display: none;"  class="pup_panel_mail" >
	<ul>
	<li>
	<img src="${pageContext.request.contextPath}/images/pc/kellogg/spk_pup02.png"
				width="480px">
	</li>
	<li  class="spkpup_text_03">
Sorry, your request cannot<br /> 

be processed at this time
	</li>
	
	</ul>		
	<ul  style="padding-top:130px;">
	<li style="float:left;padding-left:90px;">

<input class="spkpup_btn02" type="button" value="BACK TO STORE" name="" onclick="closeMaskLayerWithCenterDiv('cpt_error_msg_2');"
										 /> </li>
											
<li style="float:right;padding-right:90px;">

<input class="spkpup_btn02" type="button" value="CLOSE" name="" onclick="closeWindowForCpt('cpt_error_msg_2');"
										/> </li>
	
	</ul>	
	</div>
</body>
</html>