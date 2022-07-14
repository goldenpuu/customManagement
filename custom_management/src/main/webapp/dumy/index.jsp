<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="custom.*"%>
<%@ page import="java.util.*"%>
<%
CustomDAO dao = new CustomDAO();
List<CustomVO> customList = dao.selectList(request.getParameter("busi_num"), request.getParameter("custom"));
dao.close();

request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 관리</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#search').on("click", function(){
			location.href = "index.jsp?busi_num="+$('#bn').val()+"&custom="+$('#cu').val();
		});
	});
</script>
</head>
<body>
	<table border="1">
		<tr>
			<td>사업자번호</td>
			<td><input type="text" id="bn" name="busi_num"></td>
		</tr>
		<tr>
			<td>거래처명</td>
			<td><input type="text" id="cu" name="custom"></td>
			<td><button type="button" id="search">조회</button></td>
		</tr>
	</table>
	<table border="1" id="data">
		<tr>
			<td>사업자 번호</td>
			<td>거래처명</td>
		</tr>
		<%
		for (int i = 0; i < customList.size(); i++) {
			CustomVO customVo = customList.get(i);
		%>
		<tr>
			<td><a
				href="detail.jsp?busi_num=<%=customVo.getBusi_num()%>"><%=customVo.getBusi_num()%></a></td>
			<td><%=customVo.getCustom()%></td>
		</tr>
		<%
		}
		%>
	</table>
	<button type="button" onclick="location.href='detail.jsp'">새로등록</button>
</body>
</html>