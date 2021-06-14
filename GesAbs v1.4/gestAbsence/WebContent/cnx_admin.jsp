<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Page accès espace admin</title>
</head>
<body>
<c:choose>
<c:when test="${not empty sessionScope.admin}"><c:redirect url="Admin/espaceAdmin.jsp"/></c:when>
</c:choose>
<form action="cnxAdmin" method="POST">
	<input type="text" placeholder="login" name="login"><br>
	<input type="password" placeholder="password" name="psw"><br>
	<input type="submit" value="connexion">
</form>
<b style="color:red">${requestScope.msg}</b>

</body>
</html>