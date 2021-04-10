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

<c:when test="${ not empty sessionScope.prof}">

<h1>Bienvenue <c:out value="${sessionScope.prof.getPrenomP()}"></c:out></h1>

<a href="AbsE.jsp">Absences des étudiants</a><br>



<a href="deconnexion">Log out</a>


</c:when>
<c:otherwise>
Vous devez être connecter pour accede ce espace !<br> <a href="accProf.jsp">login</a>
</c:otherwise>
</c:choose>

</body>
</html>