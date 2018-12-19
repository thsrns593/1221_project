<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소개페이지</title>
<style type="text/css">

	.welcome{
		/* font-family: sans-serif; */
		font-family :sans-serif;
		text-align: center;
		font-weight: bolder;
	}
	.content_total{
		width : 1000px;
		margin: auto;	
		height : 850px;    	
	}
	
	.title{
		font-family: sans-serif;
		font-weight: bolder;
		font-size: 30px;
	}
	.book{
		width : 100%;
		height: 400px;
		
	}
	.text{
		font-family: sans-serif;
	}
	.bye{
		font-family :sans-serif;
		text-align: center;
		font-weight: bolder;
		font-size: 30px;
	}
	

</style>


    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
</head>
<body>

	<jsp:include page="navigation.jsp"></jsp:include>

    <div class="content_total">
 <%--    <h1 class="welcome">우리동네 도서관에 오신 것을 환영합니다.</h1>
    	<div>
    		<img src="${pageContext.request.contextPath}/images/book.jpg"   class="book"/>
    	</div>
		<div class="content">
		
		
			<h2 class="title">우리동네 도서관이란? </h2>
				<div class="text">
					우리동네 도서관은 내 주변 공공 도서관에 있는 자료를 검색해 볼 수 있는 사이트로 전국 849개 도서관에서 제공하는 정보를 통해<br/> 만들어 졌습니다.<br/>
					이와 같은 정보들은 오픈 API를 이용하였고, 추천도서목록, 인기도서목록,도서검색,게시판등의 서비스를 이용하실 수 있습니다.<br/>
					
					인기도서- 지역별, 연령별, 성별로 나누어 각 카테고리에 맞는 검색 결과를 대출횟수를 통한 순위로 매겨지며 API로 제공이 됩니다.<br/>
					도서검색- 찾고자 하는 책을 검색하게 되면 해당 도서의 정보들과 그 책을 소유하고 있는 도서관의 정보를 보여주게 됩니다.<br/>
					게시판 <br/>
						일반 게시판 - 공지사항, 잡담, 질문을 하는 게시판 입니다. <br/>
	
						책 게시판 - 책과 관련된 이야기를 할 수 있는 게시판 활발한 커뮤니케이션을 통해 책의 대한 평가, 자신이 읽지 않는책 나눔,
			   			 서로 교환, 대여를 할 수 있는 공간입니다.<br/>
			   		<br/>
			   		이 사이트를 통해 
					
				</div>	
		<br/>
		<br/>
		
			<h1 class="title">개설한 목적</h1>
				<div class="text">
					남녀노소 어른아이 불문하고 많은 사람들이 책을 보고 도서관을 이용합니다. <br/> 
					전국에 수많은 도서관이 있지만 자신이 찾고 싶은 책이 그 도서관에 있는지는 일일히 찾아봐야 하는 번거로움이 있습니다. <br/>
					그러한 불편함을 해소하기 위해 지역설정을 기준으로 찾고자 하는 책을 한 번에 찾을 수 있게 하기 위해 이 홈페이지를 개설하게 되었습니다. <br/>
				</div>
			<br/>
			
				<div class="bye">많은 이용 바랍니다.</div>
		</div>	 --%>
		
		
		<img src ="${pageContext.request.contextPath}/images/instru.PNG"/>
	</div>	

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>