<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	#page_num_area {
    		text-align: right;
    	}
    	#dataTable tbody a:hover,#dataTable tbody a:visited{
    		text-decoration: none;
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
					<div id="top_side">
						<div id="top_left">
							<select class="form-control">
								<option>전체</option>
								<option>평가</option>
								<option>나눔</option>
								<option>교환</option>
								<option>대여</option>
							</select>
						</div>
						<div id="top_right"><input type="button" class="btn btn-default" value="글쓰기" onclick="javascript:location.href='book_write.inc'"></div>
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
						<tbody>
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
							<tr>
								<td>1</td>
								<td>평가</td>
								<td><a href="book_read.inc">해리포터 후기</a></td>
								<td>해리포터</td>
								<td>J.K.롤링</td>
								<td>사용자1</td>
								<td>11/7</td>
								<td>20</td>
							</tr>
							<tr>
								<td>2</td>
								<td>나눔</td>
								<td><a href="#">해리포터 나눔해요</a></td>
								<td>해리포터</td>
								<td>J.K.롤링</td>
								<td>사용자2</td>
								<td>11/8</td>
								<td>200</td>
							</tr>
							<tr>
								<td>3</td>
								<td>교환</td>
								<td><a href="#">해리포터랑 책2 바꾸실분</a></td>
								<td>해리포터</td>
								<td>J.K.롤링</td>
								<td>사용자3</td>
								<td>11/6</td>
								<td>20</td>
							</tr>
							<tr>
								<td>4</td>
								<td>대여</td>
								<td><a href="#">해리포터 빌려드려요</a></td>
								<td>해리포터</td>
								<td>J.K.롤링</td>
								<td>사용자4</td>
								<td>11/3</td>
								<td>20</td>
							</tr>
							
						</tbody>
					</table>
					<div class="col-lg-6" id="search_area">
						<div class ="form-group" id="search_cate_area">
							<select  id="search_cate" class="form-control">
								<option>도서명</option>
								<option>저자</option>
		                        <option>글제목</option>
		                        <option>글내용</option>
		                        <option>글제목+글내용</option>
		                        <option>글쓴이</option>
	                        </select>
                        </div>
                        <div class ="form-group input-group" id="search_word_area">
                        	<input id="search_word" class="form-control" name="search_word">
                        	<span class="input-group-btn" id="search_btn">
							<button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
							</span>
						</div>
                    </div>
					<div id="page_num_area">
						<ul class="page_area">
							<li class="page_button page_disable" id="previous_btn">이전</li>
							<li class="page_button page_selected"><a href="#">1</a></li>
							<li class="page_button" ><a href="#">2</a></li>
							<li class="page_button" ><a href="#">3</a></li>
							<li class="page_button" ><a href="#">4</a></li>
							<li class="page_button" ><a href="#">5</a></li>
							<li class="page_button" id="next_btn"><a href="#">다음</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /contents -->
    <jsp:include page="footer.jsp"></jsp:include>
    
  </body>

</html>
