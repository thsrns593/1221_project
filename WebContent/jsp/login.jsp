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
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
					<form method="post" id="frm" name="frm" action="login.inc">
						<fieldset>
							<div class="input-group">
			              	<span class="input-group-btn">
			              	  <label id="id_lb" for="email" class="form-control">
			              	  	<i class="fa fa-user"></i>
			              	  </label>
			                </span>
			                <span class="input-group-btn">
			                  <input id="email" name="email" autofocus type="text" class="form-control" placeholder="User id">
			                </span>      
			              </div>
			              
			              <div class="input-group">
			              	<span class="input-group-btn">
			              	  <label id="pw_lb" for="password" class="form-control">
			              	  	<i class="fa fa-lock"></i>
			              	  </label>              	  
			                </span>
			                <span class="input-group-btn">
			                  <input id="password" name="password" type="password" class="form-control"  onkeydown="javascript: enter()" placeholder="User password">
			                </span>              
			              </div>
			          
							<!-- <div class="form-group">
								<input class="form-control" id="email" placeholder="ID"
									name="email" type="email" autofocus>
							</div>
							<div class="form-group1">
								<input class="form-control" id="password" placeholder="Password"
									name="password" type="password" value="">
							</div> -->
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
							<a href="javascript: login()" class="lo_btn">로그인</a> 
							<a href="javascript: join()" class="jo_btn">회원가입</a>
							<div id="naver_id_login" style="text-align:center"><a href="${url}">
<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
		<input type="hidden" id="check" value="${param.check}" />
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript">
	function enter(){

		var keyCode = window.event.keyCode;
		if(keyCode==13) frm.submit();
		}

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
