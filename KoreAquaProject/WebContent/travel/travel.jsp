<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dto.TravelDTO"%>
<%@page import="com.dto.TravelPage"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Inner Page - Bethany Bootstrap Template</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="../common/header.jsp" flush="ture"></jsp:include>
	<main class="main">
		<section class="breadcrumbs">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center">
					<h2></h2>
					<ol>
						<li><a href="index.jsp">Home</a></li>
						<li>Inner Page</li>
					</ol>
				</div>

			</div>
		</section>
		<section class="inner-page" style="width: 90%; text-align: center;">
			<div class="content" style="width: 50%; float: left;">
				<%
					TravelPage pDTO = (TravelPage) request.getAttribute("course"); 
				List<TravelDTO> list = pDTO.getList();
				int curPage = pDTO.getCurPage(); // curPage 현재 페이지 번호
				int perPage = pDTO.getPerPage(); // perPage 1페이지당 게시물 수 (4개)
				int PageBlock = 10;//한 화면에 보여줄 페이지 번호 수(10개 페이지)
				int totalCount = pDTO.getTotalCount(); // totalCount 전체 게시물 수
				int totalPage = totalCount / perPage;
				if (totalCount % perPage != 0)
					totalPage++;
				int EndNo = perPage * curPage;
				int StartNo = EndNo - perPage;
				int PrevBlock = (int) Math.floor((curPage - 1) / PageBlock) * PageBlock;
				int NextBlock = PrevBlock + PageBlock + 1;
				%>
				<div id="div_top3" style="margin-left: 50%; margin-top:50px;">  
					강을 위주로 한 여행코스를 소개합니다. <br><br>
					<span>권역을 선택하시면 추천 여행코스를 보실 수 있습니다.</span>
				</div>
				<div id="div_map" style="width: 70%; text-align: center;">  
					<div id="div_map2" style="margin-left: 90%; margin-top: 5%;"> 
						<img src="images/map/비활성화.JPG" id="map" usemap="#map01" style="border:2px solid #eeeeee">
						<map name="map01" id="map01">   
							<area shape="rect" coords="215,110,140,75" alt="한강권역"
								href="CourseServlet?course=ha&word=ha"></area>
							<area shape="rect" coords="93,213,167,242" alt="금강권역"
								href="CourseServlet?course=gu&word=gu" /></area>
							<area shape="rect" coords="200,225,287,253" alt="낙동강권역"
								href="CourseServlet?course=nd&word=nd" /></area>
							<area shape="rect" coords="35,335,123,370" alt="영산강권역"
								href="CourseServlet?course=ys&word=ys" /></area>
							<area shape="rect" coords="95,305,185,335" alt="섬진강권역"
								href="CourseServlet?course=sj&word=sj" /></area>
						</map>
					</div>
				</div>

			</div>
			<!-- end content -->
			<div id="div_con" style="width: 40%; float: right; margin-right: 10%; text-align: left;"> 
				<div id="div_con2" style="margin-left:50px; font-size:36px; color:#aaaaaa; ">추천코스</div>
				<%
					for (int i = 1; i <= list.size(); i++) {
					TravelDTO dto = list.get(i - 1);
					String rImage = dto.getrImage();
					String title = dto.getTitle();
					String intro = dto.getIntro();
					String course = dto.getCourse();
				%>
				<ul style="padding-top:15px; padding-bottom:15px; list-style: none; overflow:hidden;">   
					<%
						if (rImage != null) { 
					%>
					<li id=title style="margin-bottom:10px; overflow:hidden"><img src="images/ha/<%=rImage%>.JPG" border="0"
						align="left" width="200" height="100" style="margin-right:10px; margin-bottom:10px;"> <h5 style="color:#0569b4; overflow:hidden;"><%=title%></h5><br><%=course%></li> 
				</ul>    
				<%  
					}//end if(rImage) 
				%>
				<%
					if (i % 4 == 0) {
				%>

				<ul>
					<li class="page" style="list-style: none"> 
						<%
							if (PrevBlock > 0) {
						%> <a href="TravelServlet?curPage=<%=curPage - 1%>">[이전 페이지]</a>
						<%
							}
						%> <%
 	for (int j = 1 + PrevBlock; j < NextBlock && j <= totalPage; j++) {
 	if (j == curPage) {
 %> [<%=j%>] <%
 	} else {
 %> [<a href="TravelServlet?curPage=<%=j%>"><%=j%></a>] <%
 	}
 }
 %> <%
 	if (totalPage >= NextBlock) {
 %> <a href="TravelServlet?curPage=<%=NextBlock%>">[다음 페이지]</a> <%
 	}
 %>
					</li>
				</ul>
				<%
					} //end if
				%>
				<%
					} //end for
				%>
			</div>
		</section>
	</main>
	<jsp:include page="../common/footer.jsp" flush="true"></jsp:include>

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="assets/vendor/counterup/counterup.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/venobox/venobox.min.js"></script>
	<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
</body>
</html>
