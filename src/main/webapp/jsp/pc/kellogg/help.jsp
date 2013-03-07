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
<link href="${pageContext.request.contextPath}/jquery/scroll/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/scroll/jquery.mousewheel.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/scroll/jquery.mCustomScrollbar.js"></script>
<script src="${pageContext.request.contextPath}/js/pc/kellogg/common.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/cufon.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/Caecilia_LT_Std-Roman_italic_400.font.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/defineCufon.js"></script>
<script>
	$(document).ready(function() {
	
		$(".help_text").mCustomScrollbar({
			autoDraggerLength:true,
		});
		//alert($("#defaultRetailerPrice").val())
		//displayDefaultBasketInfo();
});
	
	function scrollTo(divId) {
		$(".help_text").mCustomScrollbar("scrollTo","#"+divId);
		
	}
	
	 var _gaq = _gaq || [];
	 _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
	  _gaq.push(['_trackPageview','Help']);
	  	  _gaq.push(['b._setAccount', 'UA-35779257-1']);
	  _gaq.push(['b._trackPageview','Help']);

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
piwikTracker.setDocumentTitle("Help");
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=1" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->
</head>
<body id="Help Page">
	<div id="BlowFishHomePage" class="blowfish_page">
          <div class="blowfish_term_header">
       <a href="${pageContext.request.contextPath}/${brandModel['brandName']}">
				<img src="${pageContext.request.contextPath}/blowfish_images/kellogg/logo_kellogg.png"
				height="69" name="" border="0"> </a>    </div>
          <div class="clear"></div>
          <div class="terms_content">
								<!--          <div class="help_content_title">Help topics </div> --> 
                       <div class="help_text">
							
							
							
							
				<div class="terms_text_d01">				
							•&nbsp;&nbsp;	<span onClick="scrollTo('intro')" id="top">Intro</span>
<br />
•&nbsp;&nbsp;	<span onClick="scrollTo('Selecting')">Selecting your retailer</span>
<br />
•&nbsp;&nbsp;	<span  onclick="scrollTo('Finding')">Finding products</span>
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
•&nbsp;&nbsp;	Using the<b> Kellogg’s Special K </b>Store you can easily and conveniently add<b> Special K </b>Cereals and Snacks to the basket of your preferred grocery retailer
without having to visit that retailers site
		        </li>
		        <li>
•&nbsp;&nbsp;	When you next visit your preferred grocery retailer’s site, you will see your
selected products already in your basket waiting for you to complete the
checkout process
		        </li>
		        <li>
•&nbsp;&nbsp;	The <b>Kellogg’s Special K </b>Store is easy to use and fully compliant with the most
stringent security protocols 
		        </li>
				 <li>•&nbsp;&nbsp;	Using our Store, you are not buying products directly from Kellogg’s you are
adding products to your grocery retailer basket.
				 </li>
		        <li>
•&nbsp;&nbsp;	These products can be removed at any time via the retailer’s site. You are not
committing to full purchase within the <b>Kellogg’s Special K</b> Store
		        </li>
		        <li>
•&nbsp;&nbsp;	<b>PLEASE MOVE AROUND THE STORE USING THE SITE FUNCTIONALITY
NOT THE BROWSER BACK / FORWARD BUTTONS	</b>				
			        </li>
		        </ul>
	</div>					
	     	<div class="help_back_top" >
			   <ul>
		         <li onClick="scrollTo('top')" >Back to top
			     </li>
				</ul>
	         </div>				
				<br />
		<span id="Selecting">SELECTING YOUR RETAILER</span>			
         <div class="help_text_d02">	
            <ul>
               <li>	 
•&nbsp;&nbsp;	First select your preferred retailer in the retailer selection panel (highlighted below)		
			<br />	
			<img src="${pageContext.request.contextPath}/images/pc/kellogg/Slide1.jpg"  height="400"  name="" border="0">
		        </li>
		        <li style="padding:20px 0px;">	
			•&nbsp;&nbsp;	Switching retailers doesn’t remove the products you selected from the
previous retailer. We will keep the products selected for each retailer so they
remain there for you if/when you go back to that retailer
			<br />
			<img src="${pageContext.request.contextPath}/images/pc/kellogg/Slide2.jpg"  height="400" style="padding-top:10px;"  name="" border="0">
		        </li>
		   
		        <li>		
	     	•&nbsp;&nbsp;	See below for how to delete / remove products
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
		<span id="Finding">FINDING PRODUCTS</span>			
					
         <div class="help_text_d02">	
            <ul>
               <li>	 
	     	
	     									
			•&nbsp;&nbsp;	Once your preferred retailer has been selected you can then search the full range
of products available at that retailer using the category panel and opening and
closing the product lists (both highlighted below)		
			<br />		
			<img src="${pageContext.request.contextPath}/images/pc/kellogg/Slide3.jpg"  height="400"  name="" border="0">			
		        </li>
		        <li>			
			•&nbsp;&nbsp;	The products, by product type, available at your selected retailer will be listed along with a product image and real time price and offer information
		        </li>
		        <li>	
			•&nbsp;&nbsp;	Please note that not all products will be stocked by all retailers
		        </li>
		        <li>	
			•&nbsp;&nbsp;	If you can’t find what you're looking for at one retailer, please try another product or an alternative retailer
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
						
			 •&nbsp;&nbsp;	Add and remove products using the <img src="${pageContext.request.contextPath}/images/pc/kellogg/help04.png"  height="18"  name="" border="0">	  button
		        </li>
		        <li>
			   •&nbsp;&nbsp;	The quantity of a particular product selected will be shown in the button 
		        </li>
		        <li>
			   •&nbsp;&nbsp;	This information will also be carried across to your basket in the basket panel, highlighted below
               <br />	
		 	   <img src="${pageContext.request.contextPath}/images/pc/kellogg/Slide4.jpg"  height="400"  name="" border="0">			
		        </li>
		        <li>						
				•&nbsp;&nbsp;	If you want to remove all of a specific product from your basket click  <img src="${pageContext.request.contextPath}/images/pc/kellogg/icon_del.png"  height="16"  name="" border="0">		
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
				•&nbsp;&nbsp;The web store updates information from the retailers in real time.  The price and offers you see here are the prices and offers available at your selected retailer
		        </li>
		        <li>
		      •&nbsp;&nbsp;	The line price is the price for the product, multiplied by the number added, without any offers you have qualified for applied
		        </li>
		        <li>
		      •&nbsp;&nbsp;	‘Savings’ shows the amount of money saved through offers that have been applied to the products in your basket
		        </li>
		        <li>
		      •&nbsp;&nbsp;	‘Total’ shows the sum of the line prices, with ‘Savings’ deducted
		        </li>
		        <li>
		      •&nbsp;&nbsp;	The ‘Total’ price is the current price, which may change depending on the day you complete the Checkout process at your selected retailer and your chosen delivery slot.  
		        </li>
		        <li>
		      •&nbsp;&nbsp;	We can not guarantee that the price you added products to your basket at will be the price you pay
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
				•&nbsp;&nbsp;	If you click on the <img src="${pageContext.request.contextPath}/images/pc/kellogg/info_btn.png"  height="16"  name="" border="0">  next to any product this will open up more information and details about a particular product.  Information is tabulated and presented in bite size chucks
		        </li>
		        <li>
		      •&nbsp;&nbsp;	You can return to the product list at any time by clicking the ‘BACK TO
PRODUCTS’ button
		        </li>
		        <li>
		      •&nbsp;&nbsp;	The product selection functionality, price and offer information is also available on the product information pages 
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
					•&nbsp;&nbsp;	Once you have selected all your products, you need to confirm that you want to physically transfer these to your selected retailer basket.  
		        </li>
		        <li>
		      •&nbsp;&nbsp;	To add them to your next shop at your selected retailer, you will need to enter your username and password for that retailer
		        </li>
		        <li>
		      •&nbsp;&nbsp;	Select if you want to opt into receiving special offers from<b> Kellogg’s Special K</b>
		        </li>
		        <li>
		      •&nbsp;&nbsp;	And then click ‘ADD TO BASKET’
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
		      •&nbsp;&nbsp;	If there is a password or log-in failure instructions to try again will appear on screen. If there is a second failure, we will refer you to the retailer site 
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
					•&nbsp;&nbsp;	We don’t need or want any bank or payment details from you
		        </li>
		        <li>
		      •&nbsp;&nbsp;	We do need you to securely enter your user name and password at your preferred retailers.  This allows us to process your ’add to basket’ request.
		          </li>
		          <li>
		      •&nbsp;&nbsp;	We don’t share or store any password information and all data is encrypted
		          </li>
		          <li>
		      •&nbsp;&nbsp;	If you allow us, we may use your email address to let you know of exclusive offers and deals from <b>Kellogg’s Special K</b>. 
		          </li>
		          <li>
		      •&nbsp;&nbsp;	We will never supply your details to a third party
		          </li>
		          <li style="padding-left: 26px;">
					For more information – please see<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span style="color:#000000;text-decoration: underline;font-size:11px;">TERMS</span></a>
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
			<div class="terms_text_d01" style="font-size: 12px;margin-left: 15px;">	
				If you have any further questions, please<a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span style="color:#000000;text-decoration: underline;font-size:11px;">SEE TERMS</span></a> or contact <a href="mailto:enquiries@dotter.me" style="color:#666666;">enquiries@dotter.me</a>
  
					</div>
			         	<br />	
					</div>	          
	      </div>
		     
		     <div style="float: right; margin-right: 25px;">
	                     <input class="input_btn03" style="width: 120px; margin-top:20px; " type="button" value="BACK TO STORE" name="" onClick="goBack();"/>
	                  </div>
		       <div class="sch_footer">
	                       <img src="${pageContext.request.contextPath}/images/logo_dotter.png" height="18" name="" border="0">
	                       POWERED BY DOTTER IN ASSOCIATION WITH KELLOGG'S | <a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span style="color:#ffffff;">SEE TERMS</span></a>
	                  </div>
	                  
   </div>
</body>
</html>
