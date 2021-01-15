<%@page import="com.dto.BeachDTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
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
	

	
	/* 공통옵션 */
	ul li {list-style:none; }

	.fl {float:left; }
	.tc {text-align:center; }
	.table_t {
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
</head>
<body>
<%
String sidoNm=""; //시도명
String gugunNm=""; //구군명
String staNm=""; //정점명
String resNum=""; //조사차수
String resLoc=""; //조사지점
String res1=""; //대장균
String res2=""; //장구균
String resYn=""; //적합여부
String resYear=""; // 검사년도
String resDate=""; //검사일자
String resKnd="";//검사종류
String resLocDetail=""; //조사지점 설명
String lat=""; //위도
String lon=""; //경도
String loc=""; //위치보기

	if(request.getAttribute("staNm")!=null){
	String staNmC=(String)request.getAttribute("staNm");
	BeachDTO beach1=(BeachDTO)session.getAttribute(staNmC);
 sidoNm=beach1.getSidoNm(); //시도명
 gugunNm=beach1.getGugunNm(); //구군명
 staNm=beach1.getStaNm()+" 해수욕장"; //정점명
 resNum=beach1.getResNum(); //조사차수
 resLoc=beach1.getResLoc(); //조사지점
 res1=beach1.getRes1(); //대장균
 res2=beach1.getRes2(); //장구균
 resYn=beach1.getResYn(); //적합여부
 resYear=beach1.getResYear(); // 검사년도
 resDate=beach1.getResDate(); //검사일자
 resKnd=beach1.getResKnd();//검사종류
 resLocDetail=beach1.getResLocDetail(); //조사지점 설명
 lat=beach1.getLat(); //위도
 lon=beach1.getLon(); //경도
 loc=" 위치보기";
}
%>
	<table>
	<tr>
	<td rowspan="3">
		<div id="map" style="width:500px;height:450px;margin-left:150px""></div>
		<div>
		<br>
			<h3>해수욕장수질 정보</h3>
			<form name="searchForm" id="searchForm" method="post">
			<input type="hidden" name="pMENUID" value="147" /> <input
				type="hidden" name="ATTR_1" id="ATTR_1" value="" /> <input
				type="hidden" name="ATTR_2" id="ATTR_2" value="" /> <input
				type="hidden" name="ATTR_3" id="ATTR_3" value="" />
			<div class="condition">
			<br><div>지역검색</div>
				<!-- 시도 -->
		<div style="float:left; margin-right:10px; margin-bottom:10px" >
		<select id="sidoNm" class="W150">
		<option value="" selected disabled hidden>도를 선택해주세요</option>
		<option name="sidoNm" value="강원">강원</option>
		<option name="sidoNm" value="경남">경남</option>
		<option name="sidoNm" value="경북">경북</option>
		<option name="sidoNm" value="부산">부산</option>
		<option name="sidoNm" value="울산">울산</option>
		<option name="sidoNm" value="인천">인천</option>
		<option name="sidoNm" value="전남">전남</option>
		<option name="sidoNm" value="전북">전북</option>
		<option name="sidoNm" value="제주">제주</option>
		<option name="sidoNm" value="충남">충남</option>
		</select>
		</div>

		<input type="text" id="staNm" name="staNm" style="width:45%; text-align:center;">
		<div id="btnDiv" style="float:right; margin-left:10px;"><button id="searchBtn" title="조 회">조 회</button></div>
		</form>
		</div>

			<nav class="table_t">
			
			<ul class="board">
			<li id="boardD">시도명</li>
			<li id="boardD">정점명<br></li>
			<li id="boardD">대장균</li>
			<li id="boardD">장구균 </li>
			<li id="boardD">적합여부</li>
			<li id="boardD">검사년도</li>
			<li id="boardD">길찾기</li>
			</ul>
			<ul class="board">
			<li id="boardD"><%=sidoNm %></li>
			<li id="boardD"><%=staNm %></li>
			<li id="boardD"><%=res1 %></li>
			<li id="boardD"><%=res2 %></li>
			<li id="boardD"><%= resYn%></li>
			<li id="boardD"><%=resYear%></li>
			<li id="boardD"><a href="https://map.kakao.com/link/to/<%= staNm %>,<%=lat %>,<%=lon %>" style="color:blue" target="_blank"><%=staNm %><%=loc %></a></li>
			</ul>	
			</nav>
		</td>
	</tr>
	<tr>
	<td>
		<div id="staNm"></div>	
	</td>
	</tr>
</table>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=71d27f8c1b01c15ea6c3c1cb51315cad"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
	var markers = [];
	// 마커를 생성하고 지도위에 표시하는 함수입니다

    var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
        level : 14 // 지도의 확대 레벨 
    });
$("#sidoNm").on("change", function() {
	console.log($("#sidoNm").val());
	$.ajax({
		type : "GET",
		data : {
			sidoNm : $("#sidoNm").val()
		},
		url : 'BeachServlet',
		dataType : 'json',
		success : function(data) {
				var s= "";
				$("#staNm").empty();
			
				console.log("data => " + data);
				var lat;
				var lon;
			for(var i =0; i<data.length; i++){
				lat=data[0].lat;
				lon=data[0].lon
			}
			changeMapLoc(lat,lon);
			for(var i =0; i<data.length; i++){
				addMarker(new kakao.maps.LatLng(data[i].lat, data[i].lon),data[i].staNm,data[i].lat, data[i].lon,data[0].lat,data[0].lon); //
				s = "<br><li href='#' name=gugunNm>"+data[i].staNm+"&nbsp&nbsp&nbsp"+data[i].resNum+"&nbsp&nbsp&nbsp"+data[i].resLoc+"&nbsp&nbsp&nbsp"+data[i].resYn+"&nbsp&nbsp&nbsp"+data[i].resDate;
				console.log(data[i].staNm);
				console.log(data[i])
//				$("#staNm").append(s);
			
			}

			
			 // 지도에 표시된 마커 객체를 가지고 있을 배열입니다
			},
			error : (xhr, status, data)=>{
				console.log("error");
			}
});
});



	function changeMapLoc(lat,lon){
			map=new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	        center : new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표 
	        level : 11 // 지도의 확대 레벨 
	    });
		 setMarkers(map);   
	}	
	 // 지도에 표시된 마커 객체를 가지고 있을 배열입니다

	function addMarker(position,staNm,lat,lng,lat0,lon0) {

	    var marker = new kakao.maps.Marker({
	        position: position
	    });

 	    // 마커가 지도 위에 표시되도록 설정합니다
	    marker.setMap(map);
	    // 생성된 마커를 배열에 추가합니다
	    markers.push(marker); 
		console.log("클릭이벤트적용할 marker값들"+marker);
	/* 	var map=new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	        center : new kakao.maps.LatLng(lat0, lon0), // 지도의 중심좌표 
	        level : 11 // 지도의 확대 레벨 
	   
	    }); */
		
		 setMarkers(map);  
		 
			console.log("marker갯수:"+markers.length);
			for (var n = 0; n < markers.length; n ++) {
			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: '<div style="padding:5px;"><a href="BeachInfoServlet?staNm='+staNm+'" style="color:blue" target="_blank">'+staNm+' 해수욕장</a> <a href="https://map.kakao.com/link/to/'+staNm+','+lat+','+lng+'" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표시할 내용
			        removable : true
			    });
				kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));
				
		};

		
	}	
	
		
	  function makeClickListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    	console.log("click이벤트 실행중");
		    };
		}

	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	    }            
	}
	
	

/* 	// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
	function showMarkers() {
	    setMarkers(map)    
	}

	// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
	function hideMarkers() {
	    setMarkers(null);    
	}
	
var imageSrc = 'https://blogfiles.pstatic.net/MjAyMDExMDZfMjA1/MDAxNjA0NjQ4NDg4NTQ2.Ca2pYYRwKiBt_Wl6IUu8mcGhBmaaFB7C9mWp4Y-vry8g.YymanuMYm5v-CL0GURmuIgubH2xQnSrFKCUVEWbGDcIg.PNG.make100min2022/914688d4482c428ab8dadc36ba0a970b.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다 */
 
// 마커를 생성합니다
/* var marker = new kakao.maps.Marker({
    position: markerPosition, 
     image: markerImage // 마커이미지 설정
});  
 
 // 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);   */ 
	
	//조회 버튼 클릭 시 시도, 시군, 동 값 유효성 검사 후 DayDataServlet으로 이동
	$("#searchBtn").on("click", function () {
		
		var mnrlspNm = $("#mnrlspNm option:selected").val().trim();
		
		
		$("form").attr("action", "MSWServlet?mnrlspNm="+mnrlspNm);				
	});
</script>
</body>
</html>