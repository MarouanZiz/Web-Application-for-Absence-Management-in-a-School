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

<!--
le menu doit afficher toujours dans tous les pages d'admin
------menu-----------------------------------------------------------------+--affichage du contenue---+
___Gestion des étudiants <<                                                |	------------------	  |
_consulter les absences des étudiants et saisir l'état d'absence (default) |	------------------    |
_inserer les etudiants_                                                    |	------------------    |
_Modifier les étudiants_                                                   |	------------------	  |
___Gestion des filieres >>	                                               |	------------------	  |
___Gestion des enseignants >>											   |	------------------	  |
																		   |	------------------    |						
---------------------------------------------------------------------------+--------------------------+
  -->
  <!-- une fois tu cliques sur la balise le contenu doit apparaitre dans la partie d'affichage sans faire une redirection à une autre page  -->
  
  <div class="menu">
  <a href="../espaceAdmin.jsp">Accueil</a><br>
  <h4>Gestion des étudiants</h4>
   <a href="#">consulter les absences</a><br>
  <a href="#" >Ajoute des étudiants</a><br>
  <a>____Modification des étudiants</a>
  <h4>Gestion des filieres</h4>
  <a href="#">Ajoute des filieres</a><br>
  <a href="#">Modification des filieres</a>
  <h4>Gestion des enseignants</h4>
  <a href="#">Ajoute des enseignants</a><br>
  <a href="#">Modification des enseignants</a>
  
  </div>
  
  <div class="content">
  <jsp:useBean id="niveau" class="dao.niveauDao.NiveauDao" ></jsp:useBean>
   <jsp:useBean id="etab" class="dao.EtablissementDao.EtablissementDao" ></jsp:useBean>

  <h2 Style="margin:10px 400px;">Mis à jour des étudiants</h2>
  
  <form action="../../miseEtudiant" method="POST">
  
  <table style="margin:50px auto 10px">
  
  <tr><td>Nom:</td><td><input required  type="text" name="nom" value="${sessionScope.etudiant.getNom() }" ></td></tr>
  <tr><td>Prénom:</td><td><input required  type="text" name="prenom" value="${sessionScope.etudiant.getPrenom() }" ></td></tr>
  <tr><td>Date de naissance:</td><td><input required  type="date" name="dtn" value="${sessionScope.etudiant.getDateNais() }" ></td></tr>
  <tr>
  <td>Sexe:</td>
  <td>
  <select name="gendre"> 
  <option value="H" ${sessionScope.etudiant.getSexe() == 'H' ? 'selected' : '' }>Homme</option>
  <option value="F" ${sessionScope.etudiant.getSexe() == 'F' ? 'selected' : '' }>Femme</option>
  </select>
  </td>

  <tr><td>Lieu de naissance:</td><td><input required  type="text" name="lnais" value="${sessionScope.etudiant.getLieuNais()}" ></td></tr>
  <tr><td>Etablissement:</td> <td><c:out value="${ etab.getEtabliById(sessionScope.etudiant.getIdEtab()).getNomEtab() }"/></td></tr>
  <tr><td>Niveau:</td>
                       <td><select name="niv">
                       <c:forEach items="${niveau.getNiveau()}" var="n">
                        <option value="${n.getIdNiveau()}" ${n.getIdNiveau() == sessionScope.etudiant.getIdNiv() ? 'selected' : '' } ><c:out value='${n.getNomNiveau()}'></c:out></option>
                        </c:forEach>
                        </select>
                        </td>
  </tr>
  <tr><td><input type="submit" value="Modifier" name="modif" /></td></tr>
  </table>	
  
  </form>
  
  <b>${message}</b>
  <% request.getSession().removeAttribute("message"); %>
  </div>

</body>
</html>