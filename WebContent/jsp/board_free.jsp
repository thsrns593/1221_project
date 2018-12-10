<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
					<div id="top_side">
						<div id="top_left">
							<select class="form-control">
								<option>전체</option>
								<option>공지</option>
								<option>잡담</option>
								<option>질문</option>
							</select>
						</div>
						<div id="top_right"><input type="button" class="btn btn-default" value="글쓰기" onclick="javascript:location.href='text_write.inc'"></div>
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
							<c:forEach items="${ar }" var="item" varStatus="st">
								<tr>
									<td>${item.nb_num}</td>
									<td>${item.nb_category }</td>
									<td>${item.m_id }</td>
									<td><a href="text_read.inc">${item.nb_title }</a></td>
									<td>${item.nb_cdate }</td>
									<td>${item.nb_hit }</td>
								</tr>
							</c:forEach>
							<c:if test="${empty ar}">
								<tr>
									<td bgcolor="#F2F7F9" colspan="5" height="70" align="center">
									등록된 게시물이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<div class="col-lg-6" id="search_area">
						<div class="form-group" id="search_cate_area">
							<select id="search_cate" class="form-control">
								<option>글제목</option>
								<option>글내용</option>
								<option>글제목+글내용</option>
								<option>글쓴이</option>
							</select>
						</div>
						<div class="form-group input-group" id="search_word_area">
							<input id="search_word" class="form-control" name="search_word">
							<span class="input-group-btn" id="search_btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
					</div>
						${pageCode }
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
    
</body>
</html>