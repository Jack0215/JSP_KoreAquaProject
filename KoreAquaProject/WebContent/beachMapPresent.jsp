<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>해수욕장 수질 조회</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
   <style type="text/css">
   .one_half, .one_third, .two_third, .one_quarter, .two_quarter, .three_quarter {
    /* display: inline-block; */
    float: left;
    margin: 0 0 0 4.21052%;
    list-style: none;
    
}
.first {
    margin-left: 0;
    /* clear: left; */
}
.one_quarter {
    width: 21.8421%;
}

@media screen and (min-width: 1140px)
.hoc {
    max-width: 1140px;
}
.hoc {
    display: block;
    margin: 0 auto;
}
.contain {
    padding: 80px 0;
}
.three_quarter {
    width: 73.94736%;
    display:inline-block;
    
}

   </style>
</head>

<body>


<jsp:include page="common/header.jsp"></jsp:include> 
 

    <!-- ======= Breadcrumbs ======= -->
    <section id= "breadcrumbs" class="breadcrumbs">
      <div class="container ">

        <div class="d-flex justify-content-between align-items-center">
          <h2>해수욕장 수질 조회</h2>
          <ol>
            <li><a href="index.jsp">Home</a></li>
            <li>해수욕장 수질 조회</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
    
    <main id="main hoc contain">
 <div class="wrapper row3">
  <div class="hoc contain clear"> 
  <section class="inner-page">
    <div class="sidebar one_quarter first"> 
      
      <h6>궁금한 수질?</h6>
      <nav class="sdb_holder">
        <ul>
         
          <li><a href="<c:url value='/DaySearch.jsp' />">수질 조회</a>
            <ul>
             <br> <li><a href="<c:url value='/DaySearch.jsp' />">일별 수질 조회</a></li>
              <li><a href="<c:url value='/WeekSearch.jsp' />">주별 수질 조회</a></li>
              <li><a href="<c:url value='/MonthSearch.jsp' />">월별 수질 조회</a></li>
            </ul>
          
          <ul>
          <br><li><a href="<c:url value='/MineralSWMark.jsp' />">약수터 수질 조회</a></li>
          <li><a href="<c:url value='/beachMapPresent.jsp' />">해수욕장 수질 조회</a></li>
          </ul>
          </li>
        </ul>
      </nav>
      
    </div>

    
      <div class=" three_quarter">
      
       <jsp:include page="map/beachMapPresent.jsp" flush="true"></jsp:include> 
      </div>
    </section>

 </div>
</div>


  </main><!-- End #main -->

 <jsp:include page="common/footer.jsp"></jsp:include> 

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
 <!--  <script src="assets/vendor/jquery/jquery.min.js"></script> -->
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