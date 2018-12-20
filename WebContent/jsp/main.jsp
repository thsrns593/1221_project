<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<style type="text/css">
.fastsearch {
	background-color: #81F7F3;
	cursor: pointer;
	height: 50px;
	line-height: center;
	padding: auto;
	font-size: 30px;
	text-align: center;
}

.fastsearch:hover {
	background-color: #086A87;
	cursor: pointer;
	height: 50px;
	line-height: center;
	padding: auto;
	font-size: 30px;
	text-align: center;
}

.fastsearch:active {
	background-color: #424242;
	cursor: pointer;
	height: 50px;
	line-height: center;
	padding: auto;
	font-size: 30px;
	text-align: center;
}
</style>
<title>인기도서</title>

<!-- 인기도서 자동넘김 CSS -->
<link
	href="${pageContext.request.contextPath}/lib/css/shop-homepage.css"
	rel="stylesheet" />

<link href="${pageContext.request.contextPath}/lib/css/Main.css"
	rel="stylesheet" />
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
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid"
								src="${pageContext.request.contextPath}/images/a.png"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="${pageContext.request.contextPath}/images/b.png"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="${pageContext.request.contextPath}/images/c.png"
								alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>

			<!-- Sidebar Widgets Column -->
			<div class="col-md-4">
				<!-- Search Widget -->
				<div class="card my-4">
					<a onclick="javascript:location.href='searchbook.inc'"
						class="fastsearch"> 도서 검색 하러 가기<i class="fa fa-search"></i>
					</a>
				</div>
				<a href="board_free.inc?cate=공지">공지사항</a>
				<!-- 공지사항 게시판으로 이동 -->
				<a href="board_free.inc?cate=공지" id="a_fixed">more</a>
				<table class="table table-striped font_fixed">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ar }" var="item" varStatus="st">
							<tr>
								<td>${item.nb_num}</td>
								<td><a href="text_read.inc?nb_num=${item.nb_num}">
										${item.nb_title}</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>




	<!-- Page Content -->
	<div class="container col-lg-8">

		<!-- Page Heading -->
		<h1 class="my-4">추천도서</h1>

		<div class="row2">
			<%--        <div class="col-lg-4 col-sm-6 portfolio-item">
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
        </div> --%>
		</div>
		<!-- /.row -->

		<!-- Pagination -->
		<!--       <ul class="pagination justify-content-center">
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
      </ul> -->
		<div id="pageCode"></div>
	</div>

	<!-- /.container -->

	<jsp:include page="footer.jsp"></jsp:include>


	<script
		src="${pageContext.request.contextPath}/lib/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/lib/js/jquery-ui.min.js"></script>
	<!-- ui는 위의 core가 있어야 움직이므로 두개의 js파일의 순서가 바뀌면 안됨! -->

	<script type="text/javascript">
		$(function() {
			window.onhashchange = locationHashChanged;	
		});
	
		function locationHashChanged() {
	        alert("새로운페이지");
		}
	
		var myIsbn = "9788937473135";
		$(function() {
			//jQuery시작부분!!!
			exe(myIsbn, 1); //전국 1위의 책으로 추천도서를 호출. //9788937473135는 전국 1위의 ISBN

		});

		function exe(value, np) {
			var pageCode = document.getElementById("pageCode");
			console.log("exe() value:" + value + " page : " + np);
			$
					.ajax(
							{
								url : "main_recommend.inc",
								type : "POST",
								dataType : "json",
								data : "value=" + encodeURIComponent(value)
										+ "&nowPage=" + np

							})
					.done(
							function(data) {
								var str = "";

								$
										.each(
												data.b_list,
												function(index, item) {
													console.log(index + ","
															+ item.bookname);
													str += "<div class='col-lg-3 col-md-4 col-sm-6 portfolio-item'><div class='card h-100'><a href='searchDetail.inc?isbn="
															+ item.isbn13
															+ "'><img class='card-img-top' src="+item.bookImageURL+"></a><div class='card-body'><h4 class='card-title'><a href='searchDetail.inc?isbn="
															+ item.isbn13
															+ "'>"
															+ item.bookname
															+ "</a></h4></div></div></div>";

												})

								$(".row2").html(str);

								pageCode.innerHTML = data.pageCode; //페이징 코드

							}).fail(function(er) {

					});
		}
	</script>

</body>
</html>

