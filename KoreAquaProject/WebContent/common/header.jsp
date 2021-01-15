<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KoreAqua</title>
</head>
<body>

<!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container">
      <div class="header-container d-flex align-items-center">
        <div class="logo mr-auto">
          <h1 class="text-light"><a href="index.jsp"><span>KoreAqua</span></a></h1>
          <!-- Uncomment below if you prefer to use an image logo -->
          <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
        </div>

        <nav class="nav-menu d-none d-lg-block">
          <ul>
            <li class="active"><a href="index.jsp">Home</a></li>
            
           <li class="drop-down"><a href="">궁금한 수질</a>
              <ul>
                <li class="drop-down"><a href="#">수질 조회</a>
                  <ul>
                    <li><a href="DaySearch.jsp">일별 조회</a></li>
                    <li><a href="WeekSearch.jsp">주별 조회</a></li>
                    <li><a href="MonthSearch.jsp">월별 조회</a></li>                   
                  </ul>
                </li>
                <li><a href="MineralSWMark.jsp">약수터 조회</a></li>
                <li><a href="beachMapPresent.jsp">해수욕장 조회</a></li>
              </ul>
            </li>
            
             <li class="drop-down"><a href="">물과 여행정보</a>
              <ul>
                <li><a href="TravelServlet">강 따라</a></li> 
                <li><a href="AreaServlet">명소 따라</a></li>                
              </ul>
            </li>
            
            <li><a href="DictionServlet">물과 백과사전</a></li>  
            <li><a href="#team">Q & A</a></li> 
          
          </ul>
        </nav><!-- .nav-menu -->
      </div><!-- End Header Container -->
    </div>
  </header><!-- End Header -->

</body>
</html>