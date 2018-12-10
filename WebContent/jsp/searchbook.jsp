<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>책 검색</title>
    
    <style type="text/css">
    #table1{

     		margin: auto;
     	}
     	.top-margin{
			margin-top: 10%;
     	}
     	.size{
     		margin: 0;
     		padding: 0;
     	}
     	.searchbutton{
     		padding: 0;
     		margin: 0;
     		
     	}
     	.color{
     		background-color: white;
     	}
     	.hide{
     		display: none !important;
     	}
     	#placeholderbook{
     		background-color: #298A08;
     		color: white;
     		
     	}
     	#content{
     		margin: auto;
     		padding: 0px;
     		width: 1000px;
     		height: auto;
     		min-height: 655px;

     	}
    </style>

  </head>

  <body>

    <jsp:include page="navigation.jsp"></jsp:include>

		<div class="row" id="content">  
                <div class="col-md-12">
                    <div class="panel panel-danger top-margin">
                        <div class="panel-heading">
                           <div class="row">
				                <div class="col-lg-12">
				                    <h1 class="">도서 검색</h1>
				                </div>
				                <!-- /.col-lg-12 -->
				            </div>
                        </div>
                        <div class="">
	                        <div class="panel-body">
	                        	<form action="">
                                        <div class="form-group input-group">
                                       		<span class="input-group-btn">
                                                <button class="btn btn-default" type="button" id="placeholderbook">도서명</button>
                                          </span>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button" id="placeholderperson">저자명</button>
                                            </span>
                                            <input type="text" class="form-control" id="bookname" placeholder="도서명">
                                            <input type="text" class="form-control hide" id="personname" placeholder="저자명">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button"
                                                onclick="javascript:location.href='table.inc'">
                                                <i class="fa fa-search"></i></button>
                                            </span>
                                        </div>
                                        <div>
											<p>
				                               <button type="button" class="btn btn-primary" id="menubt1">지역</button>
				                                <button type="button" class="btn" id="menubt2">장르</button>
				                                <button type="button" class="btn" id="menubt3">연령별</button>
				                                <button type="button" class="btn" id="menubt4">성별</button>
			                           		</p>     
                                        </div>
                                        
                                         <div class="col-lg-10 size " id="menu1">
						                    <div class="panel panel-default size">
						                        <div class="panel-heading">
							                        <div class="form-group input-group col-md-12 size">
														<span class="input-group-addon color">지역</span>
								                        	<select class="form-control">
									                        	<option>서울</option>
									                            <option>경기</option>
									                            <option>강원</option>
									                            <option>충청</option>
							                                </select>
							                            <span class="input-group-addon">세부지역</span>
								                            <select class="input-group form-control">
									                            <option>강남</option>
									                            <option>강북</option>
							                               	</select>
													</div>
						                        </div>
						                    </div>
						                </div>											
						                <div class="col-lg-10 size" id="menu2"  style="display:none;">
						                    <div class="panel panel-default size">
						                        <div class="panel-heading">
						                             장르
						                        <label class="checkbox-inline">
						                        <input type="checkbox">전체
						                        </label>
						                        <label class="checkbox-inline">
						                        <input type="checkbox">철학
						                        </label>
						                        <label class="checkbox-inline">
						                        <input type="checkbox">종교
						                        </label>
						                        <label class="checkbox-inline">
						                        <input type="checkbox">사회과학
						                        </label>
						                        <label class="checkbox-inline">
						                        <input type="checkbox">자연과학
						                        </label>
						                        <label class="checkbox-inline">
						                        <input type="checkbox">기술과학
						                        </label>
						                        <label class="checkbox-inline">
						                        <input type="checkbox">예술
						                        </label>
						                        <label class="checkbox-inline">
						                        <input type="checkbox">언어
						                        </label>
						                        <label class="checkbox-inline">
						                        <input type="checkbox">문학
						                        </label>
						                        <label class="checkbox-inline">
						                        <input type="checkbox">역사
						                        </label>     
						                        </div>
						                    </div>
						                </div>	
						                <div class="col-lg-5 size" id="menu3"  style="display:none;">
						                    <div class="panel panel-default size">
						                        <div class="panel-heading">
						                            연령별
						                        <label class="checkbox-inline">
						                        <input type="checkbox">10대
						                        </label>
						                        <label class="checkbox-inline">
						                        <input type="checkbox">20대
						                        </label>
						                        <label class="checkbox-inline">
						                        <input type="checkbox">30대
						                        </label>
						                        <label class="checkbox-inline">
						                        <input type="checkbox">40대
						                        </label>
						                        </div>
						                    </div>
						                </div>	
						                <div class="col-lg-5 size" id="menu4"  style="display:none;">
						                    <div class="panel panel-default size">
						                        <div class="panel-heading">
						                             성별
						                        <label class="checkbox-inline">
						                        <input type="checkbox" id="menu4chk" name="menu4chk">전체
						                        </label>
						                        <label class="checkbox-inline" >
						                        <input type="checkbox" id="menu4chk" name="menu4chk">남
						                        </label>
						                        <label class="checkbox-inline">
						                        <input type="checkbox" id="menu4chk" name="menu4chk">여
						                        </label>
						                        <label class="checkbox-inline">
						                        <input type="checkbox" id="menu4chk" name="menu4chk">미상
						                        </label>
						                        </div>
						                    </div>
						                </div>	
								</form>	                        
								<table class="table table-striped table-bordered table-hover" id="table1">
									<thead class="">
										<tr>
											<td >NO</td>
											<td>사진</td>
											<td>도서명+간단한 도서정보</td>
											<td>고유번호</td>
											<td>조회수</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>피카츄</td>
											<td><a href="table.inc" >해리포터</a></td>
											<td>AB123</td>
											<td>1</td>
										</tr>
										<tr>
											<td>2</td>
											<td>꼬부기</td>
											<td><a href="bookinfo.inc">물대포</a></td>
											<td>AB123</td>
											<td>12</td>
										</tr>
										<tr>
											<td>3</td>
											<td>리자몽</td>
											<td><a href="bookinfo.inc">지구던지기</a></td>
											<td>as999</td>
											<td>8</td>
										</tr>
										<tr>
											<td>4</td>
											<td>이상해씨</td>
											<td><a href="bookinfo.inc">태양던지기</a></td>
											<td>df1876</td>
											<td>1</td>
										</tr>
									</tbody>
								</table>
								<div class="row">
                                	<div class="col-sm-6">
                                		<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">Showing 1 to 1 of 1 entries</div>
                                	</div>
                                	<div class="col-sm-6">
	                                	<div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
		                                	<ul class="pagination">
			                                	<li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="#">Previous</a></li>
			                                	<li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="#">1</a></li>
			                                	<li class="paginate_button next disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="#">Next</a></li>
		                                	</ul>
	                                	</div>
                                	</div> 
                                </div>
							</div>
						</div>
                    </div>
                
        </div>
        

    </div>
   
   	<jsp:include page="footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/lib/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery-ui.min.js"></script>

	   
    <script>
    $(function(){

		$("#menubt1").on("click",function(){
			$("#menubt1").toggleClass("btn-primary");
			$("#menu1").toggle(300); 
			
		});
		$("#menubt2").on("click",function(){
			$("#menubt2").toggleClass("btn-primary");
			$("#menu2").toggle(300);
			var ar = $("#menu2").find(":checkbox");
			ar.prop("checked", false);
		});
		$("#menubt3").on("click",function(){
			$("#menubt3").toggleClass("btn-primary");
			$("#menu3").toggle(300); 
			var ar = $("#menu3").find(":checkbox");
			ar.prop("checked", false);
		});
		$("#menubt4").on("click",function(){
			$("#menubt4").toggleClass("btn-primary");
			$("#menu4").toggle(300);
			var ar = $("#menu4").find(":checkbox");
			ar.prop("checked", false);
		});
		$("#placeholderbook").on("click",function(){
			$("#bookname").removeClass("hide");
			$("#personname").addClass("hide");
			$("#bookname").val("");
			
			
			$("#placeholderbook").css("background-color","#298A08");
			$("#placeholderbook").css("color","white");
			$("#placeholderperson").css("background-color","#D8D8D8");
			$("#placeholderperson").css("color","black");
		});
		$("#placeholderperson").on("click",function(){
			$("#bookname").addClass("hide");
			$("#personname").removeClass("hide");
			$("#personname").val("");
			
			$("#placeholderperson").css("background-color","#298A08");
			$("#placeholderperson").css("color","white");
			$("#placeholderbook").css("background-color","#D8D8D8");
			$("#placeholderbook").css("color","black");
			
		});
	});
   
    </script>
    
  </body>

</html>
