<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<c:choose>

<c:when test="${empty sessionScope.prof}">
<form action="ProContr" method="POST">
<label>Email:</label>
<input type="text" name="email" ><br>
<label>Password</label>
<input type="password" name="psw"><br>
<input type="submit" value="Connection">
</form>
</c:when>

<c:otherwise>

<jsp:forward page="/WEB-INF/view/espaceProf.jsp"></jsp:forward>

</c:otherwise>

</c:choose>



<b style="color:red"><c:out value="${msg }"/></b>

</body>
</html>