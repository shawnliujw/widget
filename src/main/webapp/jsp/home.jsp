<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>Widget Builder</title>
<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/jquery/jquery.mobile-1.3.0.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jquery/jquery-mobile-custom-dotter.css" />
<link href="${pageContext.request.contextPath}/jquery/flexSlider/flexslider.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/jquery.mobile-1.3.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/flexSlider/jquery.flexslider-min.js"></script>
<script type="text/javascript">

var familyId = '1d1a95cf-f00e-42b3-b702-31c2efe562a6';

var family = "";

$("#homePage").live("pagebeforeshow",function() {
	$("#select-native-1").html("");
	$.ajax({
		dataType:"json",
		type:"get",
		url:"http://proto.dotter.me/api/productdb/families/"+familyId,
		async:false,
		success:function(data){
			//alert(data);
			var variants = data.variants;
			family = variants;
				$("#productImages").html("");
			$(variants).each(function(index,item){
				var productId = item.id;
				var platform = item.data[0].key;
				var option = $("<option></option>");
				option.attr("value",index);
				option.text(platform);
				
				if(index ==0) {
					option.attr("selected","selected");
				}
				
				$("#select-native-1").append(option);
				
				$.ajax({
					dataType:"json",
					type:"get",
					url:"http://proto.dotter.me/api/productdb/products/"+productId,
					async:false,
					success:function(product){
						
						var li = '<li><img src="'+product.info[0].media[0].url+'" width="100%" border="0"></li>';
						$("#productImages").append($(li));
						family[index] = product;
						
						
					}
				});
				//alert(productId);
			});
			
			
		}
	});
	$( "#select-native-1" ).selectmenu( "refresh" );
	
	
	$('.flexslider').flexslider({
		animation:"slide",
		directionNav:false,//是否显示导航按钮
		reverse:false,//是否有反向动画
		animationLoop:false,//照片是否会循环
		slideshow:false,
		slideshowSpeed:5000,//自动播放的速度
		initDelay: 0,
		controlNav: true,               //Boolean: Create navigation for paging control of each clide? Note: Leave true for manualControls usage
		directionNav: true,             //Boolean: Create navigation for previous/next navigation? (true/false)
		prevText: "Previous",           //String: Set the text for the "previous" directionNav item
		nextText: "Next", 
		before:function(slider){
			var index = slider.animatingTo;
			//alert("From:"+slider.currentSlide+"----To:"+index);
			showProduct(index);
		},after:function(slider) {
			$("#currentProduct").val(slider.currentSlide);
		}
	});
	showProduct(0);
			//alert(JSON.stringify(family));
});

var path = '${pageContext.request.contextPath}';

function slideImage(obj) {
	var platformVal = parseInt($(obj).val());
	var currentIndex = parseInt($("#currentProduct").val());
	
	if (currentIndex > platformVal) {
		for(var i=0;i<(currentIndex - platformVal);i++) {
			$(".flex-prev").trigger("click");
		}
	} else if(currentIndex < platformVal) {
		for(var i=0;i<(platformVal - currentIndex);i++) {
			$(".flex-next").trigger("click");
		}
	}
}

/**
 * show retailer info of product
 */
function showProduct(index) {
	if("" != family ) {
		try {
			
			var product = family[index];
			var retailers = product.retailers;
			var platform = product.variant.data[0].key;
			//show product name
			$("#productName").html(product.info[0].data[0].value);
			//selected platform
			
			//alert($("#select-native-1 option").length);
			$("#select-native-1 option").each(function(index,item){
				if($(item).text().toLowerCase() == platform.toLowerCase()) {
					$(item).attr("selected",true);
				} else {
					
					$(item).attr("selected",false);
				}
				
			});
			$( "#select-native-1" ).selectmenu( "refresh" );
			
			
			//show retailer information
			var retailerList = $("#retailerList");
			retailerList.empty();
			$(retailers).each(function(index,item){
				var exampleRetailer = $("#exampleRetailer");
				var retailer = $("<div class='dot_retailer'></div>");
				$(exampleRetailer.find("img")[0]).attr("src",getRetailerLogo(item.id));
				$(exampleRetailer.find("li")[1]).text(getRetailerName(item.id));
				$(exampleRetailer.find("li")[2]).text("£"+item.data[0].value);
				retailer.html(exampleRetailer.html());
				retailerList.append(retailer);
			});
			
		} catch(e) {
			
		}
	}
}

/**
 * get retailer logo accord retailer name
 */
function getRetailerLogo(id) {
	var logoUrl = "/images/" ;
	if(id.indexOf("amazon") != -1) {
		logoUrl += "icon_amazon.png";
	} else if (id.indexOf("tesco") != -1) {
		logoUrl += "icon_tesco.png";
	}else if (id.indexOf("asda") != -1) {
		logoUrl += "icon_asda.png";
	}else if (id.indexOf("game") != -1) {
		logoUrl += "icon_game.png";
	}
	return path +logoUrl;
}
/**
 * get retailer logo accord retailer name
 */
function getRetailerName(id) {
	var retailerName = "" ;
	if(id.indexOf("amazon") != -1) {
		retailerName = "AMAZON";
	} else if (id.indexOf("tesco") != -1) {
		retailerName = "TESCO";
	}else if (id.indexOf("asda") != -1) {
		retailerName = "ASDA";
	}else if (id.indexOf("game") != -1) {
		retailerName = "GAME";
	}
	return retailerName;
}
</script>
</head>
<body>
<input type="hidden" id="currentProduct" value="0"/>
<div data-role="page" id="homePage" data-theme="f" style="background-image: url('${pageContext.request.contextPath}/images/dot_homebg.png'); background-size:100%" class="dot_home">
	<div style="padding:5px;">
		<div data-display="overlay" data-role="panel" id="mypanel" data-theme="a" style="opacity:0.85;">
    		<div class="country_group">
    		    <ul>
    		       <li><img src="${pageContext.request.contextPath}/images/icon_uk.png" width="30" border="0"></li>
    		       <li class="country_name">United Kingdom</li>
    		    </ul>
    		    <div class="clear"></div>
    		    <ul>
    		       <li><img src="${pageContext.request.contextPath}/images/icon_us.png" width="30" border="0"></li>
    		       <li class="country_name">United States</li>
    		    </ul>
    		    <div class="clear"></div>
    		    <ul>
    		       <li><img src="${pageContext.request.contextPath}/images/icon_france.png" width="30" border="0"></li>
    		       <li class="country_name">France</li>
    		    </ul>
    		    <div class="clear"></div>
    		    <ul>
    		       <li><img src="${pageContext.request.contextPath}/images/icon_italy.png" width="30" border="0"></li>
    		       <li class="country_name">Italy</li>
    		    </ul>
    		    <div class="clear"></div>
    		    <ul>
    		       <li><img src="${pageContext.request.contextPath}/images/icon_germany.png" width="30" border="0"></li>
    		       <li class="country_name">Germany</li>
    		    </ul>
    		    <div class="clear"></div>
    		    <ul>
    		       <li><img src="${pageContext.request.contextPath}/images/icon_spain.png" width="30" border="0"></li>
    		       <li class="country_name">Spain</li>
    		    </ul>
    		    <div class="clear"></div>
    		    <ul>
    		       <li><img src="${pageContext.request.contextPath}/images/icon_denmark.png" width="30" border="0"></li>
    		       <li class="country_name">Denmark</li>
    		    </ul>
    		    <div class="clear"></div>
    		    <ul>
    		       <li><img src="${pageContext.request.contextPath}/images/icon_norway.png" width="30" border="0"></li>
    		       <li class="country_name">Norway</li>
    		    </ul>
    		    <div class="clear"></div>
    		    <ul>
    		       <li><img src="${pageContext.request.contextPath}/images/icon_finland.png" width="30" border="0"></li>
    		       <li class="country_name">Finland</li>
    		    </ul>
    		    <div class="clear"></div>
    		    <ul>
    		       <li><img src="${pageContext.request.contextPath}/images/icon_sweden.png" width="30" border="0"></li>
    		       <li class="country_name">Sweden</li>
    		    </ul>
    		    <div class="clear"></div>
    		    <ul>
    		       <li><img src="${pageContext.request.contextPath}/images/icon_belgium.png" width="30" border="0"></li>
    		       <li class="country_name">Belgium (French)</li>
    		    </ul>
    		</div>
		</div>
		<div data-role="header" class="dot_home_header">
		      <div style="width: 100%;margin: 0 auto;overflow: hidden;">
					<div id="" class="flexslider" >
					    <ul class="slides" id="productImages">
							<li><img src="${pageContext.request.contextPath}/images/pic_pro01.png" width="100%" border="0"></li>
							<li><img src="${pageContext.request.contextPath}/images/pic_pro02.png" width="100%" border="0"></li>
							<li><img src="${pageContext.request.contextPath}/images/pic_pro03.png" width="100%" border="0"></li>
						</ul>
					</div>
				</div>
				<a href="#mypanel" class="change_country">
				</a>
					<div class="dot_country" >
					    <img src="${pageContext.request.contextPath}/images/icon_uk.png" width="30" border="0">
					</div>
				<div class="dot_info">
				<a data-rel="popup"  data-transition="flip" href="#infoPage"    data-rel="popup">
				    <img src="${pageContext.request.contextPath}/images/icon_info.png" width="30" border="0">
				 </a>
				</div>
		</div>
		<div data-role="content" style="padding: 0px;">
		    <div class="dot_proname" id="productName">Skylanders Gaints Starter Pack</div>
		    <div class="dot_title">Select Platform</div>
		    <div>
			    <select data-icon="dotter" name="select-native-1" id="select-native-1" onchange="slideImage(this);">
			    </select>
			</div>
			<div class="dot_title02">Select Retailer</div>
			
			<div class="dot_retailer" id="exampleRetailer" style="display: none;">
						<ul>
							<li class="retailer_logo"><img
								src="${pageContext.request.contextPath}/images/icon_amazon.png"
								width="38" border="0"></li>
							<li class="retailer_name">AMAZON</li>
							<li style="float: right;" class="retailer_price">£29.99</li>
						</ul>
					</div>
			
			<div style="padding-right:2px;" id="retailerList">
			</div>
		</div>
		<div data-role="footer">
		    <div class="logo_dotter">
		    <a href="#popupMenu" data-rel="popup" data-inline="true" data-transition="slideup" data-icon="gear" data-theme="e">  
		      <img src="${pageContext.request.contextPath}/images/icon_dotter.png" width="38" border="0">
		    </a>
		    </div>
		</div>
	</div>	
	<!-------------------------------dotter overlay layer -------------------------------------------->
	<div class="dot_overlay" style="display: none;" id="popupMenu" data-theme="d">
		        <ul>
		           <li class="overlay_text"><img src="${pageContext.request.contextPath}/images/icon_dotter.png" width="17" border="0"> Powered by Dotter - <a href="#" style="color: #ffffff; font-weight:normal; text-decoration: underline;">See Terms</a></li>
		           <br/>
		           <li>More information about Dotter</li>
		           <br/>
		           <li>Terms & Conditions</li>
		           <li>Cookie Policy</li>
		           <li>Visit website</li>
		        </ul>
	 </div>
<div   id="infoPage"   data-role="popup"      style="background-image: url('${pageContext.request.contextPath}/images/dot_homebg.png'); background-size:100%" class="dot_home">
	<div style="padding:5px;">
	          <div class="dot_info_blcok">
	             <h4>THE GIANTS STORY</h4>

Thousands of years ago, the Giants fought epic battles in Skylands but were banished to Earth. With a new threat looming, it’s time to bring them back to join forces with the Skylanders to defeat KAOS. Only you can put them on the Portal of Power® to unleash their strength in the ultimate battle to save Skylands!<br/><br/>

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam cursus. Morbi ut mi. Nullam enim leo, egestas id, condimentum at, laoreet mattis, massa. Sed eleifend nonummy diam. Praesent mauris ante, elementum et, bibendum at, posuere sit amet, nibh. Duis tincidunt lectus quis dui viverra vestibulum. Suspendisse vulputate aliquam dui. Nulla elementum dui ut augue. Aliquam vehicula mi at mauris. Maecenas placerat, nisl at consequat rhoncus, sem nunc gravida justo, quis eleifend arcu velit quis lacus. Morbi magna magna, tincidunt a, mattis non, imperdiet vitae, tellus. Sed odio est, auctor ac, sollicitudin in, consequat vitae, orci. Fusce id felis. Vivamus sollicitudin metus eget eros.
	          </div>	
	          
	          <div class="info_close" >
	          <a href="#" data-rel="back">
				    <img src="${pageContext.request.contextPath}/images/icon_close.png" width="48" border="0">
	          </a>
				</div>
	</div>	
</div>
</div>



</body>
</html>
