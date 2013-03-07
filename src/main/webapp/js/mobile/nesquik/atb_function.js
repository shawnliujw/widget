

function loginAndAddToBasket(){
	if (defaultRetailer.indexOf("Sainsbury") != -1) {
		defaultRetailer = "SainsburysMobile";
	}
	var tmpUrl='/loginFor'+defaultRetailer;
	tmpUrl=encodeUrl(tmpUrl);
	var sendData={
		'email':$("#email").val(),
		'password':$("#password").val()
	};
	if(sendData.email==null||""==sendData.email){
		showMsgDiv("Enter your email, please");
		return;
	}
	if(sendData.password==null||""==sendData.password){
		showMsgDiv("Enter your password, please");
		return ;
	}
	
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
	if(tmpData==null||tmpData.length==0){
		showMsgDiv("Your basket is empty.");
		return;
	}
	var addBasketUrl ="/addTo" + defaultRetailer + "BasketEachProduct";
	addBasketUrl=encodeUrl(addBasketUrl);
	
	showMaskLayerWithLoading();
	$.ajax({
		url : tmpUrl,
		type : "post",
		dataType : 'json',
		data : sendData,
		success : function(data) {
			if(data=='success'){
				addToBasket(tmpData,addBasketUrl);
			}else{
				showMsgDiv(data);
			}
		}
	});
}

function addToBasket(tmpData,tmpUrl){
	$.ajax({
		url : tmpUrl,
		type : "post",
		dataType : 'json',
		data : {
			'productsArray' : parseToStr(tmpData),
			'clearBasket' : "N",
		},
		success : function(data) {
			var flag = 0;
			$(parseToJson(data)).each(function(index, item) {
				if (item.indexOf("Success") == -1) {
					flag = 1;
				}
			});
			if (flag == 0) {
				var url1 = path + "/" + brandName + "/" + retailerName  + "/all/thanks";
				window.location.href = url1;
			}else{
				showMsgDiv(data);
			}
		}
	});
}
//
//function login(num) {
//
//	setTimeout(hiddenDiv, 1000);
//	var userName = '';
//	var password = '';
//	if (num == 0) {
//		userName = $("#userName").val();
//		password = $("#password").val();
//	} else {
//		userName = $("#SecondUserName").val();
//		password = $("#SecondPassword").val();
//	}
//	if (isEmpty(userName) || isEmpty(password)) {
//		// showMsgDiv("please input the userName or password!");
//		$(".basket_panel_con").hide();
//		$(".basket_panel_con2").hide();
//		$(".basket_panel_con3").hide();
//		$(".basket_panel_con4").hide();
//		$(".basket_panel_con5").hide();
//		$("#test").show();
//	} else {
//		// prepare to login.....
//		var basketName = $("#defaultReatiler").val() + brandName + "Basket";
//		var basket = new BasketObject();
//		basket.setSaveName(basketName);
//		var current = getBasketListForLocal(basketName, true);
//
//		// prepare the dataArray to add to basket.
//		var tmpData = new Array();
//		for ( var v = 0; v < current.length; v++) {
//			var obj = {
//				'productUrl' : '',
//				'quantity' : ''
//			};
//			obj.productUrl = current[v].productUrl;
//			obj.quantity = current[v].quantity;
//
//			tmpData.push(obj);
//		}
//		var defaultReatiler = $("#defaultReatiler").val();
//		if (defaultReatiler.indexOf("Sainsbury") != -1) {
//			defaultReatiler = "SainsburysMobile";
//		}
//		var loginUrl = $("#context").val() + "/loginFor" + defaultReatiler;
//		var addBasketUrl = $("#context").val() + "/addTo" + defaultReatiler
//				+ "BasketEachProduct";
//		// showMaskLayerWithLoading();
//		if (num == 0) {
//			$(".basket_panel_con").hide();
//			$(".basket_panel_con2").show();
//		} else {
//			$(".basket_panel_con4").hide();
//			$(".basket_panel_con2").show();
//		}
//
//		//判断用户是否选择接受邮件，是的话要保存用户的信息
//		if($("#offerCheckBox").attr("checked") == 'checked'){
//			var basketName = $("#defaultReatiler").val() + brandName + "Basket";
//			var current = getBasketListForLocal(basketName, true);
//			var pr = current[0];
//			$.post(path+"/saveAlertUser",{
//				"brandId":pr.brandId,
//				"clientId":pr.clientId,
//				"retailerId":pr.retailerId,
//				"userName":userName
//			}
//			);
//		}
//		
//		
//		$.ajax({
//			url : loginUrl,
//			type : "post",
//			dataType : 'json',
//			data : {
//				// 'retailer':$("#defaultReatiler").val(),
//				'email' : userName,
//				'password' : password
//			},
//			success : function(data) {
//				if (data == "success") {
//					addToBasket(tmpData, addBasketUrl);
//				} else if (data.indexOf("Connection refused") != -1) {
//					window.location.href = path + "/sendSystemError";
//				} else {
//					// closeMaskLayer();
//					// showMsgDiv(data);
//					if (num == 1) {
//
//						$(".basket_panel_con2").hide();
//						$(".basket_panel_con3").hide();
//						$(".basket_panel_con4").hide();
//						$(".basket_panel_con5").show();
//						$("#test").hide();
//					} else {
//						$("#test").hide();
//						$(".basket_panel_con2").hide();
//						$(".basket_panel_con5").hide();
//						$(".basket_panel_con3").hide();
//						$(".basket_panel_con4").show();
//					}
//				}
//			}
//		});
//	}
//
//	// setTimeout("alert('0.1seconds')",100);
//}
//
//function addToBasket(tmpData, addBasketUrl) {
//	// alert(addBasketUrl);
//	$
//			.ajax({
//				url : addBasketUrl,
//				type : "post",
//				dataType : 'json',
//				data : {
//					// 'retailer':$("#defaultReatiler").val(),
//					'productsArray' : parseToStr(tmpData),
//					'clearBasket' : "N",
//				},
//				success : function(data) {
//					
//	
//					$(".basket_panel_con").hide();
//					$(".basket_panel_con2").hide();
//					var flag = 0;
//					$(parseToJson(data))
//							.each(
//									function(index, item) {
//										if (item.indexOf("Success") == -1) {
//											if (index == 2) {
//												$("#failureListMsg")
//														.append(
//																"<li><span>MORE>...</span></li>");
//											} else if (index < 2) {
//												$("#failureListMsg")
//														.append(
//																"<li><span>"
//																		+ current[index].title
//																		+ "</span></li>");
//											}
//											flag = 1;
//										}
//									});
//					if (flag == 0) {
//						var url1 = path + "/" + brandName + "/" + retailerName
//								+ "/" + categoryName + "/thanks";
//						if (isNotEmpty(productId)) {
//							url1 += "/" + productId;
//						}
//						window.location.href = url1;
//					}
//
//					if (flag == 1) {
//						$("li.input_con01").click(
//								function() {
//									window.location.href = path + "/"
//											+ brandName + "/" + retailerName
//											+ "/" + categoryName + "/product";
//								});
//						$(".basket_panel_con3").show();
//					}
//					//localStorage.removeItem(basketName);
//				}
//			});
//}
//
//function displayLogin() {
//	$("#test").hide();
//	$(".basket_panel_con").show();
//}