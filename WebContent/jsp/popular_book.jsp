<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<form method="post">
	
	<div id="wrap" class="panel panel-primary">
	<div id="tab">
			<!-- 사용자가 클릭하는 Tab들 -->
			<div class="book_icon"><i class="fa fa-book"></i></div>
			<h2 id="write">인기대출목록</h2>
			<div>
				<ul class ="tab_color" >
					<li class="col" id="tab1"><a  href="#t1" onclick="test('tb1')"><span  class="taba_color t_selected" id="tb1">지역</span></a></li> <!-- t1이라는 아이디로 가겠다. -->
					<li class="col" id="tab2"><a  href="#t2" onclick="test('tb2')"><span class="taba_color " id="tb2">연령</span></a></li>
					<li class="col" id="tab3"><a  href="#t3" onclick="test('tb3')"><span  class="taba_color " id="tb3">성별</span></a></li>
				</ul>
			</div>	
		<!-- -------------------------------------------------- -->
    
				<div id="t1">
					<div class="region_div">
						<ul id="menu1">
						 <!--<li class="region" onclick="prev" id=r1><a href="" > <span class="region_a">◀</span></a></li>-->
							<li class="region1 total"><a href="javascript:exe(null,1,3)"> <span class="region_a">전국</span></a></li>
							<li class="region1"><a href="javascript:exe(11,1,3)"> <span class="region_a seoul">서울</span></a></li>
							<li class="region1"><a href="javascript:exe(21,1,3)"> <span class="region_a busan">부산</span></a></li>
							<li class="region1"><a href="javascript:exe(22,1,3)"> <span class="region_a daegu">대구</span></a></li>
							<li class="region1"><a href="javascript:exe(23,1,3)"> <span class="region_a incheon">인천</span></a></li>
							<li class="region1"><a href="javascript:exe(24,1,3)"> <span class="region_a gwangju">광주</span></a></li>
							<li class="region1"><a href="javascript:exe(25,1,3)"> <span class="region_a daejeon">대전</span></a></li>
							<li class="region1"><a href="javascript:exe(26,1,3)"> <span class="region_a ulsan">울산</span></a></li>
							<li class="region1"><a href="javascript:exe(29,1,3)"> <span class="region_a sejong">세종</span></a></li>
							<li class="region1"><a href="javascript:exe(31,1,3)"> <span class="region_a gyeonggi">경기</span></a></li>
							<li class="region1"><a href="javascript:exe(32,1,3)"> <span class="region_a gangwon">강원</span></a></li>
							<li class="region1"><a href="javascript:exe(33,1,3)"> <span class="region_a chungcheong">충북</span></a></li>
							<li class="region1"><a href="javascript:exe(34,1,3)"> <span class="region_a chungnam">충남</span></a></li>
							<li class="region1"><a href="javascript:exe(35,1,3)"> <span class="region_a jeollabuk">전북</span></a></li>
							<li class="region1"><a href="javascript:exe(36,1,3)"> <span class="region_a jeolanam">전남</span></a></li>
							<li class="region1"><a href="javascript:exe(37,1,3)"> <span class="region_a jeollabuk">경북</span></a></li>
							<li class="region1"><a href="javascript:exe(38,1,3)"> <span class="region_a jeollabuk">경남</span></a></li>
							<li class="region1"><a href="javascript:exe(39,1,3)"> <span class="region_a jeollabuk">제주</span></a></li>
						</ul>
					</div>
			
					<div id=tabImg>
						<ul class="bookListSize">
				
<%-- 					<c:set var="doneLoop" value="true"/>
						
					<c:forEach var = "i" begin="1" end="12" step="1">
						<c:if test="${doneLoop eq 'true'}">
						
							<c:set var="num" value="${((nowPage-1)*blockList+i)}"/>	
						
								<c:if test="${num >=100}">
									<c:set var="doneLoop" value="false"/>
								</c:if>
							
						 <li class="bookList">
							<a href="#" class="imageStyle"> 
								
								<label>${num}</label>
								<img src="${pageContext.request.contextPath}/images/to${num}.PNG" class="imageSize"/>
								<span class=" fontStyle">골든아워 </span>
							</a> 
						</li>
						</c:if>
					</c:forEach> --%>
				</ul>
			</div> <!-- 이미지가 들어간 탭사이즈 -->
	
			<!-- 페이징 -->
			<div id="pageCode1"></div>											      					      	      
		</div>
	<!-- 첫번째 탭 끝!!!! -->
	
	
				<!-- 두번째 탭 시작!!! -->
				<div id="t2">
					<div class="region_div">
						<ul id="menu2">
							<li class="region2 total"><a href="javascript:exe(null,1,4)"> <span class="region_a">전체</span></a></li>
							<li class="region2"><a href="javascript:exe(0,1,4)"> <span class="region_a seoul">영유아</span></a></li>
							<li class="region2"><a href="javascript:exe(6,1,4)"> <span class="region_a busan">유아</span></a></li>
							<li class="region2"><a href="javascript:exe(8,1,4)"> <span class="region_a daegu">초등</span></a></li>
							<li class="region2"><a href="javascript:exe(14,1,4)"> <span class="region_a incheon">청소년</span></a></li>
							<li class="region2"><a href="javascript:exe(20,1,4)"> <span class="region_a gwangju">20대</span></a></li>
							<li class="region2"><a href="javascript:exe(30,1,4)"> <span class="region_a daejeon">30대</span></a></li>
							<li class="region2"><a href="javascript:exe(40,1,4)"> <span class="region_a ulsan">40대</span></a></li>
							<li class="region2"><a href="javascript:exe(50,1,4)"> <span class="region_a sejong">50대</span></a></li>
							<li class="region2"><a href="javascript:exe(60,1,4)"> <span class="region_a gyeonggi">60대 이상</span></a></li>
						</ul>
					</div>
						
					<div id=tabImg>
						<ul class="bookListSize"></ul>
					</div> <!-- 이미지가 들어간 탭사이즈 -->
							
					<!-- 페이징 -->
					<div id="pageCode2"></div>
				</div><!-- 두번째 탭 끝!!! -->
		
		
		
				<!-- 세번째 탭 시작!!! -->	
				<div id="t3">
					<div class="region_div">
						<ul id="menu3">
							<li class="region3 total"><a href="javascript:exe(null,1,0)"> <span class="region_a3">전체</span></a></li>
							<li class="region3"><a href="javascript:exe(0,1,0)"> <span class="region_a3">영유아(남)</span></a></li>
							<li class="region3"><a href="javascript:exe(0,1,1)"> <span class="region_a3">영유아(여)</span></a></li>
							<li class="region3"><a href="javascript:exe(6,1,0)"> <span class="region_a3">유아(남)</span></a></li>
							<li class="region3"><a href="javascript:exe(6,1,1)"> <span class="region_a3">유아(여)</span></a></li>
							<li class="region3"><a href="javascript:exe(8,1,0)"> <span class="region_a3">초등(남)</span></a></li>
							<li class="region3"><a href="javascript:exe(8,1,1)"> <span class="region_a3">초등(여)</span></a></li>
							<li class="region3"><a href="javascript:exe(14,1,0)"> <span class="region_a3">청소년(남)</span></a></li>
							<li class="region3"><a href="javascript:exe(14,1,1)"> <span class="region_a3">청소년(여)</span></a></li>
							<li class="region3"><a href="javascript:exe(20,1,0)"> <span class="region_a3">20대(남)</span></a></li>
							<li class="region3"><a href="javascript:exe(20,1,1)"> <span class="region_a3">20대(여)</span></a></li>
							<li class="region3"><a href="javascript:exe(30,1,0)"> <span class="region_a3">30대(남)</span></a></li>
							<li class="region3"><a href="javascript:exe(30,1,1)"> <span class="region_a3">30대(여)</span></a></li>
							<li class="region3"><a href="javascript:exe(40,1,0)"> <span class="region_a3">40대(남)</span></a></li>
							<li class="region3"><a href="javascript:exe(40,1,1)"> <span class="region_a3">40대(여)</span></a></li>
							<li class="region3"><a href="javascript:exe(50,1,0)"> <span class="region_a3">50대(남)</span></a></li>
							<li class="region3"><a href="javascript:exe(50,1,1)"> <span class="region_a3">50대(여)</span></a></li>
							<li class="region3"><a href="javascript:exe(60,1,0)"> <span class="region_a3">60대 이상(남)</span></a></li>
							<li class="region3"><a href="javascript:exe(60,1,1)"> <span class="region_a3">60대 이상(여)</span></a></li>
						</ul>
					</div>
				
					<div id=tabImg>
						<ul class="bookListSize"></ul>
					</div> <!-- 이미지가 들어간 탭사이즈 -->
								
					<!-- 페이징 -->
					<div id="pageCode3"></div>
				</div>	<!-- 세번째 탭 끝!! -->
		 	
			</div>
		</div>
	</form>

	  
	  <jsp:include page="footer.jsp"></jsp:include> 
	
	 <script src="${pageContext.request.contextPath}/lib/js/jquery-3.3.1.min.js"></script>
	 <script src="${pageContext.request.contextPath}/lib/js/jquery-ui.min.js"></script>  <!-- ui는 위의 core가 있어야 움직이므로 두개의 js파일의 순서가 바뀌면 안됨! -->
	
	<script type="text/javascript">
	
		$(function(){
			//jQuery시작부분!
		/* 	$("#btn1").button(); */
			
			$("#tab").tabs({collapsible: true});
				
			exe(null,1,3); //popular_book을 처음 실행 시키자 마자 전국의 데이터가 보인다.
			
			$("li").each(function(){ 
				$('.total').addClass("selected");
			});
			
			$("#tab1").click(function(){ //전국 탭을 눌렀을 때 전체 데이터 	

				exe(null,1,3);
	 			$("li").each(function(){	
	 					$("li").removeClass("selected");
						$('.total').addClass("selected");
					});	 
				});
			
			$("#tab2").click(function(){ //연령별 탭을 눌렀을 때 전체 데이터
				exe(null,1,4);	
				$("li").each(function(){
						$("li").removeClass("selected");
						$('.total').addClass("selected");
					});
				});
			
			$("#tab3").click(function(){ //성별 탭을 눌렀을 때 전체 데이터
				exe(null,1,0);
				$("li").each(function(){
						$('.total').removeClass("selected");
						$('.total').addClass("selected");
					});
				});
			});
		

		function test(n){ //탭을 눌렀을 때 css
			
			$(".tab_color span").css("color","#555");
			var t = document.getElementById(n);
			t.style.color = "#6B9900";
		}
		
		function exe(value,np,value2){
			
			var pageCode = null;
			
			if(value2 == "3") //value2의 값이 '3'이면 첫번째 탭(지역)의 페이지를 
				pageCode = document.getElementById("pageCode1");
			else if(value2 == "4")
				pageCode = document.getElementById("pageCode2");
			else
				pageCode = document.getElementById("pageCode3");
			
		
			//각 탭별 상세버튼을 클릭하면, 클릭한 곳에서만 selected 클래스가 적용되는 부분.
 			$("div.region_div li").each(function(){ 
				$(this).click(function(){
					$("li").removeClass("selected"); //이전에 눌러져 있던 class는 지우고
					$(this).addClass("selected"); //새로 누른 클래스에 적용된다.
				});
			});  
				
			
			//console.log("aaaa");
			var param = "";
			if(value != null && value2 != null){
				param += "value="+encodeURIComponent(value)+"&nowPage="+np+"&value2="+encodeURIComponent(value2);
			}else{
				param += "nowPage="+np+"&value2="+encodeURIComponent(value2);
			}
			
				$.ajax({
					url : "popular_book.inc",
					type : "POST",
					dataType : "json",
					data : param
					
		
				}).done(function(data){
					console.log(data);
					var str="";
					//console.log("페이지코드 : "+data.pageCode);
					
					$.each(data.b_list, function (index, item) { 
	
						//str += "<li class='bookList'><a href='#' class='imageStyle'> <label>"+item.no+"</label><img src="+item.bookImageURL+" class='imageSize'/><span class=' fontStyle'>"+item.bookname+"</span></a></li>";
						str += "<li class='bookList'><a href='searchDetail.inc?isbn="+item.isbn13+"' class='imageStyle'> <label>"+item.no+"</label><img src="+item.bookImageURL+" class='imageSize'/><span class=' fontStyle'>"+item.bookname+"</span></a></li>";
						//console.log(str);
						
						if(item.no>=200) //no가 200위 까지만 나오게 한다.
							return false;
					})
	
					$(".bookListSize").html(str+"<li class='end'></li>");
						
					pageCode.innerHTML =data.pageCode; //페이징 코드
					
				}).fail(function(er){
					
				});
			}
		
	</script>
</body>
</html>