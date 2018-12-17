<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 메인 css -->
 	<link href="${pageContext.request.contextPath}/lib/css/common.css" rel="stylesheet">
<!-- Bootstrap core CSS -->

	
<!-- jquery ui의 CSS -->
	<link href="${pageContext.request.contextPath}/lib/css/jquery-ui.min.css" rel="stylesheet" type="text/css">
	
<!-- 부트스트랩 sb-admin-2의 기본 CSS-->
   	<link href="${pageContext.request.contextPath}/lib/css/sb-admin-2.min.css" rel="stylesheet" type="text/css"> 
<!-- 부트스트랩 sb-admin-2의 폰트 및 아이콘 CSS-->
    <link href="${pageContext.request.contextPath}/lib/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        
<!-- Custom styles for this template -->
	<link href="${pageContext.request.contextPath}/lib/css/logo-nav.css" rel="stylesheet">

<!-- SideBar CSS -->
	<link href="${pageContext.request.contextPath}/lib/css/simple-sidebar.css" rel="stylesheet">
	
<!-- half-slider CSS -->
	<link href="${pageContext.request.contextPath}/lib/css/half-slider.css" rel="stylesheet">
	    
   
<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="main.inc">
   		  <!-- <img src="http://placehold.it/300x60?text=Logo" width="150" height="30" alt=""> -->
       	  <h2 id="header_logo">우리 동네 도서관</h2>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" 
          data-target="#navbarResponsive" aria-controls="navbarResponsive" 
          aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="main.inc" style="color: white !important; font-size: x-large !important;
               padding-right: 15px !important; padding-left: 15px !important;"><i class="fa fa-home"></i>
              </a>
            </li>
            <c:if test="${sessionScope.m_id == null }">
            <li class="nav-item">
              <a class="nav-link" href="join.inc" style="color: white !important; font-size: x-large !important;
               padding-right: 15px !important; padding-left: 15px !important;"><i class="fa fa-user"></i></a> <!-- 로그인 시, 마이페이지 -->
            </li>
            </c:if>
            <c:if test="${sessionScope.m_id != null }">
            	<a></a>
            </c:if>
            <c:if test="${sessionScope.m_id == null }">
            	<li class="nav-item">
            		<a class="nav-link" href="login.inc" style="color: white !important; font-size: x-large !important;
            		 padding-right: 15px !important; padding-left: 15px !important;"><i class="fa fa-sign-in"></i></a>
            	</li>
            	</c:if>
            
			<c:if test="${sessionScope.m_id != null }">
            	<li class="nav_logout">
            		<a href="modify.inc" style="color: white !important; font-size: x-large !important; 
            		padding-right: 15px !important; padding-left: 15px !important;"><i class="fa fa-user-md"></i></a>
            	</li>
            	<li class="nav-item">
            		<a class="nav-link" href="logout.inc" style="color: white !important; font-size: x-large !important;
            		 padding-right: 15px !important; padding-left: 15px !important;"><i class="fa  fa-sign-out"></i></a>
            	</li>
            </c:if>
            <!-- <li class="nav-item">
              <a class="nav-link" href="#"></a>
            </li> -->
          </ul>
        </div>
      </div>
    </nav>
    <!-- Page Content -->
    <!-- <div class="container">
      <h1 class="mt-5">Logo Nav by Start Bootstrap</h1>
      <p>The logo in the navbar is now a default Bootstrap feature in Bootstrap 4! 
      Make sure to set the width and height of the logo within the HTML. 
      For best results, it's recommended that you use an SVG image as your logo.</p>
    </div> -->
    <!-- /.container -->
    
    <!-- sidebar -->
        <div id="wrapper" >
	        <div id="sidebar-wrapper">
	            <ul class="sidebar-nav">
	                <li class="sidebar-brand">
	                    <a href="main.inc">
	                        메인화면
	                    </a>
	                </li>
	                <li>
	                    <a href="modify.inc">마이페이지</a>
	                </li>
	                <li>
	                    <a href="board_free.inc">일반게시판</a>
	                </li>
	                <li>
	                    <a href="board_share.inc">책게시판</a>
	                </li>
	                <li>
	                    <a href="searchbook.inc">도서검색</a>
	                </li>
	                <li>
	                    <a href="popular_book.inc">인기도서</a>
	                </li>
	                <li>
	                    <a href="instructional_page.inc">소개페이지</a>
	                </li>
	            </ul>
	        </div>
	        <!-- /#sidebar-wrapper -->
         	<!-- Page Content -->
	        <div id="page-content-wrapper">
	            <div class="container-fluid">
	                <a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">menu</a>
	            </div>
	        </div>
	        <!-- /#page-content-wrapper -->

	    </div>
	    <!-- /#wrapper -->
	      <!-- half-slider -->
  <!--       <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          Slide One - Set the background image for this slide in the line below
          <div class="carousel-item active" style="background-image: url('http://placehold.it/1900x1080')">
            <div class="carousel-caption d-none d-md-block">
              <h3>First Slide</h3>
              <p>This is a description for the first slide.</p>
            </div>
          </div>
          Slide Two - Set the background image for this slide in the line below
          <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Second Slide</h3>
              <p>This is a description for the second slide.</p>
            </div>
          </div>
          Slide Three - Set the background image for this slide in the line below
          <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Third Slide</h3>
              <p>This is a description for the third slide.</p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>
     -->
    <!-- Page Content -->
    <!-- <section class="py-5">
      <div class="container">
        <h1>Half Slider by Start Bootstrap</h1>
        <p>The background images for the slider are set directly in the HTML using inline CSS. The rest of the styles for this template are contained within the
          <code>half-slider.css</code>
          file.</p>
      </div>
    </section> -->
    <!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/lib/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/lib/js/bootstrap.bundle.min.js"></script>
	
	<!-- Menu Toggle Script -->
	<script>
	$("#menu-toggle").hover(function(e) {
	    e.preventDefault();
	    $("#wrapper").toggleClass("toggled");
	});
	
	$("#sidebar-wrapper").hover(function(e) {
	    e.preventDefault();
	    $("#wrapper").toggleClass("toggled");
	});  
 
	</script>