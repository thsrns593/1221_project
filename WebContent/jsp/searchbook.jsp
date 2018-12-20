<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>책 검색</title>

<style type="text/css">
#table1 {
	margin: auto;
}

.top-margin {
	margin-top: 10%;
}

.size {
	margin: 0;
	padding: 0;
}

.searchbutton {
	padding: 0;
	margin: 0;
}

.color {
	background-color: white;
}

.hide {
	display: none !important;
}

#placeholderbook {
	background-color: #298A08;
	color: white;
}

#content {
	margin: auto;
	padding: 0px;
	width: 1000px;
	height: auto;
	min-height: 655px;
}

table td, table tr{
	border: 1px solid gray;
	text-align: center;
}

.page_button {
	padding: 5px;
	display: inline-block;
}

.page_area {
	border: 1px solid #424242;
	border-radius: 5px;
	text-align: center;
	padding: 0;
}

.page_area a {
	color: #6E6E6E;
}

.page_disable {
	display: inline-block;
	color: #F4FA58;
}

.page_selected {
	font-size: 20px;
	font-weight: bold;
}
.imgrow{
	height: 175px;
	background: url("${pageContext.request.contextPath}/images/noimage.png");
	background-size: contain;
    background-repeat: no-repeat;
    background-size: 100% 100%;
	
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
						<form action="searchbook.inc" method="post" id="searchbookform">
							<input type="hidden" value="1" id="nowPage" name="nowPage"/>
							<input type="text" style="display: none;"/>
							<div>
								<label
									style="line-height: 100%; border: 1px solid #E0F8E0; background-color: #E0F8E0; color: gray; width: 70px; padding: 2px; font-size: 20px;">도서명</label>
								<input type="text" id="bookname" name="bookname"
									placeholder="도서명" size="110"> <span
									class="input-group-btn">
									<button type="button" onclick="searchbook(this.form)">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
						</form>
						<table style="border-collapse: collapse; border: 1px solid gray;">
							<colgroup>
								<col width="118px"/>
								<col width="350px" />
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
									<th>출판사</th>
								</tr>
							</thead>
							<tbody id="searchbody">
							</tbody>
						</table>

						<div id="pagearea" style="width: 924px;"></div>

					</div>
				</div>
			</div>

		</div>

		<a href="table.inc"></a>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>


	<script
		src="${pageContext.request.contextPath}/lib/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/lib/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/js/jquery-ui.min.js"></script>


	<script>
		$("#bookname").keydown(function(key) {
		
			var bookname =$("#bookname").val();
		
			if (key.keyCode == 13) {
				
				if(bookname.trim().length <1){
					alert("검색할 도서명을 입력해주세요");
					return;
				}
				
				searchbook(document.getElementById("searchbookform"));
	
			}

		});

		function searchbook(frm) {
			var bookname = frm.bookname.value;
			
			if(bookname.trim().length <1){
				alert("검색할 도서명을 입력해주세요");
				return;
			}

			$.ajax({
						url : "searchbook.inc",
						data : "bookname=" + frm.bookname.value+"&nowPage="+frm.nowPage.value,
						dataType : "json",
						type : "post"
					}).done(
							function(data) {
								//console.log(eval("("+data+")"));
								var json1 = eval("(" + data.booklist + ")");
								console.log(data.pagecode);
								str = "";
								for (var i = 0; i < json1.documents.length; i++) {

									str += "<tr><td class='imgrow'><img src='"+json1.documents[i].thumbnail+"'></td>";
									str += "<td><a href='searchDetail.inc?isbn="
											+ json1.documents[i].isbn + "'>"
											+ json1.documents[i].title
											+ "</a></td>";
									str += "<td>" + json1.documents[i].authors
											+ "</td>";
									str += "<td>" + json1.documents[i].isbn
											+ "</td>";
									str += "<td>"
											+ json1.documents[i].publisher
											+ "</td></tr>";
								}
								$("#searchbody").html(str);
								$("#pagearea").html(data.pagecode);

							}).fail(function() {
						console.log("실패!");
					});

		}
		
		function goPage(pg) {
			
			var page = pg;
			
			$("#nowPage").val(pg);
			
			searchbook(document.forms[0]);
		}
	</script>
</body>

</html>
