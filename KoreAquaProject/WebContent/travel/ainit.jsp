<%@page import="com.dto.AreaPage"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dto.AreaDTO"%>

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
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#AInit").on("change",function(){
		
		var AInit = $("#AInit option:selected").val();
		location.href="AreaInitialServlet?AInit="+AInit;
	}); 
	console.log($("#AInit").val()); 
});
</script>  
<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/header.jsp" flush="ture"></jsp:include>


	<main class="main">
		<section class="breadcrumbs">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center" style="padding-bottom:20px;">
					<h2></h2>
					<ol>
						<li><a href="index.jsp">Home</a></li>
						<li>Inner Page</li>
					</ol>
				</div>

			</div>
		</section>
		<!-- End Breadcrumbs -->
		
		<form action="AreaInitialServlet"
					style="width: 600px; height:50px; margin:0px 0px 0px 39%; padding:15px 0;">
					<select name="AInit" id="AInit" class="AInit" title="전체" style="height:30px;"> 
					<option value="All">전체</option> 
					<option value="HA">한&nbsp;&nbsp;강</option>
					<option value="GU">금&nbsp;&nbsp;강</option>
					<option value="NA">낙동강</option>
					<option value="YS">영산강</option> 
					<option value="SJ">섬진강</option>  
					 
				</select>
					<input type="text" name="searchValue" id="searchValue"
						class="searchValue" style="width:70%;"> <input
						type="submit" value="검색" class="submit" style="height: 30px;">
				</form> 
		
		<section class="inner-page">  
			<div class="content"></div>  
			<%
				String TITLE = (String) request.getAttribute("TITLE");
					AreaPage pDTO = (AreaPage) request.getAttribute("pdto");
					String REGIONCD = (String) request.getAttribute("REGIONCD"); 
				List<AreaDTO> list = pDTO.getList();
				int curPage = pDTO.getCurPage();
				int perPage = pDTO.getPerPage();
				int PageBlock = 10;
				int totalCount = pDTO.getTotalCount();
				int totalPage = totalCount / perPage; 
				if (totalCount % perPage != 0)
					totalPage++;
				int EndNo = perPage * curPage;
				int StartNo = EndNo - perPage;
				int PrevBlock = (int) Math.floor((curPage - 1) / PageBlock) * PageBlock;
				int NextBlock = PrevBlock + PageBlock + 1;
				%>
			<div id="div_con"
				style="width: 50%; margin: 0 auto;">
				<%
						for (int i = 1; i <= list.size(); i++) {
						AreaDTO adto = list.get(i - 1);
						String intro = adto.getINTRO();
						String region = adto.getREGION();
						String title = adto.getTITLE();
						String regioncd = adto.getREGIONCD();
						String rImage = adto.getRIMAGE(); 
					%>
				<ul>
					<%
							if (rImage != null) {
						%> 
					<li id=title
						style="display:flex; align-items:center; float:left;  padding: 10px 10px 10px 10px; margin:auto;  width: 50%; height:170px; overflow:hidden; ">
						
						<img src="images/area/<%=rImage%>.jpg" align="left" width="180" style="margin-right:20px"> 
						<div> <h5 style="argin-top: 15px;"><%=title%></h5> <p style="padding-top:10px; margin:auto; height:110px; overflow:hidden; text-overflow: ellipsis;"> <%=intro%></p></div> </li>  
						
				</ul>
   
				<%
						} //end if (rimage)
					%>
				<% 
						if (i % 8 == 0) {  
					%>  

				<ul>
					<li class="page" style="text-align: center;  list-style:none; ">
						<% 
								if (PrevBlock > 0) {
							%> <a href="AreaInitialServlet?searchValue=<%=TITLE%>&AInit=<%=REGIONCD %>&curPage=<%=curPage - 1%>">[이전
							페이지]</a> <%
								}
							%> <%
 	for (int j = 1 + PrevBlock; j < NextBlock && j <= totalPage; j++) {
 	if (j == curPage) {
 %> [<%=j%>] <%
 	} else {
 %> [<a href="AreaInitialServlet?searchValue=<%=TITLE%>&AInit=<%=REGIONCD %>&curPage=<%=j%>"><%=j%></a>] <%
 	}
 }
 %> <%
 	if (totalPage >= NextBlock) {  
 %> <a href="AreaInitialServlet?searchValue=<%=TITLE%>&AInit=<%=REGIONCD %>&curPage=<%=NextBlock%>">[다음 페이지]</a> <% 
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





