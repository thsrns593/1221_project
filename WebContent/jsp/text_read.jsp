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
				<br /> <label id="nreplynum">댓글수 : ${replycount }</label>
				<input type="button" id="listbtn" onclick="replyopen()" value="댓글보기"></input>
				<form action="nreply.inc" name="addnreply">

					<c:if test="${sessionScope.m_id ne null }">
						<input type="text" style="width: 800px;" id="nreply_content"
							name="nreply_content" />
						<button type="button" onclick="addreply()" style="width: 100px;">댓글달기</button>
						<input type="hidden" value="${vo.getNb_num() }" name="nb_num">
						<input type="hidden" value="${sessionScope.m_id}" name="m_id">
						<input type="hidden" value="" name="nreply_to">
					</c:if>

				</form>
				<c:if test="${sessionScope.m_id eq null}">
					<div>
						<input type="text" style="width: 800px;" placeholder="로그인 해주세요~"
							readonly="readonly" />
						<button type="button" style="width: 100px;">댓글달기</button>
					</div>
				</c:if>
				<div id="reinput" style="display: none;">
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
									<td><c:if test="${item.nreply_to ne null }">
											ㄴ${item.m_id }
										</c:if> <c:if test="${item.nreply_to eq null }">
											${item.m_id }
										</c:if> <c:if test="${item.nreply_to ne null }">
											--> ${item.nreply_to }
										</c:if> <c:if test="${item.nreply_status eq '0' }">
											 : ${item.nreply_content }
										</c:if> <c:if test="${item.nreply_status eq '1' }">
											 : 삭제된 댓글입니다.
										</c:if></td>
								</tr>
								<tr>
									<td><p>${item.nreply_cdate }</p></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br />
					<div style="height: 50px;"></div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript">
		function download(fname) {

			location.href = "FileDownload?dir=upload&filename="
					+ encodeURIComponent(fname);
			//위의 FileDownload는 서블릿이다.
		}

		function addreply() {

			var postvalue = $("form[name=addnreply]").serialize();

			$.ajax({
				type : "post",
				url : "nreply.inc",
				data : postvalue,
				dataType : 'text'
			}).done(function(data) {
				var list = data.split("#");
				var removeItem = "";
				list = jQuery.grep(list, function(value) {
					return value != removeItem;
				});

				console.log(list);
				var str = "";
				var a = 0;
				var br = "<tr><td> </td></tr><tr><td> </td></tr>";
				for (var i = 1; i < list.length - 1; i++) {
					var tr = "<tr><td>" + list[i] + "</td></tr>";

					str += tr;
					str += br;
					a = i;
					console.log(list.length);
				}
				$("#replybody").html(str);
				$("#nreplynum").text("댓글수 : " + a);
			}).fail(function(err) {
				console.log("실패" + err);
			});
			$("#nreply_content").val("");

		}
		function replyopen() {
			$("#reinput").toggle();
			
			var str = $("#listbtn").val();
			
			console.log(str);
			
			if(str =="댓글보기")
				$("#listbtn").val("댓글접기");
			else
				$("#listbtn").val("댓글보기");
		}
	</script>
</body>

</html>