<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ajout des absences</title>
</head>
<body>
<jsp:useBean id="enseignerDao" class="dao.enseignerDao.EnseignerDao"></jsp:useBean>
<jsp:useBean id="etudiant" class="dao.etudiantDao.EtudiantDao"></jsp:useBean>
<jsp:useBean id="niv" class="dao.niveauDao.NiveauDao"></jsp:useBean>
<a href="../espaceEnseig.jsp">Acceuil</a>
<form action="../../srv_ajAbs" method="POST">
<h3>choisir un niveau: </h3>
<select name="niv">
<c:forEach items="${niv.getNiveau(enseignerDao.getByThisYear(sessionScope.enseignant.getId()))}" var="n">
<option value="${n.getIdNiveau()}">${n.getNomNiveau()}</option>
</c:forEach>
</select>
<input type="submit" name="subniv" value="Lister">
</form>


<c:if test="${not empty sessionScope.listeEtd }">
<h3>Votre étudiants de cette annee:</h3>
<table border="1">
<tr><th>Cne</th><th>Nom</th><th>Prénom</th><th>Date de Naissance</th><th>Email</th><th>Sexe</th><th>Lieu de Naissance</th><th>Niveau</th><th colspan="2"></th></tr>
<c:forEach items="${sessionScope.listeEtd }" var="e">

<tr><td>${e.getCne() }</td><td>${e.getNom() }</td><td>${e.getPrenom() }</td><td>${e.getDateNais() }</td><td>${e.getEmail() }</td>
<td>${e.getSexe()}</td><td>${e.getLieuNais()}</td><td>${niv.getNivById(e.getIdNiv()).getNomNiveau()}</td><td><a href="../../srv_ajAbs?cne=${e.getCne() }&niv=${e.getIdNiv()}">Consulter l'absence</a></td><td><a href="">Saisir l'absence</a></td></tr>

</c:forEach>

</table>
<% request.getSession().removeAttribute("listeEtd"); %>
</c:if>

<c:if test="${not empty sessionScope.listeAbs}">
<h3>Liste des absences:</h3>

<table border="1">
<tr><th>cne</th><th>Nom</th><th>Prénom</th><th>Niveau</th><th>de</th><th>à</th><th>Date Absence</th><th>Etat d'absence</th></tr>

<c:forEach items="${sessionScope.listeAbs}" var="e">

<tr><td>${e.getCneEtd()}</td><td>${etudiant.getEtudiantByCn(e.getCneEtd()).getNom() }</td><td>${etudiant.getEtudiantByCn(e.getCneEtd()).getPrenom() }</td><td>${niv.getNivById(e.getIdniv()).getNomNiveau()}</td><td>${e.getEmail() }</td>
<td>${e.getSexe()}</td><td>${e.getLieuNais()}</td><td></td><td><a href="../../srv_ajAbs?cne=${e.getCne() }&niv=${e.getIdNiv()}">Consulter l'absence</a></td><td><a href="">Saisir l'absence</a></td></tr>


</c:forEach>

</table>

</c:if>


</body>
</html>