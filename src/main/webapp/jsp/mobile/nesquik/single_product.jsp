<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld"%>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld"%>
<!DOCTYPE html>
<html> 
<head>
<title>Openstore</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/mobile/main_nesquik.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/cufon.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/helvetica_rounded_bold_cond_700-helvetica_rounded_bold_cond_700.font.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/cufon/defineCufon_nesquik.js"></script>
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mobile/nesquik/common.js"></script>
<script src="${pageContext.request.contextPath}/js/mobile/nesquik/basket_multiply.js"></script>
<script src="${pageContext.request.contextPath}/js/mobile/nesquik/basket_mpupa.1.0.js"></script>
<script src="${pageContext.request.contextPath}/js/mobile/nesquik/single_product.js"></script>
<script>
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
	  $(document).ready(function(){
		  initSingleProductPageWithBasket();
	  });
	  
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
	  
	  
	  function showDivCenter(obj,divId){
			if($(divId).css('display')=='none'){
				var left=$(obj).parent().offset().left;
				var top = $(obj).parent().offset().top;
//	 			var scrollTop = document.body.scrollTop;
				
				//alert(top+"--"+$(obj).offset().top)
				//alert(height);
				
				//alert($(obj).offset().top+"----"+$(obj).css("top"));
				//alert($(divId).offset().top+"----"+$(divId).css("top"));
				var height = $(divId).height();
				//alert($(divId).attr("style"));
				$(divId).css({
					'left':left,
					'top':top,
					"height":0
				}).animate({
					'top':top-height,//-$(obj).height(),
					"height":height
				}).css('display','');
			}else{
				var top = $(obj).parent().offset().top;
				var height = $(divId).height();
//	 			var scrollTop = document.body.scrollTop;
				$(divId).animate({
					'top':top,
					"height":0
				},function(){
					//$(divId).css('top','auto');
					$(divId).attr('style','width:138px; position: absolute; z-index: 1000; text-align: center; display: none;');
				});
			}
		}
</script>
</head>
<div id="single_product_page">
	<input type="hidden" value="${product.productId}" id="defaultReatilerId">
	<input type="hidden" value="${defaultRetailer}" id="defaultReatiler">
	<input type="hidden" value="${product.productName}" id="defaultRetailerTitle">
	<input type="hidden" value="${product.offerId}" id="defaultOffer" />
	<input type="hidden" value="${product.nowPrice}" id="defaultRetailerPrice" />
	<input type="hidden" value="${product.productUrl}" id="defaultRetailerUrl">
	<input type="hidden" value="${pageContext.request.contextPath}" id="context">
	<input type="hidden" value="${product.brandId}" id="defaultBrandId">
	<input type="hidden" value="${product.clientId}" id="defaultClientId">
	<input type="hidden" value="${product.retailerId}" id="defaultRetailerId">
	    <div>
		      <div class="header_block">
		          <div class="header_logo" onclick="window.location.href='${pageContext.request.contextPath}/nesquik'"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/img_logo.png" height="64px" name="" border="0"></div>
		          <div class="header_bsk" >
		          	<a style="display: block; width: 49px; height:49px; color: #0b5caf;" id="m_h_bsk"  href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/all/basket.action"></a>
		          </div>
		          <div class="header_rabbit"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/img_rabbit.png" height="72px" name="" border="0"></div>
		      <div class="clear"></div>
		      </div>
		      <div class="clear"></div>
		      <div class="retailer_block">
		           <div class="retailer_title">MY SELECTED RETAILER:</div>
		           <div style="width:138px; float:right; height:10px; margin:12px 17px 16px 0;">
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
		      <div style="background:#fef200; height:34px;"></div>
		      <div class="line_block"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/line_blue.png" width="100%" height="10px" name="" border="0"></div>
	    </div>
	    
	    <div class="multi_content">
	         <div class="multi_help"><input class="" type="button"  value="For help using our store, please click here" name=""/></div>
	         <div class="multipro_con">
	               <div class="singlepro_block">
	                   <div class="multipro_img"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/home_pro.png" height="116px" name="" border="0"></div>
	                   <div>
			                   <div class="multipro_info">
			                      <ul>
			                         <li class="multi_name"><span>NEW</span> ${product.productName}</li>
			                         <li class="multi_price">£${product.nowPrice}</li>
			                         <c:if test="${fn:length(product.offerName) > 0}">
										<li class="multi_offer">${product.offerName}</li>
										 <div class="clear"></div>
									 </c:if>
			                      </ul>
			                   </div>
			                   <div class="clear"></div>
			                   <div>
			                       <ul>
			                           <li class="single_info"><img onclick="javascript:window.history.go(-1);" src="${pageContext.request.contextPath}/images/mobile/nesquik/pro_back.png" width="85px" name="" border="0"></li>
			                           <li class="multi_add_block">
			                               <table width="120" height="44px;" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td align="right" valign="top" style="cursor: pointer;"><img
																onclick="changeSelectNum(this,-1);"
																src="${pageContext.request.contextPath}/images/mobile/nesquik/btn_reduce.png"
																alt="" name="" border="0" class=""></td>
															<td align="center" valign="top" class="multi_quy"><input id="cureNum" name="ipt_quantity" class="sch_input_qty" value="0" type="text" readonly="readonly" /></td>
															<td align="left" valign="top" style="cursor: pointer;"><img
																onclick="changeSelectNum(this,1);"
																src="${pageContext.request.contextPath}/images/mobile/nesquik/btn_add.png"
																alt="" name="" border="0" class=""></td>
														</tr>
													</table>
			                           </li>
			                       </ul>
			                   </div>
	                   </div>
	                   <div class="clear"></div>
	               </div>
	               
	               <div class="singlepro_block2">
	               <div class="singlepro_top">
<!-- 	               <div class="singlepro_slt"> -->
<!-- 		               <select onchange="changeInfos(this);" style="width: 135px;"> -->
<!-- 		                  <option value="additionalInfo">Additional Info</option> -->
<!-- 		                  <option value="ingredients">Ingredients</option> -->
<!-- 		                  <option value="usage">Usage</option> -->
<!-- 		                  <option value="nutrition">Nutrition</option> -->
<!-- 		                  <option value="additives">Additives</option> -->
<!-- 		                  <option value="allergyAdvice">Allergy Advice</option> -->
<!-- 		                  <option value="lifeStyle">Lifestyle</option> -->
<!-- 		               </select> -->
<!-- 		           </div> -->
		           <div style="width:138px; float:left; height:10px; margin:12px 17px 16px 15px;">
		                  <div class="drop_menu" id="thisIsSingle" onclick="showDivCenter(this,'#div_s_c');">
		                       ADDITIONAL INFO
		                  </div>
                  </div>
		                  <div id="div_s_c" style="width:138px; position: absolute; z-index: 1000; text-align: center; display: none;">
				                  <div class="drop_list" >
					                  <ul>
			                  			<li onclick="changeInfos(this,'additionalInfo');" >Additional Info</li>
			                  			<li onclick="changeInfos(this,'ingredients');" >Ingredients</li>
			                  			<li onclick="changeInfos(this,'usage');" >Usage</li>
			                  			<li onclick="changeInfos(this,'nutrition');" >Nutrition</li>
			                  			<li onclick="changeInfos(this,'additives');" >Additives</li>
			                  			<li onclick="changeInfos(this,'allergyAdvice');" >Allergy Advice</li>
			                  			<li onclick="changeInfos(this,'lifeStyle');" >Lifestyle</li>
					                  </ul>
					               </div>
			               </div>
                  <div class="clear"></div>
	              </div>
	              <div style="" class="singlepro_text" id="additionalInfo">${product.additionalInfo}</div>
	              <div style="display:none;" class="singlepro_text" id="ingredients">${product.ingredients}</div>
	              <div style="display:none;" class="singlepro_text" id="usage">${product.usage}</div>
	              <div style="display:none;" class="singlepro_text" id="nutrition">${product.nutrition}</div>
	              <div style="display:none;" class="singlepro_text" id="additives">${product.additives}</div>
	              <div style="display:none;" class="singlepro_text" id="allergyAdvice">${product.allergyAdvice}</div>
	              <div style="display:none;" class="singlepro_text" id="lifeStyle">${product.lifeStyle}</div>
<!-- 	              <div  class="singlepro_text" > -->
<!-- 			            <ul> -->
<!-- 			            <li class="singlepro_textli01"> -->
<!-- 			               Nesquik NEW Hot Chocolate, 500g -->
<!-- 		                 </li> -->
<!-- 		                 <li class="singlepro_textli02"> -->
<!-- 			               ADD SOME NESQUIC MAGIC -->
<!-- 		                 </li> -->
<!-- 		                 <li class="singlepro_textli03"> -->
<!-- 			               Your kids will love NEW Nesquik Hot Chocolate, with no artificial colours, sweeteners or preservative and the same great NESQUIK taste. -->
<!-- 		                 </li> -->
<!-- 		                 <li class="singlepro_textli03"> -->
<!-- 			               Just add warm milk to give your kids a great tasting drink as part of a healthy breakfast. -->
<!-- 		                 </li> -->
<!-- 		                 <li class="singlepro_textli02"> -->
<!-- 			             GOOD TO KNOW -->
<!-- 		                 </li> -->
<!-- 		                 <li class="singlepro_textli03"> -->
<!-- 			               It's hard to improve on the original tasty Nesquik but we believe in doing our bit to help kids' healthy development. So we've fortified Nesquik with essential vitamins, especially vitamin D, which aids the absorption of calcium for healthy bones and teeth. -->
<!-- 		                 </li> -->
<!-- 		                 <li class="singlepro_textli02"> -->
<!-- 			              GOOD TO REMEMBER -->
<!-- 		                 </li> -->
<!-- 		                 <li class="singlepro_textli03"> -->
<!-- 			               Every glass of fresh milk is crammed with calcium, providing kids with almost one third of the calcium they need every day to help them grow big and strong. Drink Nesquik as part of a varied, balanced diet and a healthy lifestyle.  -->
<!-- 		                 </li>	                -->
<!-- 			             </ul>   -->
	               
<!-- 	              </div> -->
	               <div class="clear"></div>
	               </div>
	               
	               
	         </div>
	         
	         <div class="home_footer">
                 <div class="home_footercon">
                   <div class="home_footerlogo"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/dotter_logo.png" width="22" name="" border="0"></div>
                   <div class="home_footertext">POWERED BY DOTTER IN ASSOCIATION<br/> WITH NESTLE   |   <a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span>SEE TERMS</span></a></div>
                 </div>
             </div>
	         
	    </div>
   
</div>
</html>


