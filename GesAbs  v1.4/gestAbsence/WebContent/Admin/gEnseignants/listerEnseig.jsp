<%@page import="models.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lister etudiants</title>
</head>
<body>
<jsp:useBean id="enseig" class="dao.enseignantDao.EnseignantDao"></jsp:useBean>
<jsp:useBean id="etab" class="dao.EtablissementDao.EtablissementDao"></jsp:useBean>


 <div class="menu">
  <a href="../espaceAdmin.jsp">Accueil</a><br>
  <h4>Gestion des étudiants</h4>
   <a href="#">consulter les absences</a><br>
  <a href="#" >Ajoute des étudiants</a><br>
  <a href="#">Modification des étudiants</a>
  <h4>Gestion des filieres</h4>
  <a href="#">Ajoute des filieres</a><br>
  <a href="#">Modification des filieres</a>
  <h4>Gestion des enseignants</h4>
  <a href="#">Ajoute des enseignants</a><br>
  <a>___Modification des enseignants</a>
  
  </div>

<table border="1">
<tr>
<th>Cnp</th><th>Cin</th><th>Nom</th><th>Prénom</th><th>Date de Naissance</th><th>login</th><th>Password</th><th>Email</th><td>Sexe</th><th>Télé</th><th>Etablissement</th><th>Supprimer</th><th>Mise à jour</th>
</tr>


<c:forEach items="${enseig.getAllEnseig(sessionScope.admin.getIdEtab())}" var="e">
<tr>
<td>${e.getCnp()}</td><td>${e.getCin()}</td><td>${e.getNom() }</td><td>${e.getPrenom()}</td><td>${e.getDateNais()}</td><td>${e.getLogin()}</td><td>${e.getPsw()}</td><td>${e.getEmail() }</td>
<td>${e.getSexe()}</td><td>${e.getTele()}</td><td>${etab.getEtabliById(e.getIdEtab()).getNomEtab() }</td><td><a href="../../supEnseignant?cnp=${e.getCnp()}&cin=${e.getCin()}">Supprimer</a></td><td><a href="../../miseEnseignant?cnp=${e.getCnp()}&cin=${e.getCin()}">Mise à jour</a></td>
</tr>
</c:forEach>
</table>

<b>${msg}</b>
<% request.getSession().removeAttribute("msg"); %>
</body>
</html>