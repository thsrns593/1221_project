<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
	
    <title>일반게시판글쓰기</title>

    <style type="text/css">

     	#row_content{
     		margin: auto;
     		padding: 0px;
     		width: 1000px;
     		height: auto;
     		min-height: 655px;

     	}
     	#nb_content{
     		margin: auto;
     		padding: 0px;
     		width: 1000px;
     		height: auto;
     		min-height: 655px;
     	}
     	.formstyle{
     		margin-left: 300px;
     		padding: 10px;
     		width: 1000px;
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
     		width:900px;
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
     		margin: auto;
     		padding-left: 100px;
     		display: inline-block;
     		width: 600px;
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
		.panel-footer{
			margin: auto;
			padding-right: 100px;
		}
		.btn_two{
			padding-right: 300px;
		}
		#nb_title{
			width: 800px;
		}
    </style>

  </head>

  <body>
	<jsp:include page="navigation.jsp"></jsp:include>
		<div class="row" id="row_contant">  
                <div class="col-md-12" >
                      <div class="panel-heading">
                           <div class="row">
				                <div class="bts titlebox">
				                    <h1 class="">일반게시판글쓰기</h1>
				                </div>
				                <div class="panel-footer">
	                            	<p>
		                                <button type="button" class="btn btn-outline btn-success bts"
		                                onclick="javascript:location.href='board_free.inc'">돌아가기</button>
	                            	</p>
                        		</div>
				                <!-- /.col-lg-12 -->
				            </div>
                        </div>
                        <div class="">
	                        <div class="formstyle">
	                        	<form action="text_write.inc" method=post id="writeform" enctype="multipart/form-data">
	                        		<div>
	                        			<select name="nb_category">
	                        				<c:if test="${sessionScope.m_id eq 'admin'}">
	                        					<option value="공지">&nbsp;공지&nbsp;</option>
	                        				</c:if>
	                        				<option value="잡담">&nbsp;잡담&nbsp;</option>
	                        				<option value="질문">&nbsp;질문&nbsp;</option>
	                        			</select>
	                        			<input type="text" size="120px" style="margin-bottom: 10px;" value="" placeholder="제목" name="nb_title" id="nb_title"/>
	                        		</div>
  									<table>
  										<tfoot>
  											<tr>
  												<td height="10px;">

  											</tr>
  											<tr>
  												<td colspan="5">
  													<textarea rows="10px" cols="132px" name="nb_content" id="nb_content"></textarea>
  												</td>
  											</tr>
  											<tr>
  												<td>
  													<input type="file" name="upload" value="첨부파일">
  												</td>
  											</tr>
  										</tfoot>
  									</table>		
  									<input type="hidden" value="${cate }" name="cate"/>			
								</form>	                        				
							</div>					
						</div> 
						<div class="btn_two" >
	                        <p>
		                        <input type="button" class="btn btn-outline btn-danger bts btss"
		                        onclick="javascript:location.href='board_free.inc'" value="취소"></input>
			                    <input type="button" class="btn btn-outline btn-success bts btss"
			                    onclick="textwrite()" value="완료"></input>
	                        </p>
                        </div>   
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
    	function textwrite() {
    		var nb_content= $("#nb_content").val();
    		var nb_title= $("#nb_title").val();
    		
    		if(nb_title.trim().length <1 ){
    			alert("제목을 입력해주세요");
    			return; 
    		}
    		if(nb_title.trim().length >20){
    			alert("제목을 20글자 미만으로 입력해주세요");
    			return; 
    		}
    		if(nb_content.trim().length <1){
    			alert("내용을 입력해주세요");
    			return; 
    		}
    		if(nb_content.trim().length > 100000){
    			alert("내용을 10만자 이하로 입력해주세요");
    			return; 
    		}

    		$("#writeform").submit();
		}
    	$(function() {
    		$("#nb_content").summernote({
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