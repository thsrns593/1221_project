<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${page }업데이트 완료</h1>
	<c:if test="${page >=5 }">
		<input type="button" value="gomain" onclick="javascript: location.href = 'main.inc'">
	</c:if>
	<script type="text/javascript">
	var page = "${page}";
	if(page <5) {
		location.href="addlib.inc?page=${page +1}";
		
	}else {
		
	}
		
	</script>
</body>
</html>