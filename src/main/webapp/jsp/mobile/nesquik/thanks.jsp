<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld" %>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld" %>
<!DOCTYPE html>
<html> 
<head>
<title>Openstore</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/mobile/main_nesquik.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/cufon/cufon.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/cufon/helvetica_rounded_bold_cond_700-helvetica_rounded_bold_cond_700.font.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/cufon/defineCufon_nesquik.js"></script>
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mobile/nesquik/common.js"></script>
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
        <img src="${pageContext.request.contextPath}/images/mobile/nesquik/logo.png" height="80px;"  border="0"></div>
        <div  class="header_right">
        <img src="${pageContext.request.contextPath}/images/mobile/nesquik/top02.png" height="24px;"  border="0"></div>       
        </div>
        
        <div class="line_block"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/line_blue.png" width="100%" height="10px;" name="" border="0"></div>
        <div class="thanks_content">
       <div class="thanks_main">
        <ul>
        <li class="thanks_li01"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/thanks.png" height="32px;" border="0"></li>
        <li class="thanks_li02">Your selected products have been added to your Ocado Basket.
<br /><br />
To view your basket, click here:</li>
   <li class="thanks_li01"><img onclick="goToRetailer(this)" class="${retailerName}" src="${pageContext.request.contextPath}/images/mobile/nesquik/logo_${fn:toLowerCase(retailerName)}.png" height="27px;" border="0"></li>
        </ul>
        
        </div>
             
    
             
              <table width="100%" border="0" cellspacing="0" cellpadding="0"  style="padding:2px 0 15px 0;">
  <tr>
    <td align="center">     
    <table width="60%" border="0" cellspacing="0" cellpadding="0" style="text-align: center;">
   <tr>
     <td width="40%" height="85"  class="thanks_text02">Share on

</td>
     <td width="30%"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/thanks_t.png" height="55px;" border="0"></td>
      <td width="30%"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/thanks_f.png" height="55px;" border="0"></td>
   </tr>
  
   <tr>
     <td height="60" class="thanks_text02">See us on</td>
     <td colspan="2"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/thanks_y.png" height="40px;" border="0"></td>
   </tr>
   <tr>
     <td height="80"  class="thanks_text02">Back to</td>
   <td colspan="2"><img onclick="javascript:window.location.href='${pageContext.request.contextPath}/${brandModel['brandName']}'" src="${pageContext.request.contextPath}/images/mobile/nesquik/thanks_n.png" height="75px;" border="0"></td>
   </tr>
 </table>
   </td>
  </tr>
</table>
             
      
             
    
             
             <div class="home_footer">
                 <div class="home_footercon">
                   <div class="home_footerlogo"><img src="${pageContext.request.contextPath}/images/mobile/nesquik/dotter_logo.png" width="22" name="" border="0"></div>
                   <div class="home_footertext">POWERED BY DOTTER IN ASSOCIATION<br/> WITH NESTLE   |   <a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span>SEE TERMS</span></a></div>
                 </div>
             </div>
        </div>
</div>
</html>


