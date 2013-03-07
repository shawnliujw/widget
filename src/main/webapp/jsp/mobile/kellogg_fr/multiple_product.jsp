<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld" %>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld" %>
<!DOCTYPE html>
<html> 
<head>
<title>Openstore</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/mobile/main_kellogg_fr.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mobile/kellogg_fr/common.js"></script>
<script src="${pageContext.request.contextPath}/js/mobile/kellogg_fr/basket_multiply.js"></script>
<script src="${pageContext.request.contextPath}/js/mobile/kellogg_fr/basket_mpupa.1.0.js"></script>
<%--  <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/cufon.js"></script> --%>
<%--     <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/Caecilia_LT_Std-Roman_italic_400.font.js"></script> --%>
<%--     <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/defineCufon_kellogg_fr_mobile.js"></script> --%>
<script type="text/javascript">
	function gotoUrl(url){
		window.location.href=url;
	}
	
	var brandName = "${brandModel['brandName']}";
	var retailerName = "${defaultRetailer}";
	var categoryName = "${defaultCategory}";
	var productId = "";
	var path = '${pageContext.request.contextPath}';
	var retailerNameUpperCase = "${defaultRetailerUpperCase}";
	 var _gaq = _gaq || [];
	 _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
	  _gaq.push(['_trackPageview',retailerName+"/"+categoryName]);

	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	  
	  function showDiv(obj,divId){
			if($(divId).css('display')=='none'){
				var left=$(obj).parent().offset().left;
				var top = $(obj).parent().offset().top;
				var height = $(divId).height();
				$(divId).css({
					'left':left,
					'top':top+$(obj).height(),
					"height":0
				}).animate({
				//	'top':top-height,//-$(obj).height(),
					"height":height
				}).css('display','');
			}else{
				var top = $(obj).parent().offset().top;
				var height = $(divId).height();
				$(divId).animate({
					'top':top+$(obj).height(),
					"height":0
				},function(){
					$(divId).attr('style','width:138px; position: absolute; z-index: 1000; text-align: center; display: none;');
				});
			}
		}
</script>
</head>
<div id="multiple_product_page">
	<c:if test="${fn:length(productList) > 0}">
		<input type="hidden" value="${productList[0].brandId}" id="defaultBrandId">
		<input type="hidden" value="${productList[0].clientId}" id="defaultClientId">
		<input type="hidden" value="${productList[0].retailerId}" id="defaultRetailerId">
	</c:if>
	<input type="hidden" value="${defaultRetailer}" id="defaultReatiler">
	    <div>
		      <div class="header_block">
		          <div class="header_logo" onclick="window.location.href='${pageContext.request.contextPath}/specialk-fr'"><img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/logo.png"  name="" border="0"></div>
		          <div class="header_bsk" >
		          	<a style="display: block; width: 49px; height:49px; color: #e93439;" id="m_h_bsk"  href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/all/basket.action"></a>
		          </div>
		      <div class="clear"></div>
		      </div>
		      <div class="clear"></div>
		      <div class="retailer_block">
		          <div>
				           <div class="retailer_title"><img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/pic_mon.png" name="" border="0"></div>
		<!-- 		           <div class="multi_retailer_slt"> -->
		<!-- 		           		<select onchange="gotoUrl(this.options[this.selectedIndex].value);"> -->
		<%-- 		           			<c:forEach items="${retailerList}" var="retailer"> --%>
		<%--                  				<option value="${pageContext.request.contextPath}/${brandModel['brandName']}/${retailer.name}/all/product" --%>
		<%--                  					<c:if test="${retailer.name eq defaultRetailer}"> selected="selected"</c:if> --%>
		<%--                  				>${retailer.name}</option> --%>
		<%--                  			</c:forEach> --%>
		<!-- 		               </select> -->
		<!-- 		           </div> -->
		              <div style="width:138px; float:right; height:10px; margin:12px 5px 16px 0;">
		                  <div class="drop_menu" onclick="showDiv(this,'#m_p_d');">
		                       ${fn:toUpperCase(defaultRetailer)}
		                  </div>
		             </div>
		                  <div id="m_p_d" style="width:138px; position: absolute; z-index: 1000; text-align: center; display: none;">
				                  <div class="drop_list" >
					                  <ul>
					                  	<c:forEach items="${retailerList}" var="retailer">
					                  		<a style="color:#6c6c6c" 
					                  			href="${pageContext.request.contextPath}/${brandModel['brandName']}/${retailer.name}/all/product">
					                  			<li>${retailer.name}</li></a>
					                  	</c:forEach>
					                  </ul>
					               </div>
			               </div>
			               
	               </div>
	               <div class="clear"></div>
		          <div>
				           <div class="retailer_title" style="width:165px; text-align: right;"><img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/pic_moi.png" name="" border="0"></div>
		<!-- 		           <div class="multi_retailer_slt"> -->
		<!-- 		           		<select onchange="gotoUrl(this.options[this.selectedIndex].value);"> -->
		<%-- 		           			<c:forEach items="${retailerList}" var="retailer"> --%>
		<%--                  				<option value="${pageContext.request.contextPath}/${brandModel['brandName']}/${retailer.name}/all/product" --%>
		<%--                  					<c:if test="${retailer.name eq defaultRetailer}"> selected="selected"</c:if> --%>
		<%--                  				>${retailer.name}</option> --%>
		<%--                  			</c:forEach> --%>
		<!-- 		               </select> -->
		<!-- 		           </div> -->
		              <div style="width:138px; float:right; height:10px; margin:12px 5px 16px 0;">
		                  <div class="drop_menu" onclick="showDiv(this,'#m_p_c');">
		                       ${fn:toUpperCase(defaultCategory)}
		                  </div>
		             </div>
		                  <div id="m_p_c" style="width:138px; position: absolute; z-index: 1000; text-align: center; display: none;">
				                  <div class="drop_list" >
					                  <ul>
					                  	<c:forEach items="${categoryList}" var="retCl">
					                  		<a style="color:#6c6c6c" 
					                  			href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${retCl.name}/product">
					                  			<li>${retCl.name}</li></a>
					                  	</c:forEach>
					                  </ul>
					               </div>
			               </div>
			               
	               </div>
		      </div>
		      <div class="clear"></div>
	    </div>
	    
	    <div class="multi_content">
	         <div class="multi_help"><img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/btn_helpbg.png"name="" border="0"></div>
	         <div class="multipro_con">
					<c:forEach items="${requestProductList}" var="reqPL" varStatus="stat">
						<c:if test="${fn:length(reqPL.value) > 0}">
						<div class="multipro_block">
							<div class="multipro_img"><img src="${pageContext.request.contextPath}/${reqPL.key.imageUrl}" height="116px" name="" border="0"></div>
					        <div class="multi_catatitle">${fn:toUpperCase(reqPL.key.name)}</div>
								
								<c:forEach items="${reqPL.value}" var="product">
									<div>
										<div class="multipro_info">
											<ul>
												<li class="multi_name">${product.productName}</li>
						                        <li class="multi_price">€${product.nowPrice}</li>
						                        <c:if test="${fn:length(product.offerName) > 0}">
						                        <div class="clear"></div>
						                        <li class="multi_offer">product.offerName</li>
						                        </c:if>
											</ul>
											<div class="clear"></div>
										</div>
										<div class="clear"></div>
										<div>
					                       <ul>
					                           <li class="multi_info"><a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}">
					                           	<img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/icon_info.png" width="49px" name="" border="0"></a>
					                           </li>
					                           <li class="multi_add_block">
					                               <table width="120" height="44px;" border="0" cellspacing="0" cellpadding="0">
														<tr>
														<input type="hidden" value="${product.productId}" class="productId" id="${product.productId}">
														<input type="hidden" value="${product.productUrl}" class="productUrl">
														<input type="hidden" value="${product.nowPrice}" class="productPrice">
														<input type="hidden" value="${product.productName}" class="productName">
														<input type="hidden" value="${product.offerId}" class="productOfferName">
														<td align="right" valign="top" style="cursor: pointer; width: 46px;">
																<img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/btn_reduce.png"
																		alt="" name="" border="0" class="minus" onclick="changeSelectNum(this);"></td>
														<td align="center" valign="top" class="multi_quy" style="width: 26px;"><input class="sch_input_qty" value="0" type="text" readonly="readonly" /></td>
														<td align="left" valign="top" style="cursor: pointer; width: 48px;"><img
																		src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/btn_add.png"
																		alt="" name="" border="0" class="add" onclick="changeSelectNum(this);"></td>
														</tr>
													</table>
					                           </li>
					                       </ul>
					                   </div>
									</div>
									<div class="clear"></div>
								</c:forEach>
						</div>
						</c:if>
					</c:forEach>
					<c:if test="${fn:length(productList) > 0 }">
						<div class="multipro_block">
							<div class="multipro_img">
								<c:forEach items="${categoryList}" var="retcl">
									<c:if test="${fn:toLowerCase(retcl.name) eq fn:toLowerCase(defaultCategory)}">
										<img src="${pageContext.request.contextPath}/${retcl.imageUrl}" height="116px" name="" border="0">
									</c:if>
								</c:forEach>
							</div>
					        <div class="multi_catatitle">${fn:toUpperCase(defaultCategory)}</div>
								
								<c:forEach items="${productList}" var="product">
									<div>
										<div class="multipro_info">
											<ul>
												<li class="multi_name">${product.productName}</li>
						                        <li class="multi_price">€${product.nowPrice}</li>
						                        <c:if test="${fn:length(product.offerName) > 0}">
						                        <div class="clear"></div>
						                        <li class="multi_offer">product.offerName</li>
						                        </c:if>
											</ul>
											<div class="clear"></div>
										</div>
										<div class="clear"></div>
										<div>
					                       <ul>
					                           <li class="multi_info"><a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/product/${product.productId}">
					                           	<img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/icon_info.png" width="49px" name="" border="0"></a>
					                           </li>
					                           <li class="multi_add_block">
					                               <table width="120" height="44px;" border="0" cellspacing="0" cellpadding="0">
														<tr>
														<input type="hidden" value="${product.productId}" class="productId" id="${product.productId}">
														<input type="hidden" value="${product.productUrl}" class="productUrl">
														<input type="hidden" value="${product.nowPrice}" class="productPrice">
														<input type="hidden" value="${product.productName}" class="productName">
														<input type="hidden" value="${product.offerId}" class="productOfferName">
														<td align="right" valign="top" style="cursor: pointer; width: 46px;">
																<img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/btn_reduce.png"
																		alt="" name="" border="0" class="minus" onclick="changeSelectNum(this);"></td>
														<td align="center" valign="top" class="multi_quy" style="width: 26px;"><input class="sch_input_qty" value="0" type="text" readonly="readonly" /></td>
														<td align="left" valign="top" style="cursor: pointer; width: 48px;"><img
																		src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/btn_add.png"
																		alt="" name="" border="0" class="add" onclick="changeSelectNum(this);"></td>
														</tr>
													</table>
					                           </li>
					                       </ul>
					                   </div>
									</div>
									<div class="clear"></div>
								</c:forEach>
						</div>
					</c:if>
	         </div>
	         
	         <div class="home_footer">
                 <div class="home_footercon">
                   <div class="home_footerlogo"><img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/dotter_logo.png" width="22" name="" border="0"></div>
                   <div class="home_footertext">EFFECTUÉ PAR DOTTER EN ASSOCIATION <br/>AVEC KELLOGG’S  -   <span>VOIR LES TERMES</span></div>
                 </div>
             </div>
	    </div>
   
</div>
</html>


