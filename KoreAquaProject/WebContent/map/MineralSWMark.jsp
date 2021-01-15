<%@page import="com.dto.MineralSpringWaterDTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	
	MineralSpringWaterDTO dto=(MineralSpringWaterDTO)request.getAttribute("dto");
   System.out.print("받아온 dto 값은:?"+dto);
   String mnrlspNm="";
   //도로명 주소
   String rdnmadr="";
   //지명 주소
   String lnmadr="";
   //위도
   String latitude="";
   //경도
   String longtitude="";
   //지정일자
   String appnDate="";
   //일평균이용인구수
   String dayUseCn="";
   //수질검사일자
   String qltwtrInspctDate="";
   //수질검사결과구분
   String qltwtrInspctResultType="";
   //부적합항목
   String improptIem="";
   //관리기관전화번호
   String phoneNumber="";
   //관리기관명
   String institutionNm="";
   //데이터기준일자
   String referenceDate="";
   //제공기관코드
   String insttCode="";
   if(dto!=null){
      //약수터명
      mnrlspNm=dto.getMnrlspNm();
      //도로명 주소
      rdnmadr=dto.getRdnmadr();
      //지명 주소
      lnmadr=dto.getLnmadr();
      //위도
      latitude=dto.getLatitude();
      //경도
      longtitude=dto.getLongitude();
      //지정일자
      appnDate=dto.getAppnDate();
      //일평균이용인구수
      dayUseCn=dto.getDayUseCn();
      //수질검사일자
      qltwtrInspctDate=dto.getQltwtrInspctDate();
      //수질검사결과구분
      qltwtrInspctResultType=dto.getQltwtrInspctResultType();
      //부적합항목
      improptIem=dto.getImproptIem();
      //관리기관전화번호
      phoneNumber=dto.getPhoneNumber();
      //관리기관명
      institutionNm=dto.getInstitutionNm();
      //데이터기준일자
      referenceDate=dto.getReferenceDate();
      //제공기관코드
      insttCode=dto.getInsttCode();
   }
%>
    
<table>
   <tr>
      <td rowspan="3">
         <div id="map" style="width:500px;height:450px;margin-left:150px""></div>
      <div>
      <br>
         <h3>수질정보</h3>
         <form name="searchForm" id="searchForm" method="post">
         <input type="hidden" name="pMENUID" value="147" /> <input
            type="hidden" name="ATTR_1" id="ATTR_1" value="" /> <input
            type="hidden" name="ATTR_2" id="ATTR_2" value="" /> <input
            type="hidden" name="ATTR_3" id="ATTR_3" value="" />
         <div class="condition">
            <br><div>지역검색</div>
            <!-- 시도 -->
            <div style="float:left; margin-right:10px; margin-bottom:10px" >
            <select name="doNm" id="doNm" class="W150" title="광역시도">
               <option value="">선택하세요.</option>
               <option value="서울특별시">서울특별시</option>
               <option value="부산광역시">부산광역시</option>
               <option value="대구광역시">대구광역시</option>
               <option value="인천광역시">인천광역시</option>
               <option value="광주광역시">광주광역시</option>
               <option value="대전광역시">대전광역시</option>
               <option value="울산광역시">울산광역시</option>
               <option value="세종특별자치시">세종특별자치시</option>
               <option value="경기도">경기도</option>
               <option value="강원도">강원도</option>
               <option value="충청북도">충청북도</option>
               <option value="충청남도">충청남도</option>
               <option value="전라북도">전라북도</option>
               <option value="전라남도">전라남도</option>
               <option value="경상북도">경상북도</option>
               <option value="경상남도">경상남도</option>
               <option value="제주특별자치도">제주특별자치도</option>
            </select>
            </div>
            <!-- 시군 -->
            <div style="float: left; margin-right:10px;">
            <select name="siGuNm" id="siGuNm" class="W150" title="시군">
               <option value="">선택하세요.</option>
            </select>
            </div>
            <!-- 약수터 -->
            <div style="float: left; margin-right:10px;">
            <select name="mnrlspNmS" id="mnrlspNmS" class="W150" title="약수터이름">
               <option value="">선택하세요.</option>
            </select>
            <input type="text" id="mnrlspNm" name="mnrlspNm" style="width:45%; text-align:center;">
            <div id="btnDiv" style="float:right; margin-left:10px;"><button id="searchBtn" title="조 회">조 회</button></div>
            </div>
            </div>
            </form>
         </div>
      
         <nav class="table_t">
         
         <ul class="board">
         <li id="boardD">약수터명</li>
         <li id="boardD">이용 인구수<br>(일 기준)</li>
         <li id="boardD">수질검사일자</li>
         <li id="boardD">수질검사결과 </li>
         <li id="boardD">부적합항목 </li>
         <li id="boardD">관리기관명</li>
         <li id="boardD">기준 일자</li>
         </ul>
         <ul class="board">
         <li id="boardD"><%=mnrlspNm %></li>
         <li id="boardD"><%=dayUseCn %></li>
         <li id="boardD"><%=qltwtrInspctDate %></li>
         <li id="boardD"><%=qltwtrInspctResultType %></li>
         <li id="boardD"><%= improptIem%></li>
         <li id="boardD"><%=institutionNm %></li>
         <li id="boardD"><%=referenceDate %></li>
         </ul>   
         </nav>
      
      </td>
   </tr>
      
</table>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=71d27f8c1b01c15ea6c3c1cb51315cad&libraries=clusterer"></script>
<script>
    var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
        level : 14 // 지도의 확대 레벨 
    });
    
    // 마커 클러스터러를 생성합니다 
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 10 // 클러스터 할 최소 지도 레벨 
    });
 
    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
   $.get("data/springwater.json", function(data) {
        console.log(data)
         if(typeof data !="object"){
            data=JSON.parse(data); }; 
         console.log(data);
        var markers = $(data.records).map(function(i, position) {
            return new kakao.maps.Marker({
                position : new kakao.maps.LatLng(position.위도, position.경도),
               
            });
        });
        clusterer.addMarkers(markers);
        
        

        // 클러스터러에 마커들을 추가합니다
       console.log(markers)
       console.log(markers.prevObject[1].약수터명)
       console.log(markers.length)
        
      for (var i = 0; i < markers.length; i ++) {
 
 

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="padding:5px;"><a href="MSWServlet?mnrlspNm='+markers.prevObject[i].약수터명+'" style="color:blue" target="_blank">'+markers.prevObject[i].약수터명+'</a> <a href="https://map.kakao.com/link/to/'+markers.prevObject[i].약수터명+','+markers.prevObject[i].위도+','+markers.prevObject[i].경도+'" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표시할 내용
        removable : true
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(markers[i], 'click', makeOverListener(map, markers[i], infowindow));
   
   }
     
      
    });
    function makeOverListener(map, marker, infowindow) {
       return function() {
           infowindow.open(map, marker);
            $("#mnrlspNm").text("약수터명");
            $("#latitude").text("위도 값");
            $("#longtitude").text("경도 값");
       };
   }

   // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
   function makeOutListener(infowindow) {
       return function() {
           infowindow.close();
       };
   }
   
   //시도 변경에 따른 시군 세팅
   $("#doNm").on("change", function() {
      var innerHtml="";
      $.ajax({
         type: "get",
         url: "SiGuNmServlet",
         dataType: "text",
         //contentType: "application/x-www-form-urlencoded; charset=UTF-8",
         data:{
            doNm : $("#doNm option:selected").text()
         },
         success: function (data, status, xhr) {
            var data = decodeURIComponent(data);
                              
            var data = data.replace("[","");
            data = data.replace("]","");
            console.log(data);
            
            var listdata = data.split(',');
            $("#siGuNm").children("option").remove();
            $("#siGuNm").append("<option value= ''>"+"선택하세요."+"</option>");
               for(var i in listdata){
                  //innerHtml+=   "<option value= '"+listdata[i]+"'>"+listdata[i]+"</option>";
                  $("#siGuNm").append("<option value= '" + listdata[i] + "'>" + listdata[i] + "</option>");
            }   
         },
         error: function(xhr, status, e) {
            console.log(e);
         }
      });
      console.log($("#siGuNm").val());
   });

   //시군 변경에 따른 읍면동 세팅
     $("#siGuNm").on("change", function() {
      
      $.ajax({
         type: "get",
         url: "MnrlspNmServlet",
         dataType: "text",
         //contentType: "application/x-www-form-urlencoded; charset=UTF-8",
         data:{
            siGuNm : $("#siGuNm option:selected").val()
         },
         success: function (data, status, xhr) {
            //var data = decodeURIComponent(data);
            var data = data.replace("[","");
            data = data.replace("]","");
            console.log(data);
            
            var listdata = data.split(',');
            $("#mnrlspNmS").children("option").remove();
            $("#mnrlspNmS").append("<option value= ''>" + "선택하세요." + "</option>");
            
            for(var i in listdata){                                                                                                                                 
            $("#mnrlspNmS").append("<option value= '" + listdata[i] + "'>" + listdata[i] + "</option>");
            //console.log(data);
            }
            
         },
         error: function(xhr, status, e) {
            console.log(e);
         }
      });
      console.log($("#mnrlspNm").val());
   });
   
     $("#mnrlspNmS").on("change", function() {
        var mnrlspNmS = $("#mnrlspNmS option:selected").val().trim();
      $("#mnrlspNm").val(mnrlspNmS);  
     });
   //조회 버튼 클릭 시 시도, 시군, 동 값 유효성 검사 후 DayDataServlet으로 이동
   $("#searchBtn").on("click", function () {
      
      var mnrlspNm=$("#mnrlspNm").val();  
      
      $("form").attr("action", "MSWServlet?mnrlspNm="+mnrlspNm);            
   });
</script>
</body>
</html>