<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld" %>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld" %>
<!DOCTYPE html >
<html> 
<head> 
            <title>Schwartz Web Store</title> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/pc/main_schwartz.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/jquery/flexSlider/flexslider.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/flexSlider/jquery.flexslider-min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/cufon.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/Caecilia_LT_Std-Roman_italic_400.font.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/defineCufon.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.flexslider').flexslider({
			animation:"slide",
			directionNav:false,//是否显示导航按钮
			reverse:false,//是否有反向动画
			animationLoop:true,//照片是否会循环
			slideshowSpeed:5000,//自动播放的速度
			startAt:0,//从第几张图片开始
			itemWidth: 380
		});
		setTimeout(q,10000);
	});
	
	function ctlActive(opt,obj){
		var className=$(obj).attr("class");
		if(opt=='A'){
			$(obj).attr("class",className+"open");
		}else{
			$(obj).attr("class",className.replace("open",""));
		}
	}
	function q(){
		$("#cc_div").hide();
		$("#pr_div").show();
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

<!-- Piwik --> 
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://piwik.dotter.me/" : "http://piwik.dotter.me/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 2);
piwikTracker.setDocumentTitle("Home");
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=2" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pc/schwartz/track.js"></script>
</head>
<body id="Home Page">
	<div id="BlowFishHomePage" class="blowfish_page">
          <div class="blowfish_home_header">
                   <div class="blowfish_logo"><img src="${pageContext.request.contextPath}/blowfish_images/schwartz/logo_schwartz.png"  height="126"  name="" border="0"></div>
          </div>
          <div class="clear"></div>
          <div class="sch_home_content">
                  <div class="left_text" style="padding-top:40px;">
		                <div class="home_des" style="text-indent: 0;">
		                <h2 style="font-size: 16px;font-weight: bold;">Click a new Schwartz recipe mix into your weekly shopping basket  at the Schwartz webstore</h2>
		                <br/>
		                Simply select your favourite retailer, click to basket and it will be waiting in your basket next time you place your online grocery order.
		                </div>
	              </div>
	              <div class="right_image">
	                    <div style="width:100%; text-align: center; color:#f16023;"><h2 style="font-size: 16px;">HAVE YOU TRIED?</h2></div>
						<div class="flexslider">
							<ul class="slides">
									<li><img src="${pageContext.request.contextPath}/images/pc/schwartz/slider_01.png"/>
									<div class="home_slider_btn">BAG ‘N SEASON</div>
									</li>
									<li><img src="${pageContext.request.contextPath}/images/pc/schwartz/slider_02.png" />
									<div class="home_slider_btn">SLOW COOKERS</div>
									</li>
									<li><img src="${pageContext.request.contextPath}/images/pc/schwartz/slider_03.png" />
									<div class="home_slider_btn">RECIPE INSPIRATIONS</div>
									</li>
									<li><img src="${pageContext.request.contextPath}/images/pc/schwartz/slider_04.png" />
									<div class="home_slider_btn">WINTER SPECIALS</div>
									</li>
							</ul>
						</div>
				  </div>
				  <div class="clear"></div>
		          <div class="sch_home_content_text" style="margin-top:5px;">
		               To start, please select your preferred retailer below
	              </div>
	          </div>
	          
	          
	          <div class="sch_homebot">
	          
	          <div class="sch_homebotdev">
	          <ul>
<%-- 	          <li class="sch_homebotli01"><img src="${pageContext.request.contextPath}/images/logo_asda02.png"  height="57"   border="0" ></li> --%>
<%-- 	          <li class="sch_homebotli01"><img src="${pageContext.request.contextPath}/images/logo_ocado02.png"  height="57"   border="0" ></li> --%>
<%-- 	          <li class="sch_homebotli02"><img src="${pageContext.request.contextPath}/images/logo_sainsbury's02.png"  height="57"   border="0" ></li> --%>
<%-- 	          <li class="sch_homebotli01"><img src="${pageContext.request.contextPath}/images/logo_tesco02.png"  height="57"   border="0" ></li> --%>
<%-- 	          <li class="sch_homebotli01"><img src="${pageContext.request.contextPath}/images/logo_waitrose02.png"  height="57"   border="0" ></li>	           --%>
	          <c:forEach items="${retailerList}" var="retailer">
	                     
	                    		<c:choose>
								<c:when test="${retailer.name eq defaultRetailer}">
					               <li class="sch_homebotli0${fn:length(retailerList)}" onmouseover="ctlActive('A',this);" onmouseout="ctlActive('R',this);">
							<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${retailer.name}/${retailer.defaultCategory}/product"
							onClick='trackHomeEvent("${fn:replace(retailer.name,"'","~")}");'>			               
		               			 	<img  src="${pageContext.request.contextPath}/images/logo_${fn:toLowerCase(retailer.name)}02.png"  height="57"  name="" border="0">
		               			 	</a>
		               			 	</li>
								</c:when>
								<c:otherwise>
									 <li class="sch_homebotli0${fn:length(retailerList)}" onmouseover="ctlActive('A',this);" onmouseout="ctlActive('R',this);">
							<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${retailer.name}/${retailer.defaultCategory}/product"
							onClick='trackHomeEvent("${fn:replace(retailer.name,"'","~")}");'>			               
							 	<img  src="${pageContext.request.contextPath}/images/logo_${fn:toLowerCase(retailer.name)}02.png"  height="57"  name="" border="0"/>
							</a>
							 </li>

								</c:otherwise>
								</c:choose>
	                     </c:forEach>
	          </ul>
	          
	          </div>
	         
		         
		           <div class="clear"></div>
		               <div class="sch_homefooter" style="padding-left: 15px;">
				<div id="cc_div" class="sch_textbox" >
					<img src="${pageContext.request.contextPath}/images/logo_dotter.png" height="14" name="" border="0">
						THIS WEBSITE USES COOKIES. CONTINUING TO USE THIS WEBSITE GIVES CONSENT TO COOKIES BEING USED. FOR MORE INFORMAITON - 
						<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span style="color:#ffffff;">SEE TERMS</span> </a>
				</div>
				     <div id="pr_div" class="sch_textbox2"   style="display: none;">
	                       <img src="${pageContext.request.contextPath}/images/logo_dotter.png" height="16" name="" border="0">
	                       POWERED BY DOTTER IN ASSOCIATION WITH SCHWARTZ |  
	                       <a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span style="color:#ffffff;">SEE TERMS</span></a>
	                  </div>
		     </div>
	          </div>
	          
	          
	          
	          
	          
	          
	          
	          
	  
		     
	       </div>
</body>
</html>