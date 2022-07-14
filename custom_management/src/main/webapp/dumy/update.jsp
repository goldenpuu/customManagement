<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="custom.*"%>
<%
request.setCharacterEncoding("utf-8");

// 파라미터 값 받기
String busi_num = request.getParameter("busi_num");
String custom = request.getParameter("custom");
String short_name = request.getParameter("short_name");
String ceo = request.getParameter("ceo");
String charge_person = request.getParameter("charge_person");
String busi_condition = request.getParameter("busi_condition");
String item = request.getParameter("item");
String post_num = request.getParameter("post_num");
String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");
String tel = request.getParameter("tel");
String fax = request.getParameter("fax");
String homepage = request.getParameter("homepage");
String co_yn = request.getParameter("co_yn");
String foreign_yn = request.getParameter("foreign_yn");
String tax_yn = request.getParameter("tax_yn");
String country_eng = request.getParameter("country_eng");
String country_kor = request.getParameter("country_kor");
String special_relation = request.getParameter("special_relation");
String trade_stop = request.getParameter("trade_stop");
String contract_period_s = request.getParameter("contract_period_s");
String contract_period_e = request.getParameter("contract_period_e");
String regi_info_man = request.getParameter("regi_info_man");
String regi_info_date = request.getParameter("regi_info_date");
String modi_info_man = request.getParameter("modi_info_man");
String modi_info_date = request.getParameter("modi_info_date");
String factory = request.getParameter("factory");
String trade_bank = request.getParameter("trade_bank");
String account_num = request.getParameter("account_num");

CustomDAO dao = new CustomDAO();
	CustomVO vo = new CustomVO();
	vo.setBusi_num(busi_num);
	vo.setCustom(custom);
	vo.setShort_name(short_name);
	vo.setCeo(ceo);
	vo.setCharge_person(charge_person);
	vo.setBusi_condition(busi_condition);
	vo.setItem(item);
	vo.setPost_num(post_num);
	vo.setAddr1(addr1);
	vo.setAddr2(addr2);
	vo.setTel(tel);
	vo.setFax(fax);
	vo.setHomepage(homepage);
	vo.setCo_yn(co_yn);
	vo.setForeign_yn(foreign_yn);
	vo.setTax_yn(tax_yn);
	vo.setCountry_eng(country_eng);
	vo.setCountry_kor(country_kor);
	vo.setSpecial_relation(special_relation);
	vo.setTrade_stop(trade_stop);
	vo.setContract_period_s(contract_period_s);
	vo.setContract_period_e(contract_period_e);
	vo.setRegi_info_man(regi_info_man);
	vo.setRegi_info_date(regi_info_date);
	vo.setModi_info_man(modi_info_man);
	vo.setModi_info_date(modi_info_date);
	vo.setFactory(factory);
	vo.setTrade_bank(trade_bank);
	vo.setAccount_num(account_num);
	int r = dao.update(vo);
	if (r > 0) { // 정상등록
%>
수정을 성공했습니다.
<%		
	} else { // 등록실패
%>
수정 실패!
<%
	}
%>
<button type="button" onclick="location.href='index.jsp?busi_num=&custom='">돌아가기</button>