<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="custom.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 관리</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var special_relation = "N";
	var trade_stop = "N";
	var co_yn = "Y";
	var foreign_yn = "N";
	var tax_yn = "Y";

	function init() {
		$('#busi_num').val("");
		$('#custom').val("");
		$('#short_name').val("");
		$('#ceo').val("");
		$('#charge_person').val("");
		$('#busi_condition').val("");
		$('#item').val("");
		$('#post_num').val("");
		$('#addr1').val("");
		$('#addr2').val("");
		$('#tel').val("");
		$('#fax').val("");
		$('#homepage').val("");
		$('#co_y').prop("checked", true);
		$('#foreign_n').prop("checked", true);
		$('#tax_yn option:eq(0)').prop("selected", true);
		$('#country_eng').val("");
		$('#country_kor').val("");
		$('#special_relation').prop("checked", false);
		$('#trade_stop').prop("checked", false);
		$('#contract_period_s').val("");
		$('#contract_period_e').val("");
		$('#regi_info_man').val("");
		$('#regi_info_date').val("");
		$('#modi_info_man').val("");
		$('#modi_info_date').val("");
		$('#factory').val("");
		$('#trade_bank').val("");
		$('#account_num').val("");
		$('#factory').val("");
		$('#trade_bank').val("");
		$('#account_num').val("");

		table = document.getElementById("data");
		$("#data").find("tr:gt(0)").remove();

		special_relation = "N";
		trade_stop = "N";
		co_yn = "Y";
		foreign_yn = "N";
		tax_yn = "Y";
	}
	$(function() {
		$("#post_search").on("click", function() {
			new daum.Postcode({
				oncomplete : function(data) {

					var roadAddr = data.roadAddress; // 도로명 주소 변수
					$("#post_num").val(data.zonecode);
					$("#addr1").val(roadAddr);
				}
			}).open();
		});
		$("#init").on("click", function() {
			init();
		});
		$("#country_search").on("click", function() {
			debugger;
			window.open('countrySearch.jsp','국가검색창','width=400 height=400');
		});
		$("#search").on(
				"click",
				function() {
					var val1 = "";
					var val2 = "";

					val1 = $("#bn").val();
					val2 = $("#cu").val();

					$.ajax({
						url : "getCustomJson.jsp?busi_num=" + val1 + "&custom="
								+ val2,
						datatype : "json",
						contentType : "application/json",
						success : function(data) {
							var re = JSON.parse(data);
							var table = document.getElementById("data");
							$("#data").find("tr:gt(0)").remove();
							$.each(re, function(i, e) {

								var row = table.insertRow(i + 1);

								row.innerHTML = "<td>" + e.busi_num
										+ "</td><td>" + e.custom + "</td>";
							});
						}
					});
				});
		$("#insert").on("click", function() {
			$.ajax({
				url : "insert.jsp",
				data : {
					"busi_num" : $("#busi_num").val(),
					"custom" : $("#custom").val(),
					"short_name" : $("#short_name").val(),
					"ceo" : $("#ceo").val(),
					"charge_person" : $("#charge_person").val(),
					"busi_condition" : $("#busi_condition").val(),
					"item" : $("#item").val(),
					"post_num" : $("#post_num").val(),
					"addr1" : $("#addr1").val(),
					"addr2" : $("#addr2").val(),
					"tel" : $("#tel").val(),
					"fax" : $("#fax").val(),
					"homepage" : $("#homepage").val(),
					"co_yn" : co_yn,
					"foreign_yn" : foreign_yn,
					"tax_yn" : tax_yn,
					"country_eng" : $("#country_eng").val(),
					"country_kor" : $("#country_kor").val(),
					"special_relation" : special_relation,
					"trade_stop" : trade_stop,
					"contract_period_s" : $("#contract_period_s").val(),
					"contract_period_e" : $("#contract_period_e").val(),
					"regi_info_man" : $("#regi_info_man").val(),
					"regi_info_date" : $("#regi_info_date").val(),
					"modi_info_man" : $("#modi_info_man").val(),
					"modi_info_date" : $("#modi_info_date").val(),
					"factory" : $("#factory").val(),
					"trade_bank" : $("#trade_bank").val(),
					"account_num" : $("#account_num").val()
				},
				datatype : "html",
				contentType : "application/json",
				success : function(data) {
					alert(data);
				}
			});
		});
		$("#update").on("click", function() {
			$.ajax({
				url : "update.jsp",
				data : {
					"busi_num" : $("#busi_num").val(),
					"custom" : $("#custom").val(),
					"short_name" : $("#short_name").val(),
					"ceo" : $("#ceo").val(),
					"charge_person" : $("#charge_person").val(),
					"busi_condition" : $("#busi_condition").val(),
					"item" : $("#item").val(),
					"post_num" : $("#post_num").val(),
					"addr1" : $("#addr1").val(),
					"addr2" : $("#addr2").val(),
					"tel" : $("#tel").val(),
					"fax" : $("#fax").val(),
					"homepage" : $("#homepage").val(),
					"co_yn" : co_yn,
					"foreign_yn" : foreign_yn,
					"tax_yn" : tax_yn,
					"country_eng" : $("#country_eng").val(),
					"country_kor" : $("#country_kor").val(),
					"special_relation" : special_relation,
					"trade_stop" : trade_stop,
					"contract_period_s" : $("#contract_period_s").val(),
					"contract_period_e" : $("#contract_period_e").val(),
					"regi_info_man" : $("#regi_info_man").val(),
					"regi_info_date" : $("#regi_info_date").val(),
					"modi_info_man" : $("#modi_info_man").val(),
					"modi_info_date" : $("#modi_info_date").val(),
					"factory" : $("#factory").val(),
					"trade_bank" : $("#trade_bank").val(),
					"account_num" : $("#account_num").val()
				},
				datatype : "html",
				contentType : "application/json",
				success : function(data) {
					alert(data);
				}
			});
		});
		$("#delete").on("click", function() {
			$.ajax({
				url : "delete.jsp",
				data : {
					"busi_num" : $("#busi_num").val()
				},
				datatype : "html",
				contentType : "application/json",
				success : function(data) {
					debugger;
					alert(data);
					if (data == '삭제 성공했습니다.') {
						init();
					}
				}
			});
		});
	});
</script>
<script>
	function setDetail(busi_num) {
		$.ajax({
			url : "getCustomOne.jsp?busi_num=" + busi_num,
			datatype : "json",
			contentType : "application/json",
			success : function(data) {
				var re = JSON.parse(data);
				$('#busi_num').val(re[0].busi_num);
				$('#custom').val(re[0].custom);
				$('#short_name').val(re[0].short_name);
				$('#ceo').val(re[0].ceo);
				$('#charge_person').val(re[0].charge_person);
				$('#busi_condition').val(re[0].busi_condition);
				$('#item').val(re[0].item);
				$('#post_num').val(re[0].post_num);
				$('#addr1').val(re[0].addr1);
				$('#addr2').val(re[0].addr2);
				$('#tel').val(re[0].tel);
				$('#fax').val(re[0].fax);
				$('#homepage').val(re[0].homepage);
				co_yn = re[0].co_yn;
				foreign_yn = re[0].foreign_yn;
				tax_yn = re[0].tax_yn;
				special_relation = re[0].special_relation;
				trade_stop = re[0].trade_stop;
				$('input:radio[name=co_yn][value=' + co_yn + ']').click();
				$('input:radio[name=foreign_yn][value=' + foreign_yn + ']')
						.click();
				$('#tax_yn').val(tax_yn);
				if (special_relation == "Y") {
					$('#special_relation').prop('checked', true)
				} else {
					$('#special_relation').prop('checked', false)
				}
				;
				if (trade_stop == "Y") {
					$('#trade_stop').prop('checked', true)
				} else {
					$('#trade_stop').prop('checked', false)
				}
				;
				$('#country_eng').val(re[0].country_eng);
				$('#country_kor').val(re[0].country_kor);
				$('#contract_period_s').val(re[0].contract_period_s);
				$('#contract_period_e').val(re[0].contract_period_e);
				$('#regi_info_man').val(re[0].regi_info_man);
				$('#regi_info_date').val(re[0].regi_info_date);
				$('#modi_info_man').val(re[0].modi_info_man);
				$('#modi_info_date').val(re[0].modi_info_date);
				$('#factory').val(re[0].factory);
				$('#trade_bank').val(re[0].trade_bank);
				$('#account_num').val(re[0].account_num);
			},
			error : function(data, status, error) {
				console.log(status);
				console.log(error);
			}
		});
		return 0;
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#data').on('dblclick', 'tr:not(:first)', function() {
			var str = "";
			var tdArr = new Array();

			var tr = $(this);
			var td = tr.children();

			td.each(function(i) {
				console.log(td.eq(i).text());
			});
			setDetail(td.eq(0).text());
		});
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
	});
</script>
<style>
div {
	width: 100%;
	height: 600px;
	border: 1px solid #003458;
}

div.left {
	width: 30%;
	float: left;
	box-sizing: border-box;
}

div.right {
	width: 70%;
	float: right;
	box-sizing: border-box;
}

input {
	width: 160px;
	height: 20px;
	font-size: 13px;
}
</style>
</head>
<body>
	<div>
		<div class="left">
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
			</table>
		</div>
		<div class="right">
			<button type="button" id="init">초기화</button>
			<button type="button" id="insert">등록</button>
			<button type="button" id="update">수정</button>
			<button type="button" id="delete">삭제</button>
			<table border="1">
				<tr>
					<td>사업자번호</td>
					<td><input type="text" id="busi_num"></td>
					<td>약칭</td>
					<td><input type="text" id="short_name"></td>
				</tr>
				<tr>
					<td>거래처명</td>
					<td><input type="text" id="custom"></td>
				</tr>
				<tr>
					<td>대표자</td>
					<td><input type="text" id="ceo"></td>
					<td>담당자</td>
					<td><input type="text" id="charge_person"></td>
				</tr>
				<tr>
					<td>업태</td>
					<td><input type="text" id="busi_condition"></td>
					<td>종목</td>
					<td><input type="text" id="item"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" id="post_num">
						<button id="post_search">검색</button></td>
					<td>주소1</td>
					<td><input type="text" id="addr1"></td>
				</tr>
				<tr>
					<td>주소2</td>
					<td><input type="text" id="addr2"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" id="tel"></td>
					<td>팩스번호</td>
					<td><input type="text" id="fax"></td>
				</tr>
				<tr>
					<td>홈페이지</td>
					<td><input type="text" id="homepage"></td>
				</tr>
				<tr>
					<td>법인여부</td>
					<td><input type="radio" name="co_yn" id="co_y" value="Y"
						checked>법인<br> <input type="radio" name="co_yn"
						id="co_n" value="N">개인</td>
					<td>해외여부</td>
					<td><input type="radio" name="foreign_yn" id="foreign_n"
						value="N" checked>국내<br> <input type="radio"
						name="foreign_yn" id="foreign_y" value="Y">해외</td>
				</tr>
				<tr>
					<td>과세구분</td>
					<td><select name="tax_yn" id="tax_yn">
							<option value="Y" class="tax_yn" selected>과세</option>
							<option value="N" class="tax_yn">면세</option>
					</select></td>
					<td>국가</td>
					<td><input type="text" id="country_eng"> <input
						type="text" id="country_kor">
					<button id="country_search">검색</button></td>
				</tr>
				<tr>
					<td>특수관계자</td>
					<td><input type="checkbox" id="special_relation" value="Y"></td>
					<td>거래중지</td>
					<td><input type="checkbox" id="trade_stop" value="Y"></td>
				</tr>
				<tr>
					<td>계약기간</td>
					<td><input type="text" id="contract_period_s"> ~</td>
					<td><input type="text" id="contract_period_e"></td>
				</tr>
				<tr>
					<td>등록정보</td>
					<td><input type="text" id="regi_info_man"> <input
						type="text" id="regi_info_date"></td>
					<td>변경정보</td>
					<td><input type="text" id="modi_info_man"> <input
						type="text" id="modi_info_date"></td>
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
					<td><input type="text" name="factory" id="factory"></input></td>
					<td><input type="text" name="trade_bank" id="trade_bank"></input></td>
					<td><input type="text" name="account_num" id="account_num"></input></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>