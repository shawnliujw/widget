<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld"%>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld"%>
<!DOCTYPE html >
<html> 
<head> 
            <title>Kellogg’s Special K Snack Store</title> 
<meta name=description" content=Say ‘YES’ to Special K Biscuit Moments and other delicious   snacks using our Special K Snack Store."/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/pc/main_kellogg_fr.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/jquery/scroll/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/scroll/jquery.mousewheel.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/scroll/jquery.mCustomScrollbar.js"></script>

<script src="${pageContext.request.contextPath}/js/pc/kellogg_fr/common.js"></script>
<script src="${pageContext.request.contextPath}/js/pc/kellogg_fr/single_product_1.js"></script>
<script src="${pageContext.request.contextPath}/js/pc/kellogg_fr/basket_mpupa.1.0.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/cufon.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/Caecilia_LT_Std-Roman_italic_400.font.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/defineCufon.js"></script>
<script>
	$(document).ready(function() {
		//display the userName and password what user input.
		if(isNotEmpty(localStorage.getItem("specialK_"+retailerName+"_userName"))){
			$("#userName").val(localStorage.getItem("specialK_"+retailerName+"_userName"));
		}
// 		if(isNotEmpty(localStorage.getItem("specialK_"+retailerName+"_password"))){
// 			$("#password").val(localStorage.getItem("specialK_"+retailerName+"_password"));
// 			$("#password").focus();
// 		}
		
		$("#price").text($("#defaultRetailerPrice").val());
		$(".bashe_pro_text").mCustomScrollbar({
			autoDraggerLength:true,
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
			$("#nutritionDiv").mCustomScrollbar({
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
	  _gaq.push(['_trackPageview',retailerName+"/"+categoryName+"/product/"+productId]);
	  _gaq.push(['b._setAccount', 'UA-35779257-6']);
	  _gaq.push(['b._trackPageview',retailerName+"/"+categoryName+"/product/"+productId]);
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	  
</script>
<!-- Piwik  -->
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://piwik.dotter.me/" : "http://piwik.dotter.me/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php",4);
piwikTracker.setDocumentTitle(retailerName+"/"+categoryName+"/"+'${product.productName}');
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=4" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->
</head>
<body id="single_product Page">
	<div id="popUpOutOfStockProductListDiv" class="basket_panel_con_popUP" style="display:none; font-family:Arial; font-size:14px; line-height:22px; z-index:100000;position: absolute;width: 300px;list-style: none; text-shadow: none;">
			<ul id="popUpUl">
			
			</ul>
			<div style="width:100%; text-align: center; margin-top: 10px;">
			 <input class="input_btn02" style="width:170px;" type="button" value="CLOSE" name="" />
			</div>
	</div>


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
	<div id="BlowFishHomePage" class="blowfish_page">

		<div class="blowfish_header">
			
				<a href="${pageContext.request.contextPath}/${brandModel['brandName']}">
					<img src="${pageContext.request.contextPath}/${brandModel['logoUrl']}"
					height="69" name="" border="0">
			
			</a>
		</div>

		<div class="blowfish_content">
			<div class="openstore_retailer">
				<div class="sch_retailer_title"><img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/cp01.png" height="13" name="" border="0"></div>
				<div class="sch_retailer_logo">
					<ul>
						<c:forEach items="${retailerList}" var="retailer">

							<c:choose>
								<c:when test="${retailer.name eq defaultRetailer}">
									<li class="sch_retailer_active"><img
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
					<input class="input_btn02" style="height:22px;" type="button" value="AIDE" name="" />
				</div></a>
			</div>
			<div class="clear"></div>
			<div class="openstore_show">
				<div class="sch_show_title"><img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/cp02.png" height="10" name="" border="0"></div>
				<div class="sch_show_item">
					<ul>
						<c:forEach items="${categoryList}" var="category1">
							<c:choose>
								<c:when test="${category1.name eq defaultCategory}">

									<li style="width: 128px;" class="sch_show_active">${category1.name}</li>

								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${category1.name}/product">
											${category1.name} </a>
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
								<li class="detail_active" aimDiv='ourPrice' onclick="changeInfoShow(this);" >INFORMATIONS
								<li>
								<li class="detail_kong">&nbsp;
								<li>
								<li class="detail_normal" aimDiv='ingredients'  onclick="changeInfoShow(this);">INGRÉDIENTS
								<li>
								<li class="detail_kong">&nbsp;
								<li>
								<li class="detail_normal"  aimDiv='nutrition' onclick="changeInfoShow(this);"><div style="line-height:11px; padding-top: 3px; "> INFORMATION  NUTRITIONNELLES</div> 						
								<li>
								<li class="detail_kong">&nbsp;
								<li>
								<li class="detail_normal"  aimDiv='gda' onclick="changeInfoShow(this);">RNJ
								<li>
							</ul>
						</div>
                         <div class="clear"></div>
						<div class="bashe_pro_main">

						<a style="color:#bf314f;cursor:pointer;"
									href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/">
							<div class="bashe_pro_all">
								<span>RETOUR AU PRODUITS</span>
							</div></a>


							<div id="ourPrice" >
								<div class="bashe_pro_sh">
									<c:choose>
											<c:when test="${fn:length(product.productName)>36}">
												<ul class="bashe_pro_shul01" style="height: 48px;">
										<li class="bashe_pro_shli01" title="${product.productName}" style="max-height: 44px;">
											${product.productName}</li>
										<li class="bashe_pro_shli02">
											€${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/add_btn.png"
														alt="" name="" border="0"></th>
												</tr>
											</table>
										</li>
									</ul>
											</c:when>
											<c:otherwise>
												<ul class="bashe_pro_shul01" style="heigh:22px;">
										<li class="bashe_pro_shli01" title="${product.productName}" style="overflow:hidden;max-height:20px;" >
											${product.productName}</li>
										<li class="bashe_pro_shli02">
											€${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/add_btn.png"
														alt="" name="" border="0"></th>
												</tr>
											</table>
										</li>
									</ul>
											</c:otherwise>	
									</c:choose>
									<c:if test="${fn:length(product.offerName) > 0}">
									
									<ul class="bashe_pro_shul02">
										<li>${product.offerName}</li>
									</ul>
									</c:if>
									
								</div>
								<div class="clear"></div>
								<div class="bashe_pro_text" style="overflow:hidden;">
									${product.description} <br /> <br />
									${product.usage}
									
								</div>
                              
							</div>
							
							
						<div id="ingredients" style="display: none;">
						    <div class="bashe_pro_sh">
						    		<c:choose>
											<c:when test="${fn:length(product.productName)>36}">
												<ul class="bashe_pro_shul01" style="height: 48px;">
										<li class="bashe_pro_shli01" title="${product.productName}" style="max-height: 44px;">
											${product.productName}</li>
										<li class="bashe_pro_shli02">
											€${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="ingredients_cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/add_btn.png"
														alt="" name="" border="0"></th>
												</tr>
											</table>
										</li>
									</ul>
											</c:when>
											<c:otherwise>
												<ul class="bashe_pro_shul01" style="height: 22px;">
										<li class="bashe_pro_shli01" title="${product.productName}" style="overflow:hidden;max-height:20px;" >
											${product.productName}</li>
										<li class="bashe_pro_shli02">
											€${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="ingredients_cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/add_btn.png"
														alt="" name="" border="0"></th>
												</tr>
											</table>
										</li>
									</ul>
											</c:otherwise>	
									</c:choose>
						    
									
									
									<c:if test="${fn:length(product.offerName) > 0}">
									
									<ul class="bashe_pro_shul02">
										<li>${product.offerName}</li>
									</ul>
									</c:if>
									
								</div>
								<div class="clear"></div>
						
							<div class="bashe_pro_text" style="overflow:hidden;">
									${product.ingredients}
								
								</div>
						</div>
						
						<div id="nutrition" style="display: none;">
						    <div class="bashe_pro_sh">
						   			 <c:choose>
											<c:when test="${fn:length(product.productName)>36}">
												<ul class="bashe_pro_shul01" style="height: 48px;">
										<li class="bashe_pro_shli01" title="${product.productName}" style="max-height: 44px;">
											${product.productName}</li>
										<li class="bashe_pro_shli02">
											€${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="nutrition_cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/add_btn.png"
														alt="" name="" border="0"></th>
												</tr>
											</table>
										</li>
									</ul>
											</c:when>
											<c:otherwise>
												<ul class="bashe_pro_shul01" style="height: 22px;">
										<li class="bashe_pro_shli01" title="${product.productName}" style="overflow:hidden;max-height:20px;" >
											${product.productName}</li>
										<li class="bashe_pro_shli02">
											€${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="nutrition_cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/add_btn.png"
														alt="" name="" border="0"></th>
												</tr>
											</table>
										</li>
									</ul>
											</c:otherwise>	
									</c:choose>
									
									
									<c:if test="${fn:length(product.offerName) > 0}">
									
									<ul class="bashe_pro_shul02">
										<li>${product.offerName}</li>
									</ul>
									</c:if>
									
								</div>
								<div class="clear"></div>
							<div class="bashe_pro_text" style="overflow:hidden;" id="nutritionDiv">
									${product.nutrition} 
									
								</div>
						</div>	
						<div id="gda" style="display: none;">
						    <div class="bashe_pro_sh">
						    	<c:choose>
											<c:when test="${fn:length(product.productName)>36}">
												<ul class="bashe_pro_shul01" style="height: 48px;">
										<li class="bashe_pro_shli01" title="${product.productName}" style="max-height: 44px;">
											${product.productName}</li>
										<li class="bashe_pro_shli02">
											€${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="gda_cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/add_btn.png"
														alt="" name="" border="0"></th>
												</tr>
											</table>
										</li>
									</ul>
											</c:when>
											<c:otherwise>
												<ul class="bashe_pro_shul01" style="height: 22px;">
										<li class="bashe_pro_shli01" title="${product.productName}" style="overflow:hidden;max-height:20px;">
											${product.productName}</li>
										<li class="bashe_pro_shli02">
											€${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="gda_cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg_fr/add_btn.png"
														alt="" name="" border="0"></th>
												</tr>
											</table>
										</li>
									</ul>
											</c:otherwise>	
									</c:choose>
						    
									
									
									<c:if test="${fn:length(product.offerName) > 0}">
									
									<ul class="bashe_pro_shul02">
										<li>${product.offerName}</li>
									</ul>
									</c:if>
									
								</div>
								<div class="clear"></div>
							<div class="bashe_pro_text" style="overflow:hidden;" id="nutritionDiv">
									${product.otherInfo} 
									
								</div>
						</div>	
							
  					</div>
						
					</div>		
					<div class="bashe_pro_zhe"></div>			
					<div class="sch_footer">
						<img
							src="${pageContext.request.contextPath}/images/logo_dotter.png"
							height="14" name="" border="0"></a>EFFECTUÉ PAR DOTTER EN ASSOCIATION AVEC KELLOGG’S - <a style="color:#ffffff;" href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span>TERMES</span></a>
					</div>
				</div>


				<!-- -----------------------------左侧结束------------------------------------- -->
				<div class="sch_block_right">
					<div class="sch_pro_image2">
					
					<c:choose>
						<c:when test="${product.imageUrl == ''}">
						<img src="${pageContext.request.contextPath}/images/pro02.jpg"
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
							<div class="sch_bsk_title">PRODUITS SÉLECTIONNÉ</div>
							<br />
							<table width="90%" border="0" cellspacing="0" cellpadding="0"
								style="margin-top: 5px; display: none;" id="exampleData">
								<tr height="20px">
									<td width="108px" colspan="2" align="left" valign="middle">Kellogg's
										Special K Biscuit Moments</td>
									<td width="22px" align="right" valign="top"><img
										onmouseover="showTipInfo(this);" onmouseout="hideTipInfo();"
										onclick="removeItemById(this);"
										src="${pageContext.request.contextPath}/images/pc/kellogg_fr/icon_del.png"
										height="14" name="" border="0" /> <input type="hidden" /></td>
								</tr>
								<tr height="20px;">
									<td width="80px" align="left">x2</td>
									<td width="10" align="left" style="cursor: pointer;">
<%-- 										<img onmouseover="showOfferInfo(this);" onmouseout="hideOfferInfo(this);" src="${pageContext.request.contextPath}/images/pc/kellogg_fr/info_btn2.png" height="14" name="" border="0"> --%>
									</td>
									<td width="20" align="right">€0.99</td>
								</tr>
							</table>
							<div
								style="height: 75px;  margin-bottom: 10px; overflow-x: hidden; overflow-y: auto;" id="basketList">
								
							</div>
							<div style=" border-top:1px solid #c1232f; height: 1px;width: 136px; margin-bottom: 5px;"></div>
							<table width="136" border="0" cellspacing="0" cellpadding="0" onmouseover="showTotalMsgDiv(this)" onmouseout="hideTotalMsgDiv(this)">
								<tr id="savingsTr" height="14px;" style="">
									<td width="84px" align="left" valign="middle"
										class="sch_bsk_title" style="font-family: Helvetica;display:none;">SAVINGS</td>
									<td style="display:none;" width="42px" align="right" id="savingsPrice">- €0.78</td>
								</tr>
								<tr>
									<td width="84px" style="font-family: Helvetica;" align="left" valign="middle"  class="sch_bsk_title" >TOTAL</td>
									<td width="42px" align="right" id="totalPrice">€0.99</td>
								</tr>
							</table>
						</div>
						<div class="sch_login_block">
							<div><span id="tipInfo" style="line-height: 11px;">Veuillez entrer les détails ci-dessous pour ajouter à vos prochaines courses
						</span></div>
							<div class="sch_login_acc">
								<ul> 
									<li><input class="sch_input_acc" name="" id="userName" placeholder="${defaultRetailerUpperCase} Identifiant"  name=""  onchange="saveUserName('userName')"/></li>
									<li><input class="sch_input_acc" id="password" placeholder="${defaultRetailerUpperCase} Mot de passe" name="password" type="password"  /></li>
									<li style="font-size: 9px;font-weight: bold;"><label>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
  									<tr>
   									 <td width="12%"><input
											id="offerCheckBox" type="checkbox" /></td>
  									  <td width="88%"> Oui, je souhaite recevoir des 
									offres exclusives de Kellogg’s</td>
  									</tr>
									</table>
											</label>
									</li>
									<li><input class="input_btn02" type="button"
										value="AJOUTER AU PANIER" name="" onclick="login(0);" />
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
								src="${pageContext.request.contextPath}/images/lodding_01.gif"
								height="176" name="" border="0">
						</div>
						<div id="productsBasket" class="basket_con2_text">
						
							AJOUTANT LES PRODUITS DANS <br />
						VOTRE PANIER ${defaultRetailerUpperCase}
							 </div>
					</div>
					<div class="basket_panel_con2" style="display:none; ">
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
							<li class="basket_con3_li01">
							Nous sommes désolés, les produits suivants ne sont pas disponibles dans votre région
</li>
						</ul>
						<ul class="basket_con3_uld" id="failureListMsg">
                   			</ul>
						

						<ul class="basket_con3_ula">
							<li class="basket_con3_li01">Tous les autres produits ont été ajoutés à votre panier avec <span>${defaultRetailerUpperCase}</span>
								</li>
						</ul>
						<ul class="basket_con3_ulc">
							<li class="input_con02">RETOURNER ET CHOISIR UN AUTRE PRODUIT</li>
							<li class="input_con02" style="margin-top: 5px;">TERMINER L’ACHAT</li>
						</ul>
					</div>
					
					<div class="basket_panel_con4" style="display: none">
						<ul class="basket_con3_ula" style="margin-top: -15px; padding-bottom: 10px;">
							<li class="basket_con3_li01" style="font-family: Georgia, 'Times New Roman', Serif; font-weight: normal;">
							
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
					
					<div class="basket_panel_con5"  style="display: none">
						<ul class="basket_con3_ula" style="margin-top: -15px; padding-bottom: 10px;">
							<li class="basket_con3_li01" style="font-family: Georgia, 'Times New Roman', Serif; font-weight: normal;">
							Nous sommes désolés, la combinaison de votre identifiant et mot de passe n’est pas reconnu par ${defaultRetailerUpperCase}</li>
							
							<li class="basket_con3_li02" style="font-size: 11px; margin-left:3px;">
						Veuillez consulter le site de ${defaultRetailer} pour récupérer votre identifiant et mot de passe
							</li>
						</ul>
						
						<ul style="text-align:center; margin: 0 auto; margin-bottom: 5px;">
							<li style="cursor: pointer;">
<%-- 									<a href="${pageContext.request.contextPath}/${basketUrl}"> --%>
						<img  
							src="${pageContext.request.contextPath}/images/logo_${defaultRetailer}.png"
							width="144px;" border="0" onclick="goToRetailer(this)" class="${defaultRetailer}">
<!-- 						</a> -->
						</li>
						</ul>
						<ul style="text-align: center;">
						  <li><input class="input_btn02" style="width:170px;" type="button" value="CONTINUER" name="" onclick="BackToLogin();" /></li>
						</ul>
				</div>
					
				<div class="basket_panel_con5"   id="test">
						<ul class="basket_con3_ula" style="margin:15px 40px 35px 40px;">
							<li class="basket_con3_li01" style="margin:0 auto; text-align:center; font-family: Georgia, 'Times New Roman', Serif; font-weight: bold;">
							Veuillez entrer un identifiant et mot de passe valide pour votre magasin préféré</li>
						</ul>
						
						<ul style="width: 164px;margin: 0 auto;">
							<li>
							<div class="sch_login_acc">
								<ul>		<li style="margin-top: 3px;"><input class="input_btn02" type="button"
										value="FERMER" name="" onclick="displayLogin();"/>
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
		<img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/del_basket.png"></img>
	</div>
	<div class="del_bsk_block02" style="display: none" id="TotalMsgTip">
		<ul>
			<li class="del_bsk_bg02">Based on offers and prices as of today.  Prices may have changed when your order is confirmed and put together for delivery
</li>
			<li
				style="height: 7px; display: block; line-height: 0px; text-align: center;"><img
				src="${pageContext.request.contextPath}/images/pc/kellogg_fr/icon_tri.png"
				style="padding: 0; margin: 0px;" width="12px;" height="7px;">
			</li>
		</ul>
	</div>

	
</body>
</html>