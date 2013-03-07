<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld"%>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld"%>
<!DOCTYPE html >
<html>
<head>
<title>Kellogg’s Special K Snack Store</title>
<meta name="description"
	content="Say ‘YES’ to Special K Biscuit Moments and other delicious   snacks using our Special K Snack Store." />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link
	href="${pageContext.request.contextPath}/css/pc/main_kellogg_fr.css"
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
<script
	src="${pageContext.request.contextPath}/js/pc/kellogg_fr/common.js"></script>
<script
	src="${pageContext.request.contextPath}/js/pc/kellogg_fr/basket_multiply.js"></script>
<script
	src="${pageContext.request.contextPath}/js/pc/kellogg_fr/basket_mpupa.1.0.js"></script>
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

				if (firstTime == 'true') {
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

			});

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
	_gaq.push(['b._setAccount', 'UA-35779257-6']);
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

	document.addEventListener("click", function() {
		closeMsgDiv2();
	});
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
		var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 4);
		piwikTracker.setDocumentTitle(retailerName + "/" + categoryName);
		piwikTracker.trackPageView();
		piwikTracker.enableLinkTracking();
	} catch (err) {
	}
</script>
<noscript>
	<p>
		<img src="http://piwik.dotter.me/piwik.php?idsite=4" style="border: 0"
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
				<div class="sch_retailer_title"><img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/cp01.png" height="13" name="" border="0"></div>
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

									<li><a
										href="${pageContext.request.contextPath}/${brandModel['brandName']}/${retailer.name}/${defaultCategory}/product">
											<img
											src="${pageContext.request.contextPath}/images/logo_${fn:toLowerCase(retailer['name'])}01.png"
											height="17" name="" border="0" /> </a></li>

								</c:otherwise>
							</c:choose>

						</c:forEach>

					</ul>
				</div>
				<a
					href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/help"><div
						class="sch_retailer_help">
						<input class="input_btn02" style="height: 22px;" type="button"
							value="AIDE" name="" />
					</div>
				</a>
			</div>
			<div class="clear"></div>
			<div class="openstore_show">
				<div class="sch_show_title"><img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/cp02.png" height="10" name="" border="0"></div>
				<div class="sch_show_item">
					<ul>
						<!-- <li class="sch_show_active">Slow Cookers</li>
		                <li>Bag ‘N’ Season</li>
		                <li>Winter Warmers</li>
		                <li>Recipe Inspiration</li> -->

						<c:forEach items="${categoryList}" var="category1">
							<c:choose>
								<c:when test="${category1.name eq defaultCategory}">

									<li style="width: 128px;" class="sch_show_active">${category1.name}</li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${category1.name}/product">
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
								<td width="230px" style="padding-left: 15px;" align="left">PRODUITS</td>
								<td width="50px;" align="left">PRIX</td>
								<td align="left" >QUANTITÉ</td>
							</tr>
						</table>
						<!-- 	                     <div class="sch_addpro_note"> -->
						<!-- 	                        Buy one, get one free on all Slow Cookers Recipe Mixes -->
						<!-- 	                     </div> -->
						<div class="sch_pro_add">



							<c:if test="${fn:length(productList) > 0}">

								<c:forEach items="${productList}" var="product">
									<c:choose>
										<c:when test="${fn:length(product.productName)>36}">
											<ul style="height: 44px;"
												onmouseover='showProductImage("${pageContext.request.contextPath}/${product.imageUrl}");'
												onmouseout="showProductImage('','Y');">
												<li class="sch_pro_info"><a
													href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}"><img
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/info_btn.png"
														height="14" name="" border="0"> </a>
												</li>
												<li class="sch_pro_title" title="${product.productName}"
													style="max-height: 44px;"><a
													href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}">${product.productName}</a>
												</li>
												<li class="sch_pro_price">€${product.nowPrice}</li>
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
															<input type="hidden" value="${product.productName}"
																class="productName">
															<input type="hidden" value="${product.offerId}"
																class="productOfferName">
															<td align="right" valign="top" style="cursor: pointer;"><img
																src="${pageContext.request.contextPath}/images/pc/kellogg_fr/reduce_btn.png"
																alt="" name="" border="0" class="minus"
																onclick="changeSelectNum(this);">
															</td>
															<td align="center" valign="top"><input
																id="${product.productId}Quantity" class="sch_input_qty"
																name="ipt_quantity" value="0" type="text"
																readonly="readonly" />
															</td>
															<td align="left" valign="top" style="cursor: pointer;"><img
																src="${pageContext.request.contextPath}/images/pc/kellogg_fr/add_btn.png"
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
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr//info_btn.png"
														height="14" name="" border="0"> </a>
												</li>
												<li class="sch_pro_title" title="${product.productName}"><a
													href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}">${product.productName}</a>
												</li>
												<li class="sch_pro_price">€${product.nowPrice}</li>
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
															<input type="hidden" value="${product.productName}"
																class="productName">
															<input type="hidden" value="${product.offerId}"
																class="productOfferName">
															<td align="right" valign="top" style="cursor: pointer;"><img
																src="${pageContext.request.contextPath}/images/pc/kellogg_fr/reduce_btn.png"
																alt="" name="" border="0" class="minus"
																onclick="changeSelectNum(this);">
															</td>
															<td align="center" valign="top"><input
																id="${product.productId}Quantity" class="sch_input_qty"
																name="ipt_quantity" value="0" type="text"
																readonly="readonly" />
															</td>
															<td align="left" valign="top" style="cursor: pointer;"><img
																src="${pageContext.request.contextPath}/images/pc/kellogg_fr/add_btn.png"
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
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>

							<c:if test="${fn:length(productList) <= 0}">
								<span class="sch_pro_text">Not currently stocked at your
									selected retailer</span>
							</c:if>


						</div>

					</div>
					<div class="sch_footer">
						<img
							src="${pageContext.request.contextPath}/images/logo_dotter.png"
							height="18" name="" border="0"> EFFECTUÉ PAR DOTTER EN ASSOCIATION AVEC KELLOGG’S - <a style="color: #ffffff;"
							href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span>TERMES
								</span> </a>
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
							<div class="sch_bsk_title">PRODUITS SÉLECTIONNÉ</div>
							<br />
							<table width="90%" border="0" cellspacing="0" cellpadding="0"
								style="margin-bottom: 40px; display: none;" id="exampleData">

								<tr valign="bottom">
									<td width="108px" colspan="2" align="left" valign="middle">Kellogg's
										Special K Biscuit Moments</td>
									<td width="22px" align="right" valign="top"><img
										onmouseover="showTipInfo(this);" onmouseout="hideTipInfo();"
										onclick="removeItemById(this);"
										src="${pageContext.request.contextPath}/images/pc/kellogg_fr/icon_del.png"
										height="14" name="" border="0" /> <input type="hidden" /></td>
								</tr>
								<tr>
									<td width="80px" align="left">x2</td>
									<td width="10" align="left" style="cursor: pointer;">
									</td>
									<td width="20" align="right">€0.99</td>
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
								<tr id="savingsTr" height="14px;">
									<td width="84px" align="left" valign="middle"
										class="sch_bsk_title"
										style="font-family: Helvetica; display: none;">SAVINGS</td>
									<td width="42px" style="display: none;" align="right"
										id="savingsPrice">- €0.78</td>
								</tr>
								<tr>
									<td width="84px" align="left" valign="middle"
										class="sch_bsk_title" style="font-family: Helvetica;">TOTAL</td>
									<td width="42px" align="right" id="totalPrice">€0.99</td>
								</tr>
							</table>
						</div>
						<div class="sch_login_block">
							<div >
								<span id="tipInfo" style="line-height: 11px;">Veuillez entrer les détails ci-dessous pour ajouter à vos prochaines courses </span>
							</div>
							<div class="sch_login_acc">
								<ul>
									<li><input class="sch_input_acc" name=""
										placeholder="${defaultRetailerUpperCase} Identifiant"
										id="userName" onchange="saveUserName('userName')" />
									</li>
									<li><input class="sch_input_acc" name="password"
										placeholder="${defaultRetailerUpperCase} Mot de passe"
										type="password" id="password" />
									</li>
									<li style="font-size: 9px;"><label>
									
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
  									<tr>
   									 <td width="12%"><input
											id="offerCheckBox" type="checkbox" /></td>
  									  <td width="88%"> Oui, je souhaite recevoir des 
									offres exclusives de Kellogg’s</td>
  									</tr>
									</table>
									
									</label></li>
									<li><input class="input_btn02" type="button"
										value="AJOUTER AU PANIER" name=""
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
						
						AJOUTANT LES PRODUITS DANS <br />
						VOTRE PANIER ${defaultRetailerUpperCase}
					
						</div>
					</div>
					<div class="basket_panel_con2" style="display: none;">
						<div class="basket_con2_lodding">
							<img
								src="${pageContext.request.contextPath}/images/lodding_01.gif"
								height="176" name="" border="0">
						</div>
						<div id="checkArea" class="basket_con2_text">
						
					VÉRIFICATION DE LA DISPONIBILITÉ <br />						
					 DES PRODUITS AVEC ${defaultRetailerUpperCase}
					 
					</div>
					</div>

					<div class="basket_panel_con3" style="display: none;">
						<ul class="basket_con3_ula" style="margin-top: -20px;">
							<li class="basket_con3_li01">
							Nous sommes désolés, les produits suivants ne sont pas disponibles dans votre région
</li>
						</ul>
						<ul class="basket_con3_uld" id="failureListMsg">
						</ul>


						<ul class="basket_con3_ula">
							<li class="basket_con3_li01">Tous les autres produits ont été ajoutés à votre panier avec<span>${defaultRetailerUpperCase}</span>
								</li>
						</ul>
						<ul class="basket_con3_ulc">
							<li class="input_con02">RETOURNER ET CHOISIR UN AUTRE PRODUIT</li>
							<li class="input_con02" style="margin-top: 5px;">TERMINER L’ACHAT</li>
						</ul>
					</div>


					<div class="basket_panel_con4" style="display: none">
						<ul class="basket_con3_ula"
							style="margin-top: -15px; padding-bottom: 10px;">
							<li class="basket_con3_li01"
								style="font-family: Georgia, 'Times New Roman', Serif; font-weight: normal;">
								
								Nous sommes désolés, la combinaison de votre identifiant et mot de passe n’est pas reconnu par ${defaultRetailerUpperCase}, veuillez réessayer.
							
							</li>
						</ul>

						<ul style="width: 164px; margin: 0 auto;">
							<li>
								<div class="sch_login_acc">
									<ul>
										<li><input class="sch_input_acc" name=""
											placeholder="${defaultRetailerUpperCase} Identifiant"
											id="SecondUserName" onchange="saveUserName('SecondUserName')" />
										</li>
										<li><input class="sch_input_acc" name="password"
											placeholder="${defaultRetailerUpperCase} Mot de passe"
											type="password" id="SecondPassword" />
										</li>

										<li style="margin-top: 3px;"><input class="input_btn02"
											type="button"
											value="AJOUTER AU PANIER" name=""
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
								Nous sommes désolés, la combinaison de votre identifiant et mot de passe n’est pas reconnu par ${defaultRetailerUpperCase}</li>

							<li class="basket_con3_li02"
								style="font-size: 11px; margin-left: 3px;">
								Veuillez consulter le site de ${defaultRetailer} pour récupérer votre identifiant et mot de passe
			</li>
						</ul>

						<ul
							style="text-align: center; margin: 0 auto; margin-bottom: 5px;">
							<li style="cursor: pointer;">
								<%-- 									<a href="${pageContext.request.contextPath}/${basketUrl}"> --%>
								<img
								src="${pageContext.request.contextPath}/images/logo_${defaultRetailer}.png"
								width="144px;" border="0" onclick="goToRetailer(this)"
								class="${defaultRetailer}"> <!-- 						</a> --></li>
						</ul>
						<ul style="text-align: center;">
							<li><input class="input_btn02" style="width: 170px;"
								type="button" value="CONTINUER" name="" onclick="BackToLogin();" />
							</li>
						</ul>
					</div>

					<div class="basket_panel_con5" style="display: none" id="test">
						<ul class="basket_con3_ula" style="margin: 15px 40px 35px 40px;">
							<li class="basket_con3_li01"
								style="margin: 0 auto; text-align: center; font-family: Georgia, 'Times New Roman', Serif; font-weight: bold;">
								Veuillez entrer un identifiant et mot de passe valide pour votre magasin préféré</li>
						</ul>

						<ul style="width: 164px; margin: 0 auto;">
							<li>
								<div class="sch_login_acc">
									<ul>
										<li style="margin-top: 3px;"><input class="input_btn02"
											type="button" value="FERMER" name="" onclick="displayLogin();" />
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
			src="${pageContext.request.contextPath}/images/pc/kellogg_fr/del_basket.png"></img>
	</div>
	<div id="offerTipDiv" style="display: none" class="del_bsk_block">
		<ul>
			<li class="del_bsk_bg01" id="offerMsgLi">Delete this product
				from basket</li>
			<li
				style="height: 7px; display: block; line-height: 0px; padding-left: 10px;"><img
				src="${pageContext.request.contextPath}/images/pc/kellogg_fr/icon_tri.png"
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
				src="${pageContext.request.contextPath}/images/pc/kellogg_fr/icon_tri.png"
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
			style="padding: 10px 0px 20px 0px; text-align: center;"><input
			class="input_btn03" style="width: 120px; font-weight: normal;"
			type="button" value="Start shopping" name="" />
		</li>
	</div>

</body>
</html>