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
<jsp:useBean id="Nivdao" class="dao.Niveaudao" scope="page"></jsp:useBean>
<c:choose>
<c:when test="${ not empty sessionScope.prof}">

<h2>Page d'absences par filière</h2>

<h4>selectioner une filière:</h4>

<form action="inserAbs" method="POST">

<select name="niveau">

<c:forEach items="${Nivdao.getNiveau()}" var="n">

<option value="${n.getIdN()}">${n.getNomN()}</option>

</c:forEach>

</select><br>

<input type="submit" value="Lister">

</form>

<c:if test="${not empty requestScope.listEtu}">
<form action="">
<table border="1">
<tr>

<th>CNE</th> <th>Nom</th> <th>Prénom</th> <th>Date naissance</th> <th colspan="2">Date d'absence</th>

<c:forEach items="${requestScope.listEtu}" var="e">
<tr><td><c:out value="${e.getCne()}"></c:out></td> <td><c:out value="${e.getNomE()}"></c:out></td> <td><c:out value="${e.getPrenomE()}"></c:out></td> <td><c:out value="${e.getDateNais()}"></c:out></td> <td><input type="date" max="2021" min="2020" name="date"><input type="submit" value="Enregister" name="abs"></td></tr>

</c:forEach>

</tr>
</table>

</form>
</c:if>

</c:when>
<c:otherwise>
Vous devez être connecter pour accede ce espace !<br> <a href="accProf.jsp">login</a>
</c:otherwise>
</c:choose>

</body>
</html>