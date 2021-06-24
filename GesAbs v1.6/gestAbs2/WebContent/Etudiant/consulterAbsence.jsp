<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%> 
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
     <link rel="stylesheet" href="../Admin/styleEspaceAdmin.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  
<title>Espace Etudiant </title>
</head>

<body>

<jsp:useBean id="etudiant" class="dao.etudiantDao.EtudiantDao"></jsp:useBean>
 <jsp:useBean id="admin" class="dao.adminDao.AdminDao"></jsp:useBean>
 <jsp:include page="../divs/headerEtd.jsp">
  <jsp:param name="img" value="../imgs/${etudiant.getImg(sessionScope.etudiant.getCne(),sessionScope.etudiant.getCin() )}" />
 </jsp:include>


<c:choose>
<c:when test="${empty sessionScope.etudiant }">

<span>votre session est expiré,vous devez reconnecter </span>




</c:when>
<c:otherwise>

<jsp:useBean id="niv" class="dao.niveauDao.NiveauDao"></jsp:useBean>
<jsp:useBean id="absence" class="dao.absenceDao.AbsenceDao"></jsp:useBean>
<jsp:useBean id="seance" class="dao.seanceDao.SeanceDao"></jsp:useBean>
<jsp:useBean id="module" class="dao.moduleDao.ModuleDao"></jsp:useBean>

<div class="fluid-container">
<div class="row">
<div class="col-sm-2">
<div class="sidebar sadmin" >
<a class="active" href="espaceEtd.jsp">Acceuil</a>
  <a class="" data-toggle="collapse" data-target="#etudiant" aria-controlls="etudiant" href="#">Consulter mon </a>

  <div class="collapse" id="etudiant">
  <a href="">Absence</a>
  
  </div>
 
  <a href="../logoutEtd">Déconnexion</a>
  
  
</div>
</div>
	<div class="col-sm-9">
<div class="content">

<h4 class="titliste">votre absence:</h4>
			
			<table class="table">
			<tr class="thead-dark"><th>Cne</th><th>Nom</th><th>Prénom</th><th>Niveau</th><th>de</th><th>à</th><th>Date Absence</th><th>Module</th><th>Etat d'absence</th></tr>
			
			<c:forEach items="${absence.getAbsence(sessionScope.etudiant.getIdNiv(),sessionScope.etudiant.getCne())}" var="e">
			
			<tr><td>${e.getCneEtd()}</td><td>${etudiant.getEtudiantByCn(e.getCneEtd()).getNom()}</td><td>${etudiant.getEtudiantByCn(e.getCneEtd()).getPrenom() }</td><td>${niv.getNivById(e.getIdniv()).getNomNiveau()}</td><td>${seance.getSeance(e.getIdSeance()).getHeureDeb() }</td>
			<td>${seance.getSeance(e.getIdSeance()).getHeureFin() }</td><td>${e.getDateAbs()}</td><td>${module.getModule(seance.getSeance(e.getIdSeance()).getIdModule()).getNomModule()}</td><td>${e.getEtat()}</td></tr>
			
			
			</c:forEach>
			
			</table>
			
		  	

	
</div>
</div>
</div>
</div>
 </c:otherwise>
</c:choose>
 
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