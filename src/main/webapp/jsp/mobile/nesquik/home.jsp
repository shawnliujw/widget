<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld" %>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld" %>
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
<script type="text/javascript">
	$(document).ready(function(){
		setTimeout(q,10000);
	});
	function q(){
		$("#cc_div").fadeOut();
		$("#pr_div").fadeIn();
	}
	function showDiv(obj,divId){
		if($(divId).css('display')=='none'){
			var left=$(obj).parent().offset().left;
			var top = $(obj).parent().offset().top;
// 			var scrollTop = document.body.scrollTop;
			
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
			var left=$(obj).parent().offset().left;
			var top = $(obj).parent().offset().top;
			var height = $(divId).height();
// 			var scrollTop = document.body.scrollTop;
			$(divId).animate({
				'top':top,
				"height":0
			},function(){
				//$(divId).css('top','auto');
				$(divId).attr('style','width:100%;  position: absolute; z-index: 1000; text-align: center;display:none;');
			});
		}
	}
	
	 var _gaq = _gaq || [];
	 _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
	  _gaq.push(['_trackPageview', 'Home']);

	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
</script>
<!-- <style type="text/css"> -->
<!-- @font-face { -->

<!-- font-family: 'HelveticaRounded-BoldCondRegular'; -->
<%-- 	src: url('${pageContext.request.contextPath}/css/fonts/HelveticaRounded-BoldCond.otf'); --%>
<!-- 	src: local('HelveticaRounded-BoldCond Regular'),  -->
<!--               local('HelveticaRounded-BoldCond'),  -->
<%--               url('${pageContext.request.contextPath}/css/fonts/HelveticaRounded-BoldCond.woff') format('woff'),  --%>
<%--               url('${pageContext.request.contextPath}/css/fonts/HelveticaRounded-BoldCond.otf') format('truetype'),  --%>
<!--               url('HelveticaRounded-BoldCond.svg#HelveticaRounded-BoldCond') format('svg'); -->
<!-- }   -->
<!-- </style> -->
</head>
<div>
       <div class="home_header">
        <div  class="header_left">
        <img src="${pageContext.request.contextPath}/images/mobile/nesquik/logo.png" height="80px;"  border="0"></div>
        <div  class="header_right">
        <img src="${pageContext.request.contextPath}/images/mobile/nesquik/top02.png" height="24px;"  border="0"></div>       
        </div>
        <div class="line_block"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/line_blue.png" width="100%" height="10px;"  name="" border="0"></div>
        <div class="home_content">
             <div><img src="${pageContext.request.contextPath}/images/mobile/nesquik/pic_rabbit.png" width="100%" name="" border="0"></div>
             <div class="home_text">
                  Rich in calcium to help build strong bones
				  and teeth, new improved Nesquik now has
			      no artificial colours, flavours, sweeteners
				  or preservatives, and added Vitamin D to
				  help the body absorb the calcium in milk.
             </div>
             <div><img src="${pageContext.request.contextPath}/images/mobile/nesquik/pic_introduce.png" width="100%" name="" border="0"></div>
             <div class="home_hot">
                 <div class="home_pro"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/home_pro.png" width="100%" name="" border="0"></div>
                 <div class="home_pro_text">As the days get colder,<br/> try NEW Nesquik<br/> hot chocolate in the <br/>mornings! </div>
             <div class="clear"></div>
             </div>
             <div><img src="${pageContext.request.contextPath}/images/mobile/nesquik/pic_text.png" width="100%" name="" border="0"></div>
             
             <div style="width:100%; margin:13px 0 16px 0;">
                  <div class="drop_menu" onclick="showDiv(this,'#home_drop_list');">
                       OCADO
                  </div>
             </div>
                  <div id="home_drop_list" style="width:100%;  position: absolute; z-index: 1000; text-align: center;display:none;">
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
             
             <div class="home_footer">
                 <div class="home_footercon">
                   <div class="home_footerlogo"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/dotter_logo.png" width="22" name="" border="0"></div>
                   <div id="pr_div"  class="home_footertext" style="display:none;">POWERED BY DOTTER IN ASSOCIATION<br/> WITH NESTLE   |   <a href="${pageContext.request.contextPath}/nesquik/rtl/all/terms"><span>SEE TERMS</span></a></div>
                   <div id="cc_div" class="home_footertext" style="font-size: 8px; margin-top: -2px;">THIS WEBSITE USES COOKIES. CONTINUING TO USE THIS WEBSITE GIVES CONSENT TO COOKIES BEING USED.<br/> FOR MORE INFORMAITON - 
							<a style="color: #ffffff;" href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span>SEE TERMS</span> </a></div>
                 </div>
             </div>
        </div>
</div>
</html>


