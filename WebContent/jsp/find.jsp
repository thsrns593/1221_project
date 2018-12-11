<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.t_id{
	margin: auto;
	align-self: center;
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
.t_email{
	
	width: 100%;
	text-align: center;
}
.id_ema button{
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
	margin-left: 180px;
	padding: 5px;
}
.pw_ema{
	width: 100%;
	padding-left: 70px;
	
}
.t_pass{
	width: 80%;
	margin-bottom: 9px;
}
.email{
	margin-bottom: 9px;
}
</style>
</head>
<body>
	<div class="id_total">
			
			<label class="t_head">아이디 찾기</label><br/>
			
			<label class="t_email">E-Mail주소로 아이디 찾기</label><br/>
		<div class="id_ema">
			<input type="text" id="email" name="email" class="email" placeholder="E-Mail"/>
			<button type="button">인증번호받기</button><br/>
			<input type="text" id="email" name="email" class="email" placeholder="인증번호"/>
			<button type="button">인증번호확인</button>
		</div>
			<button id="t_ok" type="button">확인</button>
	</div>
	<div class="pw_total">
			
			<label class="t_head">비밀번호 찾기</label><br/>
			
			<label class="t_email">본인정보로 비밀번호 찾기</label><br/>
		<div class="pw_ema">
			<input type="text" id="t_id" name="t_id" class="t_pass" placeholder="아이디"/>
			<input type="text" id="t_email" name="t_email" class="t_pass" placeholder="E-Mail"/>
			<input type="text" id="t_bir" name="t_bir" class="t_pass" placeholder="생년월일"/>
		</div>
			<button id="t_ok" type="button">확인</button>
	</div>
	
    
</body>
</html>