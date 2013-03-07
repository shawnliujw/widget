<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld"%>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld"%>
<!DOCTYPE html >
<html>
<head>
<title>Open Store</title>
<meta name="description" content="" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/pc/main_regaine.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	var sessionId='${pageContext.session.id}';
	var path = '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/jquery/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pc/regaine/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pc/regaine/basket_mpupa.1.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pc/regaine/basket_function.js"></script>
<script src="${pageContext.request.contextPath}/jquery/scroll/nice.scroll.js" type="text/javascript"></script>	
<script>
	$(document).ready(function() {
	
		$(".help_text").niceScroll({cursorcolor:"#59608a",autohidemode:false,backgroundborderdisable:true});
	});
	
	function scrollTo(divId,vn) {
		var top = $("#"+divId).offset().top;
		
		if(vn=='step2ToPricing'){
			$(".help_text").animate({
				"scrollTop":1866
			});
		}else if(vn == 'step2ToStep3'){
			$(".help_text").animate({
				"scrollTop":1378
			});
		}else if(vn == 'step2ToAmazon'){
			$(".help_text").animate({
				"scrollTop":2386
			});
		}else if(vn == 'step2ToStep1'){
			$(".help_text").animate({
				"scrollTop":508
			});
		}else if(vn == 'step3ToData'){
			$(".help_text").animate({
				"scrollTop":2560
			});
		}else if(vn == 'step3ToCreate'){
			$(".help_text").animate({
				"scrollTop":2100
			});
		}else{
			$(".help_text").animate({
				"scrollTop":top-108
			});
		}
		
		
		//$(".help_text").getNiceScroll.doRailClick();
		//$("#"+divId).scrollTop(200);
		
	}
	
	 var _gaq = _gaq || [];
	 _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
	  _gaq.push(['_trackPageview','Help']);
	  _gaq.push(['b._setAccount', 'UA-35779257-5']);
	  _gaq.push(['b._trackPageview','Help']);
 	  (function() {
 	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
 	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
 	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
 	  })();

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

</head>
<body id="help Page">
	<div class="store_page">
		<div class="store_header">
			<div class="header_left">
				<div class="header_item">
					<span> HELP PAGE</span>
				</div>
			<!--	<div class="header_about">
					<ul>
						<li class="header_lia" onClick="javascript:window.history.go(-1);"  style="cursor:pointer;">
								<img
								src="${pageContext.request.contextPath}/images/pc/regaine/back.png"
								border="0"></li>
						<li class="header_lib"></li>
						<li class="header_lic">
						
						
						</li>
					</ul>

				</div>  -->
			</div>
			<div class="header_right">
				<ul>
					<li style="margin-bottom: 16px;">
				
					<div  style="height:24px;"></div>
					</li>
					<li><a href="${pageContext.request.contextPath}/jsp/pc/regaine/terms.jsp;jsessionid=${pageContext.session.id}"><div class="store_btn">SITE TERMS</div></a>
					</li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>

	 <div class="help_content">
				<div class="help_text">

	             <div class="help_text_d01">				
						<ul style="list-style:disc;line-height:20px;">
  <li><span onclick="scrollTo('intro')" id="top" style="cursor:pointer;"><u>INTRO</u></span></li>
  <li><span onclick="scrollTo('step1')" id="top"  style="cursor:pointer;"><u>STEP 1 - RETAILER SELECTION</u></span></li>
  <li><span onclick="scrollTo('step2')" id="top"  style="cursor:pointer;"><u>STEP 2 - PRODUCT SELECTION</u></span></li>
  <li><span onclick="scrollTo('step3')" id="top"  style="cursor:pointer;"><u>STEP 3 – ADD TO BASKET</u></span></li>
  <li><span onclick="scrollTo('pricing')" id="top"  style="cursor:pointer;"><u>PRICING AND OFFERS</u></span></li>
  <li><span onclick="scrollTo('create')" id="top"  style="cursor:pointer;"><u>CREATE AN ACCOUNT</u></span></li>
  <li><span onclick="scrollTo('amazon')" id="top"  style="cursor:pointer;"><u>AMAZON SUBSCRIBE &amp; SAVE</u></span></li>
  <li><span onclick="scrollTo('data')" id="top"  style="cursor:pointer;"><u>DATA AND SECURITY</u></span></li>
</ul>


<ul style="list-style: none; padding-top:15px;">
<li >
<p><span class="help_text01" id="intro"><u>INTRO</u></span></p>
<li class="help_text_li">
<p>By using this  service provided by Dotter (&ldquo;the Dotter Service&rdquo;) you can easily and  conveniently add REGAINE<sup>&reg;</sup> products to the basket of your chosen online retailer  without having to visit the retailer&rsquo;s website</p>
</li>
<li class="help_text_li">
<p>When you next visit  the retailer&rsquo;s website, you will see your selected products already in your  basket waiting for you to complete the checkout process</p>
</li>
<li class="help_text_li">
<p>The Dotter Service is  easy to use and fully compliant with the most stringent security protocols. For  more detailed information <a href="/store/jsp/pc/regaine/terms.jsp"> <span>see the site terms</span></a></p>
</li>
<li class="help_text_li">
<p>You are not buying  products directly from the makers of REGAINE<sup>&reg;</sup>, McNeil Healthcare (UK) Ltd. You  are adding products to your basket at your chosen retailer using the Dotter  Service.  These products can be removed  at any time via the retailer&rsquo;s website. You are not committing to full purchase  within this site.  For more detailed  information <a href="/store/jsp/pc/regaine/terms.jsp"> <span>see the site terms</span></a></p>
</li>
<li class="help_text_li">
<p><b>PLEASE MOVE AROUND  USING THE BUTTONS &amp; NAVIGATION WITHIN THE SITE AND NOT THE BROWSER BACK /  FORWARD BUTTONS</b></p>
</li>
</ul>

<p><span onclick="scrollTo('top')" class="help_back_top" style="margin-left: -14px;">Back to top</span></p>

<p>&nbsp;</p>
<p><span class="help_text01" id="step1"><u>STEP 1 - RETAILER SELECTION</u></span></p>

<ul>
  <li>You will need to select your preferred retailer on the <b> <font color="#20385c">RETAILER SELECTION</font></b> page which will take you  to the  <b> <font color="#20385c">PRODUCT SELECTION</font></b> page </li>
  <li>You are able to go back and change retailer at any point by clicking  the <b> <font color="#20385c">BACK</font></b> button or by clicking <b> <font color="#20385c">RETAILER SELECTION</font></b> in the navigation panel – highlighted below</li>
</ul>
<img src="http://apps.dotter.me/store/images/pc/regaine/help02.jpg" height="335" name="" border="0" style="padding-top: 8px;">
<ul>
  <li>Switching retailers doesn’t remove any products you may have  selected from the previously selected retailer.   Any products selected for each retailer will  be held within this site for you if/when you decide to go back to that  retailer.  Products will only be added to  the retailer websites when you complete all the stages within this site</li>
</ul>
<p><span onclick="scrollTo('top')" class="help_back_top">Back to top</span></p>
<p>&nbsp;</p>
<p><span class="help_text01" id="step2"><u>STEP 2 - PRODUCT SELECTION</u></span></p>
<ul>
  <li>Once you have selected your retailer you will then see the full  range of products available at that retailer </li>
  <li>The products, by product type, available at your selected  retailer will be listed along with product information, a product image and  real time price and offer information.  Please  refer to the <span onclick="scrollTo('pricing','step2ToPricing')" style="cursor: pointer;"><u>PRICING  &amp; OFFERS</u></span> below for more detailed information</li>
  <li>To add and remove products, use the <img src="http://apps.dotter.me/store/images/pc/regaine/selection_bg.png" height="18" name="" border="0" style="margin-top:-5px; position:relative; top:5px;"/> button.   The quantity of a particular product selected will be shown in the  button </li>
  <li>Once you have selected your products, click the <b> <font color="#20385c">ADD TO &lt;RETAILER&gt; BASKET</font></b>  button to take you  to the next and final step – <span onClick="scrollTo('step3','step2ToStep3')"  style="cursor: pointer;"><u>STEP 3 – ADD TO BASKET</u></span></li>
  <li>Amazon also offer a Subscribe and Save option.   Please see <span  onclick="scrollTo('amazon','step2ToAmazon')"  style="cursor: pointer;"><u>AMAZON  SUBSCRIBE &amp; SAVE</u></span> for information specific to this </li>
</ul>
<ul>
  <li>Please note Essential Information about REGAINE<sup>&reg;</sup> products at  the bottom of the site page </li>
</ul>
<ul>
  <li>Please note that not all REGAINE<sup>&reg;</sup> products will be stocked  by all retailers</li>
</ul>
<ul>
  <li>If you can’t find what you’re are  looking for at one retailer, please try an alternative retailer (see <span onClick="scrollTo('step1','step2ToStep1')"  style="cursor: pointer;"><u>STEP 1 -  RETAILER SELECTION</u></span> for information on how to change retailer)</li>
</ul>
<p><span onclick="scrollTo('top')" class="help_back_top">Back to top</span></p>
<p>&nbsp;</p>
<p><span class="help_text01" id="step3"><u>STEP 3 – ADD TO BASKET </u></span></p>
<ul>
  <li>The <b> <font color="#20385c">ADD TO BASKET</font></b> page summarises the  products you have selected and shows the total price of these products with any  offers and savings applied</li>
  <li>If you would like to add other products or change  quantities, use the <b> <font color="#20385c">BACK</font></b> button or click on <b> <font color="#20385c">PRODUCT SELECTION</font></b> in the navigation panel to return to the <b> <font color="#20385c">PRODUCT SELECTION</font></b> page and make any amends.  Once made, you will need to re-click the <b> <font color="#20385c">ADD TO &lt;RETAILER&gt; BASKET</font></b> button. The number shown  in the <img src="http://apps.dotter.me/store/images/pc/regaine/selection_bg.png" height="18" name="" border="0" style="margin-top:-5px; position:relative; top:5px;"/> button at any given time is the total number  of that product that has been selected </li>
  <li>If you want to remove all of a specific product from your  basket click <img src="http://apps.dotter.me/store/images/pc/regaine/icon_del.png" border="0" style="margin-top:-5px; position:relative; top:3px;"/></li>
</ul>
<ul>
  <li>Once your products selection is finalised, you need to confirm  that you want Dotter to physically transfer these to your basket on the  retailer&rsquo;s website</li>
  <li>You will need to enter your the username and password for  your selected retailer</li>
  <li>And then click <b> <font color="#20385c">ADD TO &lt;RETAILER&gt;  BASKET</font></b></li>
  <li>Please refer to<span onClick="scrollTo('data','step3ToData')"  style="cursor:pointer;">  <u>DATA &amp; SECURITY</u></span> for how this  information is used by Dotter</li>
</ul>
<ul>
  <li>You can opt-into receiving support, news and offer  information from REGAINE<sup>&reg;</sup> by clicking the appropriate box.  Please refer to <span onClick="scrollTo('data','step3ToData')"  style="cursor:pointer;"><u>DATA &amp;  SECURITY</u></span> below for more  information </li>
</ul>
<ul>
  <li>This site also allows you to securely create an account,  with the site itself, if you don&rsquo;t already have, one with Boots and  Pharmacy2U.  Please refer to <span onClick="scrollTo('create','step3ToCreate')"  style="cursor:pointer;"><u>CREATE AN  ACCOUNT</u></span> information below</li>
</ul>
<ul>
  <li>Once you have clicked <b> <font color="#20385c">ADD TO &lt;RETAILER&gt; BASKET</font></b> you will then see data processing  information appear on your screen to let you know what&rsquo;s happening.  This shouldn&rsquo;t take more than a few seconds  to complete</li>
  <li>Assuming there are no stock issues, all products will be  added to your basket and you will see a &lsquo;Thank you&rsquo; confirmation page</li>
  <li>If for any reason, products can&rsquo;t be added, most likely due  to stock availability, you will be asked if you want to add alternative  products, or continue.  Just follow the  instructions that appear on screen</li>
  <li>If there is a password or log-in failure instructions to try  again will appear on screen.  If there is  a second failure, you will be referred to the retailer&rsquo;s website </li>
</ul>
<p><span onclick="scrollTo('top')" class="help_back_top">Back to top</span></p>
<p>&nbsp;</p>
<p><span class="help_text01" id="pricing"><u>PRICING &amp; OFFERS </u></span></p>
<ul>
  <li>The Dotter Service updates information in real time.  The price and offers you see here are the  prices and offers available at the retailers</li>
  <li>All prices quoted and the total are based on the current  price, as of today, and may change depending on the day you complete the checkout  process, and the in the case of the grocery retailers (Asda, Sainsbury&rsquo;s,  Tesco) the date the goods are put together for delivery</li>
  <li>Prices quoted do not include any delivery or collection  costs that may apply based on the selected retailer&rsquo;s terms and conditions</li>
  <li>Dotter do not guarantee that the price you added products to  your basket at will be the price you pay</li>
  <li>The line price is the price for the product, multiplied by  the number added, without any multi-buy offers you have qualified for applied</li>
  <li>Any multi-buy savings you have qualified for will be shown above  the TOTAL and applied to the TOTAL amount </li>
</ul>
<p><span onclick="scrollTo('top')" class="help_back_top">Back to top</span></p>
<p>&nbsp;</p>
<p><span class="help_text01" id="create"><u>CREATE AN ACCOUNT</u></span></p>
<ul>
  <li>To help make adding REGAINE<sup>&reg;</sup> products to your shopping  basket easier, if you don&rsquo;t already have one, we are able to offer a secure  Create an Account function for Boots and Pharmacy2U within this site</li>
  <li>The option to do this is located on the <b> <font color="#20385c">ADD TO BASKET</font></b> page, next to the request for username  and password data entry fields</li>
  <li>Please follow the online instructions</li>
  <li>You will be asked for:</li>
  <div style="margin-left: 20px;">
  <ul style="list-style: circle;">
  <li>Your email address and the password you would like to use</li>
  <li>Some personal details – such as your name, and date of birth</li>
  <li>Your address </li>
  </ul>
  </div>
  <li>Please refer to <span onClick="scrollTo('data','step3ToData')" style="cursor:pointer;"><u>DATA &amp; SECURITY</u></span> for how this  information is used by Dotter</li>
  <li>Please note that using this service you will be agreeing to  the terms and conditions set out by these retailers, which we encourage you to  read beforehand</li>
</ul>
<p><span onclick="scrollTo('top')" class="help_back_top">Back to top</span></p>
<p>&nbsp;</p>
<p><span class="help_text01" id="amazon"><u>AMAZON SUBSCRIBE &amp; SAVE</u></span></p>
<ul>
  <li>Amazon offer  a 10% discount if you sign up to Subscribe &amp; Save.  Your selected item will be delivered at  a regular interval of your choice.  Selecting  this option will incur no fees, risks or obligations.  Please refer to Amazon for <a href="http://www.amazon.co.uk/gp/subscribe-and-save/details/index.html/ref=rcxsubs_dp_more" target="_blank"><span><u>MORE DETAILS</u></span></a></li>
  <li>To sign up to Subscribe &amp; Save click  &lt;SUBSCRIBE&gt;.  Enter your Amazon username and password.  You will then be referred to the Amazon site  to complete the process and set you delivery schedule</li>
</ul>
<p><span onclick="scrollTo('top')" class="help_back_top">Back to top</span></p>
<p>&nbsp;</p>
<p><span class="help_text01" id="data"><u>DATA &amp; SECURITY</u></span></p>
<ul>
  <li>Bank or payment details are not required</li>
  <li>You will need to enter your retailer username and password.  This allows Dotter to process your &rsquo;add to  basket&rsquo; request </li>
  <li>The Dotter Service adheres to the highest security standards  (PCI DSS compliant).  For more detailed  information <a href="/store/jsp/pc/regaine/terms.jsp;jsessionid=${pageContext.session.id}"> <span>see the site terms</span></a>  </li>
  <li>If you opt-into receiving support, news and offer  information from REGAINE<sup>&reg;</sup>, Dotter will pass only your email address to McNeil Healthcare  (UK) Ltd. </li>
  <li>By opting-in you will be joining the REGAINE<sup>&reg;</sup> eCRM programme  and agreeing to receive additional news, product information, surveys and future  promotions from REGAINE<sup>&reg;</sup>.  The  information you submit during registration will be governed by the REGAINE<sup>&reg;</sup> <a href="http://www.regaine.co.uk/privacy-policy" target="_blank"><span>PRIVACY POLICY</span></a>.  You will have the opportunity to unsubscribe  from our database by clicking on the &lsquo;unsubscribe&rsquo; link at the bottom of any  email you receive from REGAINE<sup>&reg;</sup> </li>
  <li>Your password information and all data are encrypted and  will not be shared or stored by Dotter</li>
  <li>Dotter will never supply your details to a third party</li>
</ul>
<p>For more  information – please <a href="/store/jsp/pc/regaine/terms.jsp;jsessionid=${pageContext.session.id}"> <span>see the site terms</span></a></p>
<p><span onclick="scrollTo('top')" class="help_back_top">Back to top</span></p>
<br />
	
<p>If you have any  further questions, please contact&nbsp;<a href="mailto:enquiries@dotter.me">enquiries@dotter.me</a><u> </u></p>
<br />         </div>
	      </div>
</div>
		<div class="store_tobasket" style="height:40px;">
		
		<div  class="store_botton"  style="width:160px; ">
		<ul>

		<li style="cursor: pointer; margin-top:-2px;" onClick="javascript:window.history.go(-1);">
		BACK TO REGAINE<span style="vertical-align:super;font-size:8px;color:#ffffff; text-decoration: none;">&reg;</span>
		<img src="${pageContext.request.contextPath}/images/pc/regaine/icon_arrow.png"   border="0"   >
		</li>
		</ul>
		</div>
		
		</div>

		<div class="home_footer">
			<div class="footer_ess">
				<b><font color="#252c4c"> ESSENTIAL INFORMATION</font></b><br /> REGAINE<span>&reg;</span> for Men Extra
				Strength Scalp Foam 5% w/w cutaneous foam, REGAINE<span>&reg;</span> for Men Extra
				Strength 5% Solution and REGAINE<span>&reg;</span> for Women Regular Strength 2%
				Solution contain Minoxidil. Always read the label. For
				Hereditary Hair Loss. Use Continually
			</div>
			<div class="footer_about">
				<span> ABOUT THIS SITE</span><br /> This service is provided by
				Dotter and the products are being offered for sale by retailers and
				not McNeil Healthcare (UK) Ltd. For more information including
				Dotter’s privacy policy – <a href="${pageContext.request.contextPath}/jsp/pc/regaine/terms.jsp;jsessionid=${pageContext.session.id}"><span  style="color: #1b1b1b;"> SEE TERMS</span></a>
			</div>
			<div class="clear"></div>
			<div class="footer_logo">
				<img
					src="${pageContext.request.contextPath}/images/pc/regaine/logo_dotter.png"
					name="" border="0">
			</div>
		</div>
	</div>

</body>
</html>