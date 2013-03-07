
/**
 * @title Basket Object for Dotter Ltd.
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
	"productId" : " ", // not null
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
			//localStorage.removeItem(this.saveName);
			remoteStorage.removeItem(this.saveName);
			//TODO
		}
	}
};

/**
 * function caculatePriceByDB();
 * description: get total price by java code.
 * 
 */
BasketObject.prototype.caculatePrice=function(){
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
};



/**
 * 将对象或者字符串方在localStorage中，如果是json对象的话会同时返回这个对象转换后的字符串
 */
function saveBasketListToLocal(modelName, model) {
	try{
		if (notEmpty(modelName)) {
			if (typeof (model) == 'object') {
				try {
					var str = JSON.stringify(model);
					//localStorage.setItem(modelName, str);
					remoteStorage.setItem(modelName,str);
					return str;
				} catch (e) {
					alert("Error when call method 'saveBasketListToLocal' from basket.js----"
							+ e.toString());
				}
			} else {
				//localStorage.setItem(modelName, model);
				remoteStorage.setItem(modelName,str);
			}
		} else {
			alert("Error when call method 'saveBasketListToLocal' from basket.js----" + "modelName or model is null");
		}
	}catch(e){
		window.console.log("User has disabled storing local content");
		alert("Sorry, you must allow this site to store local data to continue. You can change this policy in your browser's security settings.");
	}
} 

/**
 * 从localStorage中取得相应的参数,如果要取得object对象，那么flag设为true
 */
function getBasketListForLocal(modelName, flag) {
	try{
		//var str = localStorage.getItem(modelName);
		var str = remoteStorage.getItem(modelName);
		if (!notEmpty(flag)) { flag = false; }
		if (notEmpty(str)) {
			if (flag && typeof str == 'string') {
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
	}catch(e){
		window.console.log("User has disabled storing local content");
		alert("Sorry, you must allow this site to store local data to continue. You can change this policy in your browser's security settings.");
	}
}

function notEmpty(str) {
	var flag = false;
	if (null != str && undefined != str && '' != str) {
		flag = true;
	}
	return flag;
}



