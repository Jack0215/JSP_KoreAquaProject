<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dto.JusoDTO"%>
<%@page import="com.dto.MonthDTO"%>
<%@ page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="js/jquery.ui.monthpicker.js"></script>

<style type="text/css">
.modal_wrap {
	display: none;
	width: 300px;
	height: 250px;
	position: fixed;
	top: 50%;
	left: 50%;
	bottom: 50%;
	margin: auto;
	background: #eee;
	z-index: 2;
}

.black_bg {
	display: none;
	position: absolute;
	content: "";
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	top: 0;
	left: 0;
	z-index: 1;
}

.modal_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

.modal_close>a {
	display: block;
	width: 100%;
	height: 100%;
	background: url(https://img.icons8.com/metro/26/000000/close-window.png);
	text-indent: -9999px;
}
/* 공통옵션 */
ul li {
	list-style: none;
}

.fl {
	float: left;
}

.tc {
	text-align: center;
}

.table_t {
	align-item: center;
	display: table-row;
	margin: 0;
	padding: 0;
	width: 100%;
	display: table;
	border-collapse: collapse;
	table-layout: fixed;
	border: none;
}

.table_t .board {
	display: table-row;
}

.table_t #boardD {
	display: table-cell;
	text-align: center;
	padding: 5px 0;
	/*아래는 메뉴 영역을 구분하기 위한 옵션입니다.*/
	border-top: 1px solid #69c;
	border-bottom: 1px solid #69c;
}
/*아래는 메뉴 영역을 구분하기 위한 옵션입니다.*/
.boardD+.boardD {
	border-left: 1px solid #69c
}

input {
	width: 150px;
	padding: .5em .5em;
	border: 1px solid #999;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

select {
	width: 180px;
	padding: .5em .5em;
	border: 1px solid #999;
	font-family: inherit;
	background: url('images/select_img.jpeg') no-repeat 95% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

select::-ms-expand {
	display: none;
}

#searchBtn {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-right: -4px;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	font-size: 15px;
}

#btnDiv button:hover {
	color: white;
	background-color: skyblue;
}

h3 {
	font-size: 20px;
	font-weight: 250;
}
</style>
<script type="text/javascript">
	//조회 시 시도, 시군, 동 파라미터 담을 전역변수
	var globalParam1 = "";
	var globalParam2 = "";
	var globalParam3 = "";
	//select 변경 시 주소 세팅
	$(document).ready(function(){
		//조회 전에는 "", 조회 후에는 시도, 시군, 동 값을 담는다.
		globalParam1 = [];
		globalParam2 = [];
		globalParam3 = [];
		//시도 변경에 따른 시군 세팅
		$("#sido").on("change", function() {
			var innerHtml="";
			$.ajax({
				type: "get",
				url: "SigunServlet",
				dataType: "text",
				//contentType: "application/x-www-form-urlencoded; charset=UTF-8",

				data:{
					sido : $("#sido option:selected").text()
				},
				success: function (data, status, xhr) {
					var data = decodeURIComponent(data);
						var data = data.replace("[","");
						data = data.replace("]","");
						console.log(data);
						var listdata = data.split(',');
					$("#sigun").children("option").remove();
					$("#sigun").append("<option value= ''>"+"선택하세요."+"</option>");
						for(var i in listdata){
							//innerHtml+=	"<option value= '"+listdata[i]+"'>"+listdata[i]+"</option>";
							$("#sigun").append("<option value= '"+listdata[i]+"'>"+listdata[i]+"</option>");
						//console.log(data);
					}
						//$("#sigun").append(innerHtml);	
				},
				error: function(xhr, status, e) {
					console.log(e);
				}
			});
			console.log( $("#sigun").val());
		});
		
		//시군 변경에 따른 읍,면 동 변
		  $("#sigun").on("change", function() {
			$.ajax({
				type: "get",
				url: "DongServlet",
				dataType: "text",
				//contentType: "application/x-www-form-urlencoded; charset=UTF-8",

				data:{
					sigun : $("#sigun option:selected").val()
				},
				success: function (data, status, xhr) {
					//var data = decodeURIComponent(data);
						var data = data.replace("[","");
						data = data.replace("]","");
						console.log(data);
						var listdata = data.split(',');
						$("#dong").children("option").remove();
						$("#dong").append("<option value= ''>"+"선택하세요."+"</option>");
						for(var i in listdata){
						                                                                                                                              
						$("#dong").append("<option value= '"+listdata[i]+"'>"+listdata[i]+"</option>");
						//console.log(data);
					}
				},
				error: function(xhr, status, e) {
					console.log(e);
				}
			});
		});
		//조회 버튼 클릭 시 시도, 시군, 동 값 유효성 검사 후 MonthDataServlet으로 이동
		$("#searchBtn").on("click", function () {
			var sido = $("#sido option:selected").text();
			var sigun = $("#sigun option:selected").val().trim();
			var dong = $("#dong option:selected").val().trim();
			if($("#searchMonth").text() == " ") {
				alert("조회할 날짜를 선택하세요.");
				return false;
			};
			if(sido == "선택하세요.") {
				alert("검색할 지역을 모두 선택하세요.");
				return false;
			}
			if($("#sigun option:selected").text() == "선택하세요.") {
				alert("검색할 지역을 모두 선택하세요.");
				return false;
			}
			if($("#dong option:selected").text() == "선택하세요.") {
				alert("검색할 지역을 모두 선택하세요.");
				return false;
			}
			var searchMonth = $("#searchMonth").monthpicker().val();
			
			console.log(searchMonth)
			$("form").attr("action", "MonthDataServlet?sido=" + sido + "&sigun=" + sigun + "&dong=" + dong
					+ "&searchMonth=" + searchMonth);				
		});
		//달력(monthpicker) 기본 설정
		$.monthpicker.setDefaults($.monthpicker.regional['ko']);
		var currentYear = (new Date()).getFullYear();
		console.log(currentYear);

		var options = {
			changeYear: true,
            startYear: currentYear-3,
            finalYear: currentYear,
            pattern: 'yy-mm',
            dateFormat: 'yy년 MM',
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            maxDate: 0
		};

		$('#searchMonth').monthpicker(options);
	    $('.modal_btn').on('click', function () {
	    	var id = $(this).attr("data-xxx");
	    	console.log(id);
	    	document.querySelector(".modal_wrap").style.display ='block';
	    	if(id == "modalSmell"){
	    		document.querySelector("#modalSmell").style.display ='block';
	    	} else if(id == "modalTaste"){
	    		document.querySelector("#modalTaste").style.display ='block';
	    	} else if(id == "modalChromaticity"){
	    		document.querySelector("#modalChromaticity").style.display ='block';
	    	} else if(id == "modalpH"){
	    		document.querySelector("#modalpH").style.display ='block';
	    	} else if(id == "modalTurbidity"){
	    		document.querySelector("#modalTurbidity").style.display ='block';
	    	} else if(id == "modalResidualCI"){
	    		document.querySelector("#modalResidualCI").style.display ='block';
	    	}
	    	document.querySelector('.black_bg').style.display ='block';
		});
	    
		$('.modal_close').on('click', function () {
			var id = $(this).attr("data-xxx");
	    	console.log(id);
	    	document.querySelector(".modal_wrap").style.display ='none';
	    	if(id == "modalSmell"){
	    		document.querySelector("#modalSmell").style.display ='none';
	    	} else if(id == "modalTaste"){
	    		document.querySelector("#modalTaste").style.display ='none';
	    	} else if(id == "modalChromaticity"){
	    		document.querySelector("#modalChromaticity").style.display ='none';
	    	} else if(id == "modalpH"){
	    		document.querySelector("#modalpH").style.display ='none';
	    	} else if(id == "modalTurbidity"){
	    		document.querySelector("#modalTurbidity").style.display ='none';
	    	} else if(id == "modalResidualCI"){
	    		document.querySelector("#modalResidualCI").style.display ='none';
	    	}
	    	document.querySelector('.black_bg').style.display ='none';
		});
	    
	});

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String mesg = (String) request.getAttribute("mesg");
	if (mesg != null) {
	%>
	<script type="text/javascript">
	alert('<%=mesg%>
		');
	</script>
	<%
		}
	%>

	<div>
		<p>조회 날짜 선택</p>
		<input type="text" id="searchMonth" name="searchMonth" value="">

		<form name="searchForm" id="searchForm" method="post">
			<input type="hidden" name="pMENUID" value="147" /> <input
				type="hidden" name="ATTR_1" id="ATTR_1" value="" /> <input
				type="hidden" name="ATTR_2" id="ATTR_2" value="" /> <input
				type="hidden" name="ATTR_3" id="ATTR_3" value="" />
			<div class="condition">
				<br>
				<br>
				<div>지역검색</div>
				<!-- 시도 -->
				<div style="float: left; margin-right: 10px;">
					<select name="sido" id="sido" class="W150" title="광역시도">
						<option value="">선택하세요.</option>
						<option value="11">서울특별시</option>
						<option value="26">부산광역시</option>
						<option value="27">대구광역시</option>
						<option value="28">인천광역시</option>
						<option value="29">광주광역시</option>
						<option value="30">대전광역시</option>
						<option value="31">울산광역시</option>
						<option value="36">세종특별자치시</option>
						<option value="41">경기도</option>
						<option value="42">강원도</option>
						<option value="43">충청북도</option>
						<option value="44">충청남도</option>
						<option value="45">전라북도</option>
						<option value="46">전라남도</option>
						<option value="47">경상북도</option>
						<option value="48">경상남도</option>
						<option value="50">제주특별자치도</option>
					</select>
				</div>
				<!-- 시군 -->
				<div style="float: left; margin-right: 10px;">
					<select name="sigun" id="sigun" class="W150" title="시군">
						<option value="">선택하세요.</option>
					</select>
				</div>
				<!-- 읍면동 -->
				<div style="float: left; margin-right: 10px;">
					<select name="dong" id="dong" class="W150" title="읍면동">
						<option value="">선택하세요.</option>
					</select>
				</div>
				<div id="btnDiv">
					<button id="searchBtn" title="조 회">조 회</button>
				</div>
			</div>
		</form>
	</div>
	<%
		List<MonthDTO> mList = (List<MonthDTO>) request.getAttribute("mList");
	if (mList != null) {
	%>


	<hr>
	<h3>수질정보</h3>
	<nav class="table_t">
		<ul class="board">
			<li id="boardD">검사년월</li>
			<li id="boardD">맛 <img src="images/btn_info.png" width="20"
				height="20" class="modal_btn" data-xxx="modalTaste" /></li>
			<li id="boardD">색도 <img src="images/btn_info.png" width="20"
				height="20" class="modal_btn" data-xxx="modalChromaticity" /></li>
			<li id="boardD">pH <img src="images/btn_info.png" width="20"
				height="20" class="modal_btn" data-xxx="modalpH" /></li>
			<li id="boardD">탁도 <img src="images/btn_info.png" width="20"
				height="20" class="modal_btn" data-xxx="modalTurbidity" /></li>
			<li id="boardD">잔류염소<img src="images/btn_info.png" width="20"
				height="20" class="modal_btn" data-xxx="modalResidualCI" /></li>
			<li id="boardD">일반세균<img src="images/btn_info.png" width="20"
				height="20" class="modal_btn" data-xxx="modalResidualCI" /></li>
			<li id="boardD">대장균<img src="images/btn_info.png" width="20"
				height="20" class="modal_btn" data-xxx="modalResidualCI" /></li>
			<li id="boardD">암모니아성질소<img src="images/btn_info.png"
				width="20" height="20" class="modal_btn" data-xxx="modalResidualCI" /></li>
			<li id="boardD">질산성질소<img src="images/btn_info.png" width="20"
				height="20" class="modal_btn" data-xxx="modalResidualCI" /></li>
			<li id="boardD">증발잔류물<img src="images/btn_info.png" width="20"
				height="20" class="modal_btn" data-xxx="modalResidualCI" /></li>
		</ul>
		<%
			for (int i = 0; i < mList.size(); i++) {
			MonthDTO mDTO = mList.get(i);
			String date = mDTO.getDate();
			String taste = mDTO.getTaste();
			String smell = mDTO.getSmell();
			String chromaticity = mDTO.getChromaticity();
			String pH = mDTO.getpH();
			String turbidity = mDTO.getTurbidity();
			String residualCI = mDTO.getResidualCI();
			String bacteria = mDTO.getBacteria();
			String totalColi = mDTO.getTotalColi();
			String coli = mDTO.getColi();
			String ammonia = mDTO.getAmmonia();
			String nnitrogen = mDTO.getNnitrogen();
			String evaresi = mDTO.getEvaresi();
		%>
		<ul class="board">

			<li id="boardD"><%=taste%></li>
			<li id="boardD"><%=smell%></li>
			<li id="boardD"><%=chromaticity%></li>
			<li id="boardD"><%=pH%></li>
			<li id="boardD"><%=turbidity%></li>
			<li id="boardD"><%=residualCI%></li>
			<li id="boardD"><%=bacteria%></li>
			<li id="boardD"><%=coli%></li>
			<li id="boardD"><%=ammonia%></li>
			<li id="boardD"><%=nnitrogen%></li>
			<li id="boardD"><%=evaresi%></li>
		</ul>
		<%
			} //end for

		} //end if
		%>
		<div class="black_bg"></div>
		<div class="modal_wrap">
			<div class="modal_close">
				<a href="#">close</a>
			</div>
			<div class="modal_wrap" id="modalSmell">물속에 존재하는 화학물질로 인해 발생하는
				냄새. 먹는 물에서의 냄새는 미생물에 의해 생기며, 수처리 과정에서 문제점이 생기거나 저장시설이나 파이프로부터 침출된
				물질에 의해 생길 수도 있다. 인체에 직접적인 영향은 없다.</div>
			<div class="modal_wrap" id="modalTaste">물속에 존재하는 화학물질로 인해 발생하는
				맛. 맛의 원인은 대개 무기성분으로, 철, 구리, 마그네슘, 아연 등이 원인이 된다. 인체에 직접적인 영향은 없다.</div>
			<div class="modal_wrap" id="modalChromaticity">물속에 포함된 용해성 물질 및
				콜로이드성 물질이 나타내는 황갈색 계통의 색에 적용하는 척도. 인체에 직접적인 영향은 없다.</div>
			<div class="modal_wrap" id="modalpH">용액 중에 수소이온이 얼마큼 포함되어 있는지
				나타내는 것으로 산성, 알칼리성의 정도를 나타낸다. 중성 용액의 pH는 7이며, 7보다 작으면 산성, 7보다 크면 염기성을
				띤다. 사람의 건강과 pH와의 직접적인 관계는 확인되지 않았지만, 높은 pH(산성)에 노출시 눈, 피부 등에 자극을 경험할
				수도 있다.</div>
			<div class="modal_wrap" id="modalTurbidity">물이 흐린 정도를 나타내는 지표로,
				여러 가지 부유물질에 의해 발생한다. 탁도는 건강상 직접적인 영향은 없지만, 물 소독을 방해해 질병을 유발하는 세균이
				포함될 가능성이 있다.</div>
			<div class="modal_wrap" id="modalResidualCI">물을 염소로 소독한 후, 물에
				남아있는 염소를 말한다. 살균력이 강하지만 대부분 배수관망에서 빠르게 소멸한다. 미생물의 오염을 예방하거나 소독할 수
				있으나, 물에 과량으로 존재할 때에는 염소 냄새가 강하고, 금속 등을 부식시킨다.</div>

			<div class="modal_wrap" id="modalBacteria">수중에서 활동하는 병원균 이외의
				호기성균이나 혐기성균의 총칭한다. 일반적으로 무해한 잡균으로 알려지고 있으나, 병원균이 존재할 가능성이 있다. 수돗물
				기준에서는 집락수를 1ml 속에 100 이하로 규정하고 있다.</div>
			<div class="modal_wrap" id="modalTotalColi">사람과 동물의 장내에서 기생하는
				대장균 및 대장균과 유사한 성질을 가진 균의 총칭한다. 일반적으로 무해한 잡균으로 알려지고 있으나, 병원균이 존재할
				가능성이 있다.</div>
			<div class="modal_wrap" id="modalColi">사람과 동물의 장내에서 기생하는 세균으로
				호흡과 발효작용으로 신진대사 작용을 한다. 인체위해성은 설사, 경련, 구역질, 두통 또는 기타 증상등 단기간의 영향을 줄
				수 있으며, 면역체계가 약한 사람에게는 특별한 위험을 야기할 수 있다.</div>
			<div class="modal_wrap" id="modalAmmonia">암모늄염을 질소량으로 나타낸 것으로 그
				존재는 분뇨 공장폐수로 유래한다. 이것은 물의 오염지표로서 중요할 뿐더러 수역 부영양화의 요인으로서, 또 자정작용 등에
				아질산성 질소 과잉으로 인한 장애를 평가하는 데도 중요하다.</div>
			<div class="modal_wrap" id="modalNnitrogen">암모늄염을 질소량으로 나타낸 것으로
				그 존재는 분뇨 공장폐수로 유래한다. 이것은 물의 오염지표로서 중요할 뿐더러 수역 부영양화의 요인으로서, 또 자정작용 등에
				아질산성 질소 과잉으로 인한 장애를 평가하는 데도 중요하다.</div>
			<div class="modal_wrap" id="modalEvaresi">질산염을 질소량으로 나타낸 것으로서
				주로 암모니아성 질소가 질화균의 작용으로 산화되어 생성한다. 유기물 속의 질소 화합물이 산화 분해해 무기화한 최종
				산물이며, 과거에는 유기 오염의 정도를 나타냈다. 상수도의 수질 기준에서는 10ppm이 한도로 정해져 있다.</div>
		</div>
</body>
</html>