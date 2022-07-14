<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="custom.*"%>
    <%request.setCharacterEncoding("utf-8");
String busi_num = request.getParameter("busi_num");
CustomDAO dao = new CustomDAO();
int r = dao.delete(busi_num);
if (r > 0) { // 정상등록
%>삭제 성공했습니다.<%		
} else { // 등록실패
%>삭제 실패!<%
	}
%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#back').on("click", function(){
			location.href = "detail.jsp?busi_num="+<%=busi_num%>;
		});
	});
</script>
<button type="button" id="back">돌아가기</button>