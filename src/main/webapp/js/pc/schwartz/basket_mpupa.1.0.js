
/**
 * @title Basket Object for Mpupa Ltd.
 * @Description Basket Object can new object, and must use setSaveName() function
 * @Version 1.0
 * @author Steve
*/

/**
  * Object BasketObject()
  * @constructor
  * @extends Object
  * @since Standard ECMA-262 3rd. Edition
  * @since Level 2 Document Object Model Core Definition.
 */
function BasketObject() {}
BasketObject.prototype = new Object();
BasketObject.prototype.saveName = "basketList";

/**
 * function setSaveName(saveName)
 * @memberOf	BasketObject
 * @param {Object} saveName
 */
BasketObject.prototype.setSaveName = function(saveName) {
	this.saveName = saveName;
};

/**
 * Property item
 * @type    JSON
 */
BasketObject.prototype.item = {
	"productId" : "", // not null
	"productUrl" : "", // not null
	"imageUrl" : "",  
	"artist" : "",  
	"title" : "",  
	"price" : "",  
	"quantity" : "0", // not null
	"siteType" : "",  
	"flag" : true  ,
	"totalPrice":0,
	"retailerId":"",
	"clientId":"",
	"brandId":""
};

/**
 * function getItemList()
 * 
 * @memberOf BasketObject
 * @returns {JSON Array}
 */
BasketObject.prototype.getItemList = function() {
	return getBasketListForLocal(this.saveName, true);
};

/**
 * function getItem()
 * @memberOf 	BasketObject
 * @returns {JSON}
 */
BasketObject.prototype.getItem = function() {
	return this.item;
};

/**
 * function getItemById(productId)
 * @param productId req
 * @returns {JSON} BasketObject.item
 */
BasketObject.prototype.getItemById = function(productId) {
	var array = getBasketListForLocal(this.saveName, true);
	if (notEmpty(productId)) {
		var ret = -1;
		if (notEmpty(array)) {
			for ( var i = 0; i < array.length; i++) {
				if (array[i].productId == productId) {
					ret = i;
				}
			}
			if(ret!=-1){
				return array[ret];
			}else{
				
				//如果在basket 商品列表里面找不到对应的商品，说明该商品已经被移除，那么就需要根据该商品id去缓存里面查找，方便重新将该商品添加到对应的basket里面
				var loPro = getModel(productId,true);
				if(isNotEmpty(loPro)) {
					
					var o = this.getItem();
					o.price=loPro.nowPrice;
				    o.productUrl=loPro.productUrl;
				    o.title=loPro.title;
				    o.imageUrl = loPro.productImage;
				    o.productId=loPro.id;
				    o.quantity=0;
					
					return o;
				} else {
					return null;
				}
				
			}
		} else {
			//如果在basket 商品列表里面找不到对应的商品，说明该商品已经被移除，那么就需要根据该商品id去缓存里面查找，方便重新将该商品添加到对应的basket里面
				var loPro = getModel(productId,true);
				if(isNotEmpty(loPro)) {
					var o = this.getItem();
					o.price=loPro.nowPrice;
				    o.productUrl=loPro.productUrl;
				    o.title=loPro.title;
				     o.imageUrl = loPro.productImage;
				    o.quantity=0;
					 o.productId=loPro.id;
					return o;
				} else {
					return null;
				}
		}
	} else {
		alert('productId is null.');
		return null;
	}
};

/**
 * function itemQuantityChange(productId,step)
 * @param productId id
 * @param step  step -1 or 1 or 2 ...
 * @param flag  if remove the item from basket, no matter its quantity
 * @returns {Number} curr quantity if is -1 or 0 then the item is removed.
 * @Editor shawn 
 * @EditorContent 1.add parm 'flag'
 */
BasketObject.prototype.itemQuantityChange = function(productId, step,flag) {
	var v = 0;
	var basketItem = this.getItemById(productId);
	
	if(flag && isNotEmpty(basketItem)) {
		this.removeItem(basketItem);
		return 0;
	}
	
	if (notEmpty(basketItem) && step != 0) {
		var q = basketItem.quantity;
		//if (q > 0) {
			v=q+step;
				if(v<0)v=-1;
				if (v != -1) {
					basketItem.quantity = v;
					this.removeItem(basketItem);
					this.addItem(basketItem);
				}
				if (v == 0) {
					this.removeItem(basketItem);
				}
		//} else {
		//	v = 0;
		//	this.removeItem(basketItem);
		//}
	}
	return v;
};


/**
 * function addItem()
 * @memberOf 	BasketObject
 * @param {JSON} basketItem 
 */
BasketObject.prototype.addItem = function(basketItem) {
	var array = getBasketListForLocal(this.saveName, true);
	if (!notEmpty(array)) {
		array = new Array();
	}
	var obj = null;

	if (notEmpty(basketItem) && basketItem.flag) {
		var v = this.getItemById(basketItem.productId);
		if (notEmpty(v) && (v.productUrl == basketItem.productUrl)) {
			var vQ = v.quantity;
			
			if(isEmpty(vQ)) {
				vQ = 0;
			}
			
			var bQ = basketItem.quantity;
			
			if(isEmpty(bQ)) {
				bQ = 1;
			}
			
				basketItem.quantity = vQ + bQ;
				this.removeItem(basketItem);
				
				var pr = basketItem.price*basketItem.quantity;
				basketItem.totalPrice = formatFloat(pr,2);
				
				array = getBasketListForLocal(this.saveName, true);
				array.push(basketItem);
				obj = basketItem;
		} else {
			array.push(basketItem);
		}
	}
	saveBasketListToLocal(this.saveName, array);
	return obj;
};
/**
 * function removeItem()
 * @memberOf 	BasketObject
 * @param {JSON} basketItem 
 * @returns {Object} array
 */
BasketObject.prototype.removeItem = function(basketItem) {
	var array = getBasketListForLocal(this.saveName, true);
	if (notEmpty(basketItem) && basketItem.flag) {
		if (notEmpty(array)) {
			for ( var i = 0; i < array.length; i++) {
				if (array[i].productId == basketItem.productId) {
					array.splice(i, 1);
				}
			}
		}
		if (notEmpty(array) && array.length > 0) {
			saveBasketListToLocal(this.saveName, array);
		} else {
			localStorage.removeItem(this.saveName);
		}
	}
};

/**
 * function caculatePriceByDB();
 * description: get total price by java code.
 * 
 */
BasketObject.prototype.caculatePriceByDB=function(){
	var array = getBasketListForLocal(this.saveName, true);
	var totalPrice = 0;
	var result="";
	if(isNotEmpty(array)){
		for(var i=0;i<array.length;i++){
			var price=array[i].price;
			var quantity = array[i].quantity;
			var offerType=array[i].siteType;
			var productUrl=array[i].productUrl;
			if(isNotEmpty(offerType)){
				result+=price+"~~"+quantity+"~~"+offerType+"~~"+productUrl+"@@";
			}else{
				result+=price+"~~"+quantity+"~~"+"-1"+"~~"+productUrl+"@@";
			}
		}
	}
	//alert(parseToStr(array));
	$.ajax({
		url:path+"/offer/catulateOffer",
		type:'post',
		async:false,
		data:{'array':result},
		dataType:'json',
		success:function(data){
			totalPrice=parseToStr(data);
			return formatFloat(totalPrice, 2);
			
		}
	});
	totalPrice = formatFloat(totalPrice, 2);
	return totalPrice;
}











/**
 * function caculatePrice()
 * @memberOf 	BasketObject
 * @returns {Number} price 
 */
BasketObject.prototype.caculatePrice = function() {
	// TODO: Alternate
	var array = getBasketListForLocal(this.saveName, true);
	var totalPrice = 0;
	if (notEmpty(array)) {
		var o1=o2=o3=o4=o5=o6=o7=o8=o10=o11=o12=o13=o14=0;
		var o1Price=o2Price=o3Price=o4Price=o5Price=o6Price=o7Price=o8Price=o10Price=o11Price=o12Price=o13Price=o14Price=0;
		for ( var i = 0; i < array.length; i++) {
			var price = array[i].price;
			
			if(price.indexOf("£") != -1) {
				var ind = price.indexOf("£");
				price = price.substr(ind+1);
			} 
			
			var quantity = array[i].quantity;
			var offerType=array[i].siteType;
//			if (notEmpty(price)) {
//				totalPrice += parseFloat(price) * parseFloat(quantity);
//			} 
//			old price caculate
			if(offerType==1){
				o1+=quantity;
				o1Price=price;
			}else if(offerType==2){
				o2+=quantity;
				o2Price=price;
			}else if(offerType==3){
				o3+=quantity;
				o3Price=price;
			}else if(offerType==4){
				o4+=quantity;
				o4Price=price;
			}else if(offerType==5){
				o5+=quantity;
				o5Price=price;
			}else if(offerType==6){
				o6+=quantity;
				o6Price=price;
			}else if(offerType==7){
				o7+=quantity;
				o7Price=price;
			}else if(offerType==8){
				o8+=quantity;
				o8Price=price;
			}else if(offerType==10){
				o10+=quantity;
				o10Price=price;
			}else if(offerType==11){
				o11+=quantity;
				o11Price=price;
			}else if(offerType==12){
				o12+=quantity;
				o12Price=price;
			}else if(offerType==13){
				o13+=quantity;
				o13Price=price;
			}else if(offerType==14){
				o14+=quantity;
				o14Price=price;
			}else{
				totalPrice=parseFloat(totalPrice)+parseFloat(calculateSingle(price,quantity,offerType,false));
			}
			
			
		}
		totalPrice=parseFloat(totalPrice)+parseFloat(calculateSingle(o1Price,o1,'1',false));
		totalPrice=parseFloat(totalPrice)+parseFloat(calculateSingle(o2Price,o2,'2',false));
		totalPrice=parseFloat(totalPrice)+parseFloat(calculateSingle(o3Price,o3,'3',false));
		totalPrice=parseFloat(totalPrice)+parseFloat(calculateSingle(o4Price,o4,'4',false));
		totalPrice=parseFloat(totalPrice)+parseFloat(calculateSingle(o5Price,o5,'5',false));
		totalPrice=parseFloat(totalPrice)+parseFloat(calculateSingle(o6Price,o6,'6',false));
		totalPrice=parseFloat(totalPrice)+parseFloat(calculateSingle(o7Price,o7,'7',false));
		totalPrice=parseFloat(totalPrice)+parseFloat(calculateSingle(o8Price,o8,'8',false));
		totalPrice=parseFloat(totalPrice)+parseFloat(calculateSingle(o10Price,o10,'10',false));
		totalPrice=parseFloat(totalPrice)+parseFloat(calculateSingle(o11Price,o11,'11',false));
		totalPrice=parseFloat(totalPrice)+parseFloat(calculateSingle(o12Price,o12,'12',false));
		totalPrice=parseFloat(totalPrice)+parseFloat(calculateSingle(o13Price,o13,'13',false));
		totalPrice=parseFloat(totalPrice)+parseFloat(calculateSingle(o14Price,o14,'14',false));
	}
	totalPrice = formatFloat(totalPrice, 2);
	return totalPrice;
};

/**
 * function caculatePriceWithOutOffer()
 * @memberOf 	BasketObject
 * @returns {Number} price 
 * @addon 2012-11-06 10:40:07
 */
BasketObject.prototype.caculatePriceWithOutOffer=function(){
	var array = getBasketListForLocal(this.saveName, true);
	var totalPrice = 0;
	if(notEmpty(array)){
		for ( var i = 0; i < array.length; i++) {
			var price = array[i].price;
			if(price.indexOf("£") != -1) {
				var ind = price.indexOf("£");
				price = price.substr(ind+1);
			} 
			var quantity = array[i].quantity;
			totalPrice=parseFloat(totalPrice)+parseFloat(calculateSingle(price,quantity,null,true));
		}
	}
	totalPrice = formatFloat(totalPrice, 2);
	return totalPrice;
};


/**
 * 将对象或者字符串方在localStorage中，如果是json对象的话会同时返回这个对象转换后的字符串
 */
function saveBasketListToLocal(modelName, model) {
	if (notEmpty(modelName)) {
		if (typeof (model) == 'object') {
			try {
				var str = JSON.stringify(model);
				localStorage.setItem(modelName, str);
				return str;
			} catch (e) {
				alert("Error when call method 'saveBasketListToLocal' from basket.js----"
						+ e.toString());
			}
		} else {
			localStorage.setItem(modelName, model);
		}
	} else {
		alert("Error when call method 'saveBasketListToLocal' from basket.js----" + "modelName or model is null");
	}
} 

/**
 * 从localStorage中取得相应的参数,如果要取得object对象，那么flag设为true
 */
function getBasketListForLocal(modelName, flag) {
	var str = localStorage.getItem(modelName);
	if (!notEmpty(flag)) { flag = false; }
	if (notEmpty(str)) {
		if (flag) {
			try {
				return JSON.parse(str);
			} catch (e) {
				alert("Error when call method 'getBasketListForLocal' from basket.js----" + e.toString());
			}
		} else {
			return str;
		}
	} else {
		return new Array();
	}
}

function notEmpty(str) {
	var flag = false;
	if (null != str && undefined != str && '' != str) {
		flag = true;
	}
	return flag;
}

/**
 *  offer - 2012年9月26日 10:29:04
 */
var offerArray = [{
	'offerType' : '1',   // offerid
	'offerDesp' : 'any 2 for £2', // offername
	'offerQty' : '2',   //any #quantity# for #price#     quantity
	'offerPrice':'2'	//any #quantity# for #price#     price
}, {
	'offerType' : '2',
	'offerDesp' : 'Save 99p was £1.99 now £1.00',
	'offerPrice':'1.00'
}, {
	'offerType' : '3',
	'offerDesp' : 'Save 49p was £1.99 now £1.50',
	'offerPrice':'1.50'
}, {
	'offerType' : '4',
	'offerDesp' : 'Any 2 for £1.50',
	'offerQty' : '2',
	'offerPrice':'1.50'
}, {
	'offerType' : '5',
	'offerDesp' : 'Better Than Half Price Was £2.49 Now £1.00',
	'offerPrice':'1.00'
}, {
	'offerType' : '6',
	'offerDesp' : 'Better Than Half Price Was £2.75 Now £1.00',
	'offerPrice':'1.00'
}, {
	'offerType' : '7',
	'offerDesp' : ' Buy 2 for £1.20',
	'offerQty' : '2',
	'offerPrice':'1.20'
}, {
	'offerType' : '8',
	'offerDesp' : 'Any 2 for £3.00',
	'offerQty' : '2',
	'offerPrice':'3.00'
},{
	'offerType':'10',
	'offerDesp':'Save 39p was £2.39 now £2.00',
	'offerPrice':'2.00'
},{
	'offerType':'11',
	'offerDesp':'Buy any 2, and add 3rd free',
	'offerQty':'3',
	'offerPrice':'1.99'
},{
	'offerType':'12',
	'offerDesp':'Buy 2 for £1.20',
	'offerQty':'2',
	'offerPrice':'1.20'
},{
	'offerType':'13',
	'offerDesp':'Buy 2 for £3.00',
	'offerQty':'2',
	'offerPrice':'3.00'
},{
	'offerType':'14',
	'offerDesp':'Buy any 2, you add 3rd free',
	'offerQty':'3',
	'offerPrice':'1.99'
}];

function calculateSingle(productPrice,productQty,offerType,withOutOffer){
	var v=formatFloat(productPrice*productQty, 2);
	if(withOutOffer)return v;
	if(productQty==0)return 0;
	if(productQty==1&&offerType!=10)return productPrice;
	if(!isNotEmpty(offerType))return v;
	var offerObj=offerType>=10?offerArray[offerType-2]:offerArray[offerType-1];
	if(offerType==1||offerType==4||offerType==7||offerType==8||offerType==12||offerType==13){
		var e2=parseInt(productQty/parseInt(offerObj.offerQty));
		v=e2*parseFloat(offerObj.offerPrice)+(productQty%2)*productPrice;
	}else if(offerType==2||offerType==3||offerType==5||offerType==6||offerType==10){
		v=productQty*parseFloat(offerObj.offerPrice);
	}else if(offerType==11||offerType==14){
		v=(productQty-parseInt(productQty/offerObj.offerQty))*productPrice;
	}
	return v;
}


