<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover {
    border: 1px solid #c5c5c5 !important;
    background: #fff !important;
    font-weight: normal;
    color: #fff;
}

.ui-widget-header {
     border: none; 
    }
.btn-secondary{
	background-color: #6c757d !important;
	border-color: #6c757d !important;
}
.btn{
	    padding: .375rem .75rem !important;
}

</style>	
	
   <!--  Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/lib/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type=text/css> 
	<link href="${pageContext.request.contextPath}/lib/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	
  <!--   Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/lib/css/sb-admin-2.min.css" rel="stylesheet">  
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/popular_book.css"> <!-- 인기도서 css  -->
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/jquery-ui.min.css"> <!-- 탭 css -->
</head>
<jsp:include page="navigation_p.jsp"></jsp:include>
<body >
 
   
<!-- 인기도서!!!!! -->
<form>
	
	<div id="wrap" class="panel panel-primary">
	<div id="tab">
			<!-- 사용자가 클릭하는 Tab들 -->
			<div class="book_icon"><i class="fa fa-book"></i></div>
			<h2 id="write">인기대출목록</h2>
			<div><ul class ="tab_color" >
				<li class="col"><a  href="#t1" onclick="test('tb1')"><span  class="taba_color t_selected" id="tb1">지역</span></a></li> <!-- t1이라는 아이디로 가겠다. -->
				<li class="col"><a  href="#t2" onclick="test('tb2')"><span class="taba_color " id="tb2">연령</span></a></li>
				<li class="col"><a  href="#t3" onclick="test('tb3')"><span  class="taba_color " id="tb3">성별</span></a></li>
			</ul>
			</div>
			
		<!-- -------------------------------------------------- -->
    
		<div id="t1">
		<div class="region_div">
			<ul id="menu1">
			 <!--<li class="region" onclick="prev" id=r1><a href="" > <span class="region_a">◀</span></a></li>-->
				<li class="region1"><a href=""> <span class="region_a total selected">전국</span></a></li>
				<li class="region1"><a href=""> <span class="region_a seoul">서울</span></a></li>
				<li class="region1"><a href=""> <span class="region_a busan">부산</span></a></li>
				<li class="region1"><a href=""> <span class="region_a daegu">대구</span></a></li>
				<li class="region1"><a href=""> <span class="region_a incheon">인천</span></a></li>
				<li class="region1"><a href=""> <span class="region_a gwangju">광주</span></a></li>
				<li class="region1"><a href=""> <span class="region_a daejeon">대전</span></a></li>
				<li class="region1"><a href=""> <span class="region_a ulsan">울산</span></a></li>
				<li class="region1"><a href=""> <span class="region_a sejong">세종</span></a></li>
				<li class="region1"><a href=""> <span class="region_a gyeonggi">경기</span></a></li>
				<li class="region1"><a href=""> <span class="region_a gangwon">강원</span></a></li>
				<li class="region1"><a href=""> <span class="region_a chungcheong">충북</span></a></li>
				<li class="region1"><a href=""> <span class="region_a chungnam">충남</span></a></li>
				<li class="region1"><a href=""> <span class="region_a jeolanam">전남</span></a></li>
				<li class="region1"><a href=""> <span class="region_a jeollabuk">전북</span></a></li>
			 <!--<li class="region"><a href=""> <span class="region_a">▶</span></a></li>-->
			</ul>
			
		</div>
			<div id=tabImg>
				<ul class="bookListSize">
				<% 			
					for(int i=1;i<=12;i++){	
				%>	
					<li class="bookList">
						<a href="#" class="imageStyle"> 
							<label><%=i %></label>
							<img src="${pageContext.request.contextPath}/images/to<%=i+1 %>.PNG" class="imageSize"/>
							<span class=" fontStyle">골든아워 </span>
						</a> 
					</li>
					<% 
					}
				%>
				
			<li class="end"></li> 
		</ul>
	</div> <!-- 이미지가 들어간 탭사이즈 -->
	
						<ul class="pagination justify-content-center"  >
					        <li class="page-item">
					          <a class="page-link" href="#" aria-label="Previous">
					            <span aria-hidden="true">«</span>
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
					            <span aria-hidden="true">»</span>
					            <span class="sr-only">Next</span>
					          </a>
					        </li>
					      </ul><!-- 숫자끝 -->
					</div>
	<!-- 첫번째 탭 끝!!!! -->
	
			<div id="t2">
			
			<div class="region_div">
			<ul id="menu2">
				<!--<li class="region" onclick="prev" id=r1><a href="" > <span class="region_a">◀</span></a></li> -->
				<li class="region2"><a href=""> <span class="region_a total selected">전체</span></a></li>
				<li class="region2"><a href=""> <span class="region_a seoul">영유아</span></a></li>
				<li class="region2"><a href=""> <span class="region_a busan">유아</span></a></li>
				<li class="region2"><a href=""> <span class="region_a daegu">초등</span></a></li>
				<li class="region2"><a href=""> <span class="region_a incheon">청소년</span></a></li>
				<li class="region2"><a href=""> <span class="region_a gwangju">20대</span></a></li>
				<li class="region2"><a href=""> <span class="region_a daejeon">30대</span></a></li>
				<li class="region2"><a href=""> <span class="region_a ulsan">40대</span></a></li>
				<li class="region2"><a href=""> <span class="region_a sejong">50대</span></a></li>
				<li class="region2"><a href=""> <span class="region_a gyeonggi">60대 이상</span></a></li>
			 <!--<li class="region" onclick="next"><a href=""> <span class="region_a">▶</span></a></li> -->
			</ul>
		</div>
			<div id=tabImg>
				<ul class="bookListSize">
					<li class="bookList">
					
						<a href="#" class="imageStyle"> 
							<label>1</label>
							<img src="../images/to1.PNG" class="imageSize"/>
							<span class=" fontStyle">골든아워 </span>
						</a> 
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<label>2</label>
							<img src="../images/to2.PNG" class="imageSize"/>
							<span class="fontStyle">12가지 인생의 법칙</span>
						</a>
					</li>				
				
					<li class="bookList">
						<a href="#" class="imageStyle">
							<label>3</label>
							<img src="../images/to3.PNG" class="imageSize"/>
							<span class="fontStyle">골든아워2</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<label>4</label>
							<img src="../images/to4.PNG" class="imageSize"/>
							<span class="fontStyle">나는 그것에 대해 아주 오랫동안 생각해</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<label>5</label>
							<img src="../images/to5.PNG" class="imageSize"/>
							<span class="fontStyle">죽고 싶지만 떡볶이는 먹고싶어: 백세희</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<label>6</label>
							<img src="../images/to1.PNG" class="imageSize"/>
							<span class="fontStyle">골든아워 :이국종 에세이</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<label>7</label>
							<img src="../images/to2.PNG" class="imageSize"/>
							<span class="fontStyle">12가지 인생의 법칙: 조던B피터슨</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<label>8</label>
							<img src="../images/to3.PNG" class="imageSize"/>
							<span class="fontStyle">골든아워2:이국종 에세이</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<label>9</label>
							<img src="../images/to4.PNG" class="imageSize"/>
							<span class="fontStyle">나는 그것에 대해 아주 오랫동안 생각해: 김금희</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<label>10</label>
							<img src="../images/to5.PNG" class="imageSize"/>
							<span class="fontStyle">죽고 싶지만 떡볶이는 먹고싶어: 백세희</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<label>11</label>
							<img src="../images/to1.PNG" class="imageSize"/>
							<span class="fontStyle">골든아워 :이국종 에세이</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<label>12</label>
							<img src="../images/to2.PNG" class="imageSize"/>
							<span class="fontStyle">12가지 인생의 법칙: 조던B피터슨</span>
						</a>
					</li>
					
					<li class="end"></li> 
					</ul>
					</div> <!-- 이미지가 들어간 탭사이즈 -->
					
					<div >
						<ul class="pagination justify-content-center">
					        <li class="page-item">
					          <a class="page-link" href="#" aria-label="Previous">
					            <span aria-hidden="true">«</span>
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
					            <span aria-hidden="true">»</span>
					            <span class="sr-only">Next</span>
					          </a>
					        </li>
					     </ul>
					
					</div>
			</div>
			
			
			<div id="t3">
			<div class="region_div">
			<ul id="menu3">
				<!-- <li class="region3" onclick="prev" id=r1><a href="" > <span class="region_a">◀</span></a></li> -->
				<li class="region3"><a href=""> <span class="region_a total selected">전체</span></a></li>
				<li class="region3"><a href=""> <span class="region_a seoul">영유아(남)</span></a></li>
				<li class="region3"><a href=""> <span class="region_a busan">영유아(여)</span></a></li>
				<li class="region3"><a href=""> <span class="region_a daegu">유아(남)</span></a></li>
				<li class="region3"><a href=""> <span class="region_a incheon">유아(여)</span></a></li>
				<li class="region3"><a href=""> <span class="region_a gwangju">초등(남)</span></a></li>
				<li class="region3"><a href=""> <span class="region_a daejeon">초등(여)</span></a></li>
				<li class="region3"><a href=""> <span class="region_a ulsan">청소년(남)</span></a></li>
				<li class="region3"><a href=""> <span class="region_a sejong">청소년(여)</span></a></li>
				<li class="region3"><a href=""> <span class="region_a gyeonggi">20대(남)</span></a></li>
				<li class="region3"><a href=""> <span class="region_a gangwon">20대(여)</span></a></li>
				<li class="region3"><a href=""> <span class="region_a chungcheong">30대(남)</span></a></li>
				<li class="region3"><a href=""> <span class="region_a chungnam">30대(여)</span></a></li>
				<li class="region3"><a href=""> <span class="region_a jeolanam">40대(남)</span></a></li>
				<li class="region3"><a href=""> <span class="region_a jeollabuk">50대(여)</span></a></li>
				<li class="region3"><a href=""> <span class="region_a jeolanam">50대(남)</span></a></li>
				<li class="region3"><a href=""> <span class="region_a jeollabuk">60대 이상(여)</span></a></li>
				<li class="region3"><a href=""> <span class="region_a jeolanam">60대 이상(남)</span></a></li>
				<!-- <li class="region3" onclick="next"><a href=""> <span class="region_a">▶</span></a></li> -->
			</ul>
		</div>
			<div id=tabImg>
				<ul class="bookListSize">
					<li class="bookList">
					
						<a href="#" class="imageStyle"> 
							
							<img src="../images/to1.PNG" class="imageSize"/>
							<span class=" fontStyle">골든아워 </span>
						</a> 
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<img src="../images/to2.PNG" class="imageSize"/>
							<span class="fontStyle">12가지 인생의 법칙</span>
						</a>
					</li>				
				
					<li class="bookList">
						<a href="#" class="imageStyle">
							<img src="../images/to3.PNG" class="imageSize"/>
							<span class="fontStyle">골든아워2</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<img src="../images/to4.PNG" class="imageSize"/>
							<span class="fontStyle">나는 그것에 대해 아주 오랫동안 생각해</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<img src="../images/to5.PNG" class="imageSize"/>
							<span class="fontStyle">죽고 싶지만 떡볶이는 먹고싶어: 백세희</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<img src="../images/to1.PNG" class="imageSize"/>
							<span class="fontStyle">골든아워 :이국종 에세이</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<img src="../images/to2.PNG" class="imageSize"/>
							<span class="fontStyle">12가지 인생의 법칙: 조던B피터슨</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<img src="../images/to3.PNG" class="imageSize"/>
							<span class="fontStyle">골든아워2:이국종 에세이</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<img src="../images/to4.PNG" class="imageSize"/>
							<span class="fontStyle">나는 그것에 대해 아주 오랫동안 생각해: 김금희</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<img src="../images/to5.PNG" class="imageSize"/>
							<span class="fontStyle">죽고 싶지만 떡볶이는 먹고싶어: 백세희</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<img src="../images/to1.PNG" class="imageSize"/>
							<span class="fontStyle">골든아워 :이국종 에세이</span>
						</a>
					</li>
					
					<li class="bookList">
						<a href="#" class="imageStyle">
							<img src="../images/to2.PNG" class="imageSize"/>
							<span class="fontStyle">12가지 인생의 법칙: 조던B피터슨</span>
						</a>
					</li>
					
					<li class="end"></li> 
					</ul>
					</div> <!-- 이미지가 들어간 탭사이즈 -->
					
						<ul class="pagination justify-content-center"  >
					        <li class="page-item">
					          <a class="page-link" href="#" aria-label="Previous">
					            <span aria-hidden="true">«</span>
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
					            <span aria-hidden="true">»</span>
					            <span class="sr-only">Next</span>
					          </a>
					        </li>
					      </ul><!-- 숫자끝 -->
			 </div>		
		</div>
	</div>
	</form>
	 
	  <jsp:include page="footer.jsp"></jsp:include> 

   		
	 <script src="${pageContext.request.contextPath}/lib/js/jquery-3.3.1.min.js"></script>
	 <script src="${pageContext.request.contextPath}/lib/js/jquery-ui.min.js"></script>  <!-- ui는 위의 core가 있어야 움직이므로 두개의 js파일의 순서가 바뀌면 안됨! -->
	
	<script type="text/javascript">
	
		$(function(){
			//jQuery시작부분!
			$("#btn1").button();
			
			$("#tab").tabs({collapsible: true});
			$("#tab").css(border)

		});
		
		function test(n){
			
			$(".tab_color span").css("color","#555");
			var t = document.getElementById(n);
			t.style.color = "#6B9900";
		}
		
	</script>
</body>
</html>