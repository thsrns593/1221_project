<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/lib/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/lib/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body{
	width: 100%;
	height: 550px;
}
.id_total{
	margin: auto;
	margin-top: 15px;
}
.pw_total{
	margin: auto;
	margin-top: 15px;
}
.t_head{
	width: 100%;
	margin-bottom: 40px;
	font-size: 25px;
	text-align: center;
	background-color: #efefef;
	
}
.m_id{
	margin: auto;
	align-self: center;
	margin-bottom: 9px;
}
.f_bottom{
	
	position:absolute;
	bottom:0;
	width: 100%;
}
.id_ema{
	width: 100%;
	padding-left: 55px;
}
.find_id{
	
	width: 100%;
	text-align: center;
}
.find_pwd{
	
	width: 100%;
	text-align: center;
}
.id_ema button{
	background-color: white;
	border-radius: 5px;
	border: 1px solid black;
	margin-bottom: 9px;
}
.pw_ema button{
	background-color: white;
	border-radius: 5px;
	border: 1px solid black;
	margin-bottom: 9px;
}
#t_ok{
	margin-top: 10px;
	background-color: white;
	border-radius: 5px;
	border: 1px solid black;
	margin-left: 245px;
	padding: 5px;
}
.pw_ema{
	width: 100%;
	padding-left: 70px;
	
}
.m_email{
	margin-bottom: 9px;
}
</style>
</head>
<body>
	<div class="id_total">
			
			<label class="t_head">아이디 찾기</label><br/>
			
			<label class="find_id">E-Mail주소로 아이디 찾기</label><br/>
		<div class="id_ema">
			<input type="text" id="m_email" name="m_email" class="m_email" placeholder="E-Mail"/>
			<button type="button" onclick="javascript:sendMail()">인증번호받기</button><br/>
			<input type="text" id="m_att" name="m_att" class="m_att" placeholder="인증번호"/>
			<button type="button" onclick="javascript:mailAtt()">인증번호확인</button>
		</div>
			<button id="t_ok" type="button" onclick="javascript:reg()">확인</button>
	</div>
	<div class="pw_total">
			
			<label class="t_head">비밀번호 찾기</label><br/>
			
			<label class="find_pwd">본인정보로 비밀번호 찾기</label><br/>
		<div class="pw_ema">
			<input type="text" id="m_id" name="m_id" class="m_id" placeholder="아이디"/><br/>
			<input type="text" id="m_email2" name="m_email" class="m_email" placeholder="E-Mail"/>
			<button type="button" onclick="javascript:sendMail_p()">인증번호받기</button><br/>
			<input type="text" id="m_att2" name="m_att" class="m_att" placeholder="인증번호"/>
			<button type="button" onclick="javascript:mailAtt_p()">인증번호확인</button>
			
		</div>
			<button id="t_ok" type="button" onclick="javascript:reg_p()">확인</button>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
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
	
	var chkAtt = false;
	var chkSend = false;
	var findid_email = null;
	var findpwd_email = null;
	var str_space = /\s/;
	
	function mailAtt_p(){
		var att = $("#m_att2").val();
    	var num = sessionStorage.getItem("joinCode");

    	if(att.trim().length < 1){
			alert("인증번호를 입력하세요.");
			$("#m_att").focus();
			return;
		}
    	if(num == att){
    		chkAtt = true;
    		alert("인증번호 확인 완료!");
    	}else{
    		alert("올바른 인증번호가 아닙니다.");
    		return;
    	}
	}
	
	function sendMail_p(){
		var id = $("#m_id").val();
		var email = $("#m_email2").val();
		var chk = false;
		
		if(id.trim().length < 1){
			alert("아이디를 입력하세요.");
			$("#m_id").focus();
			return;
		}

		var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (email.match(regExp) == null) {
		    alert("이메일이 올바른 형식이 아닙니다.");
		    return;
		}
		
		$.ajax({
			url: "checkid.inc",
			data: "id="+ id,
			type: "POST",
			dataType: "json",
		}).done(function(data){
			var msg = data.msg;
			if(msg == "1"){
				alert("가입하신 아이디와 이메일이 일치하지 않습니다1.");
				return;
			}else{
				chk = true;
			}
		}).fail(function(){
		});
		
		setTimeout(function() {
			console.log("aaa");
		 if(chk == true){
			$.ajax({
				url: "findemail.inc",
				data: "id="+ id,
				type: "POST",
				dataType: "json",
			}).done(function(data){
				console.log("bbb");
				if(email == data.findEmail){
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
				}else{
					alert("가입하신 아이디와 이메일이 일치하지 않습니다.");
				}
			}).fail(function(){
			}); 
		}
		 
		 findpwd_email = $("#m_email2").val();
		}, 1000);
		
	}
	
	function mailAtt(){
		var att = $("#m_att").val();
    	var num = sessionStorage.getItem("joinCode");

    	if(att.trim().length < 1){
			alert("인증번호를 입력하세요.");
			$("#m_att").focus();
			return;
		}
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
    	
    	if(str_space.exec(email)){
    		alert("공백은 사용 불가합니다.");
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
		
		findid_email = $("#m_email").val();
	}
	
	function reg(){
		var email = $("#m_email").val();
		
		if(chkSend == false || chkAtt == false){
			alert("이메일 인증을 진행하셔야 합니다.");
			return;
		} 
		
		if(email != findid_email){
			alert("이메일이 바뀌었습니다 재인증 해주세요.");
			return;
		}
		
		 if(chkSend == true && chkAtt == true){
			$.ajax({
				url: "findid.inc",
				data: "email="+ email,
				type: "POST",
				dataType: "json",
			}).done(function(data){
				alert("회원님의 아이디는 "+data.findid+" 입니다.");
			}).fail(function(){
			}); 
		}	
	}
	
	function reg_p(){
		var email = $("#m_email2").val();
		
		if(chkSend == false || chkAtt == false){
			alert("이메일 인증을 진행하셔야 합니다.");
			return;
		} 
		
		if(email != findpwd_email){
			alert("이메일이 바뀌었습니다 재인증 해주세요.");
			return;
		}
		
		 if(chkSend == true && chkAtt == true){
			$.ajax({
				url: "findpwd.inc",
				data: "email="+ email,
				type: "POST",
				dataType: "json",
			}).done(function(data){
				alert("회원님의 비밀번호는 "+data.findPwd+" 입니다.");
			}).fail(function(){
			}); 
		}	
	}
	
	</script>
    
</body>
</html>