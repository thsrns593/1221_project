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
    <link href="${pageContext.request.contextPath}/lib/css/login.css" rel="stylesheet">

</head>

<body class="bodya" style="background: url(${pageContext.request.contextPath}/images/img.jpg) no-repeat !important; background-size: cover !important; height: 770px !important;">
 <jsp:include page="navigation.jsp"></jsp:include>
  
    <div class="log_container">
        
            <div class="col-md-4 col-sm-offset-4">
                <div class="login-panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">로그인</h3>
                    </div>
                    <div class="panel-body b_color">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="ID" name="email" type="email" autofocus>
                                </div>
                                <div class="form-group1">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                   <table>
                                   	<thead>
                                   		<tr>
                                   		<td>
                                   		
                                        <input name="remember" type="checkbox" value="Remember Me">&nbsp;로그인 유지
                                       
                                   		
                                   			<td>
                                   				<button onclick="window.open('find.inc','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');" type="button" id="r_id1" name="r_id1" value="아이디 찾기">아이디 찾기</button>
                                   			</td>
                                   			<td>/</td>
                                   			<td>
                                   				<button onclick="window.open('find.inc','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');" type="button" id="r_id2" name="r_id1" value="비밀번호 찾기">비밀번호 찾기</button>
                                   			</td>
                                   		</tr>
                                   	</thead>
                                   </table>
                                </div>
                                <a href="Main.inc" class="lo_btn">로그인</a>
                                <a href="join.inc" class="jo_btn">회원가입 하러가기</a>
                                <a href="" class="ka_btn">카카오 아이디로 로그인</a>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
       
    </div>
<jsp:include page="footer.jsp"></jsp:include>
    
</body>

</html>
