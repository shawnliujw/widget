/**
 * **************************************public methods*********************************************************************************
 */


/**
 * 将对象或者字符串方在sessionStorage中，如果是json对象的话会同时返回这个对象转换后的字符串
 */
function saveModel(modelName,model) {
	
	if(isNotEmpty(modelName)) {
		
		if(typeof(model) == 'object') {
			try {
				var str = JSON.stringify(model);
				sessionStorage.setItem(modelName,str);
				return str;
			} catch(e) {
				showMsgDiv("Error when call method 'saveModel' from common.js----"+e.toString());
			}
		} else {
			sessionStorage.setItem(modelName,model);
		}
	} else {
		showMsgDiv("Error when call method 'saveModel' from common.js----"+"modelName or model is null");
	}
} 

/**
 * 从sessionStorage中取得相应的参数,如果要取得object对象，那么flag设为true
 */
function getModel(modelName,flag) {
	var str = sessionStorage.getItem(modelName);
	//showMsgDiv("str:"+str);
	
	if(!isNotEmpty(flag)) {
		flag = false;
	}
	
	if(isNotEmpty(str)) {
		if(flag) {
			try{
				return JSON.parse(str);
			}catch(e) {
				showMsgDiv("Error when call method 'getModel' from common.js----"+e.toString());
			}
		}  else {
			return str;
		}
	} else {
		return "";
	}
}
/**
 * 把form转换成json字符串,会把form的name作为字段，如果name是struts对象的形式，会取最后一个“.”之后的部分
 */
function parseFormToJson(formId) {
	//showMsgDiv(123);
//	var obj = new Object();
	
	var form = $("#"+formId);
	//showMsgDiv(form);
	var str="";
	if(isNotEmpty(form)) {
		str = "{";
		var count = 0;
		$(form).find("input").each(function(index,item){
			var name = $(item).attr("name");
			if(isNotEmpty(name)) {
				var indexD = name.lastIndexOf(".");
				if(isNotEmpty(indexD)) {
					name = name.substr(indexD+1);
				}
				
				var value = $(item).attr("value");
				if(!isNotEmpty(value)) {
					value = "";
				}
				
				var temp = '"'+name+'":'+'"'+value+'"';
				
				if(count > 0) {
					str += ",";
				}
				str += temp;
				count++;
			}
		});
		$(form).find("select").each(function(index,item){
			var name = $(item).attr("name");
			if(isNotEmpty(name)) {
				var indexD = name.lastIndexOf(".");
				if(isNotEmpty(indexD)) {
					name = name.substr(indexD+1);
				}
				
				var value = $(item).attr("value");
				if(!isNotEmpty(value)) {
					value = "";
				}
				
				var temp = '"'+name+'":'+'"'+value+'"';
				
				if(count > 0) {
					str += ",";
				}
				str += temp;
				count++;
			}
		});
		str += "}";
		//showMsgDiv(str);
		//obj = JSON.parse(str);
	}
	
	return str;
}

/**
 * 将json对象转换成字符串
 */
function parseToStr(json) {
	if(typeof(json) == 'object') {
		//return 
		
		try{
			var obj = JSON.stringify(json);
			return obj;
		} catch(e) {
			showMsgDiv("Error method : 'parseStr' from common.js----\n param is null or is not the validate json Object");
			return "";
		}
		
	} else {
		return json;
	}
}

/**
 * 将字符串转换成json对象
 */
function parseToJson(str) {
	//showMsgDiv(str);
	try {
		return JSON.parse(str);
		
	} catch(e) {
		showMsgDiv("Error method : 'parseJson' from common.js----\n param is null or is not the validate json formate string");
		return "";
	}
}
function encodeUrl(url) {
	//var sessionId = document.getElementById("sessionId").value;
	var sessionId = sessionStorage.getItem("sessionId");
	if (null == sessionId || undefined == sessionId) {
		sessionId = "";
	}

	var index = url.indexOf("?");
	var tempUrl = "";
	if (index != -1) {
		tempUrl = url.substr(index) + "&dateTime=" + (new Date()).getTime();
		url = url.substring(0, index);
		url = url + ";jsessionid=" + sessionId + tempUrl;
	} else {
		url = url + ";jsessionid=" + sessionId + "?dateTime="
				+ (new Date()).getTime();
	}

	if (url.indexOf(path) == -1) {
		url = path + url;
	}

	return url;
}

/**
 * Checks if the str is null or empty.
 * 
 * @param {Object}
 *            str
 * @return {TypeName}
 */
function isNotEmpty(str) {
	var flag = false;

	if (null != str && undefined != str && '' != str && 'undefined' != str && 'null' != str) {
		flag = true;
	}
	return flag;
}

function isEmpty(str){
	return !isNotEmpty(str);
}

/**
 * 保留两位小数字
 * @param src 需要处理的数字
 * @param pos 需要保留的位数
 * @returns {string}
 */
function formatFloat(src, pos) 
{ 
	
	src = Math.round(src*Math.pow(10, pos))/Math.pow(10, pos) + "";
	if(src.indexOf(".") == -1) {
		src += ".";
		
		for(var i=0;i<pos;i++) {
			src += "0";
		}
	} else {
		
		var index = src.indexOf(".");
		
		if(pos == 0) {
			src = src.substring(0,index);
		} else {
			index += 1;
			//showMsgDiv(temp1);
			var temp = src.substr(index);
			//showMsgDiv(temp);
			
			if(pos > temp.length) {
				for(var i=0;i<pos-temp.length;i++) {
					src += "0";
				}
			} else {
				var temp1 = src.substring(0,index);
				temp = temp.substr(0,pos);
				src = temp1 + temp;
			}
		}
		
	}
	//showMsgDiv(src);
	//src = parseFloat(src);
    return src;
	//return Math.round(src*Math.pow(10, pos))/Math.pow(10, pos); 
} /**
 * 弹出error div
 *  msg  要显示的信息
 *  title 需要显示的标题
 *  调用该方法的页面的id 
 * flag 是否不需要要打开遮罩层 是的话 falg=true
 * left 靠左的位置 默认居中
 * top  距离屏幕顶部的距离  默认页面可见范围居中
 * type 弹出框的类型，默认是errorMsg， 可以选择basketInfo，addBasketInfo
 */
function showMsgDiv(msg,flag,title,type,left,top,itemArray) {
	closeMsgDiv();
	//showMsgDiv(pageId);
	//showMsgDiv(left+"---"+top);
	
	if(flag == undefined || flag == null)flag = true;
	if(flag) showMaskLayerWithoutLoading();
	if(!isNotEmpty(type)) type="errorMsg";
	
	var div = '';
	
	if(type == 'errorMsg') {
		div = '<div id="floatMsgDiv" style="z-index:100000;position: absolute;width: 300px;list-style: none;background: -webkit-gradient(linear, 0 0, 0 100%, from(#f0f0f0), to(#bdbdbd));background: -moz-linear-gradient(top ,#f0f0f0, #bdbdbd);-moz-border-radius:7px;-webkit-border-radius:7px;border-radius:7px;-moz-box-shadow:0px 0px 10px  5px #363636;-webkit-box-shadow:0px 0px  10px 5px #363636;box-shadow: 0px  0px  10px 5px #363636; text-shadow: none;">'+		
		'<li style="font-size: 14px; font-weight:bold; color: #000;line-height: 20px;padding: 30px 18px 10px 18px;text-align: center;"  id="floatMsgDivContent"></li>'+
		'<li onclick="closeMsgDiv();" style="padding: 8px 0px 20px 0px;text-align: center;"><img src="'+path+'/images/btn_close.png" border="0"></li></div>';
	} 

	
	$("body").append($(div));
	
	if(isNotEmpty(title)) {
		$("#floatMsgDivTitle").text(title);
	}
	
	if(isNotEmpty(msg)) {
		
		$("#floatMsgDivContent").text(msg);
	}
	var divLeft = 0;
	var divTop = 0;
	var divHeight = $("#floatMsgDiv").height();
	var divWidth = $(div).width();
	
	if(isNotEmpty(left)) {
		divLeft = left;
	} else {
		var screenW = document.body.clientWidth ;
		divLeft = Math.round((screenW-divWidth)/2);
	}
	if(isNotEmpty(top)) {
		divTop = top;
	} else {
		
		/*
		showMsgDiv("clientHeight:"+document.body.clientHeight+"-offsetHeight:"+document.body.offsetHeight
		+"-scrollHeight:"+document.body.scrollHeight+"-screenTop:"+window.screenTop
		+"-screenHeight:"+window.screen.height+"-availHeight:"+window.screen.availHeight);
		*/
		var scrollH = document.body.scrollTop;
		var screenH = document.body.clientHeight;
		//showMsgDiv(screenH);
		divTop = Math.abs(Math.round((screenH-divHeight)/2)+scrollH);
	}
	
	
	//showMsgDiv(divLeft+"---"+divTop);
	$("#floatMsgDiv").offset({
				"left":divLeft,
				"top":divTop
			}).css("display","");
} 


function closeMsgDivAndBack(){
	closeMsgDiv();
	window.history.go(-1);
}

/**
 * 关闭error div
 */
function closeMsgDiv() {
	$("#autoCompleteDiv").remove();
	$("#floatMsgDiv").remove();
	closeMaskLayer();
}
/**
 * 关闭遮罩层
 */
function closeMaskLayer() {
	
	$("#floatMaskLayerDiv").remove();
	$("#loadingImg").remove();
}
/**
 * 打开遮罩层，pageId是调用该方法页面的 data-role=page id
 */
function showMaskLayerWithLoading(){
	//if(!isNotEmpty(pageId))pageId=getCurrPageFirstDivId();
	var div = '<div id="floatMaskLayerDiv" style="position: absolute; left: 0px; width: 100%; height: 200%; text-align:center; filter: Alpha(Opacity =         30); opacity: 0.3; background-color: #000000;z-index:100000; ">';

	div+='</div>';
	
	var divHeight = 200;
	var imgWidth = 0;
	var scrollH = document.body.scrollTop;
	var screenH = window.screen.availHeight;
		//showMsgDiv(screenH);
	var imgTop = Math.abs(Math.round(((screenH-divHeight))/2)+scrollH);
	var screenW = document.body.clientWidth ;
	var imgLeft = Math.round((screenW-imgWidth)/2);
	//showMsgDiv(screenH+"---"+divHeight+"--"+scrollH)
	//showMsgDiv(document.body.scrollHeight+"---"+document.body.scrollTop+"---"+document.body.clientHeight);
	$("body").append($(div));
	
	var img = '<img id="loadingImg" style="width:100px;position: absolute;z-index:100001;" src="'+path+'/images/loading.gif"></img>';
	$("body").append($(img));
	
	$("#loadingImg").offset({
		left:imgLeft-50,
		top:imgTop
	});
	
	$("#floatMaskLayerDiv").offset({
				"left":0,
				"top":0
			}).css("display","");
	//$($("#floatMaskLayerDiv").find("img")[0]).css("top",imgTop);
	//showMsgDiv($("#floatMaskLayerDiv").html());
}

function showMaskLayerWithoutLoading(){
	var div = '<div id="floatMaskLayerDiv" style="position: absolute; left: 0px; width: 100%; height: 200%;text-align:center;filter: Alpha(Opacity =         30); opacity: 0.3; background-color: #000000;z-index:100000; ">';
	div+='</div>';
	$("body").append($(div));
	$("#floatMaskLayerDiv").offset({
				"left":0,
				"top":0
			}).css("display","");
}

/**
 * 折叠层
 */
//function toggleSlide(divId) {
//	
//	if(isNotEmpty(divId)) {
//		var obj = $("#"+divId);
//		
//		var height = obj.height();
//		var time = 0;
//		//showMsgDiv(height);
//		if(height < 10) {
//			return false;
//		}
//		
//		if(height < 55) {
//			time = 700;
//		} else if (height > 54 && height < 105) {
//			time = 1400;
//		}else if(height > 104 && height <200) {
//			time = 2100;
//		} else if(height >200 && height <300) {
//			time = 2800;
//		} else if(height > 300) {
//			time = 3500;
//		}
//		
//		obj.slideToggle(time);
//	}
//}

function toggleSlide(own,divId) {
	
	
	if(isNotEmpty(divId)) {
		var time = 0;
		var obj = $("#"+divId);
		var height = obj.height();
		//showMsgDiv(height);
		if(height < 10) {
			return false;
		}
		
		time = parseInt(height)*2;
		
		//time = 50000;
		obj.slideToggle(time,function(){
//		var top1 = $(own).offset().top;
//			proceedToggleSlide(top1);
		});
		/*$(".foldDivClass").each(function(index,item){
			//showMsgDiv($(item).attr("style"));
			//showMsgDiv($(item).attr("display"));
			if($(item).css("display") != 'none' && $(item).attr("id") != divId) {
							var top = $(item).offset().top;
							$(item).slideToggle(1500);
						}
			
		});*/
	}
	
}

function proceedToggleSlide(top) {
	$.mobile.silentScroll(top);
	//showMsgDiv(top);
	var activePage = $.mobile.activePage;
	var nowTop = $(activePage).offset().top;
	/*
	$(activePage).animate({
			"top":nowTop-top
		},1000);*/
	
	//showMsgDiv(top);
	
}

function firstUp(str){
	if(isEmpty(str))return "";
	return str.substring(0,1).toUpperCase()+str.substring(1);
}



function getCurrPageFirstDivId(){
	return $("body").find("div").attr("id");
}

function getUrlArgs(argName){
	var strHref = window.location.href; //获取Url字串
	var intPos = strHref.indexOf("?");  // 参数开始位置
	var strRight = strHref.substr(intPos + 1);
	var arrTmp = strRight.split("&"); //参数分割符
	for(var i = 0; i < arrTmp.length; i++) { 
		var arrTemp = arrTmp[i].split("="); 
		if(arrTemp[0].toUpperCase() == argName.toUpperCase()) return arrTemp[1]; 
	} 
	return ""; 
}

function goHome() {
//	sessionStorage.setItem("defaultSelectedRetailer","allProducts");
	window.location.href = path+"/"+gloablCategory
}

/**********************************************utilModel**************************************************************/

var Utils = new MpupaUtil();
/**
 * 
 * 用来保存 model对象到sessionStorage对象，方便进行读取查找
 * @author shawn
 */
function MpupaUtil() {
	this.itemList = ' ';
}

MpupaUtil.prototype.setItemList = function (itemList) {
	this.itemList = itemList;
}

/**
 * @param fieldArray 需要查询的字段数组
 * @param valueArray 对应查询的字段数组的值
 * @return jsonObject
 */
MpupaUtil.prototype.searchUnique = function (jsonObject,fieldName,fieldValue) {
	//showMsgDiv("test1");
	
	try {
		
		if(fieldName == 'id') {
			fieldValue = parseInt(fieldValue);
		}
	} catch(e) {
		
	}
	
	var obj = "";
	try {
		if(isNotEmpty(jsonObject) && isNotEmpty(fieldName) && isNotEmpty(fieldValue)) {
			var matching = '"'+fieldName+'":';
			if(typeof(fieldValue) == 'string') {
				matching = matching + '"'+fieldValue+'"';
			} else {
				matching = matching +fieldValue;
			}
			matching = matching.toLowerCase();
			var returnFlag = false;
			
			if(typeof(jsonObject) == 'string') {
				var json = JSON.parse(jsonObject);
				json = json.toLowerCase();
				$(json).each(function(index,item){
					//showMsgDiv(index);
					var string = JSON.stringify(item);
					if(string.indexOf(matching) != -1) {
						obj = item;
						returnFlag = true;
						//return item;
					}
					if(returnFlag) {
						return;
					}
				});
			} else {
				//showMsgDiv(JSON.stringify(jsonObject).indexOf(matching));
				$(jsonObject).each(function(index,item){
					var string = JSON.stringify(item);
					//showMsgDiv(string);
					//showMsgDiv(string.indexOf(matching));
					string = string.toLowerCase();
					if(string.indexOf(matching) != -1) {
						obj = item;
						returnFlag = true;
					}
					if(returnFlag) {
						return;
					}
					//showMsgDiv(index);
				});
			}
			
		}
		
	} catch (e) {
		showMsgDiv(e)
	}
	
	return obj;
	//showMsgDiv("--"+itemList+"--");
}

/**
 *search list
 *  
 * @param {Object} jsonObject
 * @param {Object} fieldName
 * @param {Object} fieldValue
 * @return jsonObject array
 * @author shawn
 */
MpupaUtil.prototype.searchList = function (jsonObject,fieldName,fieldValue) {
	//showMsgDiv("test1");
	var objArray = new Array();
	var matching = "";
	try {
		// if(isNotEmpty(jsonObject) && isNotEmpty(fieldName) && isNotEmpty(fieldValue)) {
			 var matching = '"'+fieldName+'":';
			if(typeof(fieldValue) == 'string') {
				matching = matching + '"'+fieldValue+'"';
			} else {
				matching = matching +fieldValue;
			}
			
			matching = matching.toLowerCase();
			
			var returnFlag = false;
			
			if(typeof(jsonObject) == 'string') {
				var json = JSON.parse(jsonObject);
				json = json.toLocaleLowerCase();
				$(json).each(function(index,item){
					var string = JSON.stringify(item);
					if(string.indexOf(matching) != -1) {
						objArray.push(item);
					}
				});
			} else {
				//showMsgDiv(JSON.stringify(jsonObject).indexOf(matching));
				$(jsonObject).each(function(index,item){
					var string = JSON.stringify(item);
					string = string.toLowerCase()
					//showMsgDiv(string);
					//showMsgDiv(string.indexOf(matching));
					if(string.indexOf(matching) != -1) {
						objArray.push(item);
					}
					//showMsgDiv(index);
				});
			}
			
		
	} catch (e) {
		showMsgDiv(e)
	}
	
	return objArray;
	//showMsgDiv("--"+itemList+"--");
}

/**
 *根据appID取得所有的product并保存到sessionStorage里面 
 * @param {Object} appId
 */
function initAllProductsByAppId(appId) {
	
	//showMsgDiv(allProduct);
	//showMsgDiv(parseToJson(allProduct));
	
	var name = "bashe_allProductList"+appId;
	var data = getModel(name,true);
	if(!isNotEmpty(data)) {
		showMaskLayerWithLoading();
		$.getJSON(path+"/app/"+appId+"?dateTime="+new Date().getTime(),function(data){
			closeMaskLayer();
			//showMsgDiv(parseToStr(data.products));
			if(isNotEmpty(data)) {
				saveModel('bashe_allProductList'+appId,data.products);
			} 
		});
	}
}

//function placeHolderFocus(obj) {
//	//var placeHolder = $(obj).attr("placeHolder");
//	$(obj).val("");
//}
//function placeHolderBlur(obj) {
//	var placeHolder = $(obj).attr("placeHolder");
//	
//	 var value = $(obj).val();
//	if(isEmpty(value)) {
//		$(obj).val(placeHolder);
//	}
//	
//}

$().ready(function(){
	var nav=window.navigator.appName;
	if(nav.indexOf("Microsoft")!=-1){
		var doc = document, inputs = doc.getElementsByTagName('input'),
		 supportPlaceholder = 'placeholder' in doc.createElement('input'),
		 placeholder = function(input) {
			var text = input.getAttribute('placeholder'), type = input.getAttribute('type'),name=input.getAttribute('name');
				defaultValue = input.defaultValue;
			if (defaultValue == '') input.value = text;
			if (type == 'password') {
				input.setAttribute('type','text');
			}
			input.onfocus = function() { 
				if (input.value === text) this.value = ''  ;
				if(type=='password')input.setAttribute('type','password'); 
			};
			input.onblur  = function() { 
				if (input.value === '')   {
					input.setAttribute('type','text');
					this.value = text;
				}
			}; 
		};
		if (!supportPlaceholder) {
			for ( var i = 0, len = inputs.length; i < len; i++) {
				var input = inputs[i], text = input.getAttribute('placeholder');
				if (input.type === 'text' && text||input.type==='password') placeholder(input);
			}
		}
	}
});


var oi="";

function showProductImage(imgUrl,sg){
	oi=$("#sss_p_img").find("img").eq(0).attr("src").indexOf("group")!=-1?$("#sss_p_img").find("img").eq(0).attr("src"):oi;
	if("Y"==sg)imgUrl=oi;
	$("#sss_p_img").find("img").eq(0).attr("src",imgUrl);
}


function showOfferInfo(obj,offerMsg){
	var left=$(obj).offset().left;
	var top=$(obj).offset().top;
	offerMsg=offerMsg==""?"No offer":offerMsg;
	$("#offerMsgLi").text(offerMsg);
	$("#offerTipDiv").css("position","absolute");
	$("#offerTipDiv").offset({
		"left":left-5,
		"top":	top-25
	}).css("display","block");
}

function closeOfferInfo(){
	$("#offerTipDiv").offset({
		"left":0,
		"top":0
	}).hide();
}

function goToRetailer(temp){
	var obj=$(temp).attr("class");
	if(obj.toLowerCase().indexOf("tesco")!=-1){
		window.open("https://secure.tesco.com/register/?from=http%3a%2f%2fwww.tesco.com%2fgroceries%2f");
	}else if(obj.toLowerCase().indexOf("ocado")!=-1){
		window.open("http://www.ocado.com/webshop/startWebshop.do");
	}else if(obj.toLowerCase().indexOf("asda")!=-1){
		window.open("http://groceries.asda.com/asda-estore/index.jsp");
	}else if(obj.toLowerCase().indexOf("sainsbury")!=-1){
		window.open("http://www.sainsburys.co.uk");
	}else if(obj.toLowerCase().indexOf("waitrose")!=-1){
		window.open("http://www.waitrose.com/");
	}
}


function goBack() {
	window.history.back();
}