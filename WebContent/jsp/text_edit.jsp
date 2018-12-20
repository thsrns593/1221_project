<%@page import="mybatis.vo.NormalVO"%>
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
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
<title>일반게시판수정</title>


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
	border: 1px solid #5882FA;
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
.btss{
	margin-bottom: 30px;
   	}
.titlebox {
	display: inline-block;
	width: 900px;
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
	border-radius: 5px;
	text-align: center;
}
</style>

</head>

<body>
	<jsp:include page="navigation.jsp"></jsp:include>
	<c:if test="${vo ne null }">
		<div class="row" id="content">
			<div class="col-md-12">
				<div class="panel-heading">
					<div class="row">
						<div class="bts titlebox">
							<h1 class="">일반게시판수정</h1>
						</div>
						<div class="panel-footer">
							<p>
								<button type="button" class="btn btn-outline btn-success bts"
									onclick="javascript:location.href='text_read.inc?nb_num=${vo.getNb_num()}&nowPage=${param.nowPage}'">돌아가기</button>
							</p>
						</div>
						<!-- /.col-lg-12 -->
					</div>
				</div>
				<div class="">
					<div class="formstyle">
						<form action="" method="post" id="editform" name="editform">
							<div>
								<%
								NormalVO vo = (NormalVO)request.getAttribute("vo");
								String cate  = vo.getNb_category();
								if(cate == null)
									cate ="";
								%>
								<select name="nb_category">
									<option <%if(cate.equals("") || cate.equals("전체")) {out.print(" selected='selected' ");} %>value="전체">전체</option>
									<option <%if(cate.equals("공지")) {out.print(" selected='selected' ");} %>value="공지">공지</option>
									<option <%if(cate.equals("잡담")) {out.print(" selected='selected' ");} %>value="잡담">잡담</option>
									<option <%if(cate.equals("질문")) {out.print(" selected='selected' ");} %>value="질문">질문</option>
								</select>
								
								<input type="text" size="120px" style="margin-bottom: 10px;"
									value="${vo.getNb_title() }"  name="nb_title" id="nb_title"/>
							</div>
							<table>
								<tfoot>
									<tr>
										<td height="10px;">
									</tr>
									<tr>
										<td colspan="5"><textarea rows="10px" cols="132px" name="nb_content" id="nb_content">${vo.getNb_content() }</textarea>
										</td>
									</tr>
									<tr>
										<td><input value="첨부파일 : ${vo.getNb_oname() }"  readonly="readonly"/>
										</td>
									</tr>
								</tfoot>
							</table>
							<input type="hidden" value="${vo.getNb_num()}" name="nb_num"/>
						</form>
					</div>
				</div>
				<div class="">
					<p>
						<button type="button" class="btn btn-outline btn-info bts btss"
							onclick="editText()">수정</button>
					</p>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${vo eq null }">
		<h1>올바른 접근이 아닙니다!!</h1>  
	</c:if>


	<jsp:include page="footer.jsp"></jsp:include>


	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/lib/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="lib/js/jquery-ui.min.js"></script>
   	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
   	<script src="lib/js/summernote/lang/summernote-ko-KR.js"></script>
	<script type="text/javascript">
		function editText(){

	    		var nb_content= $("#nb_content").val();
	    		var nb_title= $("#nb_title").val();
	    		
	    		if(nb_title.trim().length <1 ){
	    			alert("제목을 입력해주세요");
	    			return; 
	    		}
	    		if(nb_title.trim().length >20){
	    			alert("20글자 미만으로 입력해주세요");
	    			return; 
	    		}
	    		
	    		if(nb_content.trim().length < 1){
	    			alert("내용을 입력해주세요");
	    			return; 
	    		}
	    		if(nb_content.trim().length > 100000){
	    			alert("10만자 이하로 입력해주세요");
	    			return; 
	    		}

	    	$("#writeform").submit();
			$("#editform").attr("action", "text_edit.inc");
			$("#editform").submit();
		}
		$(function() {
    		$("#nb_content").summernote({
                //placeholder: 'Hello stand alone ui',
			    toolbar: [
			        ['style', ['style']],
			        ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
			        ['fontface', ['fontname']],
			        ['textsize', ['fontsize']],
			        ['color', ['color']],
			        ['alignment', ['ul', 'ol', 'paragraph', 'lineheight']],
			        ['height', ['height']],
			        ['table', ['table']],
			        ['insert', ['link']]
			    ],
                  tabsize: 2,
                  lang: "ko-KR",
                  maxHeight: 500,
                  minHeight: 200,
                  height: 300,
                  maxWidth:950,
                  minWidth:950,
                  width:950,
                  focus: true,/* 커서를 미리 가져다 놓는다. */
             });
             
          });
	</script>



</body>

</html>