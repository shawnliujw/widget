<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld"%>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld"%>
<!DOCTYPE html >
<html>
<head>
</head>
<body>
	<div style="display:none;" id="st_regaine_reg_person_div"></div>
	<div style="display:none;" id="st_regaine_reg_adr_div"></div>
	<div class="new_acc_page" id="crt_fst_pdi_div" style="width:100%; background:#fff; text-align:center; display:none;z-index: 300000;position: absolute;top:270px; ">
		  <div class="new_header" style="width:650px; margin: 0 auto; text-align:center">
		  
		    <table width="620" border="0" cellspacing="0" cellpadding="0"  style="padding-left:25px;">
              <tr>
                <td class="new_title" width="120">New Account</td>
                <td class="new_retailer_logo" align="left" width="150"><img class="rtl_img_tag"
						src="${pageContext.request.contextPath}/images/pc/regaine/logo_Boots.png" height="40" border="0"></td>
                <td class="new_item" width="275"> <div style="float: left; padding-left:20px; width:255px;"> <span>PERSONAL DETAILS&nbsp;</span> >  &nbsp;<span onClick="showOtherDiv('#crt_fst_pdi_div','#crt_sed_adr_div');" style="cursor: pointer;color: #A5A5A5;" >ADDRESS DETAILS</span></div></td>
                <td  width="75"> <div style="padding-left:19px;" onClick="closeCreateAccount('crt_fst_pdi_div');">
		         <div class="new_close_btn">CLOSE</div></div></td>
              </tr>
            </table>	
			
			        
	 
	  </div>
		  <div class="clear"></div>
		  <div class="new_content" style="width:650px; margin: 0 auto;">
		  	<form id="account_pdi_frm" >
		        <div class="new_account_left">
		             <ul>
		                 <li class="item_title">Email address</li>
		                 <li  ><input style="color: #20385c;" class="new_input"  name="email" /></li>
		             </ul>
		             <div class="clear"></div>
		             <ul>
		                 <li class="item_title">Password</li>
		                 <li ><input style="color: #20385c;" class="new_input" type="password"  name="passwd" /></li>
		             </ul>
		             <div class="clear"></div>
		             <div class="new_text">must be between 8 and 12 characters and include a number</div>
		             <ul>
		                 <li class="item_title">Date of birth</li>
		                 <li class="new_slt">
		                    <select style="color: #20385c;" name="dayOfBirth">
		                       <option value="0">dd</option>
		                       <option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
								<option value="31">31</option>
		                    </select>
		                 </li>
		                 <li class="new_slt">
		                    <select style="width:50px;color: #20385c;" name="monthOfBirth">
		                       <option value="0">mm</option>
								<option value="1">Jan</option>
								<option value="2">Feb</option>
								<option value="3">Mar</option>
								<option value="4">Apr</option>
								<option value="5">May</option>
								<option value="6">Jun</option>
								<option value="7">Jul</option>
								<option value="8">Aug</option>
								<option value="9">Sep</option>
								<option value="10">Oct</option>
								<option value="11">Nov</option>
								<option value="12">Dec</option>
		                    </select>
		                 </li>
		                 <li>
		                    <select style="width:60px;color: #20385c;" name="yearOfBirth" >
		                       <option value="0">yyyy</option>
		                       <option value="2013">2013</option>
								<option value="2012">2012</option>
								<option value="2011">2011</option>
								<option value="2010">2010</option>
								<option value="2009">2009</option>
								<option value="2008">2008</option>
								<option value="2007">2007</option>
								<option value="2006">2006</option>
								<option value="2005">2005</option>
								<option value="2004">2004</option>
								<option value="2003">2003</option>
								<option value="2002">2002</option>
								<option value="2001">2001</option>
								<option value="2000">2000</option>
								<option value="1999">1999</option>
								<option value="1998">1998</option>
								<option value="1997">1997</option>
								<option value="1996">1996</option>
								<option value="1995">1995</option>
								<option value="1994">1994</option>
								<option value="1993">1993</option>
								<option value="1992">1992</option>
								<option value="1991">1991</option>
								<option value="1990">1990</option>
								<option value="1989">1989</option>
								<option value="1988">1988</option>
								<option value="1987">1987</option>
								<option value="1986">1986</option>
								<option value="1985">1985</option>
								<option value="1984">1984</option>
								<option value="1983">1983</option>
								<option value="1982">1982</option>
								<option value="1981">1981</option>
								<option value="1980">1980</option>
								<option value="1979">1979</option>
								<option value="1978">1978</option>
								<option value="1977">1977</option>
								<option value="1976">1976</option>
								<option value="1975">1975</option>
								<option value="1974">1974</option>
								<option value="1973">1973</option>
								<option value="1972">1972</option>
								<option value="1971">1971</option>
								<option value="1970">1970</option>
								<option value="1969">1969</option>
								<option value="1968">1968</option>
								<option value="1967">1967</option>
								<option value="1966">1966</option>
								<option value="1965">1965</option>
								<option value="1964">1964</option>
								<option value="1963">1963</option>
								<option value="1962">1962</option>
								<option value="1961">1961</option>
								<option value="1960">1960</option>
								<option value="1959">1959</option>
								<option value="1958">1958</option>
								<option value="1957">1957</option>
								<option value="1956">1956</option>
								<option value="1955">1955</option>
								<option value="1954">1954</option>
								<option value="1953">1953</option>
								<option value="1952">1952</option>
								<option value="1951">1951</option>
								<option value="1950">1950</option>
								<option value="1949">1949</option>
								<option value="1948">1948</option>
								<option value="1947">1947</option>
								<option value="1946">1946</option>
								<option value="1945">1945</option>
								<option value="1944">1944</option>
								<option value="1943">1943</option>
								<option value="1942">1942</option>
								<option value="1941">1941</option>
								<option value="1940">1940</option>
								<option value="1939">1939</option>
								<option value="1938">1938</option>
								<option value="1937">1937</option>
								<option value="1936">1936</option>
								<option value="1935">1935</option>
								<option value="1934">1934</option>
								<option value="1933">1933</option>
								<option value="1932">1932</option>
								<option value="1931">1931</option>
								<option value="1930">1930</option>
								<option value="1929">1929</option>
								<option value="1928">1928</option>
								<option value="1927">1927</option>
								<option value="1926">1926</option>
								<option value="1925">1925</option>
								<option value="1924">1924</option>
								<option value="1923">1923</option>
								<option value="1922">1922</option>
								<option value="1921">1921</option>
								<option value="1920">1920</option>
								<option value="1919">1919</option>
								<option value="1918">1918</option>
								<option value="1917">1917</option>
								<option value="1916">1916</option>
								<option value="1915">1915</option>
								<option value="1914">1914</option>
								<option value="1913">1913</option>
								<option value="1912">1912</option>
								<option value="1911">1911</option>
								<option value="1910">1910</option>
								<option value="1909">1909</option>
								<option value="1908">1908</option>
								<option value="1907">1907</option>
								<option value="1906">1906</option>
								<option value="1905">1905</option>
								<option value="1904">1904</option>
								<option value="1903">1903</option>
								<option value="1902">1902</option>
								<option value="1901">1901</option>
								<option value="1900">1900</option>
								<option value="1899">1899</option>
								<option value="1898">1898</option>
								<option value="1897">1897</option>
								<option value="1896">1896</option>
								<option value="1895">1895</option>
								<option value="1894">1894</option>
								<option value="1893">1893</option>
								<option value="1892">1892</option>
								<option value="1891">1891</option>
								<option value="1890">1890</option>
								<option value="1889">1889</option>
								<option value="1888">1888</option>
								<option value="1887">1887</option>
								<option value="1886">1886</option>
								<option value="1885">1885</option>
								<option value="1884">1884</option>
								<option value="1883">1883</option>
		                    </select>
		                 </li>
			              <div class="clear"></div>
			              <div class="new_text" style="padding-top:12px;text-align: right;">please note, all fields are mandatory</div>
		             </ul>
		              <div class="clear"></div>
		        </div>
		        
		        <div class="new_account_right">
		              <ul>
		                  <li class="item_title">Title</li>
		                  <li >
		                      <select style="color: #20385c;" name="personTitle" id="personTitle" style="width:60px;">
		                       
		                    </select>
		                  </li>
		              </ul>
		              <div class="clear"></div>
		               <ul>
		                 <li class="item_title">First name</li>
		                 <li ><input style="color: #20385c;" class="new_input"  name="firstName" id=""   name="" /></li>
		             </ul>
		             <div class="clear"></div>
		              <ul>
		                 <li class="item_title">Last Name</li>
		                 <li><input style="color: #20385c;" class="new_input"  name="lastName" id=""   name="" /></li>
		             </ul>
		             <div class="clear"></div>
		              <ul>
		                 <li class="item_title">Gender</li>
		                 <li class="item_radio">
		                    <label style="color: #20385c; vertical-align:top;"><input type="radio" name="gender" checked="checked" value="M" style="margin-right:3px;"/>M</label>
		                 </li>
		                 <li class="item_radio">
		                    <label style="color: #20385c;vertical-align:top;"><input type="radio" name="gender" value="F" style="margin-right:3px;"/>F</label>
		                 </li>
		             </ul>
		        </div>
		        <div class="clear"></div>
	        </form>
		            <div onClick="handlePersonInfo();" style="float:right; margin-top: -4px; margin-right: 31px;" class="new_brown_btn"><span>NEXT</span> <img src="${pageContext.request.contextPath}/images/pc/regaine/icon_arrow.png" name="" border="0"></div>
		  </div>
		  
	</div>
	
	<div class="new_acc_page" id="crt_sed_adr_div" style="width:100%; background:#fff; text-align:center; display:none;z-index: 200000;position: absolute;top:270px; ">
		  <div class="new_header" style="width:650px; margin: 0 auto;">
		
		        
		  		    <table width="620" border="0" cellspacing="0" cellpadding="0"  style="padding-left:25px;">
              <tr>
                <td class="new_title" width="120">New Account</td>
                <td class="new_retailer_logo" align="left" width="150"><img class="rtl_img_tag"
						src="${pageContext.request.contextPath}/images/pc/regaine/logo_Boots.png" height="40" border="0"></td>
                <td class="new_item" width="275"> <div style="float: left; padding-left:20px; width:255px;"><span onClick="showOtherDiv('#crt_sed_adr_div','#crt_fst_pdi_div');" style="cursor: pointer;">PERSONAL DETAILS&nbsp;</span> <span> >  &nbsp;ADDRESS DETAILS</span></div></td>
                <td width="75"> <div style="padding-left:19px;" onClick="closeCreateAccount('crt_sed_adr_div');">
		         <div class="new_close_btn">CLOSE</div></div></td>
              </tr>
            </table>	
		  </div>
		  <div class="clear"></div>
		  <div class="new_content" style="width:650px; margin: 0 auto;">
		  	<form id="account_adr_frm" >
		        <div class="new_account_left">
		             <ul>
		                 <li class="item_title">Postcode</li>
		                 <li ><input class="new_input" onBlur="handlePostCode2(this);" onFocus="handlePostCode(this);"  style="width:110px;color: #20385c;" name="postCode" value="Address Lookup"/></li>
		                 <li style="margin-left: 10px;">
		                 	<div id="adr_lk_btn" onClick="lookupAddress();" class="new_close_btn" style="width:35px;">GO</div>
		                 	<div id="adr_lk_img" style="display:none;"><img src="${pageContext.request.contextPath}/images/pc/regaine/address_look.gif"></img></div>
		                 </li>
		             </ul>
		             <div class="new_text" style="text-align: right;padding:0 10px 5px 0;">Post code look up for UK postcodes only</div>
		             <div class="clear"></div>
		             <ul>
		                 <li class="item_title">Address 1</li>
		                 <li ><input style="color:#20385c" class="new_input"  name="address1" /></li>
		             </ul>
		             <div class="clear"></div>
		             <ul>
		                 <li class="item_title">Address 2</li>
		                 <li ><input style="color:#20385c" class="new_input"  name="address2" /></li>
		             </ul>
		              <div class="clear"></div>
		             <ul>
		                 <li class="item_title">Town/City</li>
		                 <li ><input style="color:#20385c" class="new_input"  name="townOrCity" /></li>
		             </ul>
		              <div class="clear"></div>
		        </div>
		        
		        <div class="new_account_right">
		               <ul>
		                 <li class="item_title">County</li>
		                 <li><input style="color:#20385c" class="new_input"  name="stateOrCounty" /></li>
		                </ul>
		             <div class="clear"></div>
		             
		              <ul style="padding-top:5px;">
		                 <li class="item_title">Country</li>
		                 <li >
		                      <select  name="country" style="width:165px;color: #20385c;">
		                       <option value="UK">United Kingdom</option>
		                    </select>
		                 </li>
		                 <li>
		                 
		                 </li>
		             </ul>
		        <div class="clear"></div>
		         <ul style="padding-top:5px;">
		                 <li class="item_title">Telephone</li>
		                 <li><input style="color:#20385c" class="new_input"  name="phoneNumber" /></li>
		             </ul>
		             <div class="clear"></div>
		        <ul>
		           <li class="new_notice" style="padding-top:5px; padding-left:25px;">
		           
		           <c:if test="${defaultRetailer == 'Boots'}">
		           When you submit this information you agree to the<br/> <span >BOOTS</span> terms and conditions – <a target="_blank" href="http://www.boots.com/webapp/wcs/stores/servlet/GeneralTCView?storeId=10052&catalogId=10551&langId=-1">SEE TERMS</a>
					</c:if>
<c:if test="${defaultRetailer == 'Pharmacy'}">
		           When you submit this information you agree to the<br/> <span >PHARMACY2U</span> terms and conditions – <a target="_blank" href="http://www.pharmacy2u.co.uk/Static/Terms.aspx">SEE TERMS</a>
					</c:if>
		          
		           </li>
		        </ul>
		        <div class="clear"></div>
		        </div>
		        </form>
		        <div class="clear"></div>
		            <div onClick="handleAddressInfo();" style="float:right; margin-top: -30px; margin-right: 31px;" class="new_brown_btn02">REGISTER</div>
		  </div>
	</div>
	
	<div class="new_acc_page" id="crt_tid_thk_div" style="width:100%; background:#fff; text-align:center; display:none;z-index: 200000;position: absolute;top:270px; ">
		  <div class="new_content" style="width:650px; margin: 0 auto;">
		
		         <div class="new_tks" style="padding-top: 25px; font-size: 15px;">
		             <ul>
		                <li style="font-weight: bold;">Thank you for registering with <span class="crt_act_rtl">BOOTS.</span></li><br/>
		                <li >You will be sent a confirmation email shortly.</li>
		                <li style="padding-top: 25px;"><div onClick="closeCreateAccount('crt_tid_thk_div');" style="width:216px; margin: 0 auto;line-height: 20px;" class="store_btn">RETURN TO REGAINE<span style="font-size: 8px;vertical-align:super;">&reg;</span></div></li>
		             </ul>
		         </div>
		  
		        <div class="clear"></div>
		  </div>
		  
	</div>
	<div class="new_acc_page" id="crt_frt_ldi_div" style="width:100%; background:#fff; text-align:center; display:none;z-index: 200000;position: absolute;top:270px; ">
			<div class="basket_con_text" style="z-index: 300000; margin:0 auto; text-align: center;width:100%;font-size:16px;font-weight: normal;line-height:18px;">CREATING YOUR<br />
							  <span>BOOTS</span> ACCOUNT</div>
		   <div class="basket_con_lodding">
							<img
								src="${pageContext.request.contextPath}/images/pc/regaine/animation_all.gif"
								height="207" name="" border="0">
						</div>
		</div>
	<div id="addressDiv" class="new_acc_page"  style="width:100%; background:#fff; display:none;z-index: 900000;position: absolute;top:270px;">
		<h5 style="width: 580px;margin: 0 auto;text-align:left;margin-top:10px; margin-bottom: 10px;padding-left: 20px;">Please select your address from the list below:</h5>
		<div id="addressDivList" style="width: 560px;margin: 0 auto;height:160px; padding: 0 20px;overflow:auto;"></div>
	</div>
</body>
</html>
