<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소개페이지</title>
<style type="text/css">


	.content_total{
		width : 1000px;
		margin: auto;	
		height : 800px;    	
	}
	
	.title{
		font-family: sans-serif;
		font-weight: bolder;
		font-size: 40px;
	}
	.book{
		width : 100%;
		height: 400px;
		
	}
	.text{
		font-family: sans-serif;
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
    	<div>
    		<img src="${pageContext.request.contextPath}/images/book.jpg"   class="book"/>
    	</div>
		<div class="content">
		
			<h1 class="title">우리동네 도서관? </h1>
				<div class="text">
					우리동네 도서관은 내 주변 공공 도서관에 있는 자료를 검색해 볼 수 있는 사이트입니다.<br/>
					지역, 성별, 연령대 별로 카테고리를 선택해 그에 해당하는 자료를  
					또한, 다양한 활발한 게시판을 통해 서로 책과 관련된 소통을 할 수도 있으며 소통을 통해 책도 교환 할 수 있습니다. 
				</div>	
		<br/>
		<br/>
		
			<h1 class="title">개설한 목적</h1>
				<div class="text">
					전국에 수많은 도서관이 있지만 자신이 찾고 싶은 책이 그 도서관에 있는지는 일일히 찾아봐야 하는 번거로움이 
					있습니다. <br/>
					그러한 불편함을 해소하기 위해 지역 설정과 찾고자 하는 책을 입력 하기만 하면 그 책이 있는, 나와 가장 가까운
					도서관 부터 나타내 주게 됩니다. 
				</div>
			<br/>
		</div>	
	</div>	

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>