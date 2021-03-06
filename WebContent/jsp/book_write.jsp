<%@page import="mybatis.vo.BookVO"%>
<%@page import="spring.util.BoardUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
    <title>책 게시판 글쓰기</title>
	  
    <style type="text/css">

     	#content{
     		margin: auto;
     		padding: 0px;
     		width: 1000px;
     		height: auto;
     		min-height: 655px;

     	}
     	.formstyle{
     		margin: auto;
     		padding: 10px;
     		width: auto;
     		height: auto;
     		border: 1px solid #D7DF01;
     		border-radius: 5px;

     	}
     	.top-margin{
			margin-top: 10%;
     	}
     	#write{
     		width: auto;
     		height: 400px;
     		min-width: 400px;
     	}
     	.textarea{
     		height:70%;
     		width:100%;
     		border:1;
     		overflow:visible;
     		text-overflow:ellipsis;
     	}
     	.min-size{
     		min-width: 80px;
     	}
     	#d_id{
     		width: 100px;
     		height: 20px;

     	}
     	#d_text{
     		width: auto;
     		height: 20px;

     	}
     	.bts{
     		float: right;
     		 width: 80px;
     	}
     	.btss{
     		margin-bottom: 30px;
     	}
     	.titlebox{
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
			border-radius:5px;
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
			border-radius:5px;
			margin: auto;
			padding: 0;
		}
		
		#textdiv div {
			margin-left: 30px;
		}
		
		.bookinfo{
			width: 350px;
			border-radius: 5px;
		}
		.writerinfo{
			border-radius: 5px;
			text-align: center;
		} 

    </style>

  </head>

  <body>
	<jsp:include page="navigation.jsp"></jsp:include>
		<div class="row" id="content">  
                <div class="col-md-12" >
                  	<form action="${ac }" method="post">
                  	  <input type="hidden" name ="bb_num" value="${vo.bb_num}"/>
                      <div class="panel-heading">
                           <div class="row">
				                <div class="bts titlebox">
				                    <h1 class="">책게시판글쓰기</h1>
				                </div>
				                <div class="panel-footer">
	                            	<p>
		                                <button type="button" class="btn btn-outline btn-success bts"
		                                onclick="javascript:location.href='board_share.inc'">돌아가기</button>
	                            	</p>
                        		</div>
				                <!-- /.col-lg-12 -->
				            </div>
                        </div>
                        <div class="">
	                        <div class="formstyle">
	                        		<div>
	                        		
	                        			<select id="bb_category" name="bb_category">
	                        				<option value="평가">&nbsp;평가&nbsp;</option>
	                        				<option value="나눔">&nbsp;나눔&nbsp;</option>
	                        				<option value="교환">&nbsp;교환&nbsp;</option>
	                        				<option value="대여">&nbsp;대여&nbsp;</option>
	                        			</select>
	                        			<input name="bb_title" id="bb_title" type="text" size="120px" style="margin-bottom: 10px;" value="${vo.bb_title }"/>
	                        		</div>
									<div id="textdiv">
										<div><label>도서명:</label>&nbsp;<input name="bb_bname"  id="bb_bname" type="text" value="${vo.bb_bname }"/></div>
										<div><label>저자명:</label>&nbsp;<input name="bb_author" id="bb_author" type="text" value="${vo.bb_author }"></div>
										<div><label>출판사:</label>&nbsp;<input name="bb_press"  id="bb_press" type="text" value="${vo.bb_press }"></div>
									</div>
  									<table>
  										<tfoot>
  											<tr>
  												<td height="10px;">

  											</tr>
  											<tr>
  												<td colspan="5">
  													<textarea name="bb_content" rows="10px" cols="132px" id="bb_content">${vo.bb_content }</textarea>
  												</td>
  											</tr>
  										</tfoot>
  									</table>		
							</div>					
						</div> 
						<div class="" >
	                        <p>
		                        <button type="button" class="btn btn-outline btn-danger bts btss"
		                        onclick="goBack(this.form)">취소</button>
			                    <button type="button" class="btn btn-outline btn-success bts btss"
			                    onclick="sendData(this.form)">완료</button>
	                        </p>
                        </div>   
                        
					</form>	                        				
				</div>                
        </div>
        

    <jsp:include page="footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="lib/js/jquery-ui.min.js"></script>
   	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
   	<script src="lib/js/summernote/lang/summernote-ko-KR.js"></script>
	<script type="text/javascript">
	if (document.addEventListener) {
	    window.addEventListener('pageshow', function (event) {
	        if (event.persisted || window.performance && 
	            window.performance.navigation.type == 2) 
	        {
	            location.reload();
	        }
	    },
	   false);
	}
		var test = "${vo.bb_category}";
		if(test != "")
			$("#bb_category").val("${vo.bb_category}").prop("selected", true);
		
		function goBack(frm) {
			location.href="board_share.inc";
		}
		function sendData(frm) {
			
			var bb_title= $("#bb_title").val();
    		var bb_bname= $("#bb_bname").val();
			var bb_author= $("#bb_author").val();
    		var bb_press= $("#bb_press").val();
			var bb_content= $("#bb_content").val();

    		if(bb_title.trim().length <1 ){
    			alert("제목을 입력해주세요");
    			return; 
    		}
    		if(bb_title.trim().length >20 ){
    			alert("제목을 20자 미만으로 입력해주세요");
    			return; 
    		}
    		if(bb_bname.trim().length <1 ){
    			alert("도서명을 입력해주세요");
    			return; 
    		}
    		if(bb_bname.trim().length >50 ){
    			alert("도서명을 50자 미만으로 입력해주세요");
    			return; 
    		}
    		if(bb_author.trim().length <1 ){
    			alert("저자를 입력해주세요");
    			return; 
    		}
    		if(bb_author.trim().length >20 ){
    			alert("저자를 50자 미만으로 입력해주세요");
    			return; 
    		}
    		if(bb_press.trim().length <1 ){
    			alert("출판사를 입력해주세요");
    			return; 
    		}
    		if(bb_press.trim().length >20 ){
    			alert("출판사를 50자 미만으로 입력해주세요");
    			return; 
    		}
    		if(bb_content.trim().length <1 ){
    			alert("내용을 입력해주세요");
    			return; 
    		}
    		if(bb_content.trim().length > 100000 ){
    			alert("내용을 50자 미만으로 입력해주세요");
    			return; 
    		}
    		
    		
			frm.submit();
		}
		$(function() {
    		$("#bb_content").summernote({
                //placeholder: 'Hello stand alone ui',
			    toolbar: [
			        ['style', ['style']],
			        ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
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