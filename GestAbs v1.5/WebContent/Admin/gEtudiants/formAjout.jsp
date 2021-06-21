<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%> 
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
     <link rel="stylesheet" href="../styleEspaceAdmin.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  
<title>Espace Admin </title>
</head>

<body>
  <jsp:useBean id="niveau" class="dao.niveauDao.NiveauDao" ></jsp:useBean>
  <jsp:useBean id="etab" class="dao.EtablissementDao.EtablissementDao" ></jsp:useBean>
  <jsp:useBean id="admin" class="dao.adminDao.AdminDao"></jsp:useBean>
 <jsp:include page="../../divs/headerAdmin.jsp">
 <jsp:param name="img" value="../../imgs/${admin.getImg(sessionScope.admin.getIdEtab())}" />
 </jsp:include>


<%--  <c:choose>
 <c:when test="${empty sessionScope.admin }">
 
<script>
window.location.href="http://localhost:8080/GestionAbsenceProduitFinal/Admin/warning.jsp"
</script>

  <a href="../cnx_admin.jsp">reconnecter</a>
 </c:when>
<c:otherwise>
--%>



  <!-- une fois tu cliques sur la balise le contenu doit apparaitre dans la partie d'affichage sans faire une redirection à une autre page  -->
  
  <!--  <div class="menu">
  
  <h4>Gestion des étudiants</h4>
  <a href="gEtudiants/listeAbs.jsp">liste des absences</a><br>
  <a href="gEtudiants/formAjout.jsp">Ajoute des étudiants</a><br>
  <a href="gEtudiants/listerEtuds.jsp">Liste des étudiants</a>
  <h4>Gestion des filieres</h4>
  <a href="#">Ajoute des filieres</a><br>
  <a href="#">Liste des filières</a>
  <h4>Gestion des enseignants</h4>
  <a href="gEnseignants/formAjEnseig.jsp">Ajoute les Filiére</a><br>
  <a href="gEnseignants/listerEnseig.jsp">Liste les Filiére </a>
  
  </div>
--------------------------------------------
<br><a href="../logoutAdmin">déconnexion</a>

  <div class="content">
  l'affichage du contenue modification ou insertion ou consultaion des étudiants 
  </div>

-->


<div class="fluid-container">
<div class="row">
<div class="col-sm-2">
<div class="sidebar sadmin" >
<a  href="../espaceAdmin.jsp">Acceuil</a>
  <a class="active" class="" data-toggle="collapse" data-target="#etudiant" aria-controlls="etudiant" href="#">Gestion des Etudiants</a>

  <div class="collapse" id="etudiant">
  <a href="listerEtuds.jsp">Lister tout</a>
  <a class="active" href="formAjout.jsp">Ajouter</a>
  </div>
  <a href="#"  data-toggle="collapse"  data-target="#enseignant" aria-controlls="enseignant">Gestion des Enseignants</a>
  <div class="collapse" id="enseignant">
  <a href="../gEnseignants/listerEnseig.jsp">Lister</a>
  <a href="../gEnseignants/formAjEnseig.jsp">Ajouter</a>
  </div>
  
  <a href="#" data-target="#abs" aria-controlls="abs" data-toggle="collapse" >Gestion des absence</a>
  <div class="collapse" id="abs" >
  <a href="listeAbs.jsp">Consulter des etudiants</a>
  </div>
  <a href="../../logoutAdmin">Déconnexion</a>
  
  
</div>
</div>
	<div class="col-sm-9">
<div class="content">
  <h2 Style="background-color: #04AA6D ;padding:20px;width:50%;margin:0 278px ;text-align:center;boder:2px solid black;border-radius:6px;color:white">Ajouter Etudiant</h2>
  <form action="../../ajEtudiant" method="POST" class="fadmin" >
               
                  <div class="form-outline mb-4">
                    <label class="form-label" >cne</label>
                    <input type="text" required  class="form-control" name="cne"/>
                    
                  </div>
                
             
                  <div class="form-outline mb-4">
                    <label class="form-label">cin</label>
                    <input type="text" required class="form-control" name="cin" />
                    
                  </div>
                  <div class="form-outline mb-4">
                    <label class="form-label">nom</label>
                    <input type="text" required class="form-control" name="nom"/>
                    
                  </div>
                  <div class="form-outline mb-4">
                    <label class="form-label" >prenom</label>
                    <input type="text" required  class="form-control" name="prenom"/>
                    
                  </div>
                  <div class="form-outline mb-4">
                    <label class="form-label" >dateNais</label>
                    <input type="date" required class="form-control" name="dtn" />
                    
                  </div>
                          
                             <div class="form-outline mb-4">
                    <label class="form-label" >email</label>
                    <input type="email" required class="form-control" name="email" />
                    
                  </div>
                  <div class="form-outline mb-4">
                    <label class="form-label" >sexe</label>
                    <select required name="gendre" class="form-control" >
                    <option value="H">Homme</option>
                    <option value="F">Femme</option>
                    </select>
                  </div>
				 <div class="form-outline mb-4">
                    <label class="form-label" >lieu de naissance</label>
                    <input type="text" required  name="lnais" class="form-control" />
                    
                  </div>
                  <div class="form-outline mb-4">
                    <label class="form-label">Etablissement</label>
                    <select required class="form-control" name="Etablissement">
                    <option><c:out value="${ etab.getEtabliById(sessionScope.admin.getIdEtab()).getNomEtab() }"/></option>
                    </select>
                    
                  </div>
                  
       
       <div class="form-outline mb-4">
                    <label class="form-label">Niveau</label>
                   <select required class="form-control" name="niv">
                        <c:forEach items="${niveau.getNiveau()}" var="n">
                        <option value="${n.getIdNiveau()}" ><c:out value='${n.getNomNiveau()}'></c:out></option>
                        </c:forEach>
                    </select>
                    
                  </div>
                  
                
                  <!-- Submit button -->
                  <button type="submit" style="background-color: #04AA6D" class="btn btn-primary btn-block">Ajouter</button>
                </form>
                  <b>${message}</b>
  <% request.getSession().removeAttribute("message"); %>
</div>
</div>
</div>
</div>
 
   <%-- </c:otherwise>
</c:choose> 
 --%>
<div class="container-fluid pb-0 mb-0 justify-content-center text-light ">
            <footer>
                <div class="row my-5 justify-content-center py-5">
                    <div class="col-11">
                        <div class="row ">
                            <div class="col-xl-8 col-md-4 col-sm-4 col-12 my-auto mx-auto a">
                                <h3 class="text-muted mb-md-0 mb-5 bold-text">BTS GESTION D'ABSENCE</h3>
                            </div>
                            <div class="col-xl-2 col-md-4 col-sm-4 col-12">
                                <h6 class="mb-3 mb-lg-4 bold-text "><b>MENU</b></h6>
                                <ul class="list-unstyled">
                                    <li>Home</li>
                                    <li><a href="https://www.9rayti.com/type-formation/bts-2#:~:text=Brevet%20de%20Technicien%20Sup%C3%A9rieur.,dipl%C3%B4me%20de%20niveau%20Bac%2B2." target="_blank">About BTS</a> </li>
                                     
                                </ul>
                            </div>
                            <div class="col-xl-2 col-md-4 col-sm-4 col-12">
                                <h6 class="mb-3 mb-lg-4 text-muted bold-text mt-sm-0 mt-5"><b>ADDRESS</b></h6>
                                <p class="mb-1">Adresse : BTS Lycée Ibn Sina Avenue Chakib Arsalane -</p>
                                <p> kénitra Maroc</p>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="col-xl-8 col-md-4 col-sm-4 col-auto my-md-0 mt-5 order-sm-1 order-3 align-self-end">
                                <p class="social text-muted mb-0 pb-0 bold-text"> <span class="mx-2"><i class="fa fa-facebook" aria-hidden="true"></i></span> <span class="mx-2"><i class="fa fa-linkedin-square" aria-hidden="true"></i></span> <span class="mx-2"><i class="fa fa-twitter" aria-hidden="true"></i></span> <span class="mx-2"><i class="fa fa-instagram" aria-hidden="true"></i></span> </p><small class="rights"><span>&#174;</span> Pepper All Rights Reserved.</small>
                            </div>
                            <div class="col-xl-2 col-md-4 col-sm-4 col-auto order-1 align-self-end ">
                                <h6 class="mt-55 mt-2 text-muted bold-text"><b>DIRECTEUR D'ETUDE :</b></h6><small> <span><i class="fa fa-envelope" aria-hidden="true"></i></span> hamidShabi@gmail.com</small>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </footer>
        </div>
</body>
</html>