<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<div id="top_right"><input type="button" class="btn btn-default" value="글쓰기" onclick="javascript:location.href='tw.inc'"></div>
					</div>
					<table class="table table-striped table-bordered table-hover" id="dataTable">
						<colgroup>
							<col width="5%">
							<col width="5%">
							<col width="40%">
							<col width="10%">
							<col width="10%">
							<col width="8%">
							<col width="6%">
							<col width="6%">
						</colgroup>
						<tbody>
							<tr>
								<th>번호</th>
								<th>분류</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>등록일</th>
								<th>조회수</th>
								<th>추천</th>
								<th>비추</th>
							</tr>
							<tr>
								<td>1</td>
								<td>공지</td>
								<td><a href="#">공지입니다</a></td>
								<td>관리자</td>
								<td>11/7</td>
								<td>510</td>
								<td>20</td>
								<td>3</td>
							</tr>
							<tr>
								<td>2</td>
								<td>잡담</td>
								<td><a href="#">아무글이나 쓰는곳</a></td>
								<td>사용자</td>
								<td>11/7</td>
								<td>13</td>
								<td>3</td>
								<td>10</td>
							</tr>
							<tr>
								<td>3</td>
								<td>질문</td>
								<td><a href="#">질문해도 되나요?</a></td>
								<td>다른사용자</td>
								<td>11/8</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
							</tr>
						</tbody>
					</table>
					<div class="col-lg-6" id="search_area">
						<div class ="form-group" id="search_cate_area">
							<select  id="search_cate" class="form-control">
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
	<jsp:include page="footer.jsp"></jsp:include>
    
</body>
</html>