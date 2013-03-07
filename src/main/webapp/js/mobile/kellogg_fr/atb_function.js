

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
