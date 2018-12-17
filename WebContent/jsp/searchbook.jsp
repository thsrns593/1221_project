<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>책 검색</title>
    
    <style type="text/css">
    #table1{

     		margin: auto;
     	}
     	.top-margin{
			margin-top: 10%;
     	}
     	.size{
     		margin: 0;
     		padding: 0;
     	}
     	.searchbutton{
     		padding: 0;
     		margin: 0;
     		
     	}
     	.color{
     		background-color: white;
     	}
     	.hide{
     		display: none !important;
     	}
     	#placeholderbook{
     		background-color: #298A08;
     		color: white;
     		
     	}
     	#content{
     		margin: auto;
     		padding: 0px;
     		width: 1000px;
     		height: auto;
     		min-height: 655px;

     	}
     	table th, table tr {
     		border: 1px solid gray;
     	}
    </style>

  </head>

  <body>

    <jsp:include page="navigation.jsp"></jsp:include>

		<div class="row" id="content">  
                <div class="col-md-12">
			<div class="panel panel-danger top-margin">
				<div class="panel-heading">
					<div class="row">
						<div class="col-lg-12">
							<h1 class="">도서 검색</h1>
						</div>
						<!-- /.col-lg-12 -->
					</div>
				</div>
				<div class="">
					<div class="panel-body">
						<form action="">
							<div>
								<label style="line-height: 100%; border: 1px solid #E0F8E0; background-color: #E0F8E0; color: gray; width: 70px; padding: 2px; font-size: 20px;">도서명</label>
								<input type="text" id="bookname" placeholder="도서명" size="110">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button"
										onclick="javascript:location.href='table.inc'">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
							<div class="" id="menu1">
								<label style="line-height: 100%; border: 1px solid #E0F8E0; background-color: #E0F8E0; color: gray; width: 50px; padding: 2px; font-size: 20px;">지역</label>
								<select>
									<option>서울</option>
									<option>경기</option>
									<option>강원</option>
									<option>충청</option>
								</select> 
								<span>세부지역</span> 
								<select>
									<option>강남</option>
									<option>강북</option>
								</select>
							</div>	
						</form>
						<table style="border-collapse: collapse; border: 1px solid gray;">
							<colgroup>
								<col width="100px"/>
								<col width="350px"/>
								<col width="150px">
								<col width="150px">
								<col width="150px">
							</colgroup>
							<thead>
								<tr>
									<th>도서 이미지</th>   
									<th>도서 명</th>
									<th>저자</th>
									<th>ISBN</th>
									<th>도서관</th>
								</tr>
							</thead>
							<tbody id="searchbody">
								<tr>
									<td></td>
								</tr>
							</tbody>
						</table>
						<div >
						------	페이징 -----
						</div>
					</div>
				</div>
			</div>

		</div>
        

    </div>
   
   	<jsp:include page="footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/lib/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery-ui.min.js"></script>

	   
    <script>
    $(function(){


	});
   
    </script>
    
  </body>

</html>
