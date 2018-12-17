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
											<colgroup>
												<col width="40px">
												<col width="*">
											</colgroup>
											<thead>
												<tr id="i1">
													<td colspan="2">
														<form>
															<input type ="hidden" name="breply_num" value="댓글기본키">
															<input type="hidden" name="m_id" value="댓글작성자">
															<input type="hidden" name="breply_group" value="댓글그룹">
															<div><span class="reply_from">작성자</span><input type="button" onclick="rereply(this)" value="답글"></div>
															<div><span>댓글 내용 댓글 내용 댓글 내용 댓글 내용 댓글 내용 </span></div>
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
											</thead>
											<tbody id="reply_list">
												
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
			<input type="hidden" name="breply_group">
			<input type="hidden" name="breply_to">
    	</form>
    <jsp:include page="footer.jsp"></jsp:include>
    <script type="text/javascript" src=""></script>
	<script type="text/javascript">
	var loginId ="${m_id}";
		function del(frm) {
			if(!loginId) {
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
			if(!loginId) {
				alert("로그인을 해주세요");
				return;
			}
			location.href="editBook.inc?num="+frm.bb_num.value;
		}
		$(function(){
			var loginId = "${m_id}";
			var m_id =$("input[name=m_id]").val();
			console.log(m_id);
			if(m_id != loginId) {
				$("#delBtn").prop("disabled",true);
				$("#editBtn").prop("disabled",true);
			}
		});
		
		function reply(frm) {
			if(!loginId) {
				alert("로그인을 해주세요");
				return;
			}
			var reply_list = document.getElementById("reply_list");
			reply_list.innerHTML +="";
			var bb_num = "${vo.bb_num}";
			var m_id = "${m_id}";
			var breply_content = frm.breply_content.value;
			$.ajax({
				url:"breply_write.inc",
				data : "bb_num="+bb_num+"&m_id="+m_id+"&breply_content="+breply_content,
				dataType : "json",
				type:"post"
			}).done(function(data){
				var ar =data.ar;
				var str =toTable(ar);
				$("#reply_list").append(str);
			}).fail(function(err){
				console.log("댓글실패");
			});
			frm.action="breply_write.inc";
			frm.method="post";
			frm.submit();
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
				console.log("누구에게 : "+ar[i].breply_to + "//"+!ar[i].breply_to);
				if(!ar[i].breply_to) {
					sb+= "<tr><td colspan='2'><form><input type ='hidden' name='breply_num' value='"+ar[i].breply_num +"'>";
					sb+= "<input type='hidden' name='m_id' value='"+ar[i].m_id+"'>";
					sb+= "<input type='hidden' name='breply_group' value='"+ar[i].breply_group+"'>";
					sb+= "<div><span class='reply_from'>"+ar[i].m_id+"</span><input type='button' onclick='rereply(this)' value='답글'></div>";
					sb+= "<div><span class='reply_content'>"+ar[i].breply_content+"</span></div>";
					sb+= "</form></td></tr>";
				}else {
					sb+= "<tr><td>ㄴ</td><td>";
					sb+= "<div><span class='reply_to'>@"+ar[i].breply_to+"</span><span class='reply_from'>"+ar[i].m_id+"</span></div>";
					sb+= "<div><span class='reply_content'>"+ar[i].breply_content+"</span></div>";
					sb+= "</td></tr>";
				}
			}
			return sb;
		}
		
		var replyOpen = true;
		var breply_to="";
		var bb_num = "${vo.bb_num}";
		var breply_group="";
		function rereply(t) {
			if(!loginId) {
				alert("로그인을 해주세요");
				return;
			}
			var replyTr = $(t).closest('tr');
			var replyForm = $(t).closest('form');
			//대댓글창이 열려있으면
			if(replyOpen) {
				//기존댓글창 및 값 정리
				$("#reply_input").remove();
				breply_to = $(replyForm).children("input[name=m_id]");
				breply_group = $(replyForm).find("input[name=breply_group]");
				replyOpen=false;
				$(replyTr).after("<tr id='reply_input'><td colspan=2><form><input type='text' name='breply_content'><input onclick='sendRr(this.form)' type='button' value='보내기'></form></td></tr>");
			}else {
				replyOpen = true;
				$("#reply_input").remove();
				breply_to="";
				breply_group="";
			}
		}
		
		function sendRr(frm) {
			var bt =breply_to.val();
			var bg = breply_group.val();
			console.log("bt"+bt);
			console.log("bg"+bg);
			var bc =$(frm).find("input[name=breply_content]").val();
			console.log("bc"+bc);
			$("hideForm").find("input[name=breply_content]").val(bc);
			$("hideForm").find("input[name=breply_to]").val(bt);
			$("hideForm").find("input[name=breply_group]").val(breply_group.val(bg));
			frm.action="breply_write.inc";
			frm.method="post";
			frm.submit();
			
		}
	</script>
  </body>

</html>