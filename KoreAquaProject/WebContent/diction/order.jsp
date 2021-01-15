<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dto.DictionDTO"%>
<%@page import="com.dto.PageDTO"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="">

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

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
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
		<!-- End Breadcrumbs -->

		<section class="inner-page">
			<div class="content">
				<div class="container" style="text-align: center; font-size: 22px;">
					[검색할 단어를 입력하세요 ]</div>
				<form action="DInitialServlet"
					style="width: 400px; height: 30px; margin: auto; padding-left: 50px;">
					<input type="text" name="searchValue" id="searchValue"
						class="searchValue" style="width: 80%; display: float;"> <input
						type="submit" value="검색" class="submit" style="height: 30px;">
				</form>
				<%
					PageDTO pDTO = (PageDTO) request.getAttribute("SearchList");
				List<DictionDTO> list = pDTO.getList();
				String searchValue = (String) request.getAttribute("hnm");
				String searchinitial = (String) request.getAttribute("initial");
				int curPage = pDTO.getCurPage(); // curPage 현재 페이지 번호
				int perPage = pDTO.getPerPage(); // perPage 1페이지당 게시물 수 (10개)
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
				<table width="100%" cellspacing="0" cellpadding="0">
					<tr>
						<td height="10" align="center" style="font-size: 22px;"><a
							href="OrderServlet?initial=ga&searchinitial=ga">ㄱ</a> <a
							href="OrderServlet?initial=na&searchinitial=na">ㄴ</a> <a
							href="OrderServlet?initial=da&searchinitial=da">ㄷ</a> <a
							href="OrderServlet?initial=ra&searchinitial=ra">ㄹ</a> <a
							href="OrderServlet?initial=ma&searchinitial=ma">ㅁ</a> <a
							href="OrderServlet?initial=ba&searchinitial=ba">ㅂ</a> <a
							href="OrderServlet?initial=sa&searchinitial=sa">ㅅ</a> <a
							href="OrderServlet?initial=aa&searchinitial=aa">ㅇ</a> <a
							href="OrderServlet?initial=ja&searchinitial=ja">ㅈ</a> <a
							href="OrderServlet?initial=cha&searchinitial=cha">ㅊ</a> <a
							href="OrderServlet?initial=ka&searchinitial=ka">ㅋ</a> <a
							href="OrderServlet?initial=ta&searchinitial=ta">ㅌ</a> <a
							href="OrderServlet?initial=pa&searchinitial=pa">ㅍ</a> <a
							href="OrderServlet?initial=ha&searchinitial=ha">ㅎ</a></td>
					</tr>
					<tr>
						<td>
							<table align="center" width="35%" cellspacing="0" cellpadding="0"
								border="0">

								<tr>
									<td height="5"></td>
								</tr>

								<tr>
									<td height="1" colspan="8" bgcolor="CECECE"></td>
								</tr>

								<tr>
									<%
										for (int i = 1; i <= list.size(); i++) {
										DictionDTO dto = list.get(i - 1);
										String resultCode = dto.getResultCode();
										String resultMsg = dto.getResultMsg();
										String numOfRows = dto.getNumOfRows();
										String pageNo = dto.getPageNo();
										String hNm = dto.gethNm();
										String cNm = dto.getcNm();
										String eNm = dto.geteNm();
										String explain = dto.getExplain();
										String rgsdt = dto.getRgsdt();
										if (explain == null) {
											explain = "업데이트 예정";
										}
										if (hNm == null) {
											hNm = "업데이트 예정";
										}
										if (cNm == null) {
											cNm = "업데이트 예정";
										}
										if (eNm == null) {
											eNm = "업데이트 예정";
										}
										if (rgsdt == null) {
											rgsdt = "업데이트 예정";
										}
									%>
									<td>
										<table>
											<tr>
												<td align="left"><strong><%=hNm%></strong> [<%=cNm%> <%=eNm%>]</td>
											</tr>

											<tr>
												<td height="10">
											</tr>

											<tr>
												<td class="explain" align="left"><%=explain%></td>
											</tr>
											<tr>
												<td style='padding: 10px;'></td>
											</tr>
										</table>
									</td>

									<%
										if (i % 1 == 0) {
									%>
								
								<tr>
									<td height="10">
								</tr>
								<%
									} //end if
								%>

								<%
									} //end for
								%>
								<tr>
									<td class="paging"
										style="text-align: center; font-size: 22px; padding-bottom: 30px;">
										<%
											if (PrevBlock > 0) {
										%> <a
										href="OrderServlet?initial=<%=searchinitial%>&curPage=<%=curPage - 1%>">[이전
											페이지]</a> <%
 	}
 %> <%
 	for (int i = 1 + PrevBlock; i < NextBlock && i <= totalPage; i++) {
 	if (i == curPage) {
 %> [<%=i%>] <%
 	} else {
 %> [<a href="OrderServlet?initial=<%=searchinitial%>&curPage=<%=i%>"><%=i%></a>]
										<%
 	}
 }
 %> <%
 	if (totalPage >= NextBlock) {
 %> <a
										href="OrderServlet?initial=<%=searchinitial%>&curPage=<%=NextBlock%>">
											[다음 페이지] </a> <%
 	}
 %>
									</td>
								</tr>
							</table>
						</td>
					</tr>

				</table>
			</div>
		</section>
	</main>
	<!-- End #main -->

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



	<div id="breadcrumb" class="hoc clear">
		<ul>
			<li><a href="<c:url value='/index.jsp' />">Home</a></li>
			<li><a href="Dictionary.jsp">물 백과사전</a></li>
		</ul>
	</div>
	<div class="wrapper row3">
		<main class="hoc container clear"></main>
	</div>
	
</body>
</html>

