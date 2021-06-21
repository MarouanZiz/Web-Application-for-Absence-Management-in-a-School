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

 <div class="menu">
  <a href="../espaceAdmin.jsp">Accueil</a><br>
  <h4>Gestion des étudiants</h4>
   <a href="#">consulter les absences</a><br>
  <a href="#">Ajoute des étudiants</a><br>
  <a href="#">Modification des étudiants</a>
  <h4>Gestion des filieres</h4>
  <a href="#">Ajoute des filieres</a><br>
  <a href="#">Modification des filieres</a>
  <h4>Gestion des enseignants</h4>
  <a>___Ajoute des enseignants</a><br>
  <a href="#">Modification des enseignants</a>
  
  </div>
  
  <div class="content">
  <jsp:useBean id="niveau" class="dao.niveauDao.NiveauDao" ></jsp:useBean>
  <jsp:useBean id="etab" class="dao.EtablissementDao.EtablissementDao" ></jsp:useBean>
  <jsp:useBean id="module" class="dao.moduleDao.ModuleDao" ></jsp:useBean>

  <h2 Style="margin:10px 400px;">Ajoute des enseignants</h2>
  
  <form action="../../ajEnseignant" method="POST">
  
  <table style="margin:50px auto 10px">
  <tr><td>CNP:</td><td><input required type="text" name="cnp" ></td></tr>
  <tr><td>CIN:</td><td><input required  type="text" name="cin" ></td></tr>
  <tr><td>Nom:</td><td><input required  type="text" name="nom" ></td></tr>
  <tr><td>Prénom:</td><td><input required  type="text" name="prenom" ></td></tr>
  <tr><td>Date de naissance:</td><td><input required  type="date" name="dtn" ></td></tr>
  <tr>
  <td>Sexe:</td>
  <td>
  <select name="gendre"> 
  <option value="H">Homme</option>
  <option value="F">Femme</option>
  </select>
  </td>

  <tr><td>Email:</td><td><input required  type="email" name="email" ></td></tr>
  <tr><td>Tel:</td><td><input required  type="tel" name="tel" ></td></tr>
  <tr><td>Etablissement:</td> <td><c:out value="${ etab.getEtabliById(sessionScope.admin.getIdEtab()).getNomEtab() }"/></td></tr>
  <tr><td><input type="submit" value="Enregistrer" /></td></tr>
  </table>	
  
  </form>
  
  <b>${message}</b>
  <% request.getSession().removeAttribute("message"); %>
  </div>


</body>
</html>