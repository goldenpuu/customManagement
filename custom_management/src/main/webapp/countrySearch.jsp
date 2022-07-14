<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>국가검색창</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#confirm').on("click", function(){
		
		var words = $('#select').val().split(":");
		
		$(opener.document).find('#country_eng').val(words[0]);
		$(opener.document).find('#country_kor').val(words[1]);
		
		window.close();
	});
});
</script>
</head>
<body>
	<select id="select">
		<option value='KOR:대한민국'>대한민국</option>
		<option value='USA:미국'>미국</option>
	</select>
	<button id="confirm">확인</button>
</body>
</html>