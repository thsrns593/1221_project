<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <title>일반게시판글쓰기</title>
	
   
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
                      <div class="panel-heading">
                           <div class="row">
				                <div class="bts titlebox">
				                    <h1 class="">일반게시판글쓰기</h1>
				                </div>
				                <div class="panel-footer">
	                            	<p>
		                                <button type="button" class="btn btn-outline btn-success bts"
		                                onclick="javascript:location.href='nb.inc'">돌아가기</button>
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
	                        				<option value="공지">&nbsp;공지&nbsp;</option>
	                        				<option value="잡담">&nbsp;잡담&nbsp;</option>
	                        				<option value="질문">&nbsp;질문&nbsp;</option>
	                        			</select>
	                        			<input type="text" size="120px" style="margin-bottom: 10px;" value="" placeholder="제목" name="nb_title"/>
	                        		</div>
  									<table>
  										<tfoot>
  											<tr>
  												<td height="10px;">

  											</tr>
  											<tr>
  												<td colspan="5">
  													<textarea rows="10px" cols="132px" name="nb_content" ></textarea>
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
						<div class="" >
	                        <p>
		                        <input type="button" class="btn btn-outline btn-danger bts"
		                        onclick="javascript:location.href='board_free.inc'" value="취소"></input>
			                    <input type="button" class="btn btn-outline btn-success bts"
			                    onclick="textwrite()" value="완료"></input>
	                        </p>
                        </div>   
				</div>                
        </div>
        

   <jsp:include page="footer.jsp"></jsp:include>
    
    <script type="text/javascript">
    	function textwrite() {
    		$("#writeform").submit();
		}
    </script>
  </body>

</html>