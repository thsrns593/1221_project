<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>인기도서</title>
	
	<!-- 인기도서 자동넘김 CSS -->
	<link href="${pageContext.request.contextPath}/lib/css/shop-homepage.css" rel="stylesheet" />


  </head>

  <body>

    <jsp:include page="navigation.jsp"></jsp:include>
    
    <!-- Page Content -->
    <div class="container">
      <div class="row">
      
        <!-- Post Content Column -->
        <div class="col-lg-8">
          <!-- Title -->
          <h1 class="mt-4 bold">인기 도서</h1>
          <hr id="hr_fixed">
          <!-- Date/Time -->
          <p>테마별 인기 대출도서 목록</p>
         
          <!-- Preview Image -->
          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid" src="${pageContext.request.contextPath}/images/a.png" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="${pageContext.request.contextPath}/images/b.png" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="${pageContext.request.contextPath}/images/c.png" alt="Third slide">
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
        </div>
      
    <!-- Sidebar Widgets Column -->
        <div class="col-md-4">
          <!-- Search Widget -->
          <div class="card my-4">
            <h5 class="card-header bold">도서 검색</h5> 
            <div class="card-body">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Search for...">
                <span class="input-group-btn">
                  <button id="button_fixed" class="btn btn-secondary" type="button" onclick="javascript:location.href='searchbook.inc'">
                  <!-- 버튼 누를 시 도서검색 페이지로 이동! -->
                  	<i class="fa fa-search"></i>
                  </button>
                </span>
              </div>
            </div>
          </div>
          
          <a href="board_free.inc">공지사항</a> <!-- 공지사항 게시판으로 이동 -->
          <a href="board_free.inc" id="a_fixed">more</a> 
		    <table class="table table-striped font_fixed">
		    	<thead>
		    	<tr>
		    		<th>번호</th>
		    		<th>제목</th>
		    	</tr>
		    	</thead>
		    	<tbody>
		    	<tr>
		    		<td>3</td>
		    		<td><a href="#">하기시러어어어어어엉어어어어어</a></td> <!-- 해당 글 이동 -->
		    	</tr>
		    	<tr>
		    		<td>2</td>
		    		<td><a href="#">안녕하세요</a></td> <!-- 해당 글 이동 -->
		    	</tr>
		    	<tr>
		    		<td>1</td>
		    		<td><a href="#">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</a></td> <!-- 해당 글 이동 -->
		    	</tr> 
		    	</tbody>
		    </table>   
		    </div>
	 	</div>   
       </div>


      		
    
     <!-- Page Content -->
    <div class="container col-lg-8">

      <!-- Page Heading -->
      <h1 class="my-4">추천도서
      </h1>

      <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/images/1.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">못 참는 아이 욱하는 부모</a>
              </h4>
              <p class="card-text">책 소개 내용</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/images/2.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">이기적 유전자</a>
              </h4>
              <p class="card-text">책 소개 내용</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/images/3.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">마법천자문</a>
              </h4>
              <p class="card-text">책 소개 내용</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/images/4.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">총,균,쇠</a>
              </h4>
              <p class="card-text">책 소개 내용</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/images/5.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">나의 한국현대사</a>
              </h4>
              <p class="card-text">책 소개 내용</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/images/6.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">여덟단어</a>
              </h4>
              <p class="card-text">책 소개 내용</p>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->

      <!-- Pagination -->
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">3</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>

    </div>
    <!-- /.container -->
    
   <jsp:include page="footer.jsp"></jsp:include>
	
  </body>

</html>

