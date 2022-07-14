<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="custom.*"%>
<%
CustomDAO dao = new CustomDAO(); // 객체 생성
String busi_num = request.getParameter("busi_num");
CustomVO vo = dao.selectOne(busi_num);

dao.close(); // 자원 해제
%>
[{
"busi_num" : "<%=vo.getBusi_num() %>", 
"custom" : "<%=vo.getCustom() %>", 
"short_name" : "<%=vo.getShort_name() %>", 
"ceo" : "<%=vo.getCeo() %>", 
"charge_person" : "<%=vo.getCharge_person() %>", 
"busi_condition" : "<%=vo.getBusi_condition() %>", 
"item" : "<%=vo.getItem() %>", 
"post_num" : "<%=vo.getPost_num()%>", 
"addr1" : "<%=vo.getAddr1() %>", 
"addr2" : "<%=vo.getAddr2() %>", 
"tel" : "<%=vo.getTel() %>", 
"fax" : "<%=vo.getFax() %>", 
"homepage" : "<%=vo.getHomepage() %>", 
"co_yn" : "<%=vo.getCo_yn() %>", 
"foreign_yn" : "<%=vo.getForeign_yn()%>", 
"tax_yn" : "<%=vo.getTax_yn() %>", 
"country_eng" : "<%=vo.getCountry_eng() %>", 
"country_kor" : "<%=vo.getCountry_kor() %>", 
"special_relation" : "<%=vo.getSpecial_relation() %>", 
"trade_stop" : "<%=vo.getTrade_stop() %>", 
"contract_period_s" : "<%=vo.getContract_period_s() %>", 
"contract_period_e" : "<%=vo.getContract_period_e() %>", 
"regi_info_man" : "<%=vo.getRegi_info_man() %>", 
"regi_info_date" : "<%=vo.getRegi_info_date() %>", 
"modi_info_man" : "<%=vo.getModi_info_man() %>", 
"modi_info_date" : "<%=vo.getModi_info_date() %>", 
"factory" : "<%=vo.getFactory() %>", 
"trade_bank" : "<%=vo.getTrade_bank() %>", 
"account_num" : "<%=vo.getAccount_num()%>" }]