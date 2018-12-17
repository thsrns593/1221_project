<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>로그인</title>
<link href="${pageContext.request.contextPath}/lib/css/login.css"
	rel="stylesheet">
</head>
<body class="bodya">
	<jsp:include page="navigation.jsp"></jsp:include>

	<div class="log_container">

		<div class="col-md-4 col-sm-offset-4">
			<div class="login-panel">
				<div class="panel-heading">
					<h3 class="panel-title">로그인</h3>
				</div>
				<div class="panel-body b_color">
					<form method="post" id="frm" action="login.inc">
						<fieldset>
							<div class="form-group">
								<input class="form-control" id="email" placeholder="ID"
									name="email" type="email" autofocus>
							</div>
							<div class="form-group1">
								<input class="form-control" id="password" placeholder="Password"
									name="password" type="password" value="">
							</div>
							<div class="checkbox">
								<table>
									<thead>
										<tr>
											<td><input name="remember" id="remember" type="checkbox"
												value="Remember Me" onclick="chk()">&nbsp;아이디 기억
											<td>
												<button
													onclick="window.open('find.inc','window_name','width=530,height=600,location=no,status=no,scrollbars=yes');"
													type="button" id="r_id1" name="r_id1" value="아이디 찾기" style="cursor: pointer">아이디
													찾기</button>
											</td>
											<td>/</td>
											<td>
												<button
													onclick="window.open('find.inc','window_name','width=530,height=600,location=no,status=no,scrollbars=yes');"
													type="button" id="r_id2" name="r_id1" value="비밀번호 찾기" style="cursor: pointer">비밀번호
													찾기</button>
											</td>
										</tr>
									</thead>
								</table>
							</div>
							<a href="javascript: login()" class="lo_btn">로그인</a> <a
								href="javascript: join()" class="jo_btn">회원가입</a> <a
								href="" class="ka_btn">네이버 로그인</a>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
		<input type="hidden" id="check" value="${param.check}" />
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(function() {
			
			var m_id = localStorage.getItem("m_id");
			if (m_id != null && m_id.trim().length > 0){
				$("#email").val(m_id);
				$("input:checkbox[id='remember']").prop("checked", true);
			}
			var check = $("#check").val();
			if (check.trim().length > 1) {
				alert("로그인 실패");
			}
		});
		
		function login() {

			var m_id = $("#email").val();
			var m_pwd = $("#password").val();
			if (m_id.trim().length < 1 && m_pwd.trim().length < 1) {
				alert("아이디와 비밀번호 모두 입력해주세요");
			} else {
				$("#frm").submit();
			}
		}
		function join() {
			location.href = "join.inc";
		}
		function chk() {
			var m_id = $("#email").val();
			var remember = $("[name=remember]").prop("checked");
			alert(remember);
			if (remember) {
				if (m_id.trim().length < 1) {
					$("[name=remember]").prop("checked", false);
					alert("아이디를 입력하세요");
					return;
				}
				localStorage.setItem("m_id", m_id);
			}
			if (!remember) {
				if (m_id.trim().length < 1) {
					$("[name=remember]").prop("checked", false);
					alert("아이디를 입력하세요");
					return;
				}
				localStorage.removeItem('m_id');
			}
		}
		
	</script>
</body>

</html>
