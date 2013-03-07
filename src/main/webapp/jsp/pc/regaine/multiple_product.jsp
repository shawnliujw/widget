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
<script type="text/javascript">
	var brandName = "${brandModel['brandName']}";
	var retailerName = "${defaultRetailer}";
	//window.remoteStorage;
	//remoteStorage.test();
	$(document).ready(function() {
		refreshProductQuantity();
		$("#sliderBox").niceScroll({
			cursorcolor : "#59608a",
			autohidemode : false,
			backgroundborderdisable:true
		});
		$(".store_pro04").each(function(index,item){
			$(item).html($(item).text());
		});

	});
	
	function gaHelp(){
		_gaq.push(['_trackevent', 'help', 'click', 'help' , , 'true']);
		_gaq.push(['b._trackevent', 'help', 'click', 'help' , , 'true']);
	}
	//go to basket page
	function goToBasket(){
		var basketName = retailerName + brandName + "Basket";
		var basket = new BasketObject();
		basket.setSaveName(basketName);
		var current = getBasketListForLocal(basketName, true);
		var blankUserName=retailerName=="Pharmacy"?"Pharmacy2U":retailerName;
		_gaq.push(['_trackevent', 'selection', 'click', blankUserName.toLowerCase() , , 'true']);
		_gaq.push(['_trackevent', 'selection', 'click', blankUserName.toLowerCase() , , 'true']);

		
		// prepare the dataArray to add to basket.
		var tmpData = new Array();
		for ( var v = 0; v < current.length; v++) {
			var obj = {
				'productUrl' : '',
				'quantity' : ''
			};
			obj.productUrl = current[v].productUrl;
			obj.quantity = current[v].quantity;

			tmpData.push(obj);
		}
		if(!isNotEmpty(tmpData)){
			$(".errors_con").hide();
			showMaskLayerWithCenterDiv("errors_con_emptyBasket");
			return;
		}
		var url=path +"/"+brandName+"/"+retailerName+"/basket";
		remoteStorage.save(url);
	}
	
	function goToAmazonSSBasket(obj) {
		//alert($(obj).parent().html());
		//alert(obj.parentNode.tagName);
		var productId = $(obj).parent().parent().find("input.productId").val();
		var productUrl = $(obj).parent().parent().find("input.productUrl").val();
		var productPrice = $(obj).parent().parent().find("input.productPrice").val();
		var productName = $(obj).parent().parent().find("input.productName").val();
		var offerName = $(obj).parent().parent().find("input.productOfferName").val();
		
		var ve="foam";
		if(productUrl.indexOf("B004QIWUFK")!=-1){
			ve="solution";
		}
		_gaq.push(['_trackevent', 'subscribe', 'click', ve , , 'true']);
		_gaq.push(['b._trackevent', 'subscribe', 'click', ve , , 'true']);

		
		var item = {
				"productId":productId,
				"productUrl":productUrl,
				"price":productPrice,
				"name":productName,
				"offerName":offerName
		}
		saveModel("regaineamazonssbasket",item);
		
		$(obj).parents("form").submit();
		//obj.parentNode.submit();
	}
</script>
<script type="text/javascript">
	$(document).ready(function(){
	});

	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
	  _gaq.push(['_trackPageview', 'Multiple Product']);
	  
	  _gaq.push(['b._setAccount', 'UA-35779257-7']);
	  _gaq.push(['b._trackPageview', 'Multiple Product']);
	  
	  

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
piwikTracker.setDocumentTitle('Multiple Product');
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=6" style="border:0" alt="" /></p></noscript>
</head>
<body id="multiple_product Page">
	<div class="store_page">
		<div class="store_header">
			<div class="header_left">
				<div class="header_item">
					<span><a href="${pageContext.request.contextPath}/${brandModel['brandName']};jsessionid=${pageContext.session.id}"><font color="#252c4c">RETAILER SELECTION</font></a> &nbsp;> &nbsp;<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/product;jsessionid=${pageContext.session.id}"><font color="#252c4c">PRODUCT SELECTION</font></a> </span>
					&nbsp;> &nbsp;ADD TO BASKET
				</div>
				<div class="header_about">
					<ul>
						<li class="header_lia"><a
							href="${pageContext.request.contextPath}/${brandModel['brandName']};jsessionid=${pageContext.session.id}">
								<img
								src="${pageContext.request.contextPath}/images/pc/regaine/back.png"
								border="0"> </a></li>
						<li class="header_lib">Available at your chosen retailer</li>
						<li class="header_lic"><img
							src="${pageContext.request.contextPath}/images/pc/regaine/logo_${fn:toLowerCase(defaultRetailer)}02.png"
							height="40" border="0">
						</li>
					</ul>

				</div>
			</div>
			<div class="header_right">
				<ul>
					<li style="margin-bottom: 16px;"><a onclick="gaHelp();" href="${pageContext.request.contextPath}/jsp/pc/regaine/help.jsp;jsessionid=${pageContext.session.id}">
					<div class="store_btn">HELP</div></a>
					</li>
					<li><a href="${pageContext.request.contextPath}/jsp/pc/regaine/terms.jsp;jsessionid=${pageContext.session.id}"><div class="store_btn">SITE TERMS</div></a>
					</li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>

		<div class="store_content">
			<div class="store_box_top"></div>
			<div id="sliderBox" class="store_allproduct">
				<div class="store_box">

		<input type="hidden" value="${selectedBrandId}"
			id="defaultBrandId">
		<input type="hidden" value="${selectedClientId}"
			id="defaultClientId">
		<input type="hidden" value="${selectedRetailerId}"
			id="defaultRetailerId">


					<c:if test="${products['Foam'] != null}">
						<div class="store_box_title">
							REGAINE<span style="vertical-align:super; font-size:11px;">&reg;</span> Foam is the first and only <span> scientifically
								proven</span> foam hair loss treatment to help <span>stop</span> and
							even <span>reverse hereditary hair loss</span>
						</div>
						<c:forEach items="${products['Foam']}" var="product">
							<div class="store_box_cp">

								<table width="560" border="0" cellspacing="0" cellpadding="0"
									style="padding-top: 12px;">
									<tr>
										<td width="90"  class="store_box_img"><img
											src="${pageContext.request.contextPath}/${product.imageUrl}"
											height="100" border="0" >
										</td>
										<td width="470">
											<div>
												<ul>
													<li>
														<table width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tr>
																<td width="78%"><span class="store_pro01">${product.productBreakdown2} ${product.productBreakdown1}</span><br />
																	<c:choose>
																		<c:when test="${product.offerName != null}">
																			<span class="store_pro02"> £${product.nowPrice}. ${product.offerName}
																			</span>
																			<c:if test="${!((fn:contains(product.productName,'Subscribe') ||fn:contains(product.productBreakdown2,'Subscribe')))}">
																			  <c:if test="${fn:toLowerCase(defaultRetailer) != \"sainsbury's\"}">
																				<span class="store_pro03">(RRP £${product.wasPrice})</span>
																				</c:if>
																			</c:if>
																		</c:when>
																		<c:otherwise>
																			<span  class="store_pro02">£${product.nowPrice}</span>
																		</c:otherwise>
																	</c:choose></td>
																<td width="22%">

																	<div class="sch_pro_qty">
																	<form action='${pageContext.request.contextPath}/${brandModel["brandName"]}/${defaultRetailer}/basket' method="post" >
																		<table width="100%" height="24px;" border="0"
																			cellspacing="0" cellpadding="0">
																			<tr>
																				<input type="hidden" value="${product.productId}"
																					class="productId" id="${product.productId}">
																				<input type="hidden" value="${product.productUrl}"
																					class="productUrl">
																				<input type="hidden" value="${product.nowPrice}"
																					class="productPrice">
																				<input type="hidden" value="${product.productBreakdown2} ${product.productBreakdown1}"
																					class="productName">
																				<input type="hidden" value="${product.offerId}"
																					class="productOfferName">
																					
																					
																				<c:choose>
																					<c:when test="${fn:toLowerCase(defaultRetailer) == 'amazon' && (fn:contains(product.productName,'Subscribe') || fn:contains(product.productBreakdown2,'Subscribe'))}">
																							<input type="hidden" name="basketType" value="${defaultRetailer}"/>
																							<img onClick="goToAmazonSSBasket(this);" width="62" height="22" src="${pageContext.request.contextPath}/images/pc/regaine/amazon_sub.png"></img>
																					</c:when>
																					<c:otherwise>
																						
																						<td align="right" valign="top"
																							style="cursor: pointer;" class="minus" onclick="changeSelectNum(this);"><img
																							src="${pageContext.request.contextPath}/images/pc/regaine/reduce_btn.png"
																							alt="" name="" border="0" >
																						</td>
																						<td align="center" valign="top"><input
																							id="${product.productId}Quantity"
																							class="sch_input_qty" name="ipt_quantity" value="0"
																							type="text" readonly="readonly" />
																						</td>
																						<td align="left" valign="top"
																							style="cursor: pointer;" class="add" onclick="changeSelectNum(this);"><img
																							src="${pageContext.request.contextPath}/images/pc/regaine/add_btn.png"
																							alt="" name="" border="0" >
																						</td>
																					</c:otherwise>
																				</c:choose>	
																			</tr>
																		</table>
																		</form>
																	</div></td>
															</tr>
														</table></li>
													<li class="store_pro04">${product.description}</li>
												</ul>
											</div></td>
									</tr>
								</table>
							</div>
						</c:forEach>
					</c:if>


					<c:if test="${products['Solution'] != null}">
						<div class="store_box_title2">
							ALSO AVAILABLE IN THE REGAINE<span style="vertical-align:super; font-size:11px;">&reg;</span> RANGE
						</div>
						<c:forEach items="${products['Solution']}" var="product">
							<div class="store_box_cp">

								<table width="560" border="0" cellspacing="0" cellpadding="0"
									style="padding-top: 10px;">
									<tr>
										<td width="90"  class="store_box_img"><img
											src="${pageContext.request.contextPath}/${product.imageUrl}"
											height="100" border="0" >
										</td>
										<td width="470">
											<div>
												<ul>
													<li>
														<table width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tr>
																<td width="78%">
																
																
																<span class="store_pro01">${product.productBreakdown2} ${product.productBreakdown1}</span><br />
																	<c:choose>
																		<c:when test="${product.offerName != null}">
																			<span class="store_pro02"> £${product.nowPrice}. ${product.offerName}
																			</span>
																			<c:if test="${!((fn:contains(product.productName,'Subscribe') ||fn:contains(product.productBreakdown2,'Subscribe')))}">
																				<c:if test="${fn:toLowerCase(defaultRetailer) != \"sainsbury's\"}">
																				<span class="store_pro03">(RRP £${product.wasPrice})</span>
																				</c:if>
																			</c:if>
																		</c:when>
																		<c:otherwise>
																			<span class="store_pro02">£${product.nowPrice}</span>
																		</c:otherwise>
																	</c:choose></td>
																<td width="22%">

																	<div class="sch_pro_qty">
																							<form action='${pageContext.request.contextPath}/${brandModel["brandName"]}/${defaultRetailer}/basket' method="post" >
																		<table width="100%" height="24px;" border="0"
																			cellspacing="0" cellpadding="0">
																			<tr>
																				<input type="hidden" value="${product.productId}"
																					class="productId" id="${product.productId}"/>
																				<input type="hidden" value="${product.productUrl}"
																					class="productUrl"/>
																				<input type="hidden" value="${product.nowPrice}"
																					class="productPrice"/>
																				<input type="hidden" value="${product.productBreakdown2} ${product.productBreakdown1}"
																					class="productName"/>
																				<input type="hidden" value="${product.offerId}"
																					class="productOfferName"/>
																					
																					
																					<c:choose>
																					<c:when test="${fn:toLowerCase(defaultRetailer) == 'amazon' && (fn:contains(product.productName,'Subscribe') || fn:contains(product.productBreakdown2,'Subscribe'))}">
																								<input type="hidden" name="basketType" value="${defaultRetailer}"/>
																							<img onClick="goToAmazonSSBasket(this);" width="62" height="23" src="${pageContext.request.contextPath}/images/pc/regaine/amazon_sub.png"></img>
																					</c:when>
																					<c:otherwise>
																						
																							<td align="right" valign="top"
																						style="cursor: pointer;" class="minus" onclick="changeSelectNum(this);"><img
																						src="${pageContext.request.contextPath}/images/pc/regaine/reduce_btn.png"
																						alt="" name="" border="0" >
																					</td>
																					<td align="center" valign="top"><input
																						id="${product.productId}Quantity"
																						class="sch_input_qty" name="ipt_quantity" value="0"
																						type="text" readonly="readonly" />
																					</td>
																					<td align="left" valign="top"
																						style="cursor: pointer;" class="add" onclick="changeSelectNum(this);"><img
																						src="${pageContext.request.contextPath}/images/pc/regaine/add_btn.png"
																						alt="" name="" border="0" >
																					</td>
																					</c:otherwise>
																				</c:choose>
																				
																			</tr>
																		</table>
																							</form>
																	</div></td>
															</tr>
														</table></li>
													<li class="store_pro04">${product.description}</li>
												</ul>
											</div></td>
									</tr>
								</table>
							</div>
						</c:forEach>
					</c:if>





				</div>
			</div>
			<c:if test="${fn:toLowerCase(defaultRetailer) == 'pharmacy' || fn:toLowerCase(defaultRetailer) == 'amazon'  || fn:toLowerCase(defaultRetailer) == 'boots' }">
				<div class="store_box_down"></div>
			</c:if>
		</div>

		<div class="store_tobasket">
		
		<div  class="store_botton">
		<ul>
		<c:if test="${fn:toLowerCase(defaultRetailer) == 'pharmacy'}">
		<li onClick="goToBasket();" style="cursor: pointer;">
		ADD TO ${fn:toUpperCase(defaultRetailer)}2U BASKET
		<img src="${pageContext.request.contextPath}/images/pc/regaine/icon_arrow.png"   border="0"   >
		</li>
		</c:if>
		<c:if test="${fn:toLowerCase(defaultRetailer) != 'pharmacy'}">
		<li onClick="goToBasket();" style="cursor: pointer;">
		ADD TO ${fn:toUpperCase(defaultRetailer)} BASKET
		<img src="${pageContext.request.contextPath}/images/pc/regaine/icon_arrow.png"   border="0"   >
		</li>
		</c:if>
		
		
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
	<div class="errors_con" id="errors_con_emptyBasket" style="display: none;">
			<br />
			<br />
			<br />
			<br />
			<ul>
				<li style="font-size: 15px; color: #ffffff;">YOUR BASKET IS
					EMPTY. PLEASE GO<br /> BACK AND SELECT SOME PRODUCTS</li>
				<br />
				<li><div class="store_btn"
						style="width: 220px; margin: 0 auto;" onClick="BackToLogin();">BACK</div>
				</li>
			</ul>
		</div>
</body>
</html>