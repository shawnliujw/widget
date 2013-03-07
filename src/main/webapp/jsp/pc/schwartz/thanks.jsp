<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld"%>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld"%>
<!DOCTYPE html >
<html  xmlns:og="http://ogp.me/ns#" 
xmlns:fb="https://www.facebook.com/2008/fbml"> 
<head> 
            <title>Schwartz Web Store</title> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/pc/main_schwartz.css" rel="stylesheet" type="text/css" />
<link	href="${pageContext.request.contextPath}/jquery/flexSlider/flexslider.css"	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/pc/schwartz/common.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/cufon.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/Caecilia_LT_Std-Roman_italic_400.font.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/cufon/defineCufon.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pc/schwartz/track.js"></script>
<script type="text/javascript">
    
    var brandName = "${brandModel['brandName']}";
	var retailerName = "${retailerName}";
    var _gaq = _gaq || [];
     _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
	  _gaq.push(['_trackPageview',retailerName+'/thanks']);

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
					'Schwartz Web Store', // affiliation or store name
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
		});

		_gaq.push([ '_trackTrans']); // submits transaction to
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
			var title	= "Schwartz Web Store";
			var name	= 'Share - ' + title;
			var w		= 640;
			var h		= 360;
			var l		= (screen.width - w) / 2;
			var t		= (screen.height - h) / 2;
			var u		= "https://www.facebook.com/SchwartzCookingClub/app_458885634147627"; // this is the URL of the page that user will be taken too when clicked
			var d		= "I just added a little flavour to my shopping with the new Schwartz Web Store."; // the text that will be displayed under the title in the timeline
			var i		= "http://apps.dotter.me/store/blowfish_images/schwartz/schwartz_facebook_share.png"; // the URL of the thumbnail image in the timeline

			var url		= "http://www.facebook.com/sharer.php?s=100&p[url]="+u+"&p[images][0]="+i+"&p[title]="+title+"&p[summary]="+d;

			window.open(url, name, 'width='+w+',height='+h+',left='+l+',top='+t+',scrollbars=1');
	    }
	  
	  function shareOnTwitter(){
		  
		  var width  = 575,
	        height = 400,
	        left   = ($(window).width()  - width)  / 2,
	        top    = ($(window).height() - height) / 2,
	        opts   = 'status=1' +
	                 ',width='  + width  +
	                 ',height=' + height +
	                 ',top='    + top    +
	                 ',left='   + left;
	        var url    = 'https://twitter.com/share?url=https://www.facebook.com/SchwartzCookingClub/app_458885634147627&via=Schwartz Web Store'+
	        		'&text=I just added a little flavour to my shopping with the new Schwartz Web Store.';
	    
	    window.open(url, 'twitter', opts);
		  
	  }
    </script>
   <!-- Piwik --> 
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://piwik.dotter.me/" : "http://piwik.dotter.me/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 2);
trackingAddToBasket(retailerName,current);
localStorage.removeItem(basketName);
piwikTracker.setDocumentTitle(retailerName+"/thanks");
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {
	//alert(err);
}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=2" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->

</head>
<body id="Thanks Page">
	<div id="" class="blowfish_page">
		    <div class="blowfish_home_header">
			<div class="blowfish_logo">
			<a href="${pageContext.request.contextPath}/${brandModel['brandName']}">
				<img src="${pageContext.request.contextPath}/blowfish_images/schwartz/logo_schwartz.png"
					height="126" name="" border="0">
					</a>
			</div>
		   </div>
		<div class="clear"></div>
		
		
		
		<div class="sch_home_content">
			<div class="left_text02">

				<table width="370" border="0" cellspacing="0" cellpadding="0">
					
					<tr>
						<td colspan="2"  height="20" class="thank_title" >
						THANK YOU
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" height="40"></td>
					</tr>
					<tr>
						<td colspan="2" style="line-height: 20px;font-size: 13px; color:#F16023;">Your selected products have been added to
							your<br/> ${retailerName} Basket.</td>
					</tr>
					<tr>
						<td height="50" width="50%" style="font-size: 13px; color:#F16023;">To view your basket, click here:</td>
						<td align="left">
<%-- 						<a href="${pageContext.request.contextPath}/${basketUrl}"> --%>
						<img onclick="goToRetailer(this)" class="${retailerName}" style="padding-left: 5px;"
							src="${pageContext.request.contextPath}/images/logo_${retailerName}.png"
							width="122px;" border="0">
<!-- 						</a> -->
						</td>
					</tr>
				</table>



			</div>
			<div class="right_image02" >
				
				<table width="378" border="0" cellspacing="0" cellpadding="0"  style="padding-left: 8px;">
  <tr>
    <td height="20" colspan="4"  class="thank_title" >HAVE YOU TRIED?</td>
  </tr>
  <tr>
    <td height="25" colspan="4">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" valign="bottom"><img src="${pageContext.request.contextPath}/images/pc/schwartz/thspic01.jpg" width="83"  name="" border="0"></td>
    <td align="center" valign="bottom"><img src="${pageContext.request.contextPath}/images/pc/schwartz/thspic02.jpg" width="83"  name="" border="0"></td>
    <td align="center" valign="bottom"><img src="${pageContext.request.contextPath}/images/pc/schwartz/thspic03.jpg" width="83"  name="" border="0"></td>
    <td align="center" valign="bottom"><img src="${pageContext.request.contextPath}/images/pc/schwartz/thspic04.jpg" width="83"  name="" border="0"></td>
  </tr>
  <tr>
    <td height="8"></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td align="center">
    <a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/Recipe%20Inspiration/product">
    <div class="ths_botton">RECIPE<br />  INSPIRATIONS</div>
    </a> </td>
    <td align="center">
    <a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/Bag%20%27n%20Season/product">
    <div class="ths_botton">BAG 'N<br /> SEASON</div>
    </a></td>
    <td align="center">
    <a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/Slow%20Cookers/product">
    <div class="ths_botton">SLOW<br /> COOKERS</div>
    </a></td>
    <td align="center">
    <a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/Winter Specials/product">
    <div class="ths_botton"> WINTER  <br /> SPECIALS</div>
    </a></td>
  </tr>
</table>
				
				
			</div>
			
				</div>
			<div class="clear"></div>
			
			
			  <div class="sch_thankbot">
			
			<div class=sch_tks_retailer>


				<table width="800" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="50"></td>
						<td width="70" valign="top">Share on</td>
						<td width="60">
						<!-- <a href="https://twitter.com/share" class="twitter-share-button" data-lang="en" data-via="Schwartz Web Store"
						data-text="I just added a little flavour to my shopping with the new Schwartz Web Store."
						data-url="https://www.facebook.com/SchwartzCookingClub/app_458885634147627" data-size="large"> -->
						<img onclick="shareOnTwitter();"
							src="${pageContext.request.contextPath}/images/tk_t.jpg"
							width="57px;" border="0"><!--  </a> -->
						</td>
						<td width="60">
						<img  onclick="share();"
							src="${pageContext.request.contextPath}/images/tk_f.jpg"
							width="57px;" border="0"></img>
						</td>
						<td width="70"></td>
						<td width="70" valign="top">See us on</td>
						<td width="105">
						<a target="_blank" href="http://www.youtube.com/user/schwartzads?feature=results_main">
						<img
							src="${pageContext.request.contextPath}/images/tk_y.jpg"
							width="102px;" border="0">
							</a>
						</td>
						<td width="85"></td>
						<td width="60" valign="top">Back to</td>
						<td width="120">
						<a target="_blank" href="http://www.schwartz.co.uk">
						<img
							src="${pageContext.request.contextPath}/images/pc/schwartz/tk_s.jpg"
							width="118px;" border="0">
							</a>
						</td>
						
						<td width="50"></td>
					</tr>
				</table>
			</div>
			
			
			
			<div class="clear"></div>
			
             <div class="sch_footer" style="margin-top:25px;">
	                       <img src="${pageContext.request.contextPath}/images/logo_dotter.png" height="18" name="" border="0">
	                       POWERED BY DOTTER IN ASSOCIATION WITH SCHWARTZ |  <a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span style="color:#ffffff;">SEE TERMS</span></a>
	                  </div>

				</div>
        	
</body>
</html>