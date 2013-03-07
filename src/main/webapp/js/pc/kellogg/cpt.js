/**
 * --------------弹出是否优惠的对话框-----------------
 */
//--如果想去掉popup的功能， 注释掉这一行就可以。
window.onbeforeunload = confirmExit;
var isPopup = false;

function confirmExit() {
	// run pop-up code here
	var tip_text = "Please click \"stay on this page\" if you would like a coupon for 50p of your next purchase of Special K";
	var basketName = retailerName + brandName + "Basket";
	var current = localStorage.getItem(basketName);
	if (!isNotEmpty(current)) {
		if (!isPopup) {
			if (!isNotEmpty(getCookie("cpt_email"))) {
				showMaskLayerWithCenterDiv("cpt_confrim");
			}
			return tip_text;
		}
	}
}

function checkCouponEmail() {
	var email = $("#cpt_confrim_email").val();
	if (!isValidEmail(email)) {
		//display error msg 2 div.
		closeMaskLayerWithCenterDiv("cpt_confrim");
		showMaskLayerWithCenterDiv("cpt_error_msg_2");
		return;
	}
	showMaskLayerWithCenterDiv("cpt_loading");
	$.ajax({
		url : path + "/checkCouponEmail",
		type : "post",
		dataType : 'json',
		data : {
			'email' : email
		},
		success : function(data) {
			closeMaskLayerWithCenterDiv("cpt_loading");
			closeMaskLayerWithCenterDiv("cpt_confrim");
			if (data.indexOf("success") != -1) {
				// set cookie
				setCookie(email);
				// display success div.
				showMaskLayerWithCenterDiv("cpt_success");
			}
			if (data.indexOf("failure") != -1) {

				if (data.indexOf('404') != -1) {
					//display error msg 2 div;
					showMaskLayerWithCenterDiv("cpt_error_msg_2");
				} else {
					//display error msg 1 div;
					showMaskLayerWithCenterDiv("cpt_error_msg_1");
				}
			}
		}
	});
	isPopup = true;
}

function setCookie(email) {
	document.cookie = "cpt_email=" + email;
}

function getCookie(c_name) {
	if (document.cookie.length > 0) {
		c_start = document.cookie.indexOf(c_name + "=");
		if (c_start != -1) {
			c_start = c_start + c_name.length + 1;
			c_end = document.cookie.indexOf(";", c_start);
			if (c_end == -1)
				c_end = document.cookie.length
			return unescape(document.cookie.substring(c_start, c_end));
		}
	}
}

function closeWindow() {
	closeMaskLayerWithCenterDiv("cpt_confrim");
	isPopup = true;
	window.opener=null;
	window.open('','_self');
	window.close();
}

//--工具： 将层显示在屏幕正中央，并且打开遮罩层，传入参数为 层的id.
function showMaskLayerWithCenterDiv(divId) {
	$("#floatMaskLayerDiv").remove();
	showMaskLayerWithoutLoading();
	$("#" + divId).removeAttr("style");
	var divHeight = $("#" + divId).height();
	var divWidth = $("#" + divId).width();
	var screenW = document.body.clientWidth;
	var divLeft = Math.round((screenW - divWidth) / 2);
	var scrollH = document.body.scrollTop;
	var screenH = document.body.clientHeight;
	var divTop = Math.abs(Math.round((screenH - divHeight) / 2) + scrollH);
	$("#" + divId).css("position", "absolute");
	$("#" + divId).css("z-index", "1000010");
	$("#" + divId).offset({
		"left" : divLeft,
		"top" : divTop
	}).css("display", "block");
}
//关闭 显示在屏幕中央的层。
function closeMaskLayerWithCenterDiv(divId) {
	closeMaskLayer();
	closeOtherDiv(divId);
	$("#" + divId).hide();
	isPopup = true;
}
//关闭层，关闭窗口。
function closeWindowForCpt(divId){
	closeMaskLayerWithCenterDiv(divId);
	window.opener=null;
	window.open('','_self');
	window.close();
}
function closeOtherDiv(divId) {
	var divIds = "cpt_confrim~cpt_loading~cpt_success~cpt_error_msg_1~cpt_error_msg_2";
	var array = divIds.split("~");
	for ( var i = 0, size = array.length; i < size; i++) {
		if (array[i] != divId) {
			$("#" + array[i]).hide();
		}
	}
}

function closeTemp(obj){
	window.close();
}
$(document).ready(function(){
	$(".retailerLink,.categoryLink,.sch_pro_info,.sch_pro_title,.backToProducts").click(function(){
		window.onbeforeunload = null;
	});
});