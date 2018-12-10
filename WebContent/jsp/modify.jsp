<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원정보수정</title>
	<!-- join CSS -->
	<link href="${pageContext.request.contextPath}/lib/css/join.css" rel="stylesheet">
  </head>

  <body>

    <jsp:include page="navigation.jsp"></jsp:include>
    
     <!-- Search Widget -->
          <div class="card my-4">
            <h5 class="card-header"">회원정보수정</h5>
            <div class="card-body">
            
              <div class="input-group">
              	<span class="input-group-btn">
              	  <label id="id_lb" for="id" class="form-control">
              	  	<i class="fa fa-user"></i>
              	  </label>
                </span>
                <span class="input-group-btn">
                  <input id="id" name="id" type="text" class="form-control" value="아이디수정불가" disabled="disabled">
                </span>
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button" style="color: #b00; font-weight: bold;">회원탈퇴</button>
                </span>
              </div>

              <div class="input-group">
              	<span class="input-group-btn">
              	  <label id="pw_lb" for="pw" class="form-control">
              	  	<i class="fa fa-lock"></i>
              	  </label>              	  
                </span>
                <span class="input-group-btn">
                  <input id="pw" name="pw" type="password" class="form-control" 
                  placeholder="User password(6자 이상) ">
                </span>
              </div>
              
              <div class="input-group">
              	<span class="input-group-btn">
              	  <label id="r_pw_lb" for="pw" class="form-control">
              	  	<i class="fa fa-lock"></i>
              	  </label>
                </span>
                <span class="input-group-btn">
                  <input id="r_pw" name="r_pw" type="password" class="form-control" placeholder="re-enter password">
                </span>
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button">비밀번호 확인</button>
                </span>
                
              </div>
              
              <div class="input-group">
              	<span class="input-group-btn">
              	  <label id="ph_lb" for="ph" class="form-control">
              	  	<i class="fa fa-phone"></i>
              	  </label>
                </span>
                <span class="input-group-btn">
                  <input id="ph" name="ph" type="text" class="form-control" placeholder="User phone-number" value="010-0000-0000">
                </span>
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button"">전화번호 인증</button>
                </span>
              </div>
              
              <div class="input-group">
              	<span class="input-group-btn">
              	  <label id="email_lb" for="email" class="form-control">
              	  	<i class="fa fa-envelope-o"></i> 
              	  </label>
                </span>
                <span class="input-group-btn">
                  <input id="email" name="email" type="text" class="form-control" placeholder="User email" value="kakao@google.com">
                </span>
              </div>
        
              <div class="input-group"> 
              	<span class="input-group-btn">
					<label id="b_day_lb" for="b_day" class="form-control">
						<i class="fa fa-birthday-cake"></i>
					</label>
				</span>
				<span class="input-group-btn">
					<input class="form-control" type="text" id="b_day" name="b_day" placeholder="User birthday" value="2018-12-26"/>
				</span>
				<span class="input-group-btn">
							&nbsp;&nbsp;&nbsp;
					<input type="radio" name="b_type" value="양력" checked="checked"/>양력
							&nbsp;&nbsp;&nbsp;
					<input type="radio" name="b_type" value="음력"/>음력
				</span>
			  </div>
 			  
 			  <div class="input-group">
 			  	<span class="input-group-btn btcenter">
 			  		<br/>
					<button type="button" class="btn btn-secondary" onclick="javascript:location.href='Main.inc'">저 장
					</button>
							&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-secondary" onclick="javascript:location.href='Main.inc'">취 소
					</button>
				</span>
			  </div>	
 
            </div>
          </div>
    
	<jsp:include page="footer.jsp"></jsp:include>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery-ui.min.js"></script>


	    <!-- Menu Toggle Script -->
    <script>
   
    $(function(){	
		$("#b_day").datepicker({
				dateFormat: 'yy-mm-dd',
				dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
				monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				showMonthAfterYear: true
		});
	});
     
    
    </script>
    
  </body>

</html>
