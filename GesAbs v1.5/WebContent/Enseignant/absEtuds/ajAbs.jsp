<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
<jsp:useBean id="seance" class="dao.seanceDao.SeanceDao"></jsp:useBean>
<jsp:useBean id="module" class="dao.moduleDao.ModuleDao"></jsp:useBean>

<a href="../espaceEnseig.jsp">Acceuil</a>
<form action="../../srv_listeAbs" method="POST">
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
<td>${e.getSexe()}</td><td>${e.getLieuNais()}</td><td>${niv.getNivById(e.getIdNiv()).getNomNiveau()}</td><td><a href="../../srv_listeAbs?cne=${e.getCne() }&niv=${e.getIdNiv()}">Consulter l'absence</a></td><td><a href="../../srv_ajAbs?cne=${e.getCne()}">Saisir l'absence</a></td></tr>

</c:forEach>

</table>

</c:if>

<c:if test="${not empty sessionScope.listeAbs}">
<h3>Liste d'absences de l'étudiant:</h3>

<table border="1">
<tr><th>Cne</th><th>Nom</th><th>Prénom</th><th>Niveau</th><th>de</th><th>à</th><th>Date Absence</th><th>Module</th><th>Etat d'absence</th></tr>

<c:forEach items="${sessionScope.listeAbs}" var="e">

<tr><td>${e.getCneEtd()}</td><td>${etudiant.getEtudiantByCn(e.getCneEtd()).getNom()}</td><td>${etudiant.getEtudiantByCn(e.getCneEtd()).getPrenom() }</td><td>${niv.getNivById(e.getIdniv()).getNomNiveau()}</td><td>${seance.getSeance(e.getIdSeance()).getHeureDeb() }</td>
<td>${seance.getSeance(e.getIdSeance()).getHeureFin() }</td><td>${e.getDateAbs()}</td><td>${module.getModule(seance.getSeance(e.getIdSeance()).getIdModule()).getNomModule()}</td><td>${e.getEtat()}</td></tr>


</c:forEach>

</table>
<% request.getSession().removeAttribute("listeAbs"); %>
<% request.getSession().removeAttribute("listeEtd"); %>
</c:if>

<c:if test="${not empty sessionScope.etudiant }">
 
 <h3>Saisir l'absence de l'étudiant:</h3>
 <form action="../../srv_ajAbs" method="POST">

 <table border="1">
 
 <tr><th>Cne</th><th>Nom</th><th>Prénom</th><th>Niveau</th><th>De</th><th>à</th><th>Module</th><th>Date Absence</th></tr>
  <tr><td><input type="hidden" name="cne" value="${sessionScope.etudiant.getCne() }">${sessionScope.etudiant.getCne() }</td><td>${sessionScope.etudiant.getNom()}</td>
  <td>${sessionScope.etudiant.getPrenom() }</td><td><input type="hidden" name="niv" value="${sessionScope.etudiant.getIdNiv()}">${niv.getNivById(sessionScope.etudiant.getIdNiv()).getNomNiveau()}</td>
  <td><input type="time" name="deb" /></td><td><input type="time" name="fin" /></td><td><input type="hidden" name="module" value="${enseignerDao.getEnseigner(sessionScope.etudiant.getIdNiv(),sessionScope.enseignant.getId()).getIdModule()}"/>${module.getModule(enseignerDao.getEnseigner(sessionScope.etudiant.getIdNiv(),sessionScope.enseignant.getId()).getIdModule()).getNomModule()}</td><td><input type="date" required name="dateabs"/></td></tr>
 <tr><td colspan="8" ><input type="submit" name="abs" value="Enregister"/></td></tr>
 </table>
 </form>

 
</c:if>
<b>${msg}</b>

<% request.getSession().removeAttribute("msg"); %>
<% request.getSession().removeAttribute("etudiant"); %>
</body>
</html>