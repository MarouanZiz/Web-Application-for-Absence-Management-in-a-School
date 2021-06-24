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
<div class="col-sm-2">
<div class="sidebar sadmin" >
<a href="../espaceAdmin.jsp">Acceuil</a>
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
  
  <a class="active"  href="#" data-target="#abs" aria-controlls="abs" data-toggle="collapse" >Gestion des absence</a>
  <div class="collapse" id="abs" >
  <a class="active"  href="listeAbs.jsp">Consulter des etudiants</a>
  </div>
  <a href="../../logoutAdmin">Déconnexion</a>
  
  
</div>
</div>
	<div class="col-sm-9">
<div class="content">

<h4 class="titliste">Gestion des Absences > Consultation</h4>

  	<span class="listeabs">Absence d'annee scolaire:</span>
	<form action="../../srv_listeAbsEtd" method="POST">
	
	<div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01">Annee</label>
  </div>
	
		<select class="custom-select" id="inputGroupSelect01">
		
		<c:forEach items="${annee.getAllAnnee()}" var="a">
			<option value="${a.getIdAnnee()}">${a.getAnnee()}</option>
			</c:forEach> 
			 
		</select>
		<input type="submit" class="btn btn-outline-secondary" value="lister" name="annee"/>
		
		</div>
		
	</form>
	
	<c:if test="${not empty sessionScope.listeF}">
		<span class="listeabs">choisir une filiere :</span>
		<form action="../../srv_listeAbsEtd" method="POST">
		
		<div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01">Filiere</label>
  </div>
		
		    <select name="f" class="custom-select" id="inputGroupSelect01">
				<c:forEach items="${sessionScope.listeF}" var="f">
					<option value="${f.getId()}">${f.getNom()}</option>
				</c:forEach>
			</select>
			
			<input type="submit" class="btn btn-outline-secondary" name="filiere" value="lister"/>
			</div>
			</form>	
			
	</c:if>
	
	<c:if test="${not empty sessionScope.listeN}">
		<span class="listeabs">choisir un Niveau :</span>
		<form action="../../srv_listeAbsEtd" method="POST">
		
				<div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01">Niveau</label>
  </div>
		
		    <select name="niv" class="custom-select" id="inputGroupSelect01" >
				<c:forEach items="${sessionScope.listeN}" var="n">
					<option value="${n.getIdNiveau()}">${n.getNomNiveau()}</option>
				</c:forEach>
			</select>
			
			<input type="submit" class="btn btn-outline-secondary" name="niv" value="lister"/>
			
			</div>
			</form>	

	</c:if>
	
	<c:if test="${not empty sessionScope.listeE }">
	<span class="listeabs">les étudiants de ce niveau: </span>
		<table class="table">
		<tr class="thead-dark" ><th scope="col">Cne</th><th scope="col">Nom</th><th scope="col">Prénom</th><th>Date de Naissance</th><th>Email</th><th>Sexe</th><th>Lieu de Naissance</th><th>Niveau</th><th colspan="1"></th></tr>
		
		<c:forEach items="${sessionScope.listeE }" var="e">
		
		<tr><td>${e.getCne() }</td><td>${e.getNom() }</td><td>${e.getPrenom() }</td><td>${e.getDateNais() }</td><td>${e.getEmail() }</td>
		<td>${e.getSexe()}</td><td>${e.getLieuNais()}</td><td>${niv.getNivById(e.getIdNiv()).getNomNiveau()}</td><td><a class="btn btn-info" href="../../srv_listeAbsEtd?cne=${e.getCne() }&niv=${e.getIdNiv()}">Consulter l'absence</a></td></tr>
		
		</c:forEach>
		
		</table>

	</c:if>
	
	
		<c:if test="${not empty sessionScope.listeA}">
			<span class="listeabs">Liste d'absences de l'étudiant:</span>
			
			<table class="table">
			<tr class="thead-dark"><th>Cne</th><th>Nom</th><th>Prénom</th><th>Niveau</th><th>de</th><th>à</th><th>Date Absence</th><th>Module</th><th>Etat d'absence</th><th></th></tr>
			
			<c:forEach items="${sessionScope.listeA}" var="e">
			
			<tr><td scope="row">${e.getCneEtd()}</td><td>${etudiant.getEtudiantByCn(e.getCneEtd()).getNom()}</td><td>${etudiant.getEtudiantByCn(e.getCneEtd()).getPrenom() }</td><td>${niv.getNivById(e.getIdniv()).getNomNiveau()}</td><td>${seance.getSeance(e.getIdSeance()).getHeureDeb() }</td>
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