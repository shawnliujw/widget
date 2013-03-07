<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld" %>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld" %>
<!DOCTYPE html >
<html> 
<head> 
            <title>Kellogg’s Special K Store</title> 
<meta name="description" content="Say ‘YES’ to Special K Biscuit Moments and other delicious   snacks using our Special K Snack Store."/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/pc/main_kellogg.css" rel="stylesheet" type="text/css" />
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
			animationLoop:false,//照片是否会循环
			slideshowSpeed:5000,//自动播放的速度
			startAt:0,//从第几张图片开始
			itemWidth: 380
		});
		setTimeout(q,10000);
	});
	
	function ctlActive(opt,obj){
		if(opt=='A'){
			$(".ctlActive").each(function(idx,item){
				$(item).removeClass("home_retailer_active");
			});
			$(obj).addClass("home_retailer_active");
		}else{
			$(obj).removeClass("home_retailer_active");
		}
	}
	function q(){
		$("#cc_div").hide();
		$("#pr_div").show();
	}
	

	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
	  _gaq.push(['_trackPageview', 'Home']);
	  
	  _gaq.push(['b._setAccount', 'UA-35779257-1']);
	  _gaq.push(['b._trackPageview', 'Home']);
	  
	  

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
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php",1);
piwikTracker.setDocumentTitle('Home');
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=1" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pc/kellogg/track.js"></script>
</head>
<body id="Home Page">
	<div id="BlowFishHomePage" class="blowfish_page_home">
	<div style="width: 800px;margin: 0 auto; text-align: center;height: 130px;">
	</div>
	<div style="width: 800px;margin: 0 auto; height:366px;  margin-top:-22px; text-align: center; font-size: 13px; color: #4a4d51; line-height: 15px;">
	</div>
      <!--     <div class="blowfish_home_header">
                   <div class="blowfish_logo" style="line-height: 0px;"><img src="${pageContext.request.contextPath}/images/pc/kellogg/logo_kellogg2.png"  height="149"  name="" border="0"></div>
                   <div style="float:right; line-height: 0px;" ><img src="${pageContext.request.contextPath}/images/pc/kellogg/home_header_right.png" height="101" name="" border="0"></div>
          </div>
          <div class="clear"></div>
          <div class="sch_home_content">
	              <div class="left_text">
	              <div class="home_des">
	              <img src="${pageContext.request.contextPath}/images/pc/kellogg/home_left_des.png"  name="" border="0">
	              </div>
	              </div>
	              <div style="padding-right:30px; text-align: right; float: right; margin-top: -30px;"><img src="${pageContext.request.contextPath}/images/pc/kellogg/home_group02.png"  name="" border="0"></div>              
	              <div class="clear"></div>
	              <div style="text-align: center; padding-top: 15px;">
	                 <img src="${pageContext.request.contextPath}/images/pc/kellogg/home_img.png"  name="" border="0">
	              </div>
	      </div>
	       -->
	          <div class="clear"></div>
	          <div class="sch_home_retailer">
	          
		         <div class="home_retailer_title">My preferred retailer:</div>
		          <c:if test="${fn:length(retailerList) == 0}">
	              	
		              <div class="home_retailer_logo00">
	              </c:if>
	              <c:if test="${fn:length(retailerList) == 1}">
	              	
		              <div class="home_retailer_logo01">
	              </c:if>
	              <c:if test="${fn:length(retailerList) == 2}">
	              	
		              <div class="home_retailer_logo02">
	              </c:if>
	              <c:if test="${fn:length(retailerList) == 3}">
	              	
		              <div class="home_retailer_logo03">
	              </c:if>
	              <c:if test="${fn:length(retailerList) == 4}">
	              	
		              <div class="home_retailer_logo04">
	              </c:if>
	              <c:if test="${fn:length(retailerList) == 5}">
	              	
		              <div class="home_retailer_logo05">
	              </c:if>
		             <ul>
		                <%-- <li><img src="${pageContext.request.contextPath}/images/logo_asda01.png" height="22"  name="" border="0"></li>
		                <li><img src="${pageContext.request.contextPath}/images/logo_ocado01.png" height="22"  name="" border="0"></li>
		                <li class="home_retailer_active"><img src="${pageContext.request.contextPath}/images/logo_sain01.png" height="22"  name="" border="0"></li>
		                <li><img src="${pageContext.request.contextPath}/images/logo_tesco01.png" height="22"  name="" border="0"></li>
		                <li><img src="${pageContext.request.contextPath}/images/logo_waitrose01.png" height="22"  name="" border="0"></li> --%>
		                
		                <c:forEach items="${retailerList}" var="retailer">
	                     	
	                    	<c:choose>
								<c:when test="${retailer.name eq defaultRetailer}">
									
					               <li class="ctlActive" onMouseOver="ctlActive('A',this);" onMouseOut="ctlActive('R',this);">
							<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${retailer.name}/${retailer.defaultCategory}/product"
							onClick='trackHomeEvent("${fn:replace(retailer.name,"'","~")}");'>			               
		               			 	<img src="${pageContext.request.contextPath}/images/logo_${fn:toLowerCase(retailer.name)}01.png"  height="22"  name="" border="0">
		               			 	</a>
		               			 	</li>

								</c:when>
								<c:otherwise>
									 <li class="ctlActive" onMouseOver="ctlActive('A',this);" onMouseOut="ctlActive('R',this);">
							<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${retailer.name}/${retailer.defaultCategory}/product"
							onClick='trackHomeEvent("${fn:replace(retailer.name,"'","~")}");'>			               
							 	<img src="${pageContext.request.contextPath}/images/logo_${fn:toLowerCase(retailer.name)}01.png"  height="22"  name="" border="0"/>
							</a>
							 </li>

								</c:otherwise>
							</c:choose>
	                     </c:forEach>
		                
		             </ul>
		         </div>
		        </div>
		     <div class="clear"></div>
		     
		     <div class="sch_homefooter" style="padding-top:32px; padding-left: 15px;">
					<div id="cc_div" style="" class="sch_textbox" >
						<img src="${pageContext.request.contextPath}/images/logo_dotter.png" height="14" name="" border="0">
							THIS WEBSITE USES COOKIES. CONTINUING TO USE THIS WEBSITE GIVES <br/>CONSENT TO COOKIES BEING USED. FOR MORE INFORMAITON - 
							<a style="color: #ffffff;" href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span>SEE TERMS</span> </a>
					</div>
				     <div id="pr_div" class="sch_textbox2"   style="display: none;">
	                       <img src="${pageContext.request.contextPath}/images/logo_dotter.png" height="16" name="" border="0">
	                       POWERED BY DOTTER IN ASSOCIATION WITH KELLOGG'S |  
	                       <a style="color: #ffffff;" href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span>SEE TERMS</span></a>
	                  </div>
	                  
	                 <a 	href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/help"> <div style="float: right; margin-top: -10px;">
	                     <div class="input_btn00" style="width: 220px; height:26px; line-height:26px; margin-right:74px;font-family:Bookman Old Style, Georgia,Times New Roman, Serif;"> For help using our store, please click here
	                  </div></a> 
	                
		     </div>
		     
		     
	       </div>
</body>
</html>