<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld" %>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld" %>
<!DOCTYPE html>
<html> 
<head>
<title>Openstore</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/mobile/main_nesquik.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mobile/nesquik/common.js"></script>
<script src="${pageContext.request.contextPath}/js/mobile/nesquik/basket_multiply.js"></script>
<script src="${pageContext.request.contextPath}/js/mobile/nesquik/basket_mpupa.1.0.js"></script>
<script src="${pageContext.request.contextPath}/js/mobile/nesquik/atb_function.js"></script>

<script type="text/javascript">
var brandName = "${brandModel['brandName']}";
var retailerName = "${defaultRetailer}";
var defaultRetailer="${defaultRetailer}";
var path='${pageContext.request.contextPath}';
var _gaq = _gaq || [];
_gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
_gaq.push(['_trackPageview', retailerName+'/Basket']);

(function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();

$(document).ready(function(){
	initBasketPageWithProduct();
});
</script>
</head>
<div id="basket_page">
	    <div>
		      <div class="header_block">
		          <div class="header_logo" onclick="window.location.href='${pageContext.request.contextPath}/nesquik'"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/img_logo.png" height="64px" name="" border="0"></div>
		          <div class="header_retailer"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/logo_${fn:toLowerCase(defaultRetailer)}.png" height="26px" name="" border="0"></div>
		          <div class="clear"></div>
		      </div>
		      <div class="clear"></div>
		      <div class="line_block"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/line_blue.png" width="100%" height="10px" name="" border="0"></div>
	    </div>
	    
	    <div class="basket_content">
	          <div class="basket_panel">
	                 <div>
	                     <ul>
	                         <li class="bsk_title">SELECTED PRODUCTS</li>
	                         <li class="bsk_back"><input class="" type="button" onclick="javascript:window.history.go(-1);"  value="Back" name=""/></li>
	                     </ul>
	                     <div class="clear"></div>
	                 </div>
	                 	<div id="exampleData" style="display: none;">
		                      <div class="bsk_proname">
		                          <ul>
	  		                          <li ></li>
	  		                          <li style="font-weight: bold;"></li>
		                          </ul>
		                      </div>
		                      <div class="bsk_proprice">
		                         <ul>
		                             <li><img src="${pageContext.request.contextPath}/images/mobile/nesquik/icon_bskinfo.png" width="38px" height="34px" name="" border="0"></li>
		                             <li style="width:50px; line-height: 34px;"></li>
		                             <li><input type="hidden"/><img src="${pageContext.request.contextPath}/images/mobile/nesquik/icon_del.png" onclick="removeItemById(this);" width="38px;" height="34px" name="" border="0"></li>
		                         </ul>
		                      </div>
		                      <div class="clear"></div>
	                      </div>
	                 <div id="basketList">
	                 </div>
	                 <div class="bsk_total">
	                     <ul>
	                        <li class="bsk_total_title">Total</li>
	                        <li class="bsk_total_price" id="totalPrice">£4.00</li>
	                     </ul>
	                 </div>
	                 <div class="clear"></div>
	          </div>
	          
	          <div class="bsk_accblock">
	              <div class="acc_text">Add them to your next online shop by entering the following details.</div>
	              <div class="acc_info">
		               <ul>
		                   <li><input value="" class="bsk_input" type="text" id="email" name="" placeholder="${defaultRetailer} username"/></li>
		                   <li><input value="" class="bsk_input" type="text" id="password" name="" placeholder="${defaultRetailer} password"/></li>
		                   <li class="acc_exc">
		                      <label>
		                         <input type="checkbox" class="acc_exc_box"> Yes to Nesquik exclusive offers
		                      </label>
		                   </li>
		                   <li class="bsk_btn"><input class="" type="button" onclick="loginAndAddToBasket();"  value="ADD TO ${fn:toUpperCase(defaultRetailer)} BASKET" name=""/></li>
		               </ul>
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


