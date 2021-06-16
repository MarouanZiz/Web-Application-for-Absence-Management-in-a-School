<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Espace Admin</title>
</head>
<body>
<c:choose>
<c:when test="${empty sessionScope.admin }">
<span>votre session est expiré,vous devez reconnecter </span>
<a href="../cnx_admin.jsp">reconnecter</a>
</c:when>
<c:otherwise>
<h2>Espace ${sessionScope.admin.getNom()}</h2>
<!--
le menu doit afficher toujours dans tous les pages d'admin
------menu-----------------------------------------------------------------+--affichage du contenue---+
___Gestion des étudiants >>                                                |	------------------	  |                                                
___Gestion des filieres >>	                                               |	------------------	  |
___Gestion des enseignants >>											   |	------------------	  |						
---------------------------------------------------------------------------+--------------------------+
  -->
  <!-- une fois tu cliques sur la balise le contenu doit apparaitre dans la partie d'affichage sans faire une redirection à une autre page  -->
  
  <div class="menu">
  
  <h4>Gestion des étudiants</h4>
  <a href="#">consulter les absences</a><br>
  <a href="gEtudiants/formAjout.jsp">Ajoute des étudiants</a><br>
  <a href="gEtudiants/listerEtuds.jsp">Modification des étudiants</a>
  <h4>Gestion des filieres</h4>
  <a href="#">Ajoute des filieres</a><br>
  <a href="#">Modification des filieres</a>
  <h4>Gestion des enseignants</h4>
  <a href="gEnseignants/formAjEnseig.jsp">Ajoute des enseignants</a><br>
  <a href="gEnseignants/listerEnseig.jsp">Modification des enseignants</a>
  
  </div>
--------------------------------------------
<br><a href="../logoutAdmin">déconnexion</a>

  <div class="content">
  <!-- l'affichage du contenue modification ou insertion ou consultaion des étudiants -->
  </div>


</c:otherwise>
</c:choose>
</body>
</html>