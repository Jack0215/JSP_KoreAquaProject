<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dto.JusoDTO"%>
<%@ page import="com.dto.DayDTO"%>
<%@ page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style type="text/css">
	.modal_wrap {
		display: none;
		width: 300px;
		height: 250px;
		position: fixed;
		top: 50%;
		left: 50%;
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
	ul li {list-style:none; }

	.fl {float:left; }
	.tc {text-align:center; }
	.table_t {
				text-align: center;
				margin:0;
				padding:0;
                width: 100%;
                display: table;
                border-collapse: collapse;
                table-layout:fixed;
                border: none;
            }
            .table_t .board {
                display: table-row;
            }
            .table_t #boardD  {
                display: table-cell;
                text-align:center;
                padding: 5px 0;
                 
                /*아래는 메뉴 영역을 구분하기 위한 옵션입니다.*/
                border-top:1px solid #69c;
                border-bottom:1px solid #69c;
            }
            /*아래는 메뉴 영역을 구분하기 위한 옵션입니다.*/
            .boardD+.boardD{border-left:1px solid #69c}
	
	input{
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
	h3{
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
							$("#sigun").append("<option value= '" + listdata[i] + "'>" + listdata[i] + "</option>");
					}	
				},
				error: function(xhr, status, e) {
					console.log(e);
				}
			});
			console.log($("#sigun").val());
		});

		//시군 변경에 따른 읍면동 세팅
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
					$("#dong").append("<option value= ''>" + "선택하세요." + "</option>");
					
					for(var i in listdata){	                                                                                                                              
					$("#dong").append("<option value= '" + listdata[i] + "'>" + listdata[i] + "</option>");
					//console.log(data);
					}
				},
				error: function(xhr, status, e) {
					console.log(e);
				}
			});
			console.log($("#dong").val());
		});
		
		//조회 버튼 클릭 시 시도, 시군, 동 값 유효성 검사 후 DayDataServlet으로 이동
		$("#searchBtn").on("click", function () {
			var sido = $("#sido option:selected").text();
			var sigun = $("#sigun option:selected").val().trim();
			var dong = $("#dong option:selected").val().trim();
			
			if($("#stdt").text() == " " || $("#eddt").text() == " ") {
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
			
			var stdt = $("#stdt").datepicker().val();
			var eddt = $("#eddt").datepicker().val();

			console.log(stdt);
			console.log(eddt);
			$("form").attr("action", "DayDataServlet?sigun=" + sigun + "&dong=" + dong
					+ "&stdt=" + stdt + "&eddt=" + eddt);				
		});
			
		//달력(datepicker) 기본 설정
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		
		//시작일
		$("#stdt").datepicker({
	    	changeMonth: true, 
            changeYear: true,
            yearRange: 'c-5',
            nextText: '다음 달',
            prevText: '이전 달',
            showMonthAfterYear: true,
            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dateFormat: "yy-mm-dd",
            maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
            onClose: function(selectedDate) {    
                 //시작일(startDate) datepicker가 닫힐때
                 //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#eddt").datepicker("option", "minDate", selectedDate);
            }
	    });
	    //종료일
	    $("#eddt").datepicker({
	    	changeMonth: true,//월을 바꿀 수 있는 select box 표시
            changeYear: true,//년도를 바꿀 수 있는 select box 표시
            yearRange: 'c-5',//현재 년도를 기준, 년도 select box의 범위
            nextText: '다음 달',//next 아이콘의 툴팁
            prevText: '이전 달',//prev 아이콘의 툴팁
            showMonthAfterYear: true,// 월,년순의 셀렉트 박스를 년,월 순으로 바꿔줌
            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],//표시할 요일 이름 설정
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],//요일의 한글 형식
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],//월의 한글 형식
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],//표시할 월 이름 설정
            dateFormat: "yy-mm-dd",//텍스트필드에 입력되는 날짜 형식
            maxDate: 0,//선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
            onClose: function(selectedDate) {    
                // 종료일(endDate) datepicker가 닫힐때
                // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                $("#stdt").datepicker("option", "maxDate", selectedDate);
            }
	    });
	    
	 
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
	String mesg = (String)request.getAttribute("mesg");
	if(mesg != null) {
%>
	<script type="text/javascript">
	alert('<%= mesg %>');
	</script>
	<%
	}
%>
	<div>
		<p>조회 날짜 선택</p>
		
		<div style="float:left; margin-right:10px;" >  시작일 <input type="text" id="stdt"> </div>
		<div style="float: left;">  종료일 <input type="text" id="eddt"></div><br>
		
		<form name="searchForm" id="searchForm" method="post">
			<input type="hidden" name="pMENUID" value="147" /> 
			<input type="hidden" name="ATTR_1" id="ATTR_1" value="" /> 
			<input type="hidden" name="ATTR_2" id="ATTR_2" value="" /> 
			<input type="hidden" name="ATTR_3" id="ATTR_3" value="" />
			<div class="condition">
				<br><br><div>지역검색</div>
				<!-- 시도 -->
				<div style="float:left; margin-right:10px;" >
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
				<div style="float: left; margin-right:10px;">
				<select name="sigun" id="sigun" class="W150" title="시군">
					<option value="">선택하세요.</option>
				</select>
				</div>
				<!-- 읍면동 -->
				<div style="float: left; margin-right:10px;  ">
				<select name="dong" id="dong" class="W150" title="읍면동">
					<option value="">선택하세요.</option>
				</select>
				</div>
				<div id="btnDiv"><button id="searchBtn" title="조 회">조 회</button></div>
			</div>
		</form>
	</div>
	<%
	List<DayDTO> dList = (List<DayDTO>)request.getAttribute("dList");
	if(dList != null){
%>
	<br>
	<hr>
	<h3>수질정보</h3>
	<nav class="table_t">
	<ul class="board">
			<li id="boardD" >검사년월</li>
			<li id="boardD" >냄새 <img src="images/btn_info.png" width="20" height="20" class="modal_btn" data-xxx="modalSmell"/></li>
			<li id="boardD" >맛 <img src="images/btn_info.png" width="20" height="20" class="modal_btn" data-xxx="modalTaste"/></li>
			<li id="boardD" >색도 <img src="images/btn_info.png" width="20" height="20" class="modal_btn" data-xxx="modalChromaticity"/></li>
			<li id="boardD" >pH <img src="images/btn_info.png" width="20" height="20" class="modal_btn" data-xxx="modalpH"/></li>
			<li id="boardD" >탁도 <img src="images/btn_info.png" width="20"	height="20" class="modal_btn" data-xxx="modalTurbidity"/></li>
			<li id="boardD" >잔류염소<img src="images/btn_info.png" width="20" height="20" class="modal_btn" data-xxx="modalResidualCI"/></li>
	</ul>
		<%
		for(int i = 0; i < dList.size(); i++){
			DayDTO dDTO = dList.get(i);
			String date = dDTO.getDate();
			String taste = dDTO.getTaste();
			String smell = dDTO.getSmell();
			String chromaticity = dDTO.getChromaticity();
			String pH = dDTO.getpH();
			String turbidity = dDTO.getTurbidity();
			String residualCI = dDTO.getResidualCI();
%>
		<ul class="board">
			<li id="boardD" ><%= date %></li>
			<li id="boardD" ><%= taste %></li>
			<li id="boardD" ><%= smell %></li>
			<li id="boardD" ><%= chromaticity %></li>
			<li id="boardD" ><%= pH %></li>
			<li id="boardD" ><%= turbidity %></li>
			<li id="boardD" ><%= residualCI %></li>
		</ul>
		<%
		}//end for

	}//end if
%></nav>
	<div class="black_bg"></div>
	<div class="modal_wrap">
		<div class="modal_close">
			<a href="#">close</a>
		</div>
		<div class="modal_wrap" id="modalSmell">물속에 존재하는 화학물질로 인해 발생하는 냄새. 먹는 물에서의 냄새는 미생물에
			의해 생기며, 수처리 과정에서 문제점이 생기거나 저장시설이나 파이프로부터 침출된 물질에 의해 생길 수도 있다. 인체에
			직접적인 영향은 없다.</div>
		<div class="modal_wrap" id="modalTaste">물속에 존재하는 화학물질로 인해 발생하는 맛. 맛의 원인은 대개 무기성분으로,
			철, 구리, 마그네슘, 아연 등이 원인이 된다. 인체에 직접적인 영향은 없다.</div>
		<div class="modal_wrap" id="modalChromaticity">물속에 포함된 용해성 물질 및 콜로이드성 물질이 나타내는 황갈색
			계통의 색에 적용하는 척도. 인체에 직접적인 영향은 없다.</div>
		<div class="modal_wrap" id="modalpH">용액 중에 수소이온이 얼마큼 포함되어 있는지 나타내는 것으로 산성, 알칼리성의
			정도를 나타낸다. 중성 용액의 pH는 7이며, 7보다 작으면 산성, 7보다 크면 염기성을 띤다. 사람의 건강과 pH와의
			직접적인 관계는 확인되지 않았지만, 높은 pH(산성)에 노출시 눈, 피부 등에 자극을 경험할 수도 있다.</div>
		<div class="modal_wrap" id="modalTurbidity">물이 흐린 정도를 나타내는 지표로, 여러 가지 부유물질에 의해
			발생한다. 탁도는 건강상 직접적인 영향은 없지만, 물 소독을 방해해 질병을 유발하는 세균이 포함될 가능성이 있다.</div>
		<div class="modal_wrap" id="modalResidualCI">물을 염소로 소독한 후, 물에 남아있는 염소를 말한다. 살균력이
			강하지만 대부분 배수관망에서 빠르게 소멸한다. 미생물의 오염을 예방하거나 소독할 수 있으나, 물에 과량으로 존재할 때에는
			염소 냄새가 강하고, 금속 등을 부식시킨다.</div>
	</div>
	
</body>
</html>
