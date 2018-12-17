<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>책 게시판</title>
<!--board_share css -->
<style type="text/css">
		#contents {
			height: 600px !important;
		}
    	#page_num_area {
    		text-align: right;
    	}
    	#dataTable tbody a,#dataTable tbody a:hover{
    		text-decoration: none;
    		color: rgba(0,120,205);
    	}
    	#dataTable tbody a:visited {
    		color:rgba(100,50,200);
    	}
    	#page_num_area {
    		float: right;
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
    		text-align: left;
    		padding : 0;
    	}
    	
    	.page_area a {
    		color : rgba(0,84,255);
    	}
    	.page_disable{
    		color : #ababab;
    	}
    	.page_selected{
    		font-size: 20px; 
    		font-weight: bold;
    	}
    	.noShow {
    		text-align: center;
    		font-weight: bold;
    		font-size: 20px;
    	}
    	
    </style>
<!--/share css -->
  </head>

  <body>
	<jsp:include page="navigation.jsp"></jsp:include>
    <!-- contents -->
	<div id="contents">
		<div class="col-lg-8 col-lg-offset-2">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3>책게시판</h3>
				</div>
				<div class="panel-body">
					<form action ="" method="get"> 
						<div id="top_side">
							<div id="top_left">
							<%
								String cate = (String)request.getAttribute("cate");
								if(cate == null)
									cate ="";
							%>
								<select class="form-control" onchange="sel(this.form)" name="cate">
									<option value="전체" <%if(cate.equals("") || cate.equals("전체")){out.print(" selected='selected' ");} %>>전체</option>
									<option value="평가" <%if(cate.equals("평가")){out.print(" selected='selected' ");} %>>평가</option>
									<option value="나눔" <%if(cate.equals("나눔")){out.print(" selected='selected' ");} %>>나눔</option>
									<option value="교환" <%if(cate.equals("교환")){out.print(" selected='selected' ");} %>>교환</option>
									<option value="대여" <%if(cate.equals("대여")){out.print(" selected='selected' ");} %>>대여</option>
								</select>
							</div>
							<div id="top_right"><input type="button" class="btn btn-default" value="글쓰기" onclick="javascript:location.href='writeBook.inc'"></div>
						</div>
						<table class="table table-striped table-bordered table-hover" id="dataTable">
							<colgroup>
								<col width ="5%">
								<col width="5%">
								<col width="25%">
								<col width="25%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>분류</th>
									<th>제목</th>
									<th>도서명</th>
									<th>저자</th>
									<th>글쓴이</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
							<jsp:useBean id="today2" class="java.util.Date" />
							<fmt:formatDate var="today" value="${today2}" pattern="yyyy-MM-dd" />
							<!-- bb_num,	bb_title, m_id, bb_category, bb_hit,bb_content,bb_bname, bb_author, bb_press,
	            bb_cdate, bb_edate, bb_ip,bb_status -->
								<c:if test="${ar !=null }">
									<c:forEach items="${ar }" var="item">
										<tr>
											<td>${item.bb_num }</td>
											<td>${item.bb_category }</td>
											<td><a href="javascript:goView(${item.bb_num })">${item.bb_title }</a>
												<c:if test="${item.bb_replyCount != null and item.bb_replyCount !=0 }">
													[${item.bb_replyCount }]
												</c:if>
											</td>
											<td>${item.bb_bname }</td>
											<td>${item.bb_author }</td>
											<td>${item.m_id }</td>
											<td><c:if test="${fn:startsWith(item.bb_cdate,today) }">${fn:substring(item.bb_cdate,10,16) }</c:if> 
												<c:if test="${!fn:startsWith(item.bb_cdate,today) }">${fn:substring(item.bb_cdate,5,10) }</c:if></td>
											<td>${item.bb_hit }</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty ar }">
									<tr>
										<td colspan="8" class="noShow">검색된 게시물이 없습니다</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						<div class="col-lg-6" id="search_area">
							<div class ="form-group" id="search_cate_area">
							<%
								String searchType = (String)request.getAttribute("searchType");
								if(searchType == null) 
									searchType ="";
							%>
								<select  id="search_cate" class="form-control" name="searchType" >
									<option value="0"<%if(searchType.equals("") || searchType.equals("0")) {out.print(" selected='selected' ");} %>>도서명</option>
									<option value="1"<%if(searchType.equals("1")) {out.print(" selected='selected' ");} %>>저자</option>
			                        <option value="2"<%if(searchType.equals("2")) {out.print(" selected='selected' ");} %>>글제목</option>
			                        <option value="3"<%if(searchType.equals("3")) {out.print(" selected='selected' ");} %>>글내용</option>
			                        <option value="4"<%if(searchType.equals("4")) {out.print(" selected='selected' ");} %>>글제목+글내용</option>
			                        <option value="5"<%if(searchType.equals("5")) {out.print(" selected='selected' ");} %>>글쓴이</option>
		                        </select>
	                        </div>
	                        <div class ="form-group input-group" id="search_word_area">
	                        	<input id="search_word" class="form-control" name="searchValue" value="${searchValue }">
	                        	<span class="input-group-btn" id="search_btn">
								<button class="btn btn-default" type="button" onclick ="search(this.form)"><i class="fa fa-search"></i></button>
								</span>
							</div>
	                    </div>
						${pageCode }
						<input on type="hidden" name="nowPage" value="${nowPage }">
						<input type="hidden" name="num" >
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /contents -->
    <jsp:include page="footer.jsp"></jsp:include>
    <script>
    	function goView(bb_num) {
    		var frm = document.forms[0];
    		frm.num.value=bb_num;
    		console.log(frm.num.value);
    		frm.action ="book_read.inc";
    		frm.method="post";
    		frm.submit();
    	}
    	function sel(frm) {
    		var cate =frm.cate.value;
    		location.href="board_share.inc?cate="+cate;
    	}
    	function search(frm) {
    		frm.action="board_share.inc";
    		frm.method ="post";
    		frm.submit();
    	}
    	function goPage(pg) {
    		var frm = document.forms[0];
    		frm.nowPage.value = pg;
    		console.log("nowPage :" +pg);
    		frm.action="board_share.inc";
    		frm.method ="post";
    		frm.submit();
    	}
    	
    </script>
  </body>

</html>
