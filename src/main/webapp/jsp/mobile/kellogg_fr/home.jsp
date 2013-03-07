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
 <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/cufon.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/Caecilia_LT_Std-Roman_italic_400.font.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/defineCufon_kellogg_fr_mobile.js"></script>
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
        <img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/logo.png"   border="0"></div>
        <div  class="header_right">
        <img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/top02.png"   border="0"></div>       
        </div>
        <div class="clear"></div>
        <div class="line_block"></div>
        <div class="home_content">
             <div><img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/pic_overview.png" width="100%" name="" border="0"></div>
             <div class="home_hot">
                 <div class="home_pro"><img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/home_pro.png" width="100%" name="" border="0"></div>
                 <div class="home_pro_text">
                   Dites «oui» à Special K de Kellogg en utilisant notre nouveau magasin en ligne. Découvrez la gamme de délicieux céréales et en-cas. Ajoutez les produits dans votre panier pour vos prochaines courses en ligne
                 </div>
             <div class="clear"></div>
             </div>
             <div class="home_text">
               <img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/home_intro.png"  name="" border="0">
             </div>
             
             <div style="width:100%; margin:13px 0 16px 0;">
                  <div class="drop_menu" onclick="showDiv(this,'#home_drop_list');">
                       AUCHAN
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
                   <div class="home_footerlogo"><img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/dotter_logo.png" width="22" name="" border="0"></div>
                   <div id="pr_div"  class="home_footertext" >EFFECTUÉ PAR DOTTER EN ASSOCIATION <br/>AVEC KELLOGG’S  -   <span>VOIR LES TERMES</span></div>
<!--                    <div id="cc_div" class="home_footertext" style="font-size: 8px; margin-top: -2px;">THIS WEBSITE USES COOKIES. CONTINUING TO USE THIS WEBSITE GIVES CONSENT TO COOKIES BEING USED.<br/> FOR MORE INFORMAITON -  -->
<%-- 							<a style="color: #ffffff;" href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span>SEE TERMS</span> </a></div> --%>
                 </div>
             </div>
        </div>
</div>
</html>


