<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원가입</title>
	<!-- datepicker ui CSS -->
	<link href="${pageContext.request.contextPath}/lib/css/jquery-ui.min.css" rel="stylesheet">
	<!-- join CSS -->
	<link href="${pageContext.request.contextPath}/lib/css/join.css" rel="stylesheet">
	
  </head>

  <body>

   <jsp:include page="navigation.jsp"></jsp:include>
    
     <!-- Search Widget -->
          <div class="card my-4">
          <form action="reg.inc" method ="post">
            <h5 class="card-header">회원가입</h5>
            <div class="card-body">
            
              <div class="input-group">
              	<span class="input-group-btn">
              	  <label id="id_lb" for="m_id" class="form-control">
              	  	<i class="fa fa-user"></i>
              	  </label>
                </span>
                <span class="input-group-btn">
                  <input id="m_id" name="m_id" type="text" class="form-control" placeholder="User id(4~10자)">
                </span>
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button" onclick="javascript:checkId()">중복확인</button>
                </span>
                <small> 아이디는 영문 또는 영문+숫자이어야 합니다.</small>
              </div>

              <div class="input-group">
              	<span class="input-group-btn">
              	  <label id="pw_lb" for="m_pwd" class="form-control">
              	  	<i class="fa fa-lock"></i>
              	  </label>              	  
                </span>
                <span class="input-group-btn">
                  <input id="m_pwd" name="m_pwd" type="password" class="form-control" 
                  placeholder="User password(8~15자) ">
                </span>
                <small> 비밀번호는 특수문자,영문,숫자가  모두 포함되어야 합니다.</small>
              </div>
              
              <div class="input-group">
              	<span class="input-group-btn">
              	  <label id="r_pw_lb" for="mr_pwd" class="form-control">
              	  	<i class="fa fa-lock"></i>
              	  </label>
                </span>
                <span class="input-group-btn">
                  <input id="mr_pwd" name="mr_pwd" type="password" class="form-control" placeholder="re-enter password">
                </span>
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button" onclick="javascript:checkPwd()">비밀번호 확인</button>
                </span>
              </div>
              
              <!-- <div class="input-group">
              	<span class="input-group-btn">
              	  <label id="ph_lb" for="ph" class="form-control">
              	  	<i class="fa fa-phone"></i>
              	  </label>
                </span>
                <span class="input-group-btn">
                  <input id="ph" name="ph" type="text" class="form-control" placeholder="User phone-number">
                </span>
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button">전화번호 인증</button>
                </span>
              </div> -->
              
              <div class="input-group">
              	<span class="input-group-btn">
              	  <label id="email_lb" for="m_email" class="form-control">
              	  	<i class="fa fa-envelope-o"></i> 
              	  </label>
                </span>
                <span class="input-group-btn">
                  <input id="m_email" name="m_email" type="text" class="form-control" placeholder="User email">
                </span>
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button" onclick="javascript:sendMail()">이메일 인증</button>
                </span>
              </div>
              
              <div class="input-group">
              	<span class="input-group-btn">
              	  <label id="email_lb" for="m_email" class="form-control">
              	  	<i class="fa fa-key"></i> 
              	  </label>
                </span>
                <span class="input-group-btn">
                  <input id="m_att" name="m_att" type="text" class="form-control" placeholder="User key">
                </span>
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button" onclick="javascript:mailAtt()">인증번호 확인</button>
                </span>
              </div>
        
              <!-- <div class="input-group"> 
              	<span class="input-group-btn">
					<label id="b_day_lb" for="b_day" class="form-control">
						<i class="fa fa-birthday-cake"></i>
					</label>
				</span>
				<span class="input-group-btn">
					<input class="form-control" type="text" id="b_day" name="b_day" placeholder="User birthday"/>
				</span>
				<span class="input-group-btn">
							&nbsp;&nbsp;&nbsp;
					<input type="radio" name="b_type" value="양력"/>양력
							&nbsp;&nbsp;&nbsp;
					<input type="radio" name="b_type" value="음력"/>음력
				</span>
			  </div> -->
 			  
 			  <div class="input-group">
 			  	<span class="input-group-btn btcenter">
 			  		<br/>
					<button type="button" class="btn btn-secondary" onclick="javascript:reg()">저 장
					</button>
							&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-secondary" onclick="javascript:location.href='main.inc'">취 소
					</button>
				</span>
			  </div>	
 
            </div>
           </form>
          </div>
    <jsp:include page="footer.jsp"></jsp:include>

    <!-- 달력 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery-ui.min.js"></script>
    
	    <!-- Menu Toggle Script -->
    <script>
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
    
	var sessionid = "${m_id}";
	
	if(sessionid != "")
		location.href = "main.inc";
	
    $(function(){	
		$("#b_day").datepicker({
				dateFormat: 'yy-mm-dd',
				dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
				monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				showMonthAfterYear: true
		});
		
	});
    var chkId = false;
    var chkPwd = false;
    var chkSend = false;
    var chkAtt = false;
    var str_space = /\s/;
    var regType1 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9])$/;
    var regType2 = /^[A-Za-z0-9+]*$/;
    var regType3 = /^[0-9!@#$%^*+=-]*$/;
    var regType4 = /^[A-Za-z!@#$%^*+=-]*$/;
    
    var regType5 = /^[A-Za-z]*$/;
    var regType6 = /^[0-9]*$/;
    var regType7 = /^[!@#$%^*+=-]*$/;
    var regType8 = /(^[a-zA-Z])/;
    
    var id2 = null;
    var email2 = null;
    
    function mailAtt(){
    	var att = $("#m_att").val();
    	var num = sessionStorage.getItem("joinCode");

    	if(att.trim().length < 1){
			alert("인증번호를 입력하세요.");
			$("#m_att").focus();
			return;
		}
    	console.log(num);
    	if(num == att){
    		chkAtt = true;
    		alert("인증번호 확인 완료!");
    	}else{
    		alert("올바른 인증번호가 아닙니다.");
    		return;
    	}
    }
    
    function sendMail(){
    	var email = $("#m_email").val();
    	
    	if(email.trim().length < 1){
			alert("이메일을 입력하세요.");
			$("#m_email").focus();
			return;
		}
    	
    	var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (email.match(regExp) == null) {
		    alert("이메일이 올바른 형식이 아닙니다.");
		    return;
		}
		
		alert("메일 전송, 확인버튼을 누르세요");
		
		$.ajax({
			url: "sendMail.inc",
			data: "email="+ email,
			type: "POST",
			dataType: "json",
		}).done(function(data){
			sessionStorage.setItem("joinCode", data.joinCode);
			chkSend = true;
		}).fail(function(){
		});
		
		email2 = $("#m_email").val();
    } 
    
    function checkId(){
    	var id = $("#m_id").val();
    	if(id.trim().length < 4 || id.trim().length > 11){
    		alert("아이디는 4~10자만 가능합니다.");
    		return;
    	}else if(str_space.exec(id)){
    		alert("공백은 사용 불가합니다.");
    		return;
    	}else if(regType6.exec(id)){
    		alert("영문이  포함되어야 합니다.");
    		return;
    	}else if(!regType2.exec(id)){
    		alert("아이디는 영문과 숫자만 입력 가능합니다.");
    		return;
    	}else if(!regType8.exec(id)){
    		alert("첫글자는 영문이어야 합니다.");
    		return;
    	}
    	
		$.ajax({
			url: "checkid.inc",
			data: "id="+ id,
			type: "POST",
			dataType: "json",
		}).done(function(data){
			var msg = data.msg;
			if(msg == "0"){
				alert("중복된 아이디입니다.");
				return;
			}else{
				chkId = true;
				alert("사용가능한 아이디입니다.");
			}
		}).fail(function(){
		});
		
		id2 = $("#m_id").val();
		
    }
    
    function checkPwd(){
    	var pwd = $("#m_pwd").val();
		var r_pwd = $("#mr_pwd").val();
		
		if(pwd.trim().length < 8 || pwd.trim().length > 15){
			alert("비밀번호는 8~15자만 가능합니다.");
			return;
		}else if(str_space.exec(pwd)){
    		alert("공백은 사용 불가합니다.");
    		return;
		}else if(regType5.exec(pwd)){
			alert("숫자와 특수문자가 포함되어야 합니다.");
			return;
		}else if(regType6.exec(pwd)){
			alert("특수문자와 영문이 포함되어야 합니다.");
			return;
		}else if(regType7.exec(pwd)){
			alert("영문과 숫자가 포함되어야 합니다.");
			return;
		}else if(regType1.exec(pwd)){
    		alert("입력 불가능한 문자입니다.");
    		return;
		}else if(regType2.exec(pwd)){
			alert("특수문자가 포함되어야 합니다.");
			return;
		}else if(regType3.exec(pwd)){
			alert("영문이 포함되어야 합니다.");
			return;
		}else if(regType4.exec(pwd)){
			alert("숫자가 포함되어야 합니다.");
			return;
		}
		
		if(pwd == r_pwd){
			chkPwd = true;
			alert("비밀번호 확인!");
		}else{
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
    }
    
    
    function reg(){
		// 반드시 입력이 되야하는 값을 비교
		// id, pw, r_pw, email
		var id = $("#m_id").val();
		var pwd = $("#m_pwd").val();
		var r_pwd = $("#mr_pwd").val();
		var email = $("#m_email").val();
		var att = $("#m_att").val();
		
		if(id.trim().length < 1){
			alert("아이디를 입력하세요.");
			$("#m_id").focus();
			return;
		}
		
		if(chkId == false){
			alert("중복 확인 버튼을 누르세요.");
			return;
		}
		
		if(pwd.trim().length < 1){
			alert("비밀번호를 입력하세요.");
			$("#m_pwd").focus();
			return;
		}
		
		if(r_pwd.trim().length < 1){
			alert("비밀번호를  재입력하세요.");
			$("#mr_pwd").focus();
			return;
		}
		
		if(chkPwd == false){
			alert("비밀번호 확인 버튼을 눌러주세요.");
			return;
		}
		
		if(pwd != r_pwd){
			alert("동일한 비밀번호를 입력해야합니다.");
			return;
		}
		
		if(email.trim().length < 1){
			alert("이메일을 입력하세요.");
			$("#m_email").focus();
			return;
		}
	 	
		var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		
		if (email.match(regExp) == null) {
		    alert("이메일이 올바른 형식이 아닙니다.");
		    return;
		}
		
		if(chkSend == false){
			alert("이메일 인증 버튼을 누르세요.");
			return;
		}
		
		if(att.trim().length < 1){
			alert("인증번호를 입력하세요.");
			$("#m_att").focus();
			return;
		}
		
		if(chkAtt == false){
			alert("인증번호 확인 버튼을 눌러주세요.");
			return;
		}
		
		if(id != id2){
			alert("중복 확인 버튼을 다시 누르세요.");
			return;
		}
		
		if(email != email2){
			alert("이메일이 바뀌었습니다 재인증 해주세요.");
			return;
		}
		
		alert("회원가입 완료!");
		document.forms[0].submit();
	}
     
    </script>
    
  </body>

</html>
