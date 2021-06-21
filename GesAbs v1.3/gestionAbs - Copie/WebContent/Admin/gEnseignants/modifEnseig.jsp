<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestion des etudiants</title>
</head>
<body>


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
  
  <div class="content">
  <jsp:useBean id="niveau" class="dao.niveauDao.NiveauDao" ></jsp:useBean>
   <jsp:useBean id="etab" class="dao.EtablissementDao.EtablissementDao" ></jsp:useBean>

  <h2 Style="margin:10px 400px;">Mis à jour des Enseiganat</h2>
  
  <form action="../../miseEnseignant" method="POST">
  
  <table style="margin:50px auto 10px">
  <tr><td>Cnp:</td><td><input required  type="text" name="cnp" value="${sessionScope.enseignant.getCnp() }" ></td></tr>
  <tr><td>cin:</td><td><input required  type="text" name="cin" value="${sessionScope.enseignant.getCin() }" ></td></tr>
  <tr><td>Nom:</td><td><input required  type="text" name="nom" value="${sessionScope.enseignant.getNom() }" ></td></tr>
  <tr><td>Prénom:</td><td><input required  type="text" name="prenom" value="${sessionScope.enseignant.getPrenom() }" ></td></tr>
  <tr><td>Date de naissance:</td><td><input required  type="date" name="dtn" value="${sessionScope.enseignant.getDateNais() }" ></td></tr>
  <tr><td>Email</td><td><input required  type="email" name="email" value="${sessionScope.enseignant.getEmail()}" ></td></tr>
  <tr>
  <td>Sexe:</td>
  <td>
  <select name="gendre"> 
  <option value="H" ${sessionScope.enseignant.getSexe() == 'H' ? 'selected' : '' }>Homme</option>
  <option value="F" ${sessionScope.enseignant.getSexe() == 'F' ? 'selected' : '' }>Femme</option>
  </select>
  </td>

  
  <tr><td>Etablissement:</td> <td><c:out value="${ etab.getEtabliById(sessionScope.enseignant.getIdEtab()).getNomEtab() }"/></td></tr>
 <tr><td>Téléphone:</td><td><input required  type="tel" name="tel" value="${sessionScope.enseignant.getTele()}" ></td></tr>
  <tr><td><input type="submit" value="Modifier" name="modifer" /></td></tr>
  </table>	
  
  </form>
  
  <b>${message}</b>
  <% request.getSession().removeAttribute("message"); %>
  </div>

</body>
</html>