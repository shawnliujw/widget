<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld"%>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld"%>
<!DOCTYPE html >
<html > 
<head> 
            <title>JOHNSON&#39;S&reg; Baby</title> 
<meta name="description" content="Say âYESâ to Special K Biscuit Moments and other delicious   snacks using our Special K Snack Store."/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/pc/main_johnsonbaby.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/jquery/flexSlider/flexslider.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/pc/johnsonbaby/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/pc/johnsonbaby/track.js"></script>
    <script type="text/javascript">
    
    
    var brandName = "${brandModel['brandName']}";
	var retailerName = "${retailerName}";
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
	  _gaq.push(['_trackPageview',retailerName+'/thanks']);
	  _gaq.push(['b._setAccount', 'UA-35779257-5']);
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
		  return;
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
	  
		WebFontConfig = { fontdeck: { id: '27833' } };

		(function() {
		  var wf = document.createElement('script');
		  wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
		  '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
		  wf.type = 'text/javascript';
		  wf.async = 'true';
		  var s = document.getElementsByTagName('script')[0];
		  s.parentNode.insertBefore(wf, s);
		})();
    </script>
    
    <!-- Piwik   -->
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://piwik.dotter.me/" : "http://piwik.dotter.me/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php",5);
piwikTracker.setDocumentTitle(retailerName+'/thanks');
trackingAddToBasket(retailerName,basketName);
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {alert(err)}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=5" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->

</head>
<body id="Thanks Page">
	
	<div style="margin: 0 auto; width:800px; height:600px; background: #ffffff;">
	<div class="blowfish_header2">
				<div class="header_logo" style="padding-left: 94px;">
							<a href="${pageContext.request.contextPath}/${brandModel['brandName']}">
								<img src="${pageContext.request.contextPath}/${brandModel['logoUrl']}" height="129" name="" border="0"> </a>
				</div>
		</div>
	
	<div class="openstore_block2">
			   <div class="tks_left">
			
			
				<div style="width:390px; margin:0 auto; padding:38px 0 0 0;">
					<ul style="padding-left:35px;">
						<li class="thank_title">thank you</li>
						<li  class="thanks_text" style="padding-top:15px;" >Your selected products have been<br />
						added to your  ${retailerName}  basket.
						<br /><br />
						To view your basket or shop the full JOHNSON'S<span style="vertical-align:super; font-size:7px; text-decoration: none;">&reg;</span> Baby range click here:
					</li>
					<li style="padding-top:20px">
								<!--  <a href="${pageContext.request.contextPath}/${basketUrl}">-->
								
												<img  style=" cursor:pointer;" 
													src="${pageContext.request.contextPath}/images/logo_${retailerName}.png"
													height="40px" border="0" onClick="goToRetailer(this)" class="${retailerName}">
												<!--  </a>-->
						</li>
					 </ul>
			  </div>
	
			  <div style="width: 400px;margin:0 auto; ">
			  
			  <ul>
			  <li  class="thanks_text1" style=" padding-left:35px;padding-top: 24px; width:360px; margin:0 auto; ">Please note that offers are valid until 11/02/2013.  <br/>
Prices may have changed if your order is confirmed and put together for delivery after this date</li>
			    <li  style="padding-top: 28px;padding-left:35px;">
			    <table width="400" border="0" cellspacing="0" cellpadding="0" style="margin-left:-11px">

  <tr>
    <td width="285"  class="thanks_text2">To learn more about the proven mild & gentle
JOHNSON'S<span style="vertical-align:super; font-size:7px; color:#007ac4;text-decoration: none;">&reg;</span> Baby product range, and for baby 
care videos, tips & advice, <a href="http://www.johnsonsbaby.co.uk" target="_blank"><span style="color:#007ac4;text-decoration: underline;">click here</span>  </a></td>
    <td width="95"> <a href="http://www.johnsonsbaby.co.uk" target="_blank"><img src="${pageContext.request.contextPath}/${brandModel['logoUrl']}" height="55" name="" border="0"> </a> </td>
  </tr>
</table></li>
			  </ul>
			      
			  </div>
			</div>
			<div class="tks_right">
						<img src="${pageContext.request.contextPath}/images/pc/johnsonbaby/tks_right.jpg" border="0">
			</div>
	
	
	
	
	</div>
	
		<div class="clear"></div>
  <div  class="sch_footer1" style="margin-top: -36px;">
					<ul>
					<li style="width: 22px; height: 30px; float: left; padding-top: 2px;">
					<img
								src="${pageContext.request.contextPath}/images/logo_dotter.png"
								height="18" name="" border="0">
					</li>
					<li style="float: left;margin-top:0px;font-size:7px; width: 335px;line-height: 9px;">
					
					THIS SERVICE IS PROVIDED BY DOTTER AND THE PRODUCTS ARE BEING OFFERED FOR SALE BY TESCO AND NOT JOHNSON & JOHNSON LTD. FOR MORE INFORMATION, INCLUDING DOTTER’S PRVICACY POLICY,  <a
								style="color: #ffffff;"
								href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span>SEE
									TERMS</span> </a>
					</li>
					</ul>
						
					</div>
	
	</div>
	
</body>
</html>