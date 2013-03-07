
function initPageWithBasketInfo(){
	var basketName = $("#defaultReatiler").val() + brandName + "Basket";
	var basket = new BasketObject();
	basket.setSaveName(basketName);
	var current = getBasketListForLocal(basketName, true);
	if (isNotEmpty(current)) {
		for ( var v = current.length; v--; v >= 0) {
			var item = current[v];
			if (item.quantity == 0)
				return;
			$("#" + item.productId).parent().find("input.sch_input_qty").val(item.quantity);
		}
	}
	$("#m_h_bsk").text(basket.getLength());
}

function initBasketPageWithProduct(){
	var basketName = retailerName + brandName + "Basket";
	var basket = new BasketObject();
	basket.setSaveName(basketName);
	var current = getBasketListForLocal(basketName, true);
	if(isNotEmpty(current)){
		$("#basketList").empty();
		for ( var v = current.length; v--; v >= 0) {
			var item = current[v];
			if (item.quantity == 0)
				return;
			
			var pb='<div>';
			pb+='<div class="bsk_proname">';
			pb+='<ul> <li >'+item.title+'</li>';
			pb+='<li style="font-weight: bold;">x'+item.quantity+'</li> </ul>';
			pb+='</div> <div class="bsk_proprice"> <ul>';
			pb+='<li><img src="'+path+'/images/mobile/nesquik/icon_bskinfo.png" width="38px" height="34px" name="" border="0"></li>';
			pb+='<li style="width:45px; padding-left:5px; line-height: 34px;">£'+formatFloat(item.price * item.quantity,2)+'</li>';
			pb+='<li><input value="'+item.productId+'" type="hidden"/><img src="'+path+'/images/mobile/nesquik/icon_del.png" onclick="removeItemById(this);" width="38px;" height="34px" name="" border="0"></li>';
			pb+='</ul> </div> <div class="clear"></div>';
			pb+='</div>';
//			var exampleData = $("#exampleData");
//			exampleData.find("input:eq(0)").val(item.productId);
//			exampleData.find("div:eq(0)").find("li:eq(1)").text("x" + item.quantity);
//			exampleData.find("div:eq(1)").find("li:eq(1)").text( "£" + formatFloat(item.price * item.quantity, 2));
			$("#basketList").append(pb);
		}
		$("#totalPrice").text("£" + basket.caculatePrice());
		$("#exampleData").hide();
	}else{
		$("#basketList").empty();
		$("#totalPrice").text("£" + 0.00);
	}
}


// add or minus one product 's quantity;
function changeCurrentBasketInfo(operate, obj) {
	var v=0;
	var basketName = $("#defaultReatiler").val() + brandName + "Basket";
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
		v=basket.addItem({
			"productId" : productId, // not null
			"productUrl" : productUrl.trim(),
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
		});
		v=v.quantity;
	} else if ("minus" == operate) {
		v=basket.itemQuantityChange(productId, -1, false);
	}
	initPageWithBasketInfo();
	return v;
}

// remove the product by id.
function removeItemById(obj) {

	hideTipInfo();
	var id = $(obj).parent().find("input").val();
	var basketName = retailerName + brandName + "Basket";
	var basket = new BasketObject();
	basket.setSaveName(basketName);
	basket.itemQuantityChange(id, 1, true);
	initBasketPageWithProduct();
//	var current = $(obj).parent().parent().parent().parent();// .remove();
//	current.remove();
//	var totalPrice = basket.caculatePrice();
//	$("#totalPrice").text("£" + totalPrice);
}

// change the num you select .
function changeSelectNum(obj) {
	var operNum=-1;
	var operate = $(obj).attr("class");
//	var cureNum = $(obj).parent().parent().find("input.sch_input_qty").val() * 1;
	if (operate == "add") {
//		cureNum += 1;
		operNum=changeCurrentBasketInfo("add", obj);
	} else if (operate == "minus") {
//		if (cureNum == 0) {
//			cureNum = 0;
//		} else {
//			cureNum -= 1;
			operNum=changeCurrentBasketInfo("minus", obj);
//		}
	}
	$(obj).parent().parent().find("input.sch_input_qty").val(operNum);
}



function showTipInfo(obj) {
	var left = $(obj).offset().left;
	var top = $(obj).offset().top;
	$(obj).attr("style", "cursor: pointer");
	$("#delBasketTip").css("position", "absolute");
	$("#delBasketTip").offset({
		"left" : left - 65.5,
		"top" : top - 30
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
	for ( var v = 0; v < current.length; v++) {
		if (isNotEmpty(current[v].siteType)) {
			flag = 1;
			break;
		}
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

$(document).ready(function(){
	initPageWithBasketInfo();
});