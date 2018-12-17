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
			padding : 10px;
			width: 100%;
			border: 1px solid gray;
			border-radius:5px;
		}
		
		#textdiv div {
			margin-left: 30px;
		}
		
		.bookinfo{
			width: 230px;
			border-radius: 5px;
		}
		.writerinfo{
			border-radius: 5px;
			text-align: center;
		}
		table#replyTable {
			width : 1000px;
			
		}
		.reply_to {
			display : inline-block;
			width : 100px;
		}
		.reply_from {
			display : inline-block;
			width : 80px;
		}
		.hidden {
			display: none;
		}
		tbody#reply_list td {
			padding: 5px;
		}
		tbody#reply_list div {
			padding: 5px;
		}
		tbody#reply_list .replyBox {
			display:inline-block;
			border : 1px solid #ababab;
			border-radius: 5px;
		}
		tbody#reply_list .rereplyBox {
			display:inline-block;
			margin-left: 80px;
			border :1px solid #ababab;
			border-radius: 5px;
		}
		div.infoRow {
			display: inline-block;
		}
		
		
    </style>

  </head>

  <body>

    <jsp:include page="navigation.jsp"></jsp:include>
		<div class="row" id="content">  
			<form method="post" action ="">
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
	                            		<button id="delBtn" type="button" class="btn btn-outline btn-warning bts"
	                            		onclick="del(this.form)">삭제</button>
                            			<button id="editBtn" type="button" class="btn btn-outline btn-info bts"
                            			onclick="edit(this.form)">수정</button> 
		                                
	                            	</p>
                        		</div>
                       		</div>
				                <!-- /.col-lg-12 -->
			            </div>
                </div>
                <div class="formstyle">
	                        	
               		<div >
               			<input type="hidden" id="bb_num" name="bb_num" value="${vo.bb_num }">
               			<input type="text" size="5px" value="${vo.bb_category }" readonly="readonly" style="text-align: center;"/>
               			<input type="text" size="120px" style="margin-bottom: 10px;" value="${vo.bb_title }" readonly="readonly"/>
               		</div>
               		&nbsp;
               		&nbsp;
               		<span><label>글쓴이:</label><input class="writerinfo"  type="text" value="${vo.m_id }" readonly="readonly" name="m_id" /></span>
               		<span><label>작성일:</label><input class="writerinfo" type="text" value="${vo.bb_cdate }" readonly="readonly" /></span>
               		<span><label>조회수:</label><input class="writerinfo" type="text" value="${vo.bb_hit }" readonly="readonly" /></span>
               		
					<div id="textdiv">
						<div class="infoRow"><div>도서명</div><div><input class="bookinfo" type="text" value="${vo.bb_bname }" readonly="readonly"/></div></div>
						<div class="infoRow"><div>저자명</div><div><input class="bookinfo" type="text" value="${vo.bb_author }" readonly="readonly"/></div></div>
						<div class="infoRow"><div>출판사</div><div><input class="bookinfo" type="text" value="${vo.bb_press }" readonly="readonly"/></div></div>
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
								                      				
					</div>
					</form>
						 <div class="col-md-12" >
						 	<br/>
									<div id="reinput">
										<div class="footfoot">
                      						<form action="" id="reply">
												<table id="reinput">
													<colgroup>
														<col width="1000px">
														<col width="100px">
													</colgroup>
													<tbody>
														<tr>
															<td>
																<input type="text" style="width: 100%;" name="breply_content"/>
															</td>
															<td><button type="button" style="width: 100%;" onclick="reply(this.form)">댓글달기</button> </td>
														</tr>
													</tbody>
												</table>
											</form>
										</div>
										<table>
											
		<!--
			<tr id="i1">
			<td colspan="2">
				<form>
					<input type ="hidden" name="breply_num" value="댓글기본키">
					<input type="hidden" name="m_id" value="댓글작성자">
					<input type="hidden" name="breply_group" value="댓글그룹">
					<div><span class="reply_from">작성자</span><input type="button" onclick="rereply(this)" value="답글"></div>
					<div><span class="reply_content">댓글 내용 댓글 내용 댓글 내용 댓글 내용 댓글 내용 </span></div>
				</form>
			</td>
		</tr>
		<tr>
			<td>ㄴ</td>
			<td>
				<div><span class="reply_to">@누구에게</span><span class="reply_from">작성자</span></div>
				<div><span class="reply_content">댓글 내용 댓글 내용 댓글 내용 댓글 내용 댓글 내용 </span></div>
			</td>
		</tr> 
		 -->
											<tbody id="reply_list">
												<c:forEach items="${r_list }" var="br">
													<c:if test="${ br.breply_status == 0}">
														<c:if test="${br.breply_to ne null}">
															<tr>
																<td>
																	<div class="rereplyBox">
																		<div><span class="reply_to">@${br.breply_to }</span><span class="reply_from">${br.m_id }</span>
																		<c:if test="${m_id == br.m_id }">
																			<input type='button' onclick='delReply(this.form)' value='삭제'>
																		</c:if>
																		</div>
																		<div><span class="reply_content">${br.breply_content }</span></div>
																	</div>
																</td>
															</tr>
														</c:if>
														<c:if test="${br.breply_to eq null}">
															<tr>
																<td>
																	<div class="replyBox">
																		<form>
																			<input type ="hidden" name="breply_num" value="${br.breply_num }">
																			<input type="hidden" name="m_id" value="${br.m_id }">
																			<input type="hidden" name="breply_group" value="${br.breply_group }">
																			<div><span class="reply_from">${br.m_id }</span>
																			<input type="button" onclick="rereply(this)" value="답글">
																			<c:if test="${br.m_id == m_id }">
																				<input type="button" onclick="delReply(this.form)" value="삭제">
																			</c:if>
																			</div>
																			<div><span class="reply_content">${br.breply_content }</span></div>
																		</form>
																	</div>
																</td>
															</tr>
														</c:if>
													</c:if>
													<c:if test="${ br.breply_status !=0}">
														<c:if test="${ br.breply_to != null}">
															<tr>
																<td><div class="rereplyBox">삭제된 댓글입니다</div></td>
															</tr>
														</c:if>	
														<c:if test="${ br.breply_to == null}">
															<tr>
																<td>
																	<div class="replyBox">삭제된 댓글입니다</div>
																</td>
															</tr>
														</c:if>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</div>                   				
						</div>	
							<br/>				
							<br/>				
			</div> 
			<!-- 대댓글 달기를 하기 위해 필요한 정보 -->
			
			
			<!-- 
breply_num,	bb_num, m_id, breply_to,breply_group, breply_content,
	breply_cdate,breply_ip,	breply_status -->
		<form id="hideForm">
			<input type ="hidden" name="bb_num" value="${vo.bb_num }">
			<input type="hidden" name="breply_content">
			<input type="hidden" id="brg" name="breply_group">
			<input type="hidden" name="breply_to">
    	</form>
    <jsp:include page="footer.jsp"></jsp:include>
    <script type="text/javascript" src=""></script>
	<script type="text/javascript">
	var reply_list = document.getElementById("reply_list");
	var bb_num = "${vo.bb_num}";
	var login_id = "${m_id}";
		function del(frm) {
			if(!login_id) {
				alert("로그인을 해주세요");
				return;
			}
			var bb_num = frm.bb_num; 
			var m_id = frm.m_id;
			$.ajax({
				url : "deleteBook.inc",
				data : "num="+bb_num.value+"&m_id="+m_id.value,
				dataType : "json",
				type : "post"
			}).done(function(data) {
				//1이면 삭제완료 0이면 삭제실패
				if(data.msg == "1") {
					alert("삭제완료");
					location.href="board_share.inc";
				} else {
					alert("삭제실패");
				}
			}).fail(function(err) {
				console.log(err)
			});
		}
		function edit(frm) {
			if(!login_id) {
				alert("로그인을 해주세요");
				return;
			}
			location.href="editBook.inc?num="+frm.bb_num.value;
		}
		$(function(){
			var login_id = "${m_id}";
			var m_id =$("input[name=m_id]").val();
			if(m_id != login_id) {
				$("#delBtn").prop("disabled",true);
				$("#editBtn").prop("disabled",true);
			}
		});
		
		
		function reply(frm) {
			if(!login_id) {
				alert("로그인을 해주세요");
				return;
			}
			
			var breply_content = frm.breply_content.value;
			myData = "bb_num="+bb_num+"&m_id="+login_id+"&breply_content="+breply_content;
			$.ajax({
				url:"breply_write.inc",
				data : "bb_num="+bb_num+"&m_id="+login_id+"&breply_content="+breply_content,
				dataType : "json",
				type:"post"
			}).done(function(data){
				var str =toTable(data.ar);
				$("#reply_list").html(str);
			}).fail(function(err){
				console.log("댓글실패");
			});
		}
		/*
		<tr id="i1">
			<td colspan="2">
				<form>
					<input type ="hidden" name="breply_num" value="댓글기본키">
					<input type="hidden" name="m_id" value="댓글작성자">
					<input type="hidden" name="breply_group" value="댓글그룹">
					<div><span class="reply_from">작성자</span><input type="button" onclick="rereply(this)" value="답글"></div>
					<div><span class="reply_content">댓글 내용 댓글 내용 댓글 내용 댓글 내용 댓글 내용 </span></div>
				</form>
			</td>
		</tr>
		<tr>
			<td>ㄴ</td>
			<td>
				<div><span class="reply_to">@누구에게</span><span class="reply_from">작성자</span></div>
				<div><span class="reply_content">댓글 내용 댓글 내용 댓글 내용 댓글 내용 댓글 내용 </span></div>
			</td>
		</tr>
		*/
		function toTable(ar) {
			var sb="";
			for(var i =0; i<ar.length; i++) {
				if(ar[i].breply_status ==0) {
					if(!ar[i].breply_to) {
						sb+= "<tr><td><div class='replyBox'><form><input type ='hidden' name='breply_num' value='"+ar[i].breply_num +"'>";
						sb+= "<input type='hidden' name='m_id' value='"+ar[i].m_id+"'>";
						sb+= "<input type='hidden' name='breply_group' value='"+ar[i].breply_group+"'>";
						sb+= "<div><span class='reply_from'>"+ar[i].m_id+"</span><input type='button' onclick='rereply(this)' value='답글'>";
						if(ar[i].m_id == login_id) {
							sb+= "<input type='button' onclick='delReply(this.form)' value='삭제'>";
						}
						sb+= "</div>";
						sb+= "<div><span class='reply_content'>"+ar[i].breply_content+"</span></div>";
						sb+= "</form></div></td></tr>";
					}else {
						sb+= "<tr><td><div class='rereplyBox'>";
						sb+= "<div><span class='reply_to'>@"+ar[i].breply_to+"</span><span class='reply_from'>"+ar[i].m_id+"</span>";
						if(ar[i].m_id == login_id) {
							sb+= "<input type='button' onclick='delReply(this.form)' value='삭제'>";
						}
						sb+="</div>";
						sb+= "<div><span class='reply_content'>"+ar[i].breply_content+"</span></div>";
						sb+= "</div></td></tr>";
					}
				}else {
					/*
					<c:if test="${ br.breply_status !=0}">
						<c:if test="${ br.breply_to != null}">
							<tr>
								<td>ㄴ</td><td>삭제된 댓글입니다</td>
							</tr>
						</c:if>	
						<c:if test="${ br.breply_to == null}">
							<tr>
								<td colspan ="2">
									삭제된 댓글입니다
								</td>
							</tr>
						</c:if>
					</c:if>
					*/
					if(ar[i].breply_to != null) {
						sb+= "<tr><td><div class='rereplyBox'>삭제된 댓글입니다</div></td></tr>";
					}else {
						sb+= "<tr><td><div class='replyBox'>삭제된 댓글입니다</div></td></tr>";
					}
				}
			}
			return sb;
		}
		var replyPage="${replyPage}";
		if(replyPage == "") {
			replyPage =1;
		} 
		var replyOpen = false;
		var breply_to="";
		var bb_num = "${vo.bb_num}";
		var breply_group="";
		function rereply(t) {
			if(!login_id) {
				alert("로그인을 해주세요");
				return;
			}
			var replyTr = $(t).closest('tr');
			var replyForm = $(t).closest('form');
			
			//대댓글창이 열려있으면
			if(!replyOpen) {
				//기존댓글창 및 값 정리
				$("#reply_input").remove();
				breply_to = $(replyForm).children("input[name=m_id]");
				breply_group = $(replyForm).find("input[name=breply_group]");
				replyOpen=true;
				$(replyTr).after("<tr id='reply_input'><td colspan=2><form><input type='text' name='breply_content'><input onclick='sendRr(this.form)' type='button' value='보내기'></form></td></tr>");
			}else {
				replyOpen = false;
				$("#reply_input").remove();
				breply_to="";
				breply_group="";
			}
		}
		
		function sendRr(frm) {
			var bt =breply_to.val();
			var bg = breply_group.val();
			var bc =$(frm).find("input[name=breply_content]").val();
			console.log("bt"+bt);
			console.log("bg"+bg);
			console.log("bc"+bc);
			
			$.ajax({
				url:"breply_write.inc",
				data : "bb_num="+bb_num+"&m_id="+login_id+"&breply_content="+bc+"&breply_group="+bg+"&breply_to="+bt,
				dataType : "json",
				type:"post"
			}).done(function(data){
				var str =toTable(data.ar);
				$("#reply_list").html(str);
			}).fail(function(err){
				console.log("댓글실패");
			});
			
			replyOpen = false;
			$("#reply_input").remove();
			breply_to="";
			breply_group="";
		}
		function delReply(frm) {
			$.ajax({
				url:"breply_delete.inc",
				data : "bb_num="+bb_num+"&replyPage="+replyPage+"&breply_num="+frm.breply_num.value,
				dataType : "json",
				type:"post"
			}).done(function(data){
				var str =toTable(data.ar);
				$("#reply_list").html(str);
			}).fail(function(err){
				console.log("댓글실패");
			});
		}
	</script>
  </body>

</html>