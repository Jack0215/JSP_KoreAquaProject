<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dto.JusoDTO" %>
<%@ page import="java.util.List" %>
<%@page import="com.dto.WeekDTO"%>
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
	//var sigun = $("#sigun").val($("#sigun option:selected").val());
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
		
			$("#searchBtn").on("click", function () {
				var sido = $("#sido option:selected").text;
				var sigun = $("#sigun option:selected").val().trim();
				var dong = $("#dong option:selected").val().trim();
				var stdt = $("#stdt").datepicker().val();
				var eddt = $("#eddt").datepicker().val();
				if(stdt == "" || eddt== ""){
					 alert("검색할 날짜를 선택하세요.");
					return false;
				 }
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
				console.log(dong);
				
				 
				$("form").attr("action", "WeekDataServlet?sigun=" + sigun + "&dong=" + dong+"&stdt="+stdt+"&eddt="+eddt);
				//return false;
				
				$.ajax({
					type: "get",
					url: "WeekDatsServlet",
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
		
		//달력 기본 설정
		$.datepicker.setDefaults($.datepicker.regional['kr']);
		
		 $("#stdt").datepicker({
		        changeMonth:true,
		        changeYear:true,
		        yearRange:'c-5',
		        nextText:'다음 달',
		        prevText:'이전 달',
		        showMonthAfterYear: true,
		        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],	        
		        dayNamesMin:["일","월","화","수","목","금","토"],
		        monthNameShort:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		        monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		        dateFormat:'yy-mm-dd',
		        maxDate:-1,
		        
		        onClose:function(selectDate){
		            $("#eddt").datepicker("option","minDate",selectDate);
		        }
		 
		 
		    });
		 $("#eddt").datepicker({
		        changeMonth:true,
		        changeYear:true,
		        yearRange:'c-5',
		        nextText:'다음 달',
		        prevText:'이전 달',
		        showMonthAfterYear: true,
		        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],	        
		        dayNamesMin:["일","월","화","수","목","금","토"],
		        monthNameShort:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		        monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		        dateFormat:'yy-mm-dd',
		        maxDate:-1,
		        
		        onClose:function(selectDate){
		            $("#stdt").datepicker("option","maxDate",selectDate);
		        }
		    });
		 
		    
		 $('.modal_btn').on('click', function () {
		    	var id = $(this).attr("data-xxx");
		    	console.log(id);
		    	document.querySelector(".modal_wrap").style.display ='block';
		    	if(id == "modalBacteria"){
		    		document.querySelector("#modalBacteria").style.display ='block';
		    	} else if(id == "modalTotalColi"){
		    		document.querySelector("#modalTotalColi").style.display ='block';
		    	} else if(id == "modalColi"){
		    		document.querySelector("#modalColi").style.display ='block';
		    	} else if(id == "modalAmmonia"){
		    		document.querySelector("#modalAmmonia").style.display ='block';
		    	} else if(id == "modalNnitrogen"){
		    		document.querySelector("#modalNnitrogen").style.display ='block';
		    	} else if(id == "modalEvaresi"){
		    		document.querySelector("#modalEvaresi").style.display ='block';
		    	}
		    	document.querySelector('.black_bg').style.display ='block';
			});
		    
			$('.modal_close').on('click', function () {
				var id = $(this).attr("data-xxx");
		    	console.log(id);
		    	document.querySelector(".modal_wrap").style.display ='none';
		    	if(id == "modalBacteria"){
		    		document.querySelector("#modalBacteria").style.display ='none';
		    	} else if(id == "modalTotalColi"){
		    		document.querySelector("#modalTotalColi").style.display ='none';
		    	} else if(id == "modalColi"){
		    		document.querySelector("#modalColi").style.display ='none';
		    	} else if(id == "modalAmmonia"){
		    		document.querySelector("#modalAmmonia").style.display ='none';
		    	} else if(id == "modalNnitrogen"){
		    		document.querySelector("#modalNnitrogen").style.display ='none';
		    	} else if(id == "modalEvaresi"){
		    		document.querySelector("#modalEvaresi").style.display ='none';
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
String mesg =(String)request.getAttribute("mesg");
System.out.println(mesg);
if(mesg != null){
%>
<script type="text/javascript">
alert('<%=mesg%>' 
		);
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
	List<WeekDTO> wList = (List<WeekDTO>)request.getAttribute("wList");
	if(wList != null){
%>
<br>
<hr>
<h3>수질정보</h3>
<nav class="table_t">
<ul class="board">
		<li id="boardD">측정일</li>
		<li id="boardD">일반 세균<img src="images/btn_info.png" width="20" height="20"	 class="modal_btn" data-xxx="modalBacteria"></li>
		<li id="boardD">총 대장균<img src="images/btn_info.png" width="20" height="20" class="modal_btn" data-xxx="modalTotalColi"></li>
		<li id="boardD">대장균<img src="images/btn_info.png" width="20" height="20" class="modal_btn" data-xxx="modalColi"></li>
		<li id="boardD">암모니아성질소<img src="images/btn_info.png" width="20" height="20" class="modal_btn" data-xxx="modalAmmonia"></li>
		<li id="boardD">질산성질소<img src="images/btn_info.png" width="20" height="20" class="modal_btn" data-xxx="modalNnitrogen"></li>
		<li id="boardD">증발잔류물<img src="images/btn_info.png" width="20" height="20" class="modal_btn" data-xxx="modalEvaresi"></li>
	</ul>
<%
		for(int i = 0; i < wList.size(); i++){
			WeekDTO wDTO = wList.get(i);
			String cltdt = wDTO.getCltdt();
			String bacteria = wDTO.getAmmonia();
			String TotalColita = wDTO.getTotalColi();
			String Coli = wDTO.getColi();
			String Ammonia = wDTO.getAmmonia();
			String Nnitrogen = wDTO.getNnitrogen();
			String Evaresi = wDTO.getEvaresi();
%>
	<ul class="board">
		<li id="boardD"><%= cltdt %></li>
		<li id="boardD"><%= bacteria %></li>
		<li id="boardD"><%= TotalColita %></li>
		<li id="boardD"><%= Coli %></li>
		<li id="boardD"><%= Ammonia %></li>
		<li id="boardD"><%= Nnitrogen %></li>
		<li id="boardD"><%= Evaresi %></li>
	</ul>
<%
		}//end for
%>

<%	
	}//end if
%>
</nav>
<div class="black_bg"></div>
	<div class="modal_wrap">
		<div class="modal_close">
			<a href="#">close</a>
		</div>
		<div class="modal_wrap" id="modalBacteria">수중에서 활동하는 병원균 이외의 호기성균이나 혐기성균의 총칭한다. 일반적으로 무해한 잡균으로 알려지고 있으나, 
		병원균이 존재할 가능성이 있다. 수돗물 기준에서는 집락수를 1ml 속에 100 이하로 규정하고 있다.</div>
		<div class="modal_wrap" id="modalTotalColi">사람과 동물의 장내에서 기생하는 대장균 및 대장균과 유사한 성질을 가진 균의 총칭한다.  
		일반적으로 무해한 잡균으로 알려지고 있으나, 병원균이 존재할 가능성이 있다.</div>
		<div class="modal_wrap" id="modalColi">사람과 동물의 장내에서 기생하는 세균으로 호흡과 발효작용으로 신진대사 작용을 한다. 인체위해성은 
		설사, 경련, 구역질, 두통 또는 기타 증상등 단기간의 영향을 줄 수 있으며, 면역체계가 약한 사람에게는 특별한 위험을 야기할 수 있다.</div>
		<div class="modal_wrap" id="modalAmmonia">암모늄염을 질소량으로 나타낸 것으로 그 존재는 분뇨 공장폐수로 유래한다. 이것은 물의 오염지표로서 중요할 뿐더러 수역 부영양화의 요인으로서, 
		또 자정작용 등에 아질산성 질소 과잉으로 인한 장애를 평가하는 데도 중요하다.</div>
		<div class="modal_wrap" id="modalNnitrogen">암모늄염을 질소량으로 나타낸 것으로 그 존재는 분뇨 공장폐수로 유래한다. 이것은 물의 오염지표로서 중요할 뿐더러 
		수역 부영양화의 요인으로서, 또 자정작용 등에 아질산성 질소 과잉으로 인한 장애를 평가하는 데도 중요하다.</div>
		<div class="modal_wrap" id="modalEvaresi">질산염을 질소량으로 나타낸 것으로서 주로 암모니아성 질소가 질화균의 작용으로 산화되어 생성한다.  유기물 속의 
		질소 화합물이 산화 분해해 무기화한 최종 산물이며, 과거에는 유기 오염의 정도를 나타냈다. 상수도의 수질 기준에서는 10ppm이 한도로 정해져 있다.</div>
	</div>
</body>
</html>