<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Page acc�s espace Etudiant</title>
</head>
<body>
<c:choose>
<c:when test="${not empty sessionScope.etudiant}"><c:redirect url="espaceEtd.jsp"/></c:when>
</c:choose>
<form action="cnxEtd" method="POST">
	<input type="text" placeholder="login" name="login"><br>
	<input type="password" placeholder="password" name="psw"><br>
	<input type="submit" value="connexion">
</form>
<b style="color:red">${requestScope.msg}</b>

</body>
</html>