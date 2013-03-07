<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld"%>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld"%>
<!DOCTYPE html >
<html xmlns:og="http://ogp.me/ns#" 
xmlns:fb="https://www.facebook.com/2008/fbml"> 
<head> 
            <title>Kellogg’s Special K Snack Store</title> 
<meta name="description" content="Say ‘YES’ to Special K Biscuit Moments and other delicious   snacks using our Special K Snack Store."/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/pc/main_kellogg_fr.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/jquery/flexSlider/flexslider.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/pc/kellogg_fr/common.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/cufon.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/Caecilia_LT_Std-Roman_italic_400.font.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/defineCufon.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/pc/kellogg/track.js"></script>
    <script type="text/javascript">
    
    
    var brandName = "${brandModel['brandName']}";
	var retailerName = "${retailerName}";
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
	  _gaq.push(['_trackPageview',retailerName+'/thanks']);
	  _gaq.push(['b._setAccount', 'UA-35779257-6']);
	  _gaq.push(['b._trackPageview',retailerName+'/thanks']);
		var transId = (new Date()).getTime();
		var totalPrice = 0.00;

		var basketName = retailerName + brandName + "Basket";
		var current = getModelFromLocal(basketName, true);
		$(current)
				.each(
						function(index, item) {
								totalPrice += parseFloat(item.price)
										* parseInt(item.quantity);
						});
		_gaq.push([ '_addTrans', transId, // order ID - required
					'Store Special K', // affiliation or store name
					totalPrice, // total - required
					'', // tax
					'', // shipping
					'', // city
					'', // state or province
					'' // country
				]);
		_gaq.push([ 'b._addTrans', transId, // order ID - required
					'Store Special K', // affiliation or store name
					totalPrice, // total - required
					'', // tax
					'', // shipping
					'', // city
					'', // state or province
					'' // country
				]);
		$(current).each(function(index, item) {
				_gaq.push([ '_addItem', transId, // order ID - // required
							item.productId, // SKU/code - required
							item.title, // product name
							retailerName, // category or variation
							item.price, // unit price - required
							item.quantity // quantity - required
						]);
				_gaq.push([ 'b._addItem', transId, // order ID - // required
							item.productId, // SKU/code - required
							item.title, // product name
							retailerName, // category or variation
							item.price, // unit price - required
							item.quantity // quantity - required
						]);
		});

		_gaq.push([ '_trackTrans']); // submits transaction to
		_gaq.push([ 'b._trackTrans']); // submits transaction to
										// the Analytics servers
		//localStorage.removeItem(basketName);
	  
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	  
	  /*share link on facebook timeline
		*/
		function share()
	    {
	        var title = "Special K Snack Store";
	        var name	= 'Share - ' + title;
	        var w		= 640;
	        var h		= 360;
	        var l		= (screen.width - w) / 2;
	        var t		= (screen.height - h) / 2;
	        //https://www.facebook.com/myspecialkuk?fref=ts
	        var destopUrl = "https://www.facebook.com/myspecialkuk/app_243243292470110";
	        
	        var url		= "http://www.facebook.com/sharer/sharer.php?u="+destopUrl+"&"+title;
	        
	        window.open(url, name, 'width='+w+',height='+h+',left='+l+',top='+t+',scrollbars=1');
	    }
    </script>
    
    <!-- Piwik  -->
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://piwik.dotter.me/" : "http://piwik.dotter.me/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php",4);
piwikTracker.setDocumentTitle(retailerName+'/thanks');
trackingAddToBasket(retailerName,basketName);
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {alert(err)}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=1" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->

</head>
<body id="Thanks Page">
	
	<div style="margin: 0 auto;background:url(${pageContext.request.contextPath}/images/pc/kellogg_fr/thankyou_bg.jpg); width:800px; height:600px;">
	
	
	<div class="openstore_block2">
				<div class="sch_block_left">
					<div style="padding-left:30px;padding-top:20px width:289px;height:365px;">
					
					<a href="${pageContext.request.contextPath}/${brandModel['brandName']}"><img  
							src="${pageContext.request.contextPath}/images/pc/kellogg_fr/ths_logo.png"
							width="289px;" border="0"> 
							
							</a></div></div>
	
	
	
	
	
	<div class="sch_block_right">
	
	
		<div style="padding:190px 40px 0 150px;">
	<ul>
	<li class="thank_title">Merci</li>
	<li  class="thanks_text">Vos produits sélectionnés ont été 
ajoutés à votre panier avec  ${retailerName}
<br /><br />
Pour afficher votre panier, cliquez ici:
<br /><br />
		<!--  <a href="${pageContext.request.contextPath}/${basketUrl}">-->
		
						<img  style="padding-left: 30px; cursor:pointer;" 
							src="${pageContext.request.contextPath}/images/logo_${retailerName}.png"
							heihgt="40px;" border="0" onclick="goToRetailer(this)" class="${retailerName}">
						<!--  </a>-->
<li>
	</ul>
	
	</div>
	
	
	
	
	
	</div>
	
	
	
	
	</div>
	

	
	<div class="thank_bot">
	<table width="350" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="30"></td>
						<td width="110" >PARTAGER AVEC</td>
						<td width="40"><a href="#" onclick="share();">
						<img
							src="${pageContext.request.contextPath}/images/pc/kellogg_fr/bot01.jpg"
							width="45px;" border="0"> </a>
						</td>
						
						<td width="10"></td>
						<td width="80">RETOURNER À</td>
						<td width="100">
						<a target="_blank" href="http://myspecialk.co.uk">
						<img
							src="${pageContext.request.contextPath}/images/pc/kellogg_fr/bot02.jpg"
							width="92px;" border="0">
						</td>
						</a>
						
					</tr>
				</table>
	</div>
	
	
		<div class="clear"></div>
   <div class="sch_footer" style="margin-top: 16px;">
	                       <img src="${pageContext.request.contextPath}/images/logo_dotter.png" height="18" name="" border="0">
	                      EFFECTUÉ PAR DOTTER EN ASSOCIATION AVEC KELLOGG’S - <a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span style="color:#ffffff;">TERMES</span></a>
	                  </div>
	
	</div>
	
</body>
</html>