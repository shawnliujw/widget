// display the basket info.
function displayDefaultBasketInfo() {
	var basketName = $("#defaultReatiler").val()+brandName + "Basket";
	var basket = new BasketObject();
	basket.setSaveName(basketName);
	var current = getBasketListForLocal(basketName, true);
	var totalPrice = basket.caculatePriceByDB();
	var totalPriceWithoutOffer=basket.caculatePriceWithOutOffer();
	var savingsPrice=formatFloat(totalPriceWithoutOffer-totalPrice,2);
	if (isNotEmpty(current)) {
		$("#basketList").empty();
		$(current)
				.each(
						function(index, item) {
							if (item.quantity == 0)
								return;

							if(item.productId == productId) {
								$("#cureNum").val(item.quantity);
								$("#ingredients_cureNum").val(item.quantity);
							} 
							//$("#basketList").append("<table width=\"100%\" style=\" margin-bottom:10px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><table> <tr><td width=\"100px\" align=\"left\" valign=\"middle\">"+item.title+"</td><td width=\"22px\" align=\"right\" valign=\"top\"><img src=\""+$("#context").val()+"/images/kellogg/icon_del.png\" height=\"14\" name=\"\" onmouseover=\"showTipInfo(this);\" onmouseout=\"hideTipInfo();\" onclick=\"removeItemById(this)\" border=\"0\"><input type=\"hidden\" value=\""+ item.productId+"\" ></td></tr></table></tr><tr><table><tr><td width=\"84px\" align=\"left\">x"+item.quantity+"</td><td width=\"10\" align=\"right\"></td><td width=\"20\" align=\"right\">£"+item.price+"</td></tr></table></tr></table>");
						
							var exampleData = $("#exampleData");
							exampleData.find("td:eq(0)").text(item.title);
							exampleData.find("input:eq(0)").val(item.productId);
							exampleData.find("td:eq(2)").text("x"+item.quantity);
							exampleData.find("td:eq(4)").text("£"+formatFloat(item.price*item.quantity,2));
							var offerId=item.siteType;
							if(isNotEmpty(offerId)){
								exampleData.find("img:eq(1)").show();
							}else{
								exampleData.find("img:eq(1)").hide();
							}
							var table = $("<table width=\"136\" style=\" margin-bottom:10px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"></table>");
							table.html(exampleData.html());
							$("#basketList").append(table);
						});
		$("#fullPrice").text("£" + totalPriceWithoutOffer);
		$("#totalPrice").text("£" + totalPrice);
		if(savingsPrice!=0 && savingsPrice !="0.00"){
			$("#savingsPrice").text("- £" + savingsPrice);
			$("#savingsTr").find("td:eq(0)").show();
			$("#savingsTr").find("td:eq(1)").show();
		}else{
			$("#savingsPrice").text("- £ 0.00");
			$("#savingsTr").find("td:eq(0)").hide();
			$("#savingsTr").find("td:eq(1)").hide();
		}
	} else {
		// $("#basketList").empty().append("<tr><td style=\"color: red\">No
		// products!</td></tr>");
		$("#basketList").empty();
		$("#savingsTr").find("td:eq(0)").hide();
		$("#savingsTr").find("td:eq(1)").hide();
		$("#fullPrice").text("£" + 0.00);
		$("#totalPrice").text("£" + 0.00);
	}
}

function displayDefaultBasketInfo1() {
	var basketName = $("#defaultReatiler").val()+brandName + "Basket";
	var basket = new BasketObject();
	basket.setSaveName(basketName);
	var current = getBasketListForLocal(basketName, true);
	var totalPrice = basket.caculatePriceByDB();
	var totalPriceWithoutOffer=basket.caculatePriceWithOutOffer();
	var savingsPrice=formatFloat(totalPriceWithoutOffer-totalPrice,2);
	if (isNotEmpty(current)) {
		$("#basketList .mCSB_container").empty();
		$(current)
				.each(
						function(index, item) {
							if (item.quantity == 0)
								return;
							$("#"+item.productId).parent().find("input.sch_input_qty").val(item.quantity);
							$("#ingredients_cureNum").val(item.quantity);
							//$("#basketList .mCSB_container").append("<table width=\"100%\" style=\" margin-bottom:10px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><table> <tr><td width=\"108px\" align=\"left\" valign=\"middle\">"+item.title+"</td><td width=\"22px\" align=\"right\" valign=\"top\"><img src=\""+$("#context").val()+"/images/icon_del.png\" height=\"14\" name=\"\" onmouseover=\"showTipInfo(this);\" onmouseout=\"hideTipInfo();\" onclick=\"removeItemById(this)\" border=\"0\"><input type=\"hidden\" value=\""+ item.productId+"\" ></td></tr></table></tr><tr><table><tr><td width=\"90px\" align=\"left\">x"+item.quantity+"</td><td width=\"10\" align=\"right\"></td><td width=\"20\" align=\"right\">£"+item.price+"</td></tr></table></tr></table>");
							
							
							var exampleData = $("#exampleData");
							exampleData.find("td:eq(0)").text(item.title);
							exampleData.find("input:eq(0)").val(item.productId);
							exampleData.find("td:eq(2)").text("x"+item.quantity);
							exampleData.find("td:eq(4)").text("£"+formatFloat(item.price*item.quantity,2));
							var offerId=item.siteType;
							if(isNotEmpty(offerId)){
								exampleData.find("img:eq(1)").show();
							}else{
								exampleData.find("img:eq(1)").hide();
							}
							var table = $("<table width=\"100%\" style=\" margin-bottom:10px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"></table>");
							table.html(exampleData.html());
							$("#basketList .mCSB_container").append(table);
						});
		$("#totalPrice").text("£" + totalPrice);
		if(savingsPrice!=0 && savingsPrice !="0.00"){
			$("#savingsPrice").text("- £" + savingsPrice);
			$("#savingsTr").find("td:eq(0)").show();
			$("#savingsTr").find("td:eq(1)").show();
		}else{
			$("#savingsPrice").text("- £ 0.00");
			$("#savingsTr").find("td:eq(0)").hide();
			$("#savingsTr").find("td:eq(1)").hide();
		}
	} else {
//		$("#basketList").empty().append("<tr><td style=\"color: red\">No products!</td></tr>");
		$("#basketList .mCSB_container").empty();
		$("#savingsTr").find("td:eq(0)").hide();
		$("#savingsTr").find("td:eq(1)").hide();
		$("#totalPrice").text("£" + 0.00);
	}
}

// add or minus one product 's quantity;
function changeCurrentBasketInfo(operate) {
	var basketName = $("#defaultReatiler").val()+brandName + "Basket";
	var basket = new BasketObject();
	basket.setSaveName(basketName);

	if ("add" == operate) {
		var basketItem = {
				"productId" : $("#defaultReatilerId").val(), // not null
				"productUrl" : $("#defaultRetailerUrl").val(),
				"imageUrl" : "",
				"artist" : "",
				"title" : $("#defaultRetailerTitle").val(),
				"price" : $("#defaultRetailerPrice").val(),
				"quantity" : 1, // not null
				"siteType" : $("#defaultOffer").val(),
				"flag" : true,
				"totalPrice" : 0.00,
				"brandId":$("#defaultBrandId").val(),
				"clientId":$("#defaultClientId").val(),
				"retailerId":$("#defaultRetailerId").val()
			};
		basket.addItem(basketItem);
	} else if ("minus" == operate) {
		basket.itemQuantityChange($("#defaultReatilerId").val(), -1, false);
	}
	displayDefaultBasketInfo1();
}

// remove the product by id.
function removeItemById(obj) {
	hideTipInfo();
	var id = $(obj).parent().find("input").val();
	var basketName = $("#defaultReatiler").val()+brandName + "Basket";
	var basket = new BasketObject();
	basket.setSaveName(basketName);
	basket.itemQuantityChange(id, 1, true);
	
	if(id == productId) {
		$("#cureNum").val(0);
	}
	
	//displayDefaultBasketInfo();
    var current = $(obj).parent().parent().parent();//.remove();
    current.remove();
    var totalPrice = basket.caculatePrice();
    var totalPriceWithoutOffer=basket.caculatePriceWithOutOffer();
	var savingsPrice=formatFloat(totalPriceWithoutOffer-totalPrice,2);
    $("#totalPrice").text("£" + totalPrice);
    if(savingsPrice!=0 && savingsPrice !="0.00"){
		$("#savingsPrice").text("- £" + savingsPrice);
		$("#savingsTr").find("td:eq(0)").show();
		$("#savingsTr").find("td:eq(1)").show();
	}else{
		$("#savingsPrice").text("- £ 0.00");
		$("#savingsTr").find("td:eq(0)").hide();
		$("#savingsTr").find("td:eq(1)").hide();
	}
}

/**
 * change description, useage,ingredients and storage dynamic.
 */

function change_div(id) {
	var index = id.charAt(id.length - 1);
	$(".peo_description").hide();
	for ( var i = 1; i < 5; i++) {
		if (i == index) {
			$("#m_" + i).attr("class", "detail_active");
			$("#" + id).show();
		} else {
			$("#m_" + i).attr("class", "detail_normal");
		}
	}
}

// change the num you select .
function changeSelectNum(obj, num) {
	var operate = $(obj).attr("class");
	var cureNum = $("#cureNum").val() * 1;
	if (num > 0) {
		cureNum += 1;
		changeCurrentBasketInfo("add");
	} else if (num < 0) {
		if (cureNum == 0) {
			cureNum = 0;
		} else {
			cureNum -= 1;
			changeCurrentBasketInfo("minus");
		}
	}
	$("#cureNum").val(cureNum);
	$("#ingredients_cureNum").val(cureNum);
}

function login(num) {
	var userName='';
	var password='';
	if(num==0){
		userName=$("#userName").val();
		password=$("#password").val();
	}else{
		userName=$("#SecondUserName").val();
		password=$("#SecondPassword").val()
	}
	var flag = 0;
	if (isEmpty(userName) || isEmpty(password)) {
		//showMsgDiv("please input the userName or password!");
		$(".basket_panel_con").hide();
		$(".basket_panel_con2").hide();
		$(".basket_panel_con3").hide();
		$(".basket_panel_con4").hide();
		$(".basket_panel_con5").hide();
		$("#test").show();
	} else {
		localStorage.setItem("userName",userName);
		localStorage.setItem("password",password);
		// prepare to login.....
		var basketName = $("#defaultReatiler").val()+brandName + "Basket";
		var basket = new BasketObject();
		basket.setSaveName(basketName);
		var current = getBasketListForLocal(basketName, true);

		// prepare the dataArray to add to basket.
		var tmpData = new Array();
		for ( var v = 0; v < current.length; v++) {
			var obj = {
				'productUrl' : '',
				'quantity' : ''
			};
			obj.productUrl = current[v].productUrl;
			obj.quantity = current[v].quantity;

			tmpData.push(obj);
		}
		
		if(!isNotEmpty(tmpData)){
			showMsgDiv("YOUR BASKET IS EMPTY. PLEASE GO BACK AND SELECT SOME PRODUCTS",true);
			return;
		}
		
		var defaultReatiler = $("#defaultReatiler").val();
		if (defaultReatiler.indexOf("Sainsbury") != -1) {
			defaultReatiler = "SainsburysMobile";
		}
		var loginUrl = $("#context").val() + "/loginFor" + defaultReatiler;
		var addBasketUrl = $("#context").val() + "/addTo" + defaultReatiler
				+ "BasketEachProduct";
		// alert(addBasketUrl);
		//showMaskLayerWithLoading();
		if(num==0){
			$(".basket_panel_con").hide();
			$(".basket_panel_con2").show();
		}else{
			$(".basket_panel_con4").hide();
			$(".basket_panel_con2").show();
		}
		
		
		//判断用户是否选择接受邮件，是的话要保存用户的信息
		if($("#offerCheckBox").attr("checked") == 'checked'){
			var basketName = $("#defaultReatiler").val() + brandName + "Basket";
			var current = getBasketListForLocal(basketName, true);
			var pr = current[0];
			$.post(path+"/saveAlertUser",{
				"brandId":pr.brandId,
				"clientId":pr.clientId,
				"retailerId":pr.retailerId,
				"userName":userName
			}
			);
		}
		
		$.ajax({
			url : loginUrl,
			type : "post",
			dataType : 'json',
			data : {
				// 'retailer':$("#defaultReatiler").val(),
				'email' : userName,
				'password' : password
			},
			success : function(data) {
				if (data == "success") {
					addToBasket(tmpData, addBasketUrl);
				}else if(data.indexOf("Connection refused")!=-1){
						window.location.href=path+"/sendSystemError";
				}else {
					//closeMaskLayer();
					//showMsgDiv(data);
					if(num==1){
						$(".basket_panel_con2").hide();
						$(".basket_panel_con3").hide();
						$(".basket_panel_con4").hide();
						$(".basket_panel_con5").show();
						$("#test").hide();
					}else{
						$("#test").hide();
						$(".basket_panel_con2").hide();
						$(".basket_panel_con5").hide();
						$(".basket_panel_con3").hide();
						$(".basket_panel_con4").show();
					}
				}
			}
		});
	}
}

function addToBasket(tmpData, addBasketUrl) {
	$.ajax({
		url : addBasketUrl,
		type : "post",
		dataType : 'json',
		data : {
			// 'retailer':$("#defaultReatiler").val(),
			'productsArray' : parseToStr(tmpData),
			'clearBasket' : "N"
		},
		success : function(data) {
			//closeMaskLayer();
//			if(data.indexOf("OutOfStock")!=-1){
//				$(".basket_panel_con").hide();
//				$(".basket_panel_con2").hide();
//				$(".basket_panel_con3").show();
//				$("li.input_con01").click(function(){
//					window.location.href =path + "/" + brandName + "/" + retailerName + "/"
//					+ categoryName + "/product";
//				});
//			}else{
//				var url1 = path + "/" + brandName + "/" + retailerName + "/"
//				+ categoryName + "/thanks";
//				if (isNotEmpty(productId)) {
//					url1 += "/" + productId;
//				}
//				window.location.href = url1;
//			}
//			
			var basketName = $("#defaultReatiler").val()+brandName + "Basket";
			var current = getBasketListForLocal(basketName, true);
			$(".basket_panel_con").hide();
			$(".basket_panel_con2").hide();
			var flag=0;
			var failureListcount=0;
			$(parseToJson(data)).each(function(index,item){
				if(item.indexOf("Success")==-1){
					if(failureListcount<2){
						$("#failureListMsg").append("<li style='text-align:center;' class='failureListMsg_less2'><span>"+ current[index].title+ "</span></li>");
						$("#popUpUl").append("<li style='text-align:center;' class='failureListMsg_less2'><span>"+ current[index].title+ "</span></li>");
						
					}else{
						$("#popUpUl")
						.append(
								"<li style='text-align:center;' class='failureListMsg_large2'><span>"+ current[index].title+ "</span></li>");
					}
					failureListcount++;
					flag = 1;
				}
		});
			
			if(failureListcount>2){
				$("#failureListMsg")
				.append(
						"<li style='text-align:center; cursor:pointer;' class='failureListMsg_less2' onclick='failureListMsgUtil();'><span >MORE>...</span></li>");
			}
			
			
			if(flag==0){
				///localStorage.removeItem(basketName);
				var url1 = path + "/"+brandName+"/"+retailerName+"/"+categoryName+"/thanks";
				if(isNotEmpty(productId)) {
					url1 += "/"+productId;
				}
				window.location.href = url1;
			}
			if (flag == 1) {
				$("li.input_con02").eq(0).click(
						function() {
							localStorage.removeItem(basketName);
							window.location.href = path + "/"
									+ brandName + "/" + retailerName
									+ "/" + categoryName + "/product";
						});
				$("li.input_con02").eq(1).click(
						function() {
							localStorage.removeItem(basketName);
							window.location.href = path + "/"
									+ brandName + "/" + retailerName
									+ "/" + categoryName + "/thanks";
						});
				$(".basket_panel_con3").find("span").contents().unwrap();
				$(".basket_panel_con3").show();
			}
			localStorage.removeItem(basketName);
		}
	});
}

function showTipInfo(obj){
	var left=$(obj).offset().left;
	var top=$(obj).offset().top;
	$(obj).attr("style","cursor: pointer");
	$("#delBasketTip").css("position","absolute");
	$("#delBasketTip").offset({
		"left":left-70.5,
		"top":	top-30
	}).css("display","block");
}

function hideTipInfo(){
	$("#delBasketTip").removeAttr("style").hide();
}

function showTotalMsgDiv(obj){
	var basketName = $("#defaultReatiler").val()+brandName + "Basket";
	var current = getBasketListForLocal(basketName, true);
	var flag=0;
//	for(var v=0;v<current.length;v++){
//		if(isNotEmpty(current[v].siteType)){
//			flag=1;
//			break;
//		}
//	}
	//如果篮子为空 ，不显示。
	if(isNotEmpty(current)){
		flag=1;
	}else{
		flag=0;
	}
	
	if (flag==1){
		$(obj).attr("style","cursor: pointer");
		var left=$(obj).offset().left;
		var top=$(obj).offset().top;
		$("#TotalMsgTip").css("position","absolute");
		$("#TotalMsgTip").offset({
			"left":left-65.5,
			"top":	top-70
		}).css("display","block");
//	}
}else{
	$(obj).removeAttr("style");
}
}

function hideTotalMsgDiv(obj){
	$(obj).removeAttr("style");
	$("#TotalMsgTip").removeAttr("style").hide();
}

function displayLogin(){
	$("#test").hide();
	$(".basket_panel_con").show();
}


function failureListMsgUtil(){
		$("#popUpOutOfStockProductListDiv").remove("style");
		$("#popUpOutOfStockProductListDiv").attr("style","display:none; cursor:pointer;font-family:Arial; font-size:14px; line-height:22px; z-index:200000;position: absolute;width: 300px;list-style: none; text-shadow: none;");
		var divHeight = $("#popUpOutOfStockProductListDiv").height();
		var divWidth = $("#popUpOutOfStockProductListDiv").width();
		var screenW = document.body.clientWidth ;
		var divLeft = Math.round((screenW-divWidth)/2);
		var scrollH = document.body.scrollTop;
		var screenH = document.body.clientHeight;
		var divTop = Math.abs(Math.round((screenH-divHeight)/2)+scrollH);
		var div = '<div id="floatMaskLayerDiv" style="position: absolute; top:0; left: 0px; width: 100%; height: 200%; text-align:center; filter: Alpha(Opacity =         30); opacity: 0.3; background-color: #000000;z-index:100009; ">';
		div+='</div>';
		$("body").append($(div));
		
		$("#popUpOutOfStockProductListDiv").find("input.input_btn02").click(function(){
			$("#floatMaskLayerDiv").remove();
			$("#popUpOutOfStockProductListDiv").hide();
		});
		$("#popUpOutOfStockProductListDiv").offset({
			"left":divLeft,
			"top":divTop
		}).css("display","block");
}

function BackToLogin(){
$("#popUpOutOfStockProductListDiv").hide();
	$(".basket_panel_con2").hide();
	$(".basket_panel_con3").hide();
	$(".basket_panel_con4").hide();
	$(".basket_panel_con5").hide();
	$("#userName").val("");
	$("#password").val("");
	$(".basket_panel_con").show();
}

function saveUserName(userName){
	localStorage.setItem("schwartz"+retailerName+"_userName",$("#"+userName).val());
}
function savePassword(password){
	localStorage.setItem("schwartz"+retailerName+"_password",$("#"+password).val());
}