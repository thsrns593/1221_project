<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>책게시판글보기</title>
    
    <!-- 내가 만든 CSS -->
      
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
     		border: 1px solid #F5A9E1;
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
				                    <h1 class="">책게시판글보기</h1>
				                </div>
				                <div class="panel-footer">
	                            	<p>
	                            		<button type="button" class="btn btn-outline btn-success bts"
	                            		onclick="javascript:location.href='board_share.inc'">돌아가기</button>
	                            		<button type="button" class="btn btn-outline btn-warning bts"
	                            		onclick="">삭제</button>
                            			<button type="button" class="btn btn-outline btn-info bts"
                            			onclick="javascript:location.href='book_edit.inc'">수정</button> 
		                                
	                            	</p>
                        		</div>
				                <!-- /.col-lg-12 -->
				            </div>
                        </div>
                        <div class="">
	                        <div class="formstyle">
	                        	<form action="">
	                        		<div >
	                        			<input type="text" size="5px"value="${vo.bb_category }" readonly="readonly" style="text-align: center;"/>
	                        			<input type="text" size="120px" style="margin-bottom: 10px;" value="${vo.bb_title }" readonly="readonly"/>
	                        		</div>
	                        		&nbsp;
	                        		&nbsp;
	                        		<span><label>글쓴이:</label><input class="writerinfo"  type="text" value="${vo.m_id }" readonly="readonly" value=""/></span>
	                        		<span><label>작성일:</label><input class="writerinfo" type="text" value="${vo.bb_cdate }" readonly="readonly" value=""/></span>
	                        		<span><label>조회수:</label><input class="writerinfo" type="text" value="${vo.bb_hit }" readonly="readonly" value=""/></span>
	                        		<div id="imagediv"> 사진 </div>
									<div id="textdiv">
										&nbsp;
										<div><label>도서명:</label><input class="bookinfo" type="text" value="${vo.bb_bname }" readonly="readonly"/></div>
										<div><label>저자명:</label><input class="bookinfo" type="text" value="${vo.bb_author }" readonly="readonly"/></div>
										<div><label>출판사:</label><input class="bookinfo" type="text" value="${vo.bb_press }" readonly="readonly"/></div>
									</div>
  									<table>
  										<tfoot>
  											<tr>
  												<td height="10px;">

  											</tr>
  											<tr>
  												<td colspan="5">
  													<textarea rows="10px" cols="132px"  readonly="readonly">${vo.bb_content }</textarea>
  												</td>
  											</tr>
  										</tfoot>
  									</table>		
								</form>	                        				
							</div>
							 <div class="col-md-12" >
							 	<br/>
	                        	<form action="">
									<div id="reinput">
										<table id="list_table">
											<tbody>
												<tr>
													<td><div id="d_id">홍길동</div></td>
													<td><div id="d_text">그 책 가지고 싶은데 공짜론 안되나요?</div></td>
													<td><div id="d_delete"><i class="fa fa-times"></i></div></td>
												</tr>
												<tr>
													<td><div id="d_id">ㄴ됩니다</div></td>
													<td><div id="d_text">그럼요 드려야죠</div></td>
												</tr>
											</tbody>
										</table>
										<br/>
										<div class="footfoot">
											<table id="reinput">
												<colgroup>
													<col width="1000px">
													<col width="100px">
												</colgroup>
												<tbody>
													<tr>
														<td><input type="text" style="width: 100%;"/></td>
														<td><button type="button" style="width: 100%;">댓글달기</button> </td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</form>	                        				
								</div>	
							<br/>				
							<br/>				
						</div> 
				</div>                
        </div>
        
    <jsp:include page="footer.jsp"></jsp:include>

  </body>

</html>