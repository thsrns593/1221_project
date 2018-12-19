<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<!--share css -->
    <style type="text/css">
    	#contents{
    		height: 600px !important;
    	}
    	#dataTable tbody a:hover,#dataTable tbody a:visited{
    		text-decoration: none;
    	}
    	#page_num_area {
    		width : 160px;
    		float: right;
    		text-align: center;
    	}
    	#search_area {
    		float:left;
    		width : 535px;
    	}
    	#search_cate_area{
    		display: inline-block;
    	}
    	#search_word_area{
    		display: inline-block;
    	}
    	#search_cate_area {
    		display: inline-block;
    		width : 200px;
    	}
    	#search_word_area {
    		display: inline-block;
    		width : 300px;
    	}
    	#search_word {
    		display:inline-block;
    		width:250px;
    	}
    	#top_left {
    		float:left;
    		padding-bottom:10px;
    	}
    	#top_right{
    		float:right;
    		padding-bottom:10px;
    	}
    	#contents {
    		width : 1800px;
    		margin-left: 190px;
    		height: 500px;
    	}
    	.page_button{
    		padding: 5px;
    		display: inline-block;
    	}
    	.page_area {
    		border : 1px solid #dedede;
    		border-radius: 5px;
    		text-align: center;
    		padding : 0;
    	}
    	
    	.page_area a {
    		color : rgba(0,84,255);
    	}
    	.page_disable{
    		display: inline-block;
    		color : #ababab;
    	}
    	.page_selected{
    		font-size: 20px; 
    		font-weight: bold;
    	}
    	 
    </style>
	
</head>
<body>
	<jsp:include page="navigation.jsp"></jsp:include>
	<div id="contents">
		<div class="col-lg-8 col-lg-offset-2">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3>일반게시판</h3>
				</div>
				<div class="panel-body">
					<form action="board_free.inc" method="get">
						<div id="top_side">
							<div id="top_left">
							<%
								String cate = (String)request.getAttribute("cate");
								if(cate == null)
									cate ="";
							%>
								<select class="form-control" name="cate" onchange="sel()">
									<option <%if(cate.equals("") || cate.equals("전체")) {out.print(" selected='selected' ");} %>value="전체">전체</option>
									<option <%if(cate.equals("공지")) {out.print(" selected='selected' ");} %>value="공지">공지</option>
									<option <%if(cate.equals("잡담")) {out.print(" selected='selected' ");} %>value="잡담">잡담</option>
									<option <%if(cate.equals("질문")) {out.print(" selected='selected' ");} %>value="질문">질문</option>
								</select>
							</div>
							<c:if test="${sessionScope.m_id ne null }">
							<div id="top_right"><input type="button" class="btn btn-default" value="글쓰기" onclick="javascript:location.href='text_write.inc'"></div>
							</c:if>
						</div>
						<table class="table table-striped table-bordered table-hover" id="dataTable">
							<colgroup>
								<col width="5%">
								<col width="5%">
								<col width="10%">
								<col width="50%">
								<col width="20%">
								<col width="10%">
	
							</colgroup>
							<tbody>
								<tr>
									<th>번호</th>
									<th>분류</th>
									<th>글쓴이</th>
									<th>제목</th>
									<th>등록일</th>
									<th>조회수</th>
								</tr>
								<jsp:useBean id="today2" class="java.util.Date" />
								<fmt:formatDate var="today" value="${today2}" pattern="yyyy-MM-dd" />
								
								<c:forEach items="${ar }" var="item" varStatus="st">
									<tr>
										<td>${item.nb_num}</td>
										<td>${item.nb_category }</td>
										<td>
											<c:if test="${fn:contains(item.m_id,'@naver')}">
												<img src="${pageContext.request.contextPath}/images/naver_icon.png"></img>${fn:substring(item.m_id,0,fn:indexOf(item.m_id,'@')) }
											</c:if> 
											<c:if test="${!fn:contains(item.m_id,'@naver') }">
												${item.m_id }
											</c:if> 
										</td>
										<td><a href="text_read.inc?nowPage=${nowPage }&nb_num=${item.nb_num}">${item.nb_title }
										<c:if test="${item.nb_reply_count ne '0'}">
											[${item.nb_reply_count}]
										</c:if>
										</a></td>
										<td><c:if test="${fn:startsWith(item.nb_cdate,today) }">${fn:substring(item.nb_cdate,10,16) }</c:if> 
											<c:if test="${!fn:startsWith(item.nb_cdate,today) }">${fn:substring(item.nb_cdate,5,10) }</c:if>
										</td>
										<td>${item.nb_hit }</td>
									</tr>
								</c:forEach>
								<c:if test="${empty ar}">
									<tr>
										<td bgcolor="#F2F7F9" colspan="6" height="70" align="center">
										등록된 게시물이 없습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						<%
							String searchType = (String)request.getAttribute("searchType");
							String searchValue = (String)request.getAttribute("searchValue");
							if(searchType == null) 
								searchType ="";
							if(searchValue == null)
								searchValue="";
						%>
						<div class="col-lg-6" id="search_area">
							<div class="form-group" id="search_cate_area">
								<select id="search_cate" class="form-control" name="searchType">
									<option <%if(searchType.equals("0")) {out.print(" selected='selected' ");} %> value="0">글제목</option>
									<option <%if(searchType.equals("1")) {out.print(" selected='selected' ");} %>value="1">글내용</option>
									<option <%if(searchType.equals("2")) {out.print(" selected='selected' ");} %>value="2">글제목+글내용</option>
									<option <%if(searchType.equals("3")) {out.print(" selected='selected' ");} %>value="3">글쓴이</option>
								</select>
							</div>
							<div class="form-group input-group" id="search_word_area">
								<input id="search_word" class="form-control" name="searchValue" value="<%=searchValue%>">
								<span class="input-group-btn" id="search_btn">
									<button class="btn btn-default" type="button" onclick="search(this.form)">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
						</div>
							${pageCode }
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
    <script>
    	function sel() {
    		var cate =document.forms[0].cate.value;
    		location.href= "board_free.inc?cate="+cate;
    	}
    	function search(frm) {
    		frm.submit();
    	}
    </script>
</body>
</html>