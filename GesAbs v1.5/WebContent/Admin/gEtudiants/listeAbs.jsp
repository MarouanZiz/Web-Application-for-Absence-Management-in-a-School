<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%> 
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
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
 <jsp:useBean id="admin" class="dao.adminDao.AdminDao"></jsp:useBean>
 <jsp:include page="../../divs/headerAdmin.jsp">
 <jsp:param name="img" value="../../imgs/${admin.getImg(sessionScope.admin.getIdEtab())}" />
 </jsp:include>

<jsp:useBean id="annee" class="dao.anneeDao.AnneeDao"></jsp:useBean>
<jsp:useBean id="niv" class="dao.niveauDao.NiveauDao"></jsp:useBean>
<jsp:useBean id="etudiant" class="dao.etudiantDao.EtudiantDao"></jsp:useBean>
<jsp:useBean id="seance" class="dao.seanceDao.SeanceDao"></jsp:useBean>
<jsp:useBean id="module" class="dao.moduleDao.ModuleDao"></jsp:useBean>
 
	
	
	
	
	<div class="fluid-container">
<div class="row">
<div class="col-sm-2" style="background-color:#f1f1f1" >
<div class="sidebar" style="margin:5.5px">
<a class="" href="../espaceAdmin.jsp">Acceuil</a>
  <a class="" data-toggle="collapse" data-target="#etudiant" aria-controlls="etudiant" href="#">Gestion des Etudiants</a>
  <div class="collapse" id="etudiant">
  <a href="listerEtuds.jsp">Lister tout</a>
  <a href="formAjout.jsp">Ajouter</a>
  </div>
  <a href="#"  data-toggle="collapse"  data-target="#enseignant" aria-controlls="enseignant">Gestion des Enseignants</a>
  <div class="collapse" id="enseignant">
  <a href="../gEnseignants/listerEnseig.jsp">Lister</a>
  <a href="../gEnseignants/formAjEnseig.jsp">Ajouter</a>
  </div>
  <a href="#" data-toggle="collapse"  data-target="#Filiére" aria-controlls="filiére" >Gestion des Filiéres</a>
  <div class="collapse" id="Filiére">
  <a href="">Lister</a>
  <a href="">Ajouter</a>
  </div>
  <a href="#" data-target="#etablissement" data-toggle="collapse"  aria-controlls="etablissement" >Gestion des Etablissement</a>
  <div class="collapse" id="etablissement">
    <a href="">Lister</a>
  <a href="">Ajouter</a>
  </div>
  <a href="#" data-target="#seance" aria-controlls="seance" data-toggle="collapse" >Gestion des séances</a>
  <div class="collapse" id="seance">
  <a href="">Lister</a>
  <a href="">Ajouter</a>
  </div>
  <a href="#" data-target="#modul"data-toggle="collapse"  aria-controlls="modul">Gestion des modules</a>
  <div class="collapse" id="modul">
  <a href="">Lister</a>
  <a href="">Ajouter</a>
  </div>
  <a href="#" data-target="#anneScolaire"  data-toggle="collapse"  aria-controlls="anneScolaire">Gestion des anneé scolaire</a>
  <div class="collapse" id="anneScolaire">
  <a href="">Lister</a>
  <a href="">Ajouter</a>
  </div>
  <a href="#" data-target="#niveau" aria-controlls="niveau" data-toggle="collapse"  >Gestion des niveaux</a>
  <div class="collapse" id="niveau">
  <a href="">Lister</a>
  <a href="">Ajouter</a>
  </div>
  
  
  <a href="#" class="activ"data-target="#abs" aria-controlls="abs" data-toggle="collapse" >Gestion des absence</a>
  <div class="collapse" id="abs" >
  <a href="">Consulter tout</a>
  </div>
  <a href="../logoutAdmin">déconnexion</a>
  
  
</div>
</div>
	<div class="col-sm-9">
<div class="content">
  	<h3>Absence d'annee scolaire:</h3>
	<form action="../../srv_listeAbsEtd" method="POST">
		<select>
		
		<c:forEach items="${annee.getAllAnnee()}" var="a">
			<option value="${a.getIdAnnee()}">${a.getAnnee()}</option>
			</c:forEach> 
			 
		</select>
		<input type="submit" value="afficher" name="annee"/>
	</form>
	
	<c:if test="${not empty sessionScope.listeF}">
		<h3>choisir la filiere :</h3>
		<form action="../../srv_listeAbsEtd" method="POST">
		    <select name="f">
				<c:forEach items="${sessionScope.listeF}" var="f">
					<option value="${f.getId()}">${f.getNom()}</option>
				</c:forEach>
			</select>
			
			<input type="submit" name="filiere" value="lister"/>
			</form>	
			
	</c:if>
	
	<c:if test="${not empty sessionScope.listeN}">
		<h3>choisir le Niveau :</h3>
		<form action="../../srv_listeAbsEtd" method="POST">
		    <select name="niv">
				<c:forEach items="${sessionScope.listeN}" var="n">
					<option value="${n.getIdNiveau()}">${n.getNomNiveau()}</option>
				</c:forEach>
			</select>
			
			<input type="submit" name="niv" value="lister"/>
			</form>	

	</c:if>
	
	<c:if test="${not empty sessionScope.listeE }">
	<h3>les étudiants de ce niveau: </h3>
		<table border="1">
		<tr><th>Cne</th><th>Nom</th><th>Prénom</th><th>Date de Naissance</th><th>Email</th><th>Sexe</th><th>Lieu de Naissance</th><th>Niveau</th><th colspan="1"></th></tr>
		
		<c:forEach items="${sessionScope.listeE }" var="e">
		
		<tr><td>${e.getCne() }</td><td>${e.getNom() }</td><td>${e.getPrenom() }</td><td>${e.getDateNais() }</td><td>${e.getEmail() }</td>
		<td>${e.getSexe()}</td><td>${e.getLieuNais()}</td><td>${niv.getNivById(e.getIdNiv()).getNomNiveau()}</td><td><a href="../../srv_listeAbsEtd?cne=${e.getCne() }&niv=${e.getIdNiv()}">Consulter l'absence</a></td></tr>
		
		</c:forEach>
		
		</table>

	</c:if>
	
	
		<c:if test="${not empty sessionScope.listeA}">
			<h3>Liste d'absences de l'étudiant:</h3>
			
			<table border="1">
			<tr><th>Cne</th><th>Nom</th><th>Prénom</th><th>Niveau</th><th>de</th><th>à</th><th>Date Absence</th><th>Module</th><th>Etat d'absence</th><td></td></tr>
			
			<c:forEach items="${sessionScope.listeA}" var="e">
			
			<tr><td>${e.getCneEtd()}</td><td>${etudiant.getEtudiantByCn(e.getCneEtd()).getNom()}</td><td>${etudiant.getEtudiantByCn(e.getCneEtd()).getPrenom() }</td><td>${niv.getNivById(e.getIdniv()).getNomNiveau()}</td><td>${seance.getSeance(e.getIdSeance()).getHeureDeb() }</td>
			<td>${seance.getSeance(e.getIdSeance()).getHeureFin() }</td><td>${e.getDateAbs()}</td><td>${module.getModule(seance.getSeance(e.getIdSeance()).getIdModule()).getNomModule()}</td><td>${e.getEtat()}</td><td><a href="../../srv_listeAbsEtd?idabs=${e.getIdAbs()}&etat=${e.getEtat()}">${e.getEtat() == "non justifiee" ? "justifiée" : "non justifiée" }</a></td></tr>
			
			
			</c:forEach>
			
			</table>
			
	
			<% request.getSession().removeAttribute("listeA"); %>
			<% request.getSession().removeAttribute("listeF"); %>
			<% request.getSession().removeAttribute("listeN"); %>
		  	<% request.getSession().removeAttribute("listeE"); %>
		  	 
		  	
		 
		  	
		</c:if>
	<b>${msg}</b>
	<% request.getSession().removeAttribute("msg"); %>
</div>
</div>
</div>
</div>
 
	
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