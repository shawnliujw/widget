
/**
 * update product quantity on multiply product page
 */
function refreshProductQuantity() {
	var basketName = retailerName+brandName+"Basket";
	var basket = new BasketObject();
	basket.setSaveName(basketName);
	
	var itemList = basket.getItemList();
	if(isNotEmpty(itemList)) {
		for(var i=0;i<itemList.length;i++) {
			var product = itemList[i];
			
			$("#"+product.productId+"Quantity").val(product.quantity);
		}
	}
}

/**
 * list basket items on basket page
 */
function displayBasketItems() {
	var basketName = retailerName+brandName+"Basket";
	var basket = new BasketObject();
	basket.setSaveName(basketName);
	
	var itemList = basket.getItemList();
	if(isNotEmpty(itemList)) {
		var exampleData = $("#exampleData");
		var basketDiv = $("#basketList");
		for(var i=0;i<itemList.length;i++) {
			var product = itemList[i];
			exampleData.find("td:eq(0)").html(product.title);
			exampleData.find("td:eq(1)").text("£" + formatFloat(product.price*product.quantity,2));
			exampleData.find("td:eq(3)").text('x'+product.quantity);
			exampleData.find("img:eq(0)").attr("onclick",'removeItemById(this,'+product.productId+');');
			
			var table = $('<table  width="568" border="0" cellpadding="0" cellspacing="0" class="bsk_con_single"></table>');
			table.html(exampleData.html());
			basketDiv.append(table);
		}
		$("#totalPrice").text("£"+basket.caculatePrice());
	}
	
}

// add or minus one product 's quantity;
function changeCurrentBasketInfo(operate, obj) {
	var basketName = retailerName + brandName + "Basket";
	var basket = new BasketObject();
	basket.setSaveName(basketName);
	var productId = $(obj).parent().parent().find("input.productId").val();
	var productUrl = $(obj).parent().parent().find("input.productUrl").val();
	var productPrice = $(obj).parent().parent().find("input.productPrice")
			.val();
	var productName = $(obj).parent().parent().find("input.productName").val();
	var offerName = $(obj).parent().parent().find("input.productOfferName")
			.val();
	// alert(productId+"--"+productUrl+"--"+productPrice+"--"+productName);
	//
	if ("add" == operate) {
		
		var basketItem = {
				"productId" : productId, // not null
				"productUrl" : productUrl,
				"imageUrl" : "",
				"artist" : "",
				"title" : productName,
				"price" : productPrice,
				"quantity" : 1, // not null
				"siteType" : offerName,
				"flag" : true,
				"totalPrice" : 0.00,
				"brandId":$("#defaultBrandId").val(),
				"clientId":$("#defaultClientId").val(),
				"retailerId":$("#defaultRetailerId").val()
			};
		basket.addItem(basketItem);
	} else if ("minus" == operate) {
		basket.itemQuantityChange(productId, -1, false);
	}
	remoteStorage.save();
}

// remove the product by id from basket on basket page.
function removeItemById(obj,productId) {

	hideTipInfo();
	var basketName = retailerName+brandName+"Basket";
	var basket = new BasketObject();
	basket.setSaveName(basketName);
	
	var basketItem = {
			"productId":productId,
			flag:true
	};
	
	basket.removeItem(basketItem);
	//basket.itemQuantityChange(id, 1, true);
	// $("#"+id).parent().find("input.sch_input_qty").val(0);
	//$("#" + id + "Quantity").val(0);
	// displayDefaultBasketInfo();
	var current = $(obj).parent().parent().parent();// .remove();
	current.remove();

	var totalPrice = basket.caculatePrice();
	$("#totalPrice").text("£" + totalPrice);
	remoteStorage.save();
	$("#basketList").getNiceScroll().resize();
	//var totalPriceWithoutOffer=basket.caculatePriceWithOutOffer();
	
	//displayDefaultBasketInfo();
}

// change the num you select .
function changeSelectNum(obj) {
	var operate = $(obj).attr("class");
	var cureNum = $(obj).parent().parent().find("input.sch_input_qty").val() * 1;
	if (operate == "add") {
		cureNum += 1;
		changeCurrentBasketInfo("add", obj);
	} else if (operate == "minus") {
		if (cureNum == 0) {
			cureNum = 0;
		} else {
			cureNum -= 1;
			changeCurrentBasketInfo("minus", obj);
		}
	}
	$(obj).parent().parent().find("input.sch_input_qty").val(cureNum);
}

function hiddenDiv() {
	$("#productsBasket").show();

	$("#checkArea").hide();

}

function login(num) {
	setTimeout(hiddenDiv, 1000);
	var userName = '';
	var password = '';
	if (num == 0) {
		userName = $("#userName").val();
		password = $("#password").val();
	} else {
		$("#rePwdPlaceholder").remove();
		userName = $("#SecondUserName").val();
		password = $("#SecondPassword").val();
	}
	
	var rn=retailerName=="Pharmacy"?"Pharmacy2U":retailerName;
	_gaq.push(['_trackevent', 'add to basket', 'click', rn.toLowerCase() , , 'true']);
	_gaq.push(['b._trackevent', 'add to basket', 'click', rn.toLowerCase() , , 'true']);

	
	var blankUserName=retailerName=="Pharmacy"?"Pharmacy2U":retailerName;
	blankUserName+=' username';
	var blankPassword=retailerName+' username';
	if (isEmpty(userName) || isEmpty(password)||blankUserName.toLowerCase()==userName.toLowerCase()||blankPassword.toLowerCase()==password.toLowerCase()) {
		$(".errors_con").hide();
		showMaskLayerWithCenterDiv("errors_con_unvalid_userName_password");
	} else {
		// prepare to login.....
		var basketName = retailerName + brandName + "Basket";
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
			$(".errors_con").hide();
			showMaskLayerWithCenterDiv("errors_con_emptyBasket");
//			showMsgDiv("YOUR BASKET IS EMPTY. PLEASE GO BACK AND SELECT SOME PRODUCTS",true);
			return;
		}
		var retailerNameForLogin=retailerName;
		//var defaultReatiler = $("#defaultReatiler").val();
		if (retailerName.indexOf("Sainsbury") != -1) {
			retailerNameForLogin = "SainsburysMobile";
		}
		var loginUrl = path+ "/loginFor" + retailerNameForLogin;
		var addBasketUrl = path + "/addTo" + retailerNameForLogin
				+ "BasketEachProduct";
		// showMaskLayerWithLoading();
		//显示addtobasker 动画
		//$(".bsk_login").hide();
		$(".errors_con").hide();
		showMaskLayerWithCenterDiv("errors_con_addingToBasketAnimation");
		
//		if (num == 0) {
//			$(".basket_panel_con").hide();
//			$(".basket_panel_con2").show();
//		} else {
//			$(".basket_panel_con4").hide();
//			$(".basket_panel_con2").show();
//		}

		//判断用户是否选择接受邮件，是的话要保存用户的信息
		if($("#offerCheckBox").attr("checked") == 'checked'){
			var basketName = retailerName + brandName + "Basket";
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
					$(".errors_con").hide();
					showMaskLayerWithCenterDiv("errors_con_animationChecking");
					addToBasket(tmpData, addBasketUrl);
				} else if (data.indexOf("Connection refused") != -1) {
					window.location.href = path + "/sendSystemError";
				} else {
					// closeMaskLayer();
					// showMsgDiv(data);
					if (num == 1) {
						$(".errors_con").hide();
						showMaskLayerWithCenterDiv("errors_con_SecondInputUserNameAndPasswordFailure");
//						$(".basket_panel_con2").hide();
//						$(".basket_panel_con3").hide();
//						$(".basket_panel_con4").hide();
//						$(".basket_panel_con5").show();
//						$("#test").hide();
					} else {
						$(".errors_con").hide();
						showMaskLayerWithCenterDiv("errors_con_secondInputUserNameAndPassword");
//						$("#test").hide();
//						$(".basket_panel_con2").hide();
//						$(".basket_panel_con5").hide();
//						$(".basket_panel_con3").hide();
//						$(".basket_panel_con4").show();
					}
				}
			}
		});
	}

	// setTimeout("alert('0.1seconds')",100);
}

function addToBasket(tmpData, addBasketUrl) {
	// alert(addBasketUrl);
	$
			.ajax({
				url : addBasketUrl,
				type : "post",
				dataType : 'json',
				data : {
					// 'retailer':$("#defaultReatiler").val(),
					'productsArray' : parseToStr(tmpData),
					'clearBasket' : "N"
				},
				success : function(data) {
					var basketName = retailerName+brandName + "Basket";
					var current = getBasketListForLocal(basketName, true);
					$(".bsk_login").hide();
					$(".errors_con").hide();
					//$("#errors_con_animationChecking").show();
//					$(".basket_panel_con").hide();
//					$(".basket_panel_con2").hide();
//					$(".basket_panel_con3").hide();
					var flag = 0;
					var failureListcount=0;
					$(parseToJson(data))
							.each(
									function(index, item) {					
										if (item.indexOf("Success") == -1) {
											if(failureListcount<2){
												$("#failureListMsg").append("<li style='text-align:center; font-size:11px; line-height:15px;height:15px; color:#1A1A1A;'><span >"+ current[index].title+ "</span></li>");
												$("#popUpUl").append("<li style='text-align:center;font-size:11px; line-height:15px;height:15px; color:#1A1A1A;'><span >"+ current[index].title+ "</span></li>");
											}else{
												$("#popUpUl")
												.append(
														"<li style='text-align:center; cursor:pointer;font-size:11px; line-height:15px;height:15px; color:#1A1A1A;' class='failureListMsg_large2'><span>"+ current[index].title+ "</span></li>");
											}
										failureListcount++;
										flag = 1;
										}
									});
					if(failureListcount>2){
						$("#failureListMsg")
						.append(
								"<li style='text-align:center; cursor:pointer; font-size:11px;line-height:20px;height:20px;' onclick='failureListMsgUtil();'><span >MORE>...</span></li>");
					}
					if (flag == 0) {
						//localStorage.removeItem(basketName);
						var url1 = path + "/" + brandName + "/" + retailerName
								+ "/thanks";
//						if (isNotEmpty(productId)) {
//							url1 += "/" + productId;
//						}
						remoteStorage.setItem('addBasketSuccess','addBasketSuccess');
						remoteStorage.save(url1);
					}

					
					if (flag == 1) {
						var r=retailerName=="Pharmacy"?"pharmacy2u":retailerName.toLowerCase();
						_gaq.push(['_trackevent', 'oos error', 'show', r , , 'true']);
						_gaq.push(['b._trackevent', 'oos error', 'show', r , , 'true']);

						showMaskLayerWithCenterDiv("errors_con_displayOutOfStockProducts");
						$("#goBackAndChooseAnother").click(function(){
							window.location.href = path + "/"+ brandName + "/" + retailerName+ "/product";
						});
						$("#finishShopping").click(function(){
							window.location.href = path + "/"+ brandName + "/" + retailerName+ "/thanks";
						});
					}
					localStorage.removeItem(basketName);
				}
			});
}

function showTipInfo(obj) {
	var left = $(obj).offset().left;
	var top = $(obj).offset().top;
	$(obj).attr("style", "cursor: pointer");
	$("#delBasketTip").css("position", "absolute");
	$("#delBasketTip").offset({
		"left" : left -133,
		"top" : top - 32
	}).css("display", "block");
}

function hideTipInfo() {
	$("#delBasketTip").removeAttr("style").hide();
}

function showTotalMsgDiv(obj) {
	// if(retailerName.toLowerCase().indexOf("sainsbury")!=-1){
	var basketName = $("#defaultReatiler").val() + brandName + "Basket";
	var current = getBasketListForLocal(basketName, true);
	var flag = 0;
//	for ( var v = 0; v < current.length; v++) {
//		if (isNotEmpty(current[v].siteType)) {
//			flag = 1;
//			break;
//		}
//	}
	//如果篮子为空 ，不显示。
	if(isNotEmpty(current)){
		flag=1;
	}else{
		flag=0;
	}
	
	if (flag == 1) {
		$(obj).attr("style", "cursor: pointer");
		var left = $(obj).offset().left;
		var top = $(obj).offset().top;
		$("#TotalMsgTip").css("position", "absolute");
		$("#TotalMsgTip").offset({
			"left" : left - 65.5,
			"top" : top - 70
		}).css("display", "block");
		// }
	} else {
		$(obj).removeAttr("style");
	}
}

function hideTotalMsgDiv(obj) {
	$(obj).removeAttr("style");
	$("#TotalMsgTip").removeAttr("style").hide();
}

function displayLogin() {
	$("#test").hide();
	$(".basket_panel_con").show();
}
function BackToLogin(){
//	$(".basket_panel_con2").hide();
//	$(".basket_panel_con3").hide();
//	$(".basket_panel_con4").hide();
//	$(".basket_panel_con5").hide();
//	$("#userName").val("");
//	$("#password").val("");
//	$(".basket_panel_con").show();
	$(".errors_con").hide();
	closeMaskLayer();
	$(".bsk_login").show();
}

function failureListMsgUtil(){
	$("#errors_con_displayOutOfStockProducts").hide();
	$("#popUpOutOfStockClose").live("click",function(){
		closeMaskLayer();
		$("#popUpOutOfStockProductListDiv").hide();
	});
	showMaskLayerWithCenterDiv("popUpOutOfStockProductListDiv");
//	$("#popUpOutOfStockProductListDiv").removeAttr("style");
//	var divHeight = $("#popUpOutOfStockProductListDiv").height();
//	var divWidth = $("#popUpOutOfStockProductListDiv").width();
//	var screenW = document.body.clientWidth ;
//	var divLeft = Math.round((screenW-divWidth)/2);
//	var scrollH = document.body.scrollTop;
//	var screenH = document.body.clientHeight;
//	var divTop = Math.abs(Math.round((screenH-divHeight)/2)+scrollH);
//	var div = '<div id="floatMaskLayerDiv" style="position: absolute; top:0; left: 0px; width: 100%; height: 200%; text-align:center; filter: Alpha(Opacity =         30); opacity: 0.3; background-color: #000000;z-index:100009; ">';
//	div+='</div>';
//	$("body").append($(div));
//	$("#popUpOutOfStockProductListDiv").find("div#popUpOutOfStockClose").click(function(){
//		$("#floatMaskLayerDiv").remove();
//		$("#popUpOutOfStockProductListDiv").hide();
//	});
//	$("#popUpOutOfStockProductListDiv").offset({
//		"left":divLeft,
//		"top":divTop
//	}).css("display","block");
}

function savePassword(password){
	try{
		localStorage.setItem("specialK_"+retailerName+"_password",$("#"+password).val());
	}catch(e){
		window.console.log("User has disabled storing local content");
		alert("Sorry, you must allow this site to store local data to continue. You can change this policy in your browser's security settings.");
	}
}

function showMaskLayerWithCenterDiv(divId){
	$("#floatMaskLayerDiv").remove();
	showMaskLayerWithoutLoading();
	//$("#"+divId).attr("style","");
	$("#"+divId).removeAttr("style");
	var divHeight = $("#"+divId).height();
	var divWidth = $("#"+divId).width();
	var screenW = document.body.clientWidth ;
	var divLeft = Math.round((screenW-divWidth)/2);
	var scrollH = document.body.scrollTop;
	var screenH = document.body.clientHeight;
	var divTop = Math.abs(Math.round((screenH-divHeight)/2)+scrollH);
	$("#"+divId).css("position","absolute");
	$("#"+divId).css("z-index","1000010");
	$("#"+divId).offset({
		"left":divLeft,
		"top":divTop-75
	}).css("display","block");
	
	if("errors_con_secondInputUserNameAndPassword"==divId){
		if(!isPlaceholder()){
			var pwdField    = $("input[name=rePassword]");  
	        var pwdVal      = pwdField.attr('placeholder'); 
	        pwdField.after('<input id="rePwdPlaceholder" type="text" class="new_input" value="'+pwdVal+'" />');  
	        var pwdPlaceholder = $('#rePwdPlaceholder');  
	        pwdPlaceholder.show();  
	        pwdField.hide();  
	          
	        pwdPlaceholder.focus(function(){  
	            pwdPlaceholder.hide();  
	            pwdField.show();  
	            pwdField.focus();  
	        });  
	          
	        pwdField.blur(function(){  
	            if(pwdField.val() == '') {  
	                pwdPlaceholder.show();  
	                pwdField.hide();  
	            }  
	        });  
		}
	}
	
}

function clearUserNameAndPassword(){
	$("#userName").val("");
	$("#password").val("");
	$("#SecondUserName").val("");
	$("#SecondPassword").val("");
	$(".errors_con").hide();
	closeMaskLayer();
}

function saveUserName(userName){
	try{
		remoteStorage.setItem(brandName + retailerName + "_userName",$("#"+userName).val());
	}catch(e){
		window.console.log("User has disabled storing local content");
		alert("Sorry, you must allow this site to store local data to continue. You can change this policy in your browser's security settings.");
	}
}
