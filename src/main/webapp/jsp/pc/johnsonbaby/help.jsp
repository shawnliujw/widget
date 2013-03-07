<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld" %>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld" %>
<!DOCTYPE html >
<html> 
<head> 
            <title>JOHNSON&#39;S&reg; Baby</title> 
<meta name="description" content="Say ‘YES’ to Special K Biscuit Moments and other delicious   snacks using our Special K Snack Store."/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/pc/main_johnsonbaby.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/jquery/scroll/nice.scroll.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/pc/johnsonbaby/common.js"></script>
<script>
	$(document).ready(function() {
	
		$(".help_text").niceScroll({cursorcolor:"#F7a6B4",autohidemode:false,backgroundborderdisable:true});
		//alert($("#defaultRetailerPrice").val())
		//displayDefaultBasketInfo();
});
	
	function scrollTo(divId) {
		
		//var currentTop = $(obj).offset().top;
		var top = $("#"+divId).offset().top;
		
	//	$(".help_text").scrollTop(top);
	$(".help_text").animate({
		"scrollTop":top-88
	});
		
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
		
<!-- Piwik  -->
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://piwik.dotter.me/" : "http://piwik.dotter.me/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php",5);
piwikTracker.setDocumentTitle("Help");
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=5" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->
</head>
<body id="Help Page">
	<div id="BlowFishHomePage" class="blowfish_page">
          <div class="blowfish_term_header">
      <a href="${pageContext.request.contextPath}/${brandModel['brandName']}">
				<img src="${pageContext.request.contextPath}/blowfish_images/johnsonbaby/logo_johnsonbaby.png"
				height="69" name="" border="0"> </a>    </div>
          <div class="clear"></div>
          <div class="terms_content">
								<!--          <div class="help_content_title">Help topics </div> --> 
                       <div class="help_text">
							
							
							
							
				<div>Help topics </div>			
				<br/>
				<div class="terms_text_d01">	
							•&nbsp;&nbsp;	<span onClick="scrollTo('intro')" id="top">Intro</span>
<br />
•&nbsp;&nbsp;	<span  onclick="scrollTo('Featured')">Featured products</span>
<br />
•&nbsp;&nbsp;	<span  onclick="scrollTo('Adding')">Adding and removing products</span>
<br />
•&nbsp;&nbsp;	<span  onclick="scrollTo('Pricing')">Pricing and offers</span>
<br />
•&nbsp;&nbsp;	<span  onclick="scrollTo('Additional')">Additional product information</span>
<br />
•&nbsp;&nbsp;	<span  onclick="scrollTo('basket')">Adding to basket</span>
<br />
•&nbsp;&nbsp;	<span  onclick="scrollTo('Data')">Data and security</span>
							
		</div>					
							
	<br />					
			
<span id="intro">INTRO</span>
         <div class="help_text_d01">	
            <ul>
               <li>	 			       
By using this service provided by Dotter (“the Dotter Service”) you can easily and conveniently add <b>JOHNSON’S<span style="vertical-align:super; font-size:6px; color:#000000;text-decoration: none;">&reg;</span> Baby</b> products to your Tesco online shopping basket without having to visit the Tesco website		       
		       
		        </li>
		        <li>
When you next visit the Tesco website, you will see your selected products already in your basket waiting for you to complete the checkout process
		        </li>
		        <li>
The Dotter Service is easy to use and fully compliant with the most stringent security protocols. For more detailed information 
<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span style="color:#007ac4;margin-top:0px;font-size: 13px;line-height:15px;text-decoration: underline" >see the site terms</span>
</a>
		        </li>
		        
		        <li>
You are not buying products directly from <b>JOHNSON’S<span style="vertical-align:super; font-size:6px; color:#000000;text-decoration: none;">&reg;</span> Baby</b> / <b>Johnson & Johnson Ltd</b>. You are adding products to your Tesco basket using the Dotter Service.  These products can be removed at any time via Tesco’s website. You are not committing to full purchase within this site. For more detailed information 
<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span style="color:#007ac4;margin-top:0px;font-size: 13px;line-height:15px;text-decoration: underline" >see the site terms</span>
</a> 

		        </li>
		        <li>
<b>PLEASE MOVE AROUND USING THE SITE FUNCTIONALITY NOT THE BROWSER BACK / FORWARD BUTTONS</b>					
			        </li>
		        </ul>
	</div>					
	     	<div class="help_back_top" >
			   <ul>
		         <li onClick="scrollTo('top')" style="margin-left:2px;">Back to top
			     </li>
				</ul>
	         </div>				
				<br />
		<span id="Featured">FEATURED PRODUCTS</span>			
         <div class="help_text_d02">	
            <ul>
               <li>	 
•&nbsp;&nbsp;	The <b>JOHNSON’S<span style="vertical-align:super; font-size:6px; color:#000000;text-decoration: none;">&reg;</span>
 Baby</b> products featured are those on special offer during the Tesco Baby & Toddler Club Baby Event running from 14/01/2013 until 11/02/2013
		        </li>
		        <li >	
			•&nbsp;&nbsp; The featured products are listed, along with a product image and real time price and offer information
		        </li>
		        <li>	
			
			•&nbsp;&nbsp; Please note some products may not be stocked by your local Tesco.com distribution centre
		        </li>
				</ul>
	</div>			
	     	<div class="help_back_top" >
			   <ul>
		         <li onClick="scrollTo('top')">Back to top
			     </li>
				</ul>
	         </div>			
				<br />
					
		    <span id="Adding">ADDING & REMOVING PRODUCTS</span>			
         <div class="help_text_d02">	
            <ul>
               <li>	  		
						
			 •&nbsp;&nbsp;	Add and remove products using the <img src="${pageContext.request.contextPath}/images/pc/johnsonbaby/selection_bg.png"  height="18"  name="" border="0">	  button
		        </li>
		        <li>
			   •&nbsp;&nbsp;	The quantity of a particular product selected will be shown in the button 
		        </li>
		        <li>
			   •&nbsp;&nbsp;	This information will also be carried across to your basket in the basket panel, highlighted below
               <br />	<br />
		 	   <img src="${pageContext.request.contextPath}/images/pc/johnsonbaby/help01.png"  height="400"  name="" border="0">			
		        </li>
		        <li>						
				•&nbsp;&nbsp;	If you want to remove all of a specific product from your basket click  <img src="${pageContext.request.contextPath}/images/pc/johnsonbaby/icon_del.png"  height="14"  name="" border="0">		
					  </li>
				</ul>
	             </div>							
	     	<div class="help_back_top" >
			   <ul>
		         <li onClick="scrollTo('top')">Back to top
			     </li>
				</ul>
	         </div>				
		
			   <br />
		    <span id="Pricing">PRICING & OFFERS </span>			
         <div class="help_text_d02">	
            <ul>
               <li>	         	 
				•&nbsp;&nbsp;  The Dotter Service updates information in real time.  The price and offers you see here are the prices and offers available at Tesco
		        </li>
		        <li>
		      •&nbsp;&nbsp;	 All prices quoted and the total are based on the current price, as of today, and may change depending on the day you complete the checkout process at Tesco and your chosen delivery slot.
		        </li>
		        <li>
		      •&nbsp;&nbsp;  We can not guarantee that the price you added products to your basket at will be the price you pay when you checkout at Tesco
		        </li>
				</ul>
	             </div>	
	     	<div class="help_back_top" >
			   <ul>
		         <li onClick="scrollTo('top')">Back to top
			     </li>
				</ul>
	         </div>				
				 
				 <br />
		    <span id="Additional">ADDITIONAL PRODUCT INFORMATION</span>			
         <div class="help_text_d02">	
            <ul>
               <li>			
				•&nbsp;&nbsp;	If you click on the <img src="${pageContext.request.contextPath}/images/pc/johnsonbaby/info_btn.png"  height="16"  name="" border="0"> 
				 next to any product this will open up more information and details about a particular product
		        </li>
		        <li>
		      •&nbsp;&nbsp;	You can return to the product list at any time by clicking the ‘<b>BACK TO ALL PRODUCTS</b>’ button
		        </li>
		        <li>
		      •&nbsp;&nbsp;	The ‘<b>ADD TO TESCO BASKET</b>’ functionality, price and offer information is also available on the product information pages 
				  </li>
                 </ul> 
     			</div>	
				   <div class="help_back_top" >
			   <ul>
		         <li onClick="scrollTo('top')">Back to top
			     </li>
				</ul>
	         </div>	
				
				   <br />
					 <span id="basket">ADDING TO BASKET</span>			
         <div class="help_text_d02">	
            <ul>
               <li>	
					•&nbsp;&nbsp;	Once you have selected all your products, you need to confirm that you want to physically transfer these to your Tesco basket.
		        </li>
		        <li>
		      •&nbsp;&nbsp;	To add them to your next online shop, you will need to enter your Tesco username and password
		        </li>		    
		        <li>
		      •&nbsp;&nbsp;	And then click ‘<b>ADD TO TESCO BASKET</b>’
		        </li>
		        <li>
		      •&nbsp;&nbsp;	You will then see data processing information appear on your screen to let you know what’s happening.  This shouldn’t take more than a few seconds to complete
		        </li>
		        <li>
		      •&nbsp;&nbsp;	Assuming there are no stock issues, all products will be added to your basket and you will see a ‘Thank you’ confirmation
		        </li>
		        <li>
		      •&nbsp;&nbsp;	If for any reason, products can’t be added, most likely due to stock availability in your area, you will be asked if you want to add alternative products, or continue.  Just follow the instructions that appear on screen
		        </li>
		        <li>
		      •&nbsp;&nbsp;	If there is a password or log-in failure instructions to try again will appear on screen. If there is a second failure, you will be referred to the Tesco website 
                     </li>
     </ul> 
     			</div>	
	     	<div class="help_back_top" >
			   <ul>
		         <li onClick="scrollTo('top')">Back to top
			     </li>
				</ul>
	         </div>				

			<br />
					 <span id="Data">DATA & SECURITY</span>			
         <div class="help_text_d02">	
	   <ul>
               <li>
					•&nbsp;&nbsp;  Bank or payment details are not required
		        </li>
		        <li>
		      •&nbsp;&nbsp;  You will need to enter your Tesco user name and password. This allows
your ’add to basket’ request to be processed
		          </li>
		          <li>
		      •&nbsp;&nbsp;	 The Dotter Service adheres to the Data Protection Act 1998 and the
highest security standards (PCI DSS compliant). For more detailed
information
		      <a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span style="color:#007ac4;margin-top:0px;font-size: 13px;line-height:15px;text-decoration: underline" >see the site terms</span>
</a>
		          </li>
		          <li>
		      •&nbsp;&nbsp;  Your password information and all data is encrypted and will not be shared
or stored.
		          </li>
		         		          <li>
		      •&nbsp;&nbsp;  Your details will never be supplied to a third party although we may share
anonymous aggregated data with our third party retail and brand partners.
The information will never enable our partners to identify you or contact
you unless we have explicitly asked for and you have provided consent.
We may disclose your personal data to third parties without obtaining
your prior consent if we are required to do so by law. ). For more detailed
information
		      <a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span style="color:#007ac4;margin-top:0px;font-size: 13px;line-height:15px;text-decoration: underline" >see the site terms</span>
</a>
		
		          </li>
		          <li>
					For more information – please 
					<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span style="color:#007ac4;margin-top:0px;font-size: 13px;line-height:15px;text-decoration: underline" >see the site terms</span>
</a>
		          </li>

     </ul>
     					</div>	
	     	<div class="help_back_top" >
			   <ul>
		         <li onClick="scrollTo('top')">Back to top
			     </li>
				</ul>
	         </div>	
	              <div class="help_text_d02">	
         
             <ul>
               <li>
					If you have any further questions, please contact <a href="mailto:enquiries@dotter.me" style="color:#666666;">enquiries@dotter.me</a>
		        </li>
		 

     </ul>
     					</div>	
			         	<p>&nbsp;</p>	
					</div>	          
	      </div>
		    
		     <div style="float: right; margin-right: 25px;width: 240px; ">
		     <ul> <li  style="float: left;"> <a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span class="input_btn03b" style="width: 100px; margin-top:20px; text-align: center; line-height: 24px;">site terms</span></a>
                       </li>
                        <li  style="float: left; padding-left: 20px;"> <span class="input_btn03" style="width: 100px; margin-top:20px; text-align: center; line-height: 24px;"  onClick="goBack();">back to store</span>
                       </li>
		     </ul>
		   </div>
		       <div  class="sch_footer1">
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