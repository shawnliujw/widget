<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>Widget Builder</title>
<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/jquery/jquery.mobile-1.3.0.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jquery/jquery-mobile-custom-dotter.css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/jquery.mobile-1.3.0.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div data-role="page" id="infoPage" data-theme="f" style="background-image: url('${pageContext.request.contextPath}/images/dot_homebg.png'); background-size:100%" class="dot_home">
	<div style="padding:5px;">
		<div data-role="header" class="dot_home_header">
		</div>
		<div data-role="content" style="padding: 0px;">
	          <div class="dot_info_blcok">
	             <h4>THE GIANTS STORY</h4>

Thousands of years ago, the Giants fought epic battles in Skylands but were banished to Earth. With a new threat looming, it’s time to bring them back to join forces with the Skylanders to defeat KAOS. Only you can put them on the Portal of Power® to unleash their strength in the ultimate battle to save Skylands!<br/><br/>

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam cursus. Morbi ut mi. Nullam enim leo, egestas id, condimentum at, laoreet mattis, massa. Sed eleifend nonummy diam. Praesent mauris ante, elementum et, bibendum at, posuere sit amet, nibh. Duis tincidunt lectus quis dui viverra vestibulum. Suspendisse vulputate aliquam dui. Nulla elementum dui ut augue. Aliquam vehicula mi at mauris. Maecenas placerat, nisl at consequat rhoncus, sem nunc gravida justo, quis eleifend arcu velit quis lacus. Morbi magna magna, tincidunt a, mattis non, imperdiet vitae, tellus. Sed odio est, auctor ac, sollicitudin in, consequat vitae, orci. Fusce id felis. Vivamus sollicitudin metus eget eros.
	          </div>	
	          
	          <div class="info_close" onclick="javascript:history.go(-1)">
				    <img src="${pageContext.request.contextPath}/images/icon_close.png" width="48" border="0">
				</div>
		</div>
		<div data-role="footer">
		</div>
	</div>	
</div>
</body>
</html>
