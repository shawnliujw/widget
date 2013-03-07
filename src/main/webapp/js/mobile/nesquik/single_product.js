

 function initSingleProductPageWithBasket(){
	 
	 var basketName = $("#defaultReatiler").val() + brandName + "Basket";
		var basket = new BasketObject();
		basket.setSaveName(basketName);
		var current = getBasketListForLocal(basketName, true);
		if (isNotEmpty(current)) {
			var obj=basket.getItemById(productId);
			if(obj==null){
				$("#cureNum").val("0");
			}else
				$("#cureNum").val(obj.quantity);
		}
		$("#m_h_bsk").text(basket.getLength());
 }
 
 function changeSelectNum(obj,oper){
	 var cureNum = $("#cureNum").val() * 1;
	 if(oper>0){
		 cureNum += 1;
		 changeCurrentBasketInfo("add");
	 }else{
		 cureNum -= 1;
		 cureNum=changeCurrentBasketInfo("minus");
	 }
	 $("#cureNum").val(cureNum);
 }
 
 function changeCurrentBasketInfo(operate) {
		var basketName = $("#defaultReatiler").val()+brandName + "Basket";
		var basket = new BasketObject();
		var v=0;
		basket.setSaveName(basketName);

		if ("add" == operate) {
			basket.addItem({
				"productId" : $("#defaultReatilerId").val(), // not null
				"productUrl" : $("#defaultRetailerUrl").val().trim(),
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
			});
		} else if ("minus" == operate) {
			v=basket.itemQuantityChange($("#defaultReatilerId").val(), -1, false);
		}
		initSingleProductPageWithBasket();
		return v;
}

 var infosArray=["additionalInfo","ingredients","usage","nutrition","additives","allergyAdvice","lifeStyle"];
 
 function changeInfos(o,obj){
	 
	 var v=$(o).text();
	 v=v.toUpperCase();
	 $("#thisIsSingle").text(v);
	 $(infosArray).each(function(idx,item){
		 if(item==obj){
			 $("#"+item).fadeIn();
		 }else
			 $("#"+item).hide();
	 });
	 showDivCenter("#thisIsSingle",'#div_s_c');
 }
 