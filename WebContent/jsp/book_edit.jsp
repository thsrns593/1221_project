<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>책 게시물 수정</title>
	
    <!-- 내가 만든 CSS -->
    <link href="${pageContext.request.contextPath}/lib/css/default.css" rel="stylesheet">  
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
     		border: 1px solid #5882FA;
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
        <!-- Page Content -->
        
		<div class="row" id="content">  
                <div class="col-md-12" >
                      <div class="panel-heading">
                           <div class="row">
				                <div class="bts titlebox">
				                    <h1 class="">책게시판글수정</h1>
				                </div>
				                <div class="panel-footer">
	                            	<p>
		                                <button type="button" class="btn btn-outline btn-success bts"
		                                onclick="javascript:location.href='book_read.inc'">돌아가기</button>
	                            	</p>
                        		</div>
				                <!-- /.col-lg-12 -->
				            </div>
                        </div>
                        <div class="">
	                        <div class="formstyle">
	                        	<form action="">
	                        		<div>
	                        			<select>
	                        				<option value="자랑">&nbsp;평가&nbsp;</option>
	                        				<option value="교환">&nbsp;교환&nbsp;</option>
	                        				<option value="대여">&nbsp;대여&nbsp;</option>
	                        				<option value="나눔">&nbsp;나눔&nbsp;</option>
	                        			</select>
	                        			<input type="text" size="120px" style="margin-bottom: 10px;" value="안녕하세요"/>
	                        		</div>
	                        		<div id="imagediv">사진</div>
									<div id="textdiv">
										&nbsp;
										<div><label>도서명:</label>&nbsp;<input type="text"  value="해리포터"/></div>
										<div><label>저자명:</label>&nbsp;<input type="text" value="하이염"/></div>
										<div><label>출판사:</label>&nbsp;<input type="text" value="위가르디움 레비오사"/></div>
									</div>
  									<table>
  										<tfoot>
  											<tr>
  												<td height="10px;">

  											</tr>
  											<tr>
  												<td colspan="5">
  													<textarea rows="10px" cols="132px" >해리포터,,,,ㅡㅡ</textarea>
  												</td>
  											</tr>
  										</tfoot>
  									</table>		
								</form>	                        				
							</div>					
						</div> 
						<div class="">
                            	<p>
                            		<button type="button" class="btn btn-outline btn-warning bts"
                            		onclick="javascript:location.href='book_read.inc'">삭제</button>
                            		<button type="button" class="btn btn-outline btn-info bts"
                            		onclick="javascript:location.href='book_read.inc'">수정</button> 
                            	</p>
                        	</div>  
				</div>                
        </div>
        

    <jsp:include page="footer.jsp"></jsp:include>

  </body>

</html>