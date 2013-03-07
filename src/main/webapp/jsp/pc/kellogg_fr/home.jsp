<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld" %>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld" %>
<!DOCTYPE html >
<html> 
<head> 
            <title>Kellogg’s Special K Snack Store</title> 
<meta name="description" content="Say ‘YES’ to Special K Biscuit Moments and other delicious   snacks using our Special K Snack Store."/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/pc/main_kellogg_fr.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
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

	  _gaq.push(['b._setAccount', 'UA-35779257-6']);
	  _gaq.push(['b._trackPageview', 'Home']);
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
piwikTracker.setDocumentTitle('Home');
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=4" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pc/kellogg_fr/track.js"></script>
</head>
<body id="Home Page">
	<div id="BlowFishHomePage" class="blowfish_page">
          <div class="blowfish_home_header">
                   <div class="blowfish_logo" style="line-height: 0px;"><img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/logo_kellogg2.png"  height="151"  name="" border="0"></div>
         
                   <div class="sch_home_top">
                   <ul>
                   <li style="float: right; height: 92px; width: 658px;">
                   <img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/header_right.png" height="92" name="" border="0">
                  </li>
                  <li style=" padding-top:30px;">
                  
Kellogg’s Special K vous propose toute une gamme de délicieux céréales et en-cas céréaliers dont vous pouvez profiter pendant toute la journée. 
                  </li>
                  
                  <li style=" padding-top:15px;">
Grâce aux 11 variétés de céréales Special K et toute une gamme en-cas céréaliers  au chocolat ou aux fruits, c’est facile de varier les plaisirs, bye-bye la routine.
                  </li>
                  
                  <li style=" padding-top:5px;"> <img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/home01.png" height="31" name="" border="0"></li>
                  
        <li style=" padding-top:8px;">             
        C’est facile d’utiliser notre NOUVEAU magasin en ligne Special K. Découvrez la gamme de délicieux céréales et en-cas. Ajoutez les produits dans votre panier pour vos prochaines courses en ligne.</li>
                       
                  <li style=" padding-top:8px;"> 
                  <img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/home02.png" height="174" name="" border="0"></li>
              
                <li style=" padding-top:2px; ">
        Pour voir la disponibilité, prix et offres, veuillez cliquer sur votre magasin préféré ci-dessous.  </li>
                   </ul>
                   </div>     
          </div>
          <div class="clear"></div>
          
          
     <!--      <div class="sch_home_content">
	              <div class="left_text">
	              <div class="home_des" style="width: 550px;"><span style="font-family:Arial, Helvetica, sans-serif; font-size: 13px;">Just select your preferred retailer and explore the range of tempting sweet and savoury snacks you don’t have to say ‘no’ to.<br/>
Fill your shopping basket with our yummy snacks, using the    <img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/icon_add.png" height="14" name="" border="0">    button.</span>
	              </div>
	              </div>
	              <div style="margin-top:33px;"><img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/home_group.png"  name="" border="0"></div>              
	      </div>
	          <div class="clear"></div>
	          
	   -->        
	          <div class="sch_home_retailer">
	          
		         <div class="home_retailer_title" style="padding-top: 3px;"> <img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/home03.png" height="15" name="" border="0"></div>
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
									
					               <li class="ctlActive" onmouseover="ctlActive('A',this);" onmouseout="ctlActive('R',this);">
							<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${retailer.name}/${retailer.defaultCategory}/product"
							onClick='trackHomeEvent("${fn:replace(retailer.name,"'","~")}");'>			               
		               			 	<img src="${pageContext.request.contextPath}/images/logo_${fn:toLowerCase(retailer.name)}01.png"  height="22"  name="" border="0">
		               			 	</a>
		               			 	</li>

								</c:when>
								<c:otherwise>
									 <li class="ctlActive" onmouseover="ctlActive('A',this);" onmouseout="ctlActive('R',this);">
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
		     
		     <div class="sch_homefooter">
	      <div  class="sch_textbox2" >
	                       <img src="${pageContext.request.contextPath}/images/logo_dotter.png" height="16" name="" border="0">
	                     EFFECTUÉ PAR DOTTER EN ASSOCIATION AVEC KELLOGG’S -
	                       <a style="color: #ffffff;" href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span>TERMES</span></a>
	                  </div>
	                  
	                 <a 	href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/help"> <div style="float: right;">
	                     <input class="input_btn01" style="width: 330px; margin-right:15px;" type="button" value="Si vous avez besoin d’aide pour utiliser notre service, cliquez ici
" name=""/>
	                  </div></a>
	                
		     </div>
		     
		     
	       </div>
</body>
</html>