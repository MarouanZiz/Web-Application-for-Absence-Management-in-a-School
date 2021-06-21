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
<c:when test="${empty sessionScope.etudiant }">

<span>votre session est expiré,vous devez reconnecter </span>

<a href="../cnx_etd.jsp">reconnecter</a>

</c:when>
<c:otherwise>

<h2>Espace ${sessionScope.etudiant.getNom()}</h2>

<a href="../logoutEtd">déconnexion</a>
</c:otherwise>
</c:choose>
</body>
</html>