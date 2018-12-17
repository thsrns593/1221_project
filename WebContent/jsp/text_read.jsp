<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>일반게시물보기</title>


<style type="text/css">
#content {
	margin: auto;
	padding: 0px;
	width: 1000px;
	height: auto;
	min-height: 655px;
}

.formstyle {
	margin: auto;
	padding: 10px;
	width: auto;
	height: auto;
	border: 1px solid #2EFE64;
	border-radius: 5px;
}

.top-margin {
	margin-top: 10%;
}

#write {
	width: auto;
	height: 400px;
	min-width: 400px;
}

.textarea {
	height: 70%;
	width: 100%;
	border: 1;
	overflow: visible;
	text-overflow: ellipsis;
}

.min-size {
	min-width: 80px;
}

#d_id {
	width: 100px;
	height: 20px;
}

#d_text {
	width: auto;
	height: 20px;
}

.bts {
	float: right;
	width: 80px;
}

.titlebox {
	display: inline-block;
	width: 700px;
	height: 50px;
}

#imagediv {
	float: left;
	margin: 10px;
	padding: 0;
	width: 450px;
	height: 200px;
	border: 1px solid gray;
	border-radius: 5px;
	margin: auto;
	padding: 0;
}

#textdiv {
	float: left;
	margin: 0;
	padding: auto;
	width: 450px;
	height: 200px;
	border: 1px solid gray;
	border-radius: 5px;
	margin: auto;
	padding: 0;
}

#textdiv div {
	margin-left: 30px;
}

.bookinfo {
	width: 350px;
	border-radius: 5px;
}

.writerinfo {
	margin: auto;
	border-radius: 5px;
	text-align: center;
}

#replybody td {
	width: 1200px;
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


</style>

</head>

<body>

	<jsp:include page="navigation.jsp"></jsp:include>
	<div class="row" id="content">
		<div class="col-md-12">
			<div class="panel-heading">
				<div class="row">
					<div class="bts titlebox">
						<h1 class="">일반게시판읽기</h1>
					</div>
					<div class="panel-footer">
						<p>
							<c:if test="${sessionScope.m_id eq vo.getM_id() }">
								<button type="button" class="btn btn-outline btn-success bts"
									onclick="javascript:location.href='board_free.inc?nowPage=${param.nowPage}'">돌아가기</button>
								<button type="button" class="btn btn-outline btn-warning bts"
 									onclick="javascript:location.href='text_del.inc?nb_num=${param.nb_num}'">삭제</button>
								<button type="button" class="btn btn-outline btn-info bts"
									onclick="javascript:location.href='text_edit.inc?nb_num=${param.nb_num}&nowPage=${param.nowPage}'">수정</button>
							</c:if>
							<c:if test="${sessionScope.m_id ne vo.getM_id() }">
								<button type="button" class="btn btn-outline btn-success bts"
									style="float: right;"
									onclick="javascript:location.href='board_free.inc?nowPage=${param.nowPage}'">돌아가기</button>
							</c:if>

						</p>
					</div>
					<!-- /.col-lg-12 -->
				</div>
			</div>
			<div class="formstyle">
				<div>
					<input type="text" size="5px" value="${vo.getNb_category() }"
						readonly="readonly" style="text-align: center;" /> <input
						type="text" size="120px" style="margin-bottom: 10px;"
						value="${vo.getNb_title() }" readonly="readonly" />
				</div>

				<table>
					<tfoot>
						<tr>
							<td height="10px;">
						</tr>
						<tr>
							<td colspan="5"><textarea rows="10px" cols="132px"
									readonly="readonly">${vo.getNb_content() }</textarea></td>
						</tr>
						<tr>
							<td>
								<div>
									첨부파일 : <a href="javascript:download('${vo.getNb_fname()}')">
										${vo.getNb_oname()} </a>
								</div>
							</td>
						</tr>               
					</tfoot>
				</table>
				<span><label>글쓴이:</label><input class="writerinfo"
					type="text" value="${vo.getM_id() }" readonly="readonly" /></span> <span><label>작성일</label><input
					class="writerinfo" type="text" value="${vo.getNb_cdate() }"
					readonly="readonly" /></span> <span><label>조회수:</label><input
					class="writerinfo" type="text" value="${vo.getNb_hit() }"
					readonly="readonly" /></span>
			</div>
			<div class="col-md-12">
				<br /> <label id="nreplynum">댓글수 : ${nrreplycount }</label>
				<form action="nreply.inc" name="addnreply">

					<c:if test="${sessionScope.m_id ne null }">
						<input type="text" style="width: 800px;" id="nreply_content"
							name="nreply_content" />
						<button type="button" onclick="goPage(1)" style="width: 100px;">댓글달기</button>
						<input type="hidden" value="${vo.getNb_num() }" name="nb_num">
						<input type="hidden" value="${sessionScope.m_id}" name="m_id">

					</c:if>
				</form>
				<div style="height: 30px;"></div>
				<c:if test="${sessionScope.m_id eq null}">
					<div>
						<input type="text" style="width: 800px;" placeholder="로그인 해주세요~"
							readonly="readonly" />
						<button type="button" style="width: 100px;">댓글달기</button>
					</div>
				</c:if>
				<div id="reinput">
					<table id="reply_table">
						<tbody id="replybody" style="background-color: #F2F2F2;">
							<c:if test="${nreplyar eq null }">
								<tr>
									<td>
										<h5>등록된 댓글이 없어요</h5>
									</td>
								</tr>
							</c:if>
							<c:forEach items="${nreplyar}" var="item">
								<tr>
									<td>
										<c:if test="${item.nreply_to eq null }">
											<button type="button" class="button"
												onclick="newreplybox(this)"
												value="${item.m_id},${item.nreply_group}" id="${item.m_id}">
												${item.m_id }
											</button>
										</c:if>
										<c:if test="${item.nreply_to ne null }">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<label > ${item.m_id } </label> 
										</c:if>
										 ${item.nreply_cdate } 
										<input type="hidden" value="${item.nreply_group}" id="nreply_group"> <input type="hidden" value="${item.m_id}" id="m_id">
									</td>
								</tr>
								<tr>
									<c:if test="${item.nreply_to ne null }">
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<c:if test="${item.nreply_status eq '0' }"> &nbsp;&nbsp;${item.nreply_content } <c:if test="${sessionScope.m_id == item.m_id}"> <button type="button" onclick="nreply_status(this)" value="${item.nreply_num }" >삭제</button> </c:if>
											</c:if> <c:if test="${item.nreply_status eq '1' }">
												  삭제된 글입니다.
											</c:if>
											</td>

									</c:if>
									<c:if test="${item.nreply_to eq null }">
										<td>&nbsp;&nbsp;<c:if
												test="${item.nreply_status eq '0' }">
												  &nbsp;&nbsp;${item.nreply_content }  <c:if test="${sessionScope.m_id == item.m_id}"> <button type="button" onclick="nreply_status(this)" value="${item.nreply_num }" >삭제</button> </c:if>
											</c:if> <c:if test="${item.nreply_status eq '1' }">
												 삭제된 글입니다.
											</c:if></td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div id="nrpageCode">${nrpageCode }</div>
					<br />
					<div style="height: 50px;"></div>
				</div>

			</div>
		</div>
	</div> 

	<jsp:include page="footer.jsp"></jsp:include>

	<form action="nreply.inc" name="addnreply2">

		<c:if test="${sessionScope.m_id ne null }">
			<input type="hidden" value="${vo.getNb_num() }" name="nb_num"
				id="nb_num1">
			<input type="hidden" value="${sessionScope.m_id}" name="m_id"
				id="m_id1">
			<input type="hidden" value="" name="nreply_to" id="nreply_to1">
			<input type="hidden" value="" name="nreply_group" id="nreply_group1">
			<input type="hidden" value="" name="nreply_num" id="nreply_num1">
		</c:if>
	</form>  

	<script type="text/javascript">
	
		function nreply_status(a) {
			
			var  nreply_num = $(a).val();
			
			$("#nreply_num1").val(nreply_num);
			
			console.log(nreply_num);
			
			goPage3(1);
			
		}
		
		function download(fname) {

			location.href = "FileDownload?dir=upload&filename="
					+ encodeURIComponent(fname);
			//위의 FileDownload는 서블릿이다.
		}

		function goPage(pg) {
			var postvalue = $("form[name=addnreply]").serialize();
			var nb_num = $("#nrnb_num").val();
			$.ajax({
						type : "get",
						url : "nreply.inc?nowPage=" + pg + "&" + postvalue,
						dataType : 'text'
					}).done( 
							function(data) {
								var list = data.split("#");
								var removeItem = "";
								list = jQuery.grep(list, function(value) {
									return value != removeItem;
								});

								var str = "";
								var a = 0;

								for (var i = 1; i < list.length - 1; i++) {
									var ar = list[i].split("@");
									var removeItem = "";
									ar = jQuery.grep(ar, function(value) {
										return value != removeItem;
									});
									if($.inArray("1", ar) != -1){
										ar[3] = "삭제된 글입니다.";
										}
									if (ar[1] != "null")
										str += "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>" + ar[0] + "</label>";
									if ((ar[1] == "null"))
										str += "<tr><td><button type='button' class='button' onclick='newreplybox(this)' value='"+ ar[0]+ ","+ ar[4]+ "'>"+ ar[0] + "</button>";

									str += "&nbsp;" + ar[2] + "</td></tr>";
									
									if (ar[1] != "null")
									str += "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + ar[3]; 
									if ((ar[1] == "null"))
									str += "<tr><td>&nbsp;&nbsp;&nbsp;" + ar[3]; 
									
									if($.inArray("삭제된 글입니다.", ar) == -1){
										if($.inArray("<%=(String)session.getAttribute("m_id")%>", ar) != -1){
											str += "<button type='button' onclick='nreply_status(this)' value='"+ar[5]+"' >삭제</button>" +"</td></tr>";
	
											}
										}

								}

								$("#replybody").html(str);

								var pageCode = data.split("!");
								pageCode = jQuery.grep(pageCode,
										function(value) {
											return value != removeItem;
										});
								$("#nrpageCode").html(pageCode[1]);
								var count = data.split("^");
								count = jQuery.grep(count, function(value) {
									return value != removeItem;
								});
								$("#nreplynum").text("댓글수 : " + count[1]);
							}).fail(function(err) {
						console.log("실패" + err);
					});
			$("#nreply_content").val("");

		}

		function newreplybox(a) {

			var list = $(a).val();
			list = list.split(",");
			var removeItem = "";
			list = jQuery.grep(list, function(value) {
				return value != removeItem;
			});
			var nreply_group = list[1];
			var nreply_to = list[0];

			$("#nreply_to1").val(nreply_to);
			$("#nreply_group1").val(nreply_group);

			$("#nreply_content2").remove();
			$("#nreply_content2").next().remove();
//			$(a).remove();
/* 			$(a).closest("tr").close.next().after("<label style='color: #0101DF;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --> "+nreply_to+ " 님에게</label><input type='text' style='width: 600px;' id='nreply_content2'name='nreply_content2'/> <button type='button' onclick='goPage2(1)' style='width: 100px;'>댓글달기</button>");
 */			
 
 
 			var flage = true;
 
 			if(flage){
 				$("#newinputtd").remove();
 				$(a).closest("tr").next().after("<td id='newinputtd'><label style='color: #0101DF;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --> "+nreply_to+ " 님에게</label><input type='text' style='width: 600px;' id='nreply_content2'name='nreply_content2'/> <button type='button' onclick='goPage2(1)' style='width: 100px;'>댓글달기</button></td>");
 				flage = false;
 			}else{
 				$("#newinputtd").remove();
 				flage = true;
 			}
 			
			

		}
		function goPage2(pg) {

			var postvalue = $("form[name=addnreply2]").serialize();
			var nreply_content = $("#nreply_content2").val();

			$.ajax(
							{
								type : "get",
								url : "nreply2.inc?nowPage=" + pg + "&"+ postvalue + "&nreply_content="+ nreply_content,
								dataType : 'text'
							}).done(
							function(data) {
								var list = data.split("#");
								var removeItem = "";
								list = jQuery.grep(list, function(value) {
									return value != removeItem;
								});

								var str = "";
								var a = 0;

								for (var i = 1; i < list.length - 1; i++) {
									var ar = list[i].split("@");
									var removeItem = "";
									ar = jQuery.grep(ar, function(value) {
										return value != removeItem;
									});
									if($.inArray("1", ar) != -1){
										ar[3] = "삭제된 글입니다.";
										}
									if (ar[1] != "null")
										str += "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>" + ar[0] + "</label>";
									if ((ar[1] == "null"))
										str += "<tr><td><button type='button' class='button' onclick='newreplybox(this)' value='"+ ar[0]+ ","+ ar[4]+ "'>"+ ar[0] + "</button>";

									str += "&nbsp;" + ar[2] + "</td></tr>";

									if (ar[1] != "null")
										str += "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + ar[3]; 
									if ((ar[1] == "null"))
										str += "<tr><td>&nbsp;&nbsp;&nbsp;" + ar[3]; 
									
									if($.inArray("삭제된 글입니다.", ar) == -1){
										if($.inArray("<%=(String)session.getAttribute("m_id")%>", ar) != -1){
											str += "<button type='button' onclick='nreply_status(this)' value='"+ar[5]+"' >삭제</button>" +"</td></tr>";
	
											}
										}

								}
								$("#replybody").html(str);

								var pageCode = data.split("!");
								pageCode = jQuery.grep(pageCode,
										function(value) {
											return value != removeItem;
										});
								$("#nrpageCode").html(pageCode[1]);
								var count = data.split("^");
								count = jQuery.grep(count, function(value) {
									return value != removeItem;
								});
								$("#nreplynum").text("댓글수 : " + count[1]);
							}).fail(function(err) {
						console.log("실패" + err);
					});
			$("#nreply_content").val("");

		}
		function goPage3(pg) {

			var postvalue = $("form[name=addnreply2]").serialize();
			var nreply_content = $("#nreply_content2").val();

			$.ajax(
							{
								type : "get",
								url : "nreply3.inc?nowPage=" + pg + "&"+ postvalue + "&nreply_content="+ nreply_content,
								dataType : 'text'
							}).done(
							function(data) {
								var list = data.split("#");
								var removeItem = "";
								list = jQuery.grep(list, function(value) {
									return value != removeItem;
								});

								var str = "";
								var a = 0;

								for (var i = 1; i < list.length - 1; i++) {
									var ar = list[i].split("@");
									var removeItem = "";
									ar = jQuery.grep(ar, function(value) {
										return value != removeItem;
									});
									if($.inArray("1", ar) != -1){
										ar[3] = "삭제된 글입니다.";
										}
									if (ar[1] != "null")
										str += "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>" + ar[0] + "</label>";
									if ((ar[1] == "null"))
										str += "<tr><td><button type='button' class='button' onclick='newreplybox(this)' value='"+ ar[0]+ ","+ ar[4]+ "'>"+ ar[0] + "</button>";

									str += "&nbsp;" + ar[2] + "</td></tr>";

									if (ar[1] != "null")
									str += "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + ar[3]; 
									if ((ar[1] == "null"))
									str += "<tr><td>&nbsp;&nbsp;&nbsp;" + ar[3]; 
									
									if($.inArray("삭제된 글입니다.", ar) == -1){
										if($.inArray("<%=(String)session.getAttribute("m_id")%>", ar) != -1){
											str += "<button type='button' onclick='nreply_status(this)' value='"+ar[5]+"' >삭제</button>" +"</td></tr>";
	
											}
										}

								}
								$("#replybody").html(str);

								var pageCode = data.split("!");
								pageCode = jQuery.grep(pageCode,
										function(value) {
											return value != removeItem;
										});
								$("#nrpageCode").html(pageCode[1]);
								var count = data.split("^");
								count = jQuery.grep(count, function(value) {
									return value != removeItem;
								});
								$("#nreplynum").text("댓글수 : " + count[1]);
							}).fail(function(err) {
						console.log("실패" + err);
					});
			$("#nreply_content").val("");

		}
	</script>
</body>

</html>