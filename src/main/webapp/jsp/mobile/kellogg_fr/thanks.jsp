<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld" %>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld" %>
<!DOCTYPE html>
<html> 
<head>
<title>Openstore</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/mobile/main_kellogg_fr.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mobile/kellogg_fr/common.js"></script>
 <script type="text/javascript">
    
    function getModelFromLocal(modelName,flag) {
    	var str = localStorage.getItem(modelName);
    	if (!isNotEmpty(flag)) { flag = false; }
    	if (isNotEmpty(str)) {
    		if (flag) {
    			try {
    				return JSON.parse(str);
    			} catch (e) {
    				alert("Error when call method 'getBasketListForLocal' from basket.js----" + e.toString());
    			}
    		} else {
    			return str;
    		}
    	} else {
    		return new Array();
    	}
    }
    
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
		});

		_gaq.push([ '_trackTrans']); // submits transaction to
										// the Analytics servers
		localStorage.removeItem(basketName);
	  
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	  
	  /*share link on facebook timeline
		*/
		function share()
	    {
	        var title = "Nesquik Snack Store";
	        var name	= 'Share - ' + title;
	        var w		= 640;
	        var h		= 360;
	        var l		= (screen.width - w) / 2;
	        var t		= (screen.height - h) / 2;
	        //https://www.facebook.com/myspecialkuk?fref=ts
	     //   var destopUrl = "http://myspecialk.co.uk/snackstore";
	        
	       // var url		= "http://www.facebook.com/sharer/sharer.php?u="+destopUrl+"&"+title;
	        
	       // window.open(url, name, 'width='+w+',height='+h+',left='+l+',top='+t+',scrollbars=1');
	    }
    </script>
</head>
<div id="thanks_page">
        <div class="home_header">
        <div  class="header_left">
        <img onclick="window.location.href='${pageContext.request.contextPath}/specialk-fr'" src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/logo.png"  border="0"></div>
        <div  class="header_right">
        <img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/top02.png"  border="0"></div>       
        </div>
        <div class="line_block"></div>
        <div class="thanks_content">
	       <div class="thanks_main">
			        <ul>
				        <li class="thanks_title"><img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/tks_merci.png" border="0"></li>
				        <li class="thanks_li02">
				        Vos produits sélectionnés ont été ajoutés à <br/>
						votre panier avec Carrefour.<br/>
						<br/>
						<br/>
						Pour afficher votre panier, <br/>
						cliquez ici
				        </li>
				  	     <li class="thanks_li01"><img onclick="goToRetailer(this)" class="${retailerName}" src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/logo_${fn:toLowerCase(retailerName)}.png" height="22px;" border="0"></li>
			             <li class="thanks_extra"  style="margin-bottom: 5px;"><img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/pic_parta.png" border="0"></li>
			             <li class="thanks_extra"><img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/icon_facebook.png" border="0"></li>
			             <li class="thanks_extra"  style="margin-bottom: 5px;"><img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/pic_ret.png" border="0"></li>
			             <li class="thanks_extra"><img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/pic_myspecialk.png" border="0"></li>
			        </ul>
	        
	        </div>
	        <div class="clear"></div>
             <div class="home_footer">
                 <div class="home_footercon">
                   <div class="home_footerlogo"><img src="${pageContext.request.contextPath}/images/mobile/kellogg_fr/dotter_logo.png" width="22" name="" border="0"></div>
                   <div class="home_footertext">POWERED BY DOTTER IN ASSOCIATION<br/> WITH NESTLE   |   <span>SEE TERMS</span></div>
                 </div>
             </div>
        </div>
</div>
</html>


