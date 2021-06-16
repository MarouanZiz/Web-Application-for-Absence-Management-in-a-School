<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lister etudiants</title>
</head>
<body>
<jsp:useBean id="etudiants" class="dao.etudiantDao.EtudiantDao"></jsp:useBean>
<jsp:useBean id="etab" class="dao.EtablissementDao.EtablissementDao"></jsp:useBean>
<jsp:useBean id="niv" class="dao.niveauDao.NiveauDao"></jsp:useBean>

 <div class="menu">
  <a href="../espaceAdmin.jsp">Accueil</a><br>
  <h4>Gestion des étudiants</h4>
   <a href="#">consulter les absences</a><br>
  <a href="#" >Ajoute des étudiants</a><br>
  <a >____Modification des étudiants</a>
  <h4>Gestion des filieres</h4>
  <a href="#">Ajoute des filieres</a><br>
  <a href="#">Modification des filieres</a>
  <h4>Gestion des enseignants</h4>
  <a href="#">Ajoute des enseignants</a><br>
  <a href="#">Modification des enseignants</a>
  
  </div>

<table border="1">
<tr><th>Cne</th><th>Cin</th><th>Nom</th><th>Prénom</th><th>Date de Naissance</th><th>login</th><th>Password</th><th>Email</th><td>Sexe</th><th>Lieu de Naissance</th><th>Etablissement</th><th>Niveau</th><th>Supprimer</th><th>Mise à jour</th></tr>
<c:forEach items="${etudiants.getAllEtd(sessionScope.admin.getIdEtab())}" var="e">
<tr><td>${e.getCne() }</td><td>${e.getCin() }</td><td>${e.getNom() }</td><td>${e.getPrenom() }</td><td>${e.getDateNais() }</td><td>${e.getLogin() }</td><td>${e.getPassword() }</td><td>${e.getEmail() }</td>
<td>${e.getSexe()}</td><td>${e.getLieuNais()}</td><td>${etab.getEtabliById(e.getIdEtab()).getNomEtab() }</td><td>${niv.getNivById(e.getIdNiv()).getNomNiveau()}</td><td><a href="../../supEtudiant?cne=${e.getCne()}&cin=${e.getCin()}">Supprimer</a></td><td><a href="../../miseEtudiant?cne=${e.getCne()}&cin=${e.getCin()}">Mise à jour</a></td></tr>
</c:forEach>
</table>

<b>${msg}</b>
<% request.getSession().removeAttribute("msg"); %>
</body>
</html>