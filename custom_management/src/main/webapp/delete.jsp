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