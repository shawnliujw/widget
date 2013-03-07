<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld"%>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld"%>
<!DOCTYPE html >
<html> 
<head> 
            <title>Kellogg’s Special K Store</title> 
<meta name=description" content=Say ‘YES’ to Special K Biscuit Moments and other delicious   snacks using our Special K Snack Store."/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/pc/main_kellogg.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/jquery/scroll/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/scroll/jquery.mousewheel.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/scroll/jquery.mCustomScrollbar.js"></script>
<script
	src="${pageContext.request.contextPath}/js/pc/kellogg/cpt.js"></script>
<script src="${pageContext.request.contextPath}/js/pc/kellogg/common.js"></script>
<script src="${pageContext.request.contextPath}/js/pc/kellogg/single_product_1.js"></script>
<script src="${pageContext.request.contextPath}/js/pc/kellogg/basket_mpupa.1.0.js"></script>
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
	  _gaq.push(['_trackPageview',retailerName+"/"+categoryName+"/product/"+productId]);

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
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php",1);
piwikTracker.setDocumentTitle(retailerName+"/"+categoryName+"/"+'${product.productName4Specialk}');
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=1" style="border:0" alt="" /></p></noscript>
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
		value="${product.productName4Specialk}"
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
				<div class="sch_retailer_title">My selected retailer:</div>
				<div class="sch_retailer_logo">
					<ul>
						<c:forEach items="${retailerList}" var="retailer">

							<c:choose>
								<c:when test="${retailer.name eq defaultRetailer}">
									<li class="sch_retailer_active"><img
										src="${pageContext.request.contextPath}/images/logo_${fn:toLowerCase(retailer.name)}01.png"
										height="17" name="" border="0" >
									</li>
								</c:when>
								<c:otherwise>

									<li><a
										href="${pageContext.request.contextPath}/${brandModel['brandName']}/${retailer.name}/${defaultCategory}/product/${product.productId}"  class="retailerLink">
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
					<input class="input_btn02" style="height:22px;" type="button" value="HELP" name="" />
				</div></a>
			</div>
			<div class="clear"></div>
			<div class="openstore_show">
				<div class="sch_show_title">Show me:</div>
				<div class="sch_show_item">
					<ul>
						<c:forEach items="${categoryList}" var="category1">
							<c:choose>
								<c:when test="${category1.name eq defaultCategory}">

									<li style="width: 166px;" class="sch_show_active">${category1.name}</li>

								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${category1.name}/product" class="categoryLink">
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
								<li class="detail_active" aimDiv='ourPrice' onClick="changeInfoShow(this);" >ABOUT
								<li>
								<li class="detail_kong">&nbsp;
								<li>
								<li class="detail_normal" aimDiv='ingredients'  onclick="changeInfoShow(this);">INGREDIENTS
								<li>
								<li class="detail_kong">&nbsp;
								<li>
								<li class="detail_normal"  aimDiv='nutrition' onClick="changeInfoShow(this);">NUTRITION
								<li>
								<li class="detail_kong">&nbsp;
								<li>
								<li class="detail_normal"  aimDiv='gda' onClick="changeInfoShow(this);">GDA
								<li>
							</ul>
						</div>
                         <div class="clear"></div>
						<div class="bashe_pro_main">

						<a style="color:#bf314f;cursor:pointer;"
									href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/" class="backToProducts">
							<div class="bashe_pro_all">
								<span> BACK TO PRODUCTS</span>
							</div></a>


							<div id="ourPrice" >
								<div class="bashe_pro_sh">
									<c:choose>
											<c:when test="${fn:length(product.productName4Specialk)>36}">
												<ul class="bashe_pro_shul01" style="height: 48px;">
										<li class="bashe_pro_shli01" title="${product.productName4Specialk}" style="max-height: 44px;">
											${product.productName4Specialk}</li>
										<li class="bashe_pro_shli02">
											£${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg/add_btn.png"
														alt="" name="" border="0"></th>
												</tr>
											</table>
										</li>
									</ul>
											</c:when>
											<c:otherwise>
												<ul class="bashe_pro_shul01" style="heigh:22px;">
										<li class="bashe_pro_shli01" title="${product.productName4Specialk}" style="overflow:hidden;max-height:20px;" >
											${product.productName4Specialk}</li>
										<li class="bashe_pro_shli02">
											£${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg/add_btn.png"
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
											<c:when test="${fn:length(product.productName4Specialk)>36}">
												<ul class="bashe_pro_shul01" style="height: 48px;">
										<li class="bashe_pro_shli01" title="${product.productName4Specialk}" style="max-height: 44px;">
											${product.productName4Specialk}</li>
										<li class="bashe_pro_shli02">
											£${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="ingredients_cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg/add_btn.png"
														alt="" name="" border="0"></th>
												</tr>
											</table>
										</li>
									</ul>
											</c:when>
											<c:otherwise>
												<ul class="bashe_pro_shul01" style="height: 22px;">
										<li class="bashe_pro_shli01" title="${product.productName4Specialk}" style="overflow:hidden;max-height:20px;" >
											${product.productName4Specialk}</li>
										<li class="bashe_pro_shli02">
											£${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="ingredients_cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg/add_btn.png"
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
											<c:when test="${fn:length(product.productName4Specialk)>36}">
												<ul class="bashe_pro_shul01" style="height: 48px;">
										<li class="bashe_pro_shli01" title="${product.productName4Specialk}" style="max-height: 44px;">
											${product.productName4Specialk}</li>
										<li class="bashe_pro_shli02">
											£${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="nutrition_cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg/add_btn.png"
														alt="" name="" border="0"></th>
												</tr>
											</table>
										</li>
									</ul>
											</c:when>
											<c:otherwise>
												<ul class="bashe_pro_shul01" style="height: 22px;">
										<li class="bashe_pro_shli01" title="${product.productName4Specialk}" style="overflow:hidden;max-height:20px;" >
											${product.productName4Specialk}</li>
										<li class="bashe_pro_shli02">
											£${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="nutrition_cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg/add_btn.png"
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
							<div class="bashe_pro_text" style="overflow:auto;" id="nutritionDiv">
									${product.nutrition} 
									
								</div>
						</div>	
						<div id="gda" style="display: none;">
						    <div class="bashe_pro_sh">
						    	<c:choose>
											<c:when test="${fn:length(product.productName4Specialk)>36}">
												<ul class="bashe_pro_shul01" style="height: 48px;">
										<li class="bashe_pro_shli01" title="${product.productName4Specialk}" style="max-height: 44px;">
											${product.productName4Specialk}</li>
										<li class="bashe_pro_shli02">
											£${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="gda_cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg/add_btn.png"
														alt="" name="" border="0"></th>
												</tr>
											</table>
										</li>
									</ul>
											</c:when>
											<c:otherwise>
												<ul class="bashe_pro_shul01" style="height: 22px;">
										<li class="bashe_pro_shli01" title="${product.productName4Specialk}" style="overflow:hidden;max-height:20px;">
											${product.productName4Specialk}</li>
										<li class="bashe_pro_shli02">
											£${product.nowPrice}</li>
										<li class="bashe_pro_shli03">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<th style="cursor: pointer;"><img
														onclick="changeSelectNum(this,-1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg/reduce_btn.png"
														alt="" name="" border="0"></th>
													<th><input name="ipt_quantity" class="sch_input_qty" value="0" type="text"
														readonly="readonly" id="gda_cureNum" /></th>
													<th align="left" style="cursor: pointer;"><img
														onclick="changeSelectNum(this,1);"
														src="${pageContext.request.contextPath}/images/pc/kellogg/add_btn.png"
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
							height="14" name="" border="0"></a> POWERED BY DOTTER IN ASSOCIATION WITH KELLOGG'S | <a style="color:#ffffff;" href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span>SEE TERMS</span></a>
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
							<div class="sch_bsk_title">SELECTED PRODUCTS</div>
							<br />
							<table width="90%" border="0" cellspacing="0" cellpadding="0"
								style="margin-top: 5px; display: none;" id="exampleData">
								<tr height="20px">
									<td width="108px" colspan="2" align="left" valign="middle">Kellogg's
										Special K Biscuit Moments</td>
									<td width="22px" align="right" valign="top"><img
										onmouseover="showTipInfo(this);" onMouseOut="hideTipInfo();"
										onclick="removeItemById(this);"
										src="${pageContext.request.contextPath}/images/pc/kellogg/icon_del.png"
										height="14" name="" border="0" /> <input type="hidden" /></td>
								</tr>
								<tr height="20px;">
									<td width="80px" align="left">x2</td>
									<td width="10" align="left" style="cursor: pointer;">
<%-- 										<img onmouseover="showOfferInfo(this);" onmouseout="hideOfferInfo(this);" src="${pageContext.request.contextPath}/images/pc/kellogg/info_btn2.png" height="14" name="" border="0"> --%>
									</td>
									<td width="20" align="right">£0.99</td>
								</tr>
							</table>
							<div
								style="height: 72px;  margin-bottom: 10px; overflow-x: hidden; overflow-y: auto;" id="basketList">
								
							</div>
							<div style=" border-top:1px solid #c1232f; height: 1px;width: 136px; margin-bottom: 5px;"></div>
							<table width="136" border="0" cellspacing="0" cellpadding="0" onMouseOver="showTotalMsgDiv(this)" onMouseOut="hideTotalMsgDiv(this)">
								<tr id="savingsTr" height="16px;">
									<td width="84px" align="left" valign="middle"
										class="sch_bsk_title" style="display:none;">SAVINGS</td>
									<td style="display:none;" width="42px" align="right" id="savingsPrice">- £0.78</td>
								</tr>
								<tr>
									<td width="84px" align="left" valign="middle"  class="sch_bsk_title" >TOTAL</td>
									<td width="42px" align="right" id="totalPrice">£0.99</td>
								</tr>
							</table>
						</div>
						<div class="sch_login_block">
							<div style="font-size: 10px;"><span id="tipInfo">Add to your next online shop by entering the
								following details.</span></div>
							<div class="sch_login_acc">
								<ul> 
									<li><input class="sch_input_acc"  name="" id="userName" placeholder="${defaultRetailerUpperCase} username"  name=""  onchange="saveUserName('userName')"/></li>
									<li><input class="sch_input_acc" id="password" placeholder="${defaultRetailerUpperCase} password" name="password" type="password"  /></li>
									<li style="font-size: 9px;"><label><input id="offerCheckBox"
											type="checkbox" /> Yes to Kellogg's exclusive offers</label>
									</li>
									<li><input class="input_btn02" type="button"
										value="ADD TO ${defaultRetailerUpperCase} BASKET" name="" onClick="login(0);" />
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
						<div id="productsBasket" class="basket_con2_text">PRODUCTS ADDING TO<br />
							 YOUR ${defaultRetailerUpperCase} BASKET...</div>
					</div>
					<div class="basket_panel_con2" style="display:none; ">
						<div class="basket_con2_lodding">
							<img
								src="${pageContext.request.contextPath}/images/lodding_01.gif"
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
							<li class="input_con02" style="margin-top: 5px;">FINISH SHOPPING</li>
						</ul>
					</div>
					
					<div class="basket_panel_con4" style="display: none">
						<ul class="basket_con3_ula" style="margin-top: -15px; padding-bottom: 10px;">
							<li class="basket_con3_li01" style="font-family: Georgia, 'Times New Roman', Serif; font-weight: normal;">
							SORRY YOUR USERNAME AND PASSWORD COMBINATION IS NOT RECOGNISED BY ${defaultRetailerUpperCase}, PLEASE TRY AGAIN.</li>
						</ul>
						
						<ul style="width: 164px;margin: 0 auto;">
							<li>
							<div class="sch_login_acc">
								<ul>
									<li><input class="sch_input_acc" name=""
										placeholder="${defaultRetailerUpperCase} username"
										id="SecondUserName"  onchange="saveUserName('SecondUserName')" /></li>
									<li><input class="sch_input_acc" name="password"
										placeholder="${defaultRetailerUpperCase} password"
										type="password" id="SecondPassword"  /></li>
								
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
							<li class="basket_con3_li01" style="font-family: Georgia, 'Times New Roman', Serif; font-weight: normal;">
							SORRY YOUR USERNAME AND PASSWORD COMBINATION IS NOT RECOGNISED BY ${defaultRetailerUpperCase}.</li>
							
							<li class="basket_con3_li02" style="font-size: 11px; margin-left:3px;">Please visit the ${defaultRetailer} website to retrieve your username and password:
							</li>
						</ul>
						
						<ul style="text-align:center; margin: 0 auto; margin-bottom: 5px;">
							<li style="cursor: pointer;">
<%-- 									<a href="${pageContext.request.contextPath}/${basketUrl}"> --%>
						<img  
							src="${pageContext.request.contextPath}/images/logo_${defaultRetailer}.png"
							width="144px;" border="0" onClick="goToRetailer(this)" class="${defaultRetailer}">
<!-- 						</a> -->
						</li>
						</ul>
						<ul style="text-align: center;">
						  <li><input class="input_btn02" style="width:170px;" type="button" value="CONTINUE" name="" onClick="BackToLogin();" /></li>
						</ul>
				</div>
					
				<div class="basket_panel_con5"  style="display: none" id="test">
						<ul class="basket_con3_ula" style="margin:15px 40px 35px 40px;">
							<li class="basket_con3_li01" style="margin:0 auto; text-align:center; font-family: Georgia, 'Times New Roman', Serif; font-weight: bold;">
							PLEASE INPUT A VALID USERNAME AND PASSWORD FOR YOUR CHOSEN RETAILER</li>
						</ul>
						
						<ul style="width: 164px;margin: 0 auto;">
							<li>
							<div class="sch_login_acc">
								<ul>		<li style="margin-top: 3px;"><input class="input_btn02" type="button"
										value="CLOSE" name="" onClick="displayLogin();"/>
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
		<img src="${pageContext.request.contextPath}/images/pc/kellogg/del_basket.png"></img>
	</div>
	<div class="del_bsk_block02" style="display: none" id="TotalMsgTip">
		<ul>
			<li class="del_bsk_bg02">Based on offers and prices as of today.  Prices may have changed when your order is confirmed and put together for delivery
</li>
			<li
				style="height: 7px; display: block; line-height: 0px; text-align: center;"><img
				src="${pageContext.request.contextPath}/images/pc/kellogg/icon_tri.png"
				style="padding: 0; margin: 0px;" width="12px;" height="7px;">
			</li>
		</ul>
	</div>
	<div class="offer_bsk_block02" style="display:none;" id="s_product_offer">
		<ul>
			<li class="offer_bsk_bg02">Offer applied to Total<br/> Buy one, get one free on all Slow Cookers Recipe Mixes</li>
			<li
				style="height: 7px; display: block; line-height: 0px; text-align: center;"><img
				src="${pageContext.request.contextPath}/images/pc/kellogg/icon_tri.png"
				style="padding: 0; margin: 0px;" width="12px;" height="7px;">
			</li>
		</ul>
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