<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="custom.*"%>
<%@ page import="java.util.*"%>
<%
CustomDAO dao = new CustomDAO(); // 객체 생성
String busi_num = request.getParameter("busi_num");
String custom = request.getParameter("custom");

List<CustomVO> customList = dao.selectList(busi_num, custom); // 메서드 호출 결과를 변수에 대입
dao.close(); // 자원 해제
%>[<%int i = 0;
for(CustomVO vo : customList){ 
i++;
%>
{ 
"busi_num" : "<%=vo.getBusi_num() %>", 
"custom" : "<%=vo.getCustom() %>"}
<%if(i==customList.size()){}else{%>
,<%}%><%}%>]