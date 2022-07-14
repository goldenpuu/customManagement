<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="custom.*"%>
<%@page import="java.time.LocalDate"%>
<%
request.setCharacterEncoding("utf-8");

CustomDAO dao = new CustomDAO();
CustomVO vo = dao.selectOne(request.getParameter("busi_num"));
if (vo == null) {
	LocalDate todaysDate = LocalDate.now();
	vo = new CustomVO();
	vo.setAccount_num("");
	vo.setAddr1("");
	vo.setAddr2("");
	vo.setBusi_condition("");
	vo.setBusi_num("");
	vo.setCeo("");
	vo.setCharge_person("");
	vo.setCo_yn("Y");
	vo.setContract_period_e(todaysDate.toString());
	vo.setContract_period_s(todaysDate.toString());
	vo.setCountry_eng("");
	vo.setCountry_kor("");
	vo.setCustom("");
	vo.setFactory("");
	vo.setFax("");
	vo.setForeign_yn("N");
	vo.setHomepage("");
	vo.setItem("");
	vo.setModi_info_date(todaysDate.toString());
	vo.setModi_info_man("");
	vo.setPost_num("");
	vo.setRegi_info_date(todaysDate.toString());
	vo.setRegi_info_man("");
	vo.setShort_name("");
	vo.setSpecial_relation("N");
	vo.setTax_yn("Y");
	vo.setTel("");
	vo.setTrade_bank("");
	vo.setTrade_stop("N");
}
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상세조회</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var special_relation = "N";
	var trade_stop = "N";
	var co_yn = "Y";
	var foreign_yn = "N";
	var tax_yn = "Y";

	$(function() {
		$("#init").on("click", function() {
			location.reload();
		});
		$("#post_search").on("click", function() {
			new daum.Postcode({
				oncomplete : function(data) {
					$("#post_num").val(data.zonecode);
					$("#addr1").val(data.roadAddress);
				}
			}).open();
		});
		$("#country_search").on(
				"click",
				function() {
					window.open('../countrySearch.jsp', '국가검색창',
							'width=400 height=400');
				});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#co_y").change(function() {
			co_yn = $("input[name='co_yn']:checked").val();
		});
		$("#co_n").change(function() {
			co_yn = $("input[name='co_yn']:checked").val();
		});
		$("#foreign_y").change(function() {
			foreign_yn = $("input[name='foreign_yn']:checked").val();
		});
		$("#foreign_n").change(function() {
			foreign_yn = $("input[name='foreign_yn']:checked").val();
		});
		$("#special_relation").change(function() {
			if ($("#special_relation")[0].checked) {
				special_relation = "Y";
			} else {
				special_relation = "N";
			}
		});
		$("#trade_stop").change(function() {
			if ($("#trade_stop")[0].checked) {
				trade_stop = "Y";
			} else {
				trade_stop = "N";
			}
		});
		$("#tax_yn").change(function() {
			tax_yn = $("#tax_yn option:selected").val();
		});
		$("#sending").submit(function() {
			$("input[name=special_relation]").val(special_relation);
			$("input[name=trade_stop]").val(trade_stop);
		});
	});
</script>
</head>
<body>
	<form method="post" id="sending">
		<button type="button" id="init">초기화</button>
		<button type="submit" id="insert"
			onclick="javascript: form.action='insert.jsp';">등록</button>
		<button type="submit" id="update"
			onclick="javascript: form.action='update.jsp';">수정</button>
		<button type="submit" id="delete"
			onclick="javascript: form.action='delete.jsp';">삭제</button>
		<table border="1">
			<tr>
				<td>사업자번호</td>
				<td><input type="text" name="busi_num" id="busi_num"
					value='<%=vo.getBusi_num()%>'></td>
				<td>약칭</td>
				<td><input type="text" name="short_name" id="short_name"
					value='<%=vo.getShort_name()%>'></td>
			</tr>
			<tr>
				<td>거래처명</td>
				<td><input type="text" name="custom" id="custom"
					value='<%=vo.getCustom()%>'></td>
			</tr>
			<tr>
				<td>대표자</td>
				<td><input type="text" name="ceo" id="ceo"
					value='<%=vo.getCeo()%>'></td>
				<td>담당자</td>
				<td><input type="text" name="charge_person" id="charge_person"
					value='<%=vo.getCharge_person()%>'></td>
			</tr>
			<tr>
				<td>업태</td>
				<td><input type="text" id="busi_condition"
					name="busi_condition" value='<%=vo.getBusi_condition()%>'></td>
				<td>종목</td>
				<td><input type="text" name="item" id="item"
					value='<%=vo.getItem()%>'></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type="text" id="post_num" name="post_num"
					value='<%=vo.getPost_num()%>'>
					<button id="post_search">검색</button></td>
				<td>주소1</td>
				<td><input type="text" name="addr1" id="addr1"
					value='<%=vo.getAddr1()%>'></td>
			</tr>
			<tr>
				<td>주소2</td>
				<td><input type="text" name="addr2" id="addr2"
					value='<%=vo.getAddr2()%>'></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="tel" id="tel"
					value='<%=vo.getTel()%>'></td>
				<td>팩스번호</td>
				<td><input type="text" name="fax" id="fax"
					value='<%=vo.getFax()%>'></td>
			</tr>
			<tr>
				<td>홈페이지</td>
				<td><input type="text" name="homepage" id="homepage"
					value='<%=vo.getHomepage()%>'></td>
			</tr>
			<tr>
				<td>법인여부</td>
				<td><input type="radio" name="co_yn" id="co_y" value="Y"
					<%if ("Y".equals(vo.getCo_yn())) {%> checked <%}%>>법인<br>
					<input type="radio" name="co_yn" id="co_n" value="N"
					<%if ("N".equals(vo.getCo_yn())) {%> checked <%}%>>개인</td>
				<td>해외여부</td>
				<td><input type="radio" name="foreign_yn" id="foreign_n"
					value="N" <%if ("N".equals(vo.getForeign_yn())) {%> checked <%}%>>국내<br>
					<input type="radio" name="foreign_yn" id="foreign_y" value="Y"
					<%if ("Y".equals(vo.getForeign_yn())) {%> checked <%}%>>해외</td>
			</tr>
			<tr>
				<td>과세구분</td>
				<td><select name="tax_yn" name="tax_yn" id="tax_yn">
						<option value="Y" class="tax_yn"
							<%if ("Y".equals(vo.getTax_yn())) {%> selected <%}%>>과세</option>
						<option value="N" class="tax_yn"
							<%if ("N".equals(vo.getTax_yn())) {%> selected <%}%>>면세</option>
				</select></td>
				<td>국가</td>
				<td><input type="text" name="country_eng" id="country_eng"
					value='<%=vo.getCountry_eng()%>'> <input type="text"
					name="country_kor" id="country_kor">
					<button id="country_search" value='<%=vo.getCountry_kor()%>'>검색</button></td>
			</tr>
			<tr>
				<td>특수관계자</td>
				<td><input type="checkbox" id="special_relation"
					<%if ("Y".equals(vo.getSpecial_relation())) {%> checked <%}%>>
					<input type="hidden" name="special_relation"></td>
				<td>거래중지</td>
				<td><input type="checkbox" id="trade_stop"
					<%if ("Y".equals(vo.getTrade_stop())) {%> checked <%}%>> <input
					type="hidden" name="trade_stop"></td>
			</tr>
			<tr>
				<td>계약기간</td>
				<td><input type="date" name="contract_period_s"
					id="contract_period_s" value='<%=vo.getContract_period_s()%>'>
					~</td>
				<td><input type="date" name="contract_period_e"
					id="contract_period_e" value='<%=vo.getContract_period_e()%>'></td>
			</tr>
			<tr>
				<td>등록정보</td>
				<td><input type="text" name="regi_info_man" id="regi_info_man"
					value='<%=vo.getRegi_info_man()%>'> <input type="date"
					name="regi_info_date" id="regi_info_date"
					value='<%=vo.getRegi_info_date()%>'></td>
				<td>변경정보</td>
				<td><input type="text" name="modi_info_man" id="modi_info_man"
					value='<%=vo.getModi_info_man()%>'> <input type="date"
					name="modi_info_date" id="modi_info_date"
					value='<%=vo.getModi_info_date()%>'></td>
			</tr>
			<tr>
				<td>(거래처 계좌정보)</td>
			</tr>
			<tr>
				<td>사무소</td>
				<td>은행</td>
				<td>계좌번호</td>
			</tr>
			<tr>
				<td><input type="text" name="factory" id="factory"
					value='<%=vo.getFactory()%>'></input></td>
				<td><input type="text" name="trade_bank" id="trade_bank"
					value='<%=vo.getTrade_bank()%>'></input></td>
				<td><input type="text" name="account_num" id="account_num"
					value='<%=vo.getAccount_num()%>'></input></td>
			</tr>
		</table>
	</form>
</body>
</html>