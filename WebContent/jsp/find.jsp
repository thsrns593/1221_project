<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/lib/css/find.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/lib/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/lib/css/bootstrap.min.css" rel="stylesheet">
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
	<!-- Footer -->
    <footer class="py-5 bg-dark f_bottom">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
    </footer>
    
</body>
</html>