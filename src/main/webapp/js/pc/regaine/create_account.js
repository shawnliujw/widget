
// st_regaine_reg_person, st_regaine_reg_address
// crt_fst_pdi_div,crt_sed_adr_div,crt_tid_thk_div,crt_frt_ldi_div


function showOtherDiv(hideDivId,showDivId){
	$(hideDivId).hide();
	$(showDivId).show();
}



function startCreatAccount(){
	var rtl=firstUp(retailerName);
	if(rtl=='Pharmacy'||rtl=='Boots'){
		showMaskLayerWithoutLoading();
		$("#crt_fst_pdi_div").show();
		if(rtl=='Pharmacy'){
			$(".crt_act_rtl").text('PHARMACY2U.');
		}
		initPageWithRtl(rtl);
	}else{
		showCreateAccountMsgDiv("Failure, not support current retailer create account.");
	}
		
}

function closeCreateAccount(n){
	$("#"+n).hide();
	closeMaskLayer();
}


function handlePersonInfo(){
	try{
		if(validPersonInfo()){
			var v=parseFormToJson("account_pdi_frm");
			$("#st_regaine_reg_person_div").empty().text(v);
//			sessionStorage.setItem('st_regaine_reg_person',v);
			$("#crt_fst_pdi_div").hide();
			$("#crt_sed_adr_div").show();
		}
	}catch(e){
		window.console.log("User has disabled storing local content");
		alert("Sorry, you must allow this site to store local data to continue. You can change this policy in your browser's security settings.");
	}
}

function isEmail(strEmail) {
	if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)
		return true;
	else
		return false;
}

function postDataWithCreateAccount(){
	var rtl=firstUp(retailerName);
	if(rtl=="Pharmacy"||rtl=="Boots"){
		if(validPersonInfo()&&validAddress()){
			var gn=rtl=="Pharmacy"?'pharmacy2u':'boots';
			_gaq.push(['_trackevent', 'new account', 'create', gn , , 'true']);
			_gaq.push(['b._trackevent', 'new account', 'create', gn , , 'true']);

			var v="/registerFor"+rtl+".action";
			var tmpUrl=encodeUrl(v);
			var sendData={
					'personalDetailStr':$("#st_regaine_reg_person_div").text(),
					'shipAddrStr':$("#st_regaine_reg_adr_div").text()
//					'personalDetailStr':sessionStorage.getItem('st_regaine_reg_person'),
//					'shipAddrStr':sessionStorage.getItem('st_regaine_reg_adr')
			};
			$.ajax({
				url : tmpUrl,
				type : "post",
				dataType : 'json',
				data : sendData,
				success : function(data) {
					if("success"==data){
						createAccountSuccess();
					}else{
						$("#crt_frt_ldi_div").hide();
						$("#crt_fst_pdi_div").hide();
						$("#crt_sed_adr_div").show();
						var errMsg='This email is already registered with BOOTS. Please enter a different email and try again.';
						if(rtl=='Pharmacy'){
							errMsg="This email is already registered with PHARMACY2U. Please enter a different email and try again.";
						}
						showCreateAccountMsgDiv(errMsg);
					}
				},error:function(){
					$("#crt_frt_ldi_div").hide();
					$("#crt_fst_pdi_div").hide();
					$("#crt_sed_adr_div").show();
					var errMsg='SORRY WE HAVE BEEN UNABLE TO <br/> PROCESS YOUR REQUEST AT THIS TIME.';
					showCreateAccountMsgDiv(errMsg);
				}
			});
		}
	}else{
		showCreateAccountMsgDiv("Failure, not support current retailer create account.");
	}
}


function createAccountSuccess(){
	try{
//		var userInfo=sessionStorage.getItem("st_regaine_reg_person");
//		if(isNotEmpty(userInfo)){
//			sessionStorage.setItem(brandName + retailerName + "_userName",parseToJson(userInfo).email);
//		}
		$("#crt_frt_ldi_div").hide();
		$("#crt_tid_thk_div").show();
	}catch(e){
		window.console.log("User has disabled storing local content");
		alert("Sorry, you must allow this site to store local data to continue. You can change this policy in your browser's security settings.");
	}
}

function handleAddressInfo(){
	try{
		if(validPersonInfo()&&validAddress()){
			var v=parseFormToJson("account_adr_frm");
			$("#st_regaine_reg_adr_div").empty().text(v);
//			sessionStorage.setItem('st_regaine_reg_adr',v);
			$("#crt_sed_adr_div").hide();
			$("#crt_frt_ldi_div").show();
			postDataWithCreateAccount();
		}
	}catch(e){
		window.console.log("User has disabled storing local content");
		alert("Sorry, you must allow this site to store local data to continue. You can change this policy in your browser's security settings.");
	}
}



function lookupAddress(){
	var pt=$("input[name='postCode']").val();
	if(pt=="Address Lookup"){
		showCreateAccountMsgDiv("PLEASE ENTER A VALID POSTCODE OR TYPE IN YOUR ADDRESS");
		return;
	}
	getAddressBegin(pt);
}



function validPersonInfo(){
	var v=$("input[name='email']").val();
	if(!isEmail(v)){
		showCreateAccountMsgDiv("PLEASE ENTER A VALID EMAIL ADDRESS");
		return false;
	}
	v=$("input[name='passwd']").val();
	var vp= /^(?![a-z]+$)(?!\d+$)[a-z0-9]{8,12}$/i;
	if(!vp.test(v)){
		showCreateAccountMsgDiv("PASSWORDS MUST BE BETWEEN 8 - 12 CHARACTERS<br/> AND CONTAIN LETTERS AND NUMBERS");
		return false;
	}
	v=$("input[name='firstName']").val();
	if(v==null||v==""||v==" "){
		showCreateAccountMsgDiv("THERE IS INFORMATION MISSING<br/> PLEASE COMPLETE ALL FIELDS");
		return false;
	}
	v=$("input[name='lastName']").val();
	if(v==null||v==""||v==" "){
		showCreateAccountMsgDiv("THERE IS INFORMATION MISSING<br/> PLEASE COMPLETE ALL FIELDS");
		return false;
	}
	var select_day=$("select[name='dayOfBirth']").find("option:selected").val();//dd
	var select_month=$("select[name='monthOfBirth']").find("option:selected").val();//mm
	var select_year=$("select[name='yearOfBirth']").find("option:selected").val();//yyyy
	if(select_day=='0'||select_month=='0'||select_year=='0'){
		showCreateAccountMsgDiv("THERE IS INFORMATION MISSING<br/> PLEASE COMPLETE ALL FIELDS");
		return false;
	}
	return true;
}

function validAddress(){
	var v=$("input[name='postCode']").val();
	if(v==null||v==""||v==" "||v=="Address Lookup"){
		showCreateAccountMsgDiv("PLEASE ENTER A VALID POSTCODE OR TYPE IN YOUR ADDRESS");
		return false;
	}
	var v=$("input[name='address1']").val();
	if(v==null||v==""||v==" "){
		showCreateAccountMsgDiv("THERE IS INFORMATION MISSING<br/> PLEASE COMPLETE ALL FIELDS");
		return false;
	}
	var v=$("input[name='phoneNumber']").val();
	if(v!=null&&v!=''){
		while(v.indexOf(" ")!=-1){
			v=v.replace(" ","");
		}
	}
	var vp=/(^[0-9]{10,11}$)/;
	if(!vp.test(v)){
		showCreateAccountMsgDiv("PLEASE ENTER A VALID PHONE NUMBER");
		return false;
	}
	var v=$("input[name='townOrCity']").val();
	if(v==null||v==""||v==" "){
		showCreateAccountMsgDiv("THERE IS INFORMATION MISSING<br/> PLEASE COMPLETE ALL FIELDS");
		return false;
	}
	
	return true;
}

function initPageWithRtl(rtl){
	handlePersonDivWithRtl(rtl);
	handlePersonTitleWithRtl(rtl);
	if('Pharmacy'==rtl){
		$("#crt_frt_ldi_div").find("span:eq(0)").text('PHARMACY2U');
		$("#crt_act_rtl").text('PHARMACY2U.');
	}
}

function handlePersonDivWithRtl(rtl){
	var imgUrl=path+"/images/pc/regaine/logo_"+rtl+".png";
	$(".rtl_img_tag").attr('src',imgUrl);
}

function handlePersonTitleWithRtl(rtl){
	var pt="";
	if(rtl=="Boots"){
		pt+='<option value="Mr">Mr</option>';
		pt+='<option value="Ms">Ms</option>';
		pt+='<option value="Mrs">Mrs</option>';
		pt+='<option value="Miss">Miss</option>';
		pt+='<option value="Dr">Dr</option>';
		pt+='<option value="Prof">Prof</option>';
		pt+='<option value="Rev">Rev</option>';
		pt+='<option value="Sir">Sir</option>';
		pt+='<option value="Sister">Sister</option>';
		pt+='<option value="Father">Father</option>';
		pt+='<option value="Lady">Lady</option>';
		pt+='<option value="Lord">Lord</option>';
		pt+='<option value="RH">RH</option>';
	}else{
		pt+='<option value="Mr.">Mr.</option>';
		pt+='<option value="Ms.">Ms.</option>';
		pt+='<option value="Mrs.">Mrs.</option>';
		pt+='<option value="Miss.">Miss.</option>';
		pt+='<option value="Dr.">Dr.</option>';
		pt+='<option value="Rev.">Rev.</option>';
	}
	$("#personTitle").append(pt);
}

function handlePostCode(obj){
	if($(obj).val()=="Address Lookup")$(obj).val("");
}
function handlePostCode2(obj){
	if($(obj).val()=="")$(obj).val("Address Lookup");
}



function getAddressBegin(postCode) {
	$("#adr_lk_btn").hide();
	$("#adr_lk_img").show();
	var Key = "ET99-RX94-ZW66-ZY75";
	var Building = "";
	var UserName = "";
	
	var scriptTag = document
			.getElementById("PCA38d38252878f434581f85b249661cd94");
	var headTag = document.getElementsByTagName("head").item(0);
	//alert("headerTag:"+headTag);
	var strUrl = "";

	// Build the url
	strUrl = "http://services.postcodeanywhere.co.uk/PostcodeAnywhere/Interactive/RetrieveByPostcodeAndBuilding/v1.10/json.ws?";
	strUrl += "&Key=" + escape(Key);
	strUrl += "&Postcode=" + escape(postCode);
	strUrl += "&Building=" + escape(Building);
	strUrl += "&UserName=" + escape(UserName);
	strUrl += "&CallbackFunction=getAddressEnd";

	// Make the request
	if (scriptTag) {
		try {
			headTag.removeChild(scriptTag);
		} catch (e) {
			// Ignore
		}
	}
	scriptTag = document.createElement("script");
	scriptTag.src = strUrl;
	scriptTag.type = "text/javascript";
	scriptTag.id = "PCA38d38252878f434581f85b249661cd94";
	headTag.appendChild(scriptTag);
}

function getAddressEnd(response) {
	var pt=$("input[name='postCode']").val();
	pt=pt.toUpperCase();
	$("input[name='postCode']").val(pt);
	// Test for an error
	if (response.length == 1 && typeof (response[0].Error) != 'undefined') {
		// Show the error message
		//alert(response[0].Description);
		showCreateAccountMsgDiv("PLEASE ENTER A VALID POSTCODE OR TYPE IN YOUR ADDRESS");
		$("#adr_lk_img").hide();
		$("#adr_lk_btn").show();
	} else {
		// Check if there were any items found
		if (response.length == 0) {
			alert("Sorry, no matching items found");
			$("#adr_lk_img").hide();
			$("#adr_lk_btn").show();
		} else {
			$("#addressDiv").show();
			$("#addressDivList").empty().show();
			var div = $("#addressDivList");
			//alert("find address");
			$(response).each(function(index,item){
				
				var msg = "";
				
				if(isNotEmpty(item.Company)) {
					msg += item.Company;
				}
				if(!isNotEmpty(item.Company) && isNotEmpty(item.Line1)) {
					msg += item.Line1;
				} else if(isNotEmpty(item.Company) && isNotEmpty(item.Line1)) {
					msg += ","+ item.Line1;
				}
				if(isNotEmpty(item.Line1) && isNotEmpty(item.Line2)) {
					msg += "," +item.Line2;
				} else if(!isNotEmpty(item.Line1) && isNotEmpty(item.Line2)) {
					msg += item.Line2;
					
				}
				if(isNotEmpty(item.PostTown)) {
					msg += "," +item.PostTown;
				}
				if(isNotEmpty(item.County)) {
					msg += "," +item.County;
				}
				
				var li = $("<li style='list-style:none;font-size:11px;color:#20385c;cursor:pointer;text-align:left;line-height: 17px;'></li>").text(msg+","+$("input[name='postCode']").val()+"," +item.CountryName).click(function(){
					saveAddress(item.Line1,item.Line2,item.PostTown,item.County,pt,item.CountryName);
				});
				div.append(li);
			});
			$("#addressDivList").niceScroll({cursorcolor:'#59608a',zindex:'100000',autohidemode : false,
				backgroundborderdisable:true}).show();
		}
	}
}

function saveAddress(address1,address2,city,county,zipCode,country) {
	$("input[name='address1']").val(address1);
	$("input[name='address2']").val(address2);
	$("input[name='townOrCity']").val(city);
	$("input[name='stateOrCounty']").val(county);
//	var lookUpAddress = address1+"~~"+address2+"~~"+city+"~~"+county+"~~"+zipCode+"~~"+country;
//	localStorage.setItem("lookUpAddress",lookUpAddress);
	$("#addressDivList").niceScroll({
	}).hide();
	$("#addressDiv").hide();
	$("#adr_lk_btn").show();
	$("#adr_lk_img").hide();
}
