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
  <a >____Ajoute des étudiants</a><br>
  <a href="#">Modification des étudiants</a>
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

  <h2 Style="margin:10px 400px;">Ajoute des étudiants</h2>
  
  <form action="../../ajEtudiant" method="POST">
  
  <table style="margin:50px auto 10px">
  <tr><td>CNE:</td><td><input required type="text" name="cne" ></td></tr>
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

  <tr><td>Lieu de naissance:</td><td><input required  type="text" name="lnais" ></td></tr>
  <tr><td>Etablissement:</td> <td><c:out value="${ etab.getEtabliById(sessionScope.admin.getIdEtab()).getNomEtab() }"/></td></tr>
  <tr><td>Niveau:</td>
                       <td><select name="niv">
                       <c:forEach items="${niveau.getNiveau()}" var="n">
                        <option value="${n.getIdNiveau()}" ><c:out value='${n.getNomNiveau()}'></c:out></option>
                        </c:forEach>
                        </select>
                        </td>
  </tr>
  <tr><td><input type="submit" value="Enregistrer" /></td></tr>
  </table>	
  
  </form>
  
  <b>${message}</b>
  <% request.getSession().removeAttribute("message"); %>
  </div>

</body>
</html>