<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ajout des absences</title>
<meta charset="UTF-8">
  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
     <link rel="stylesheet" href="../../Admin/styleEspaceAdmin.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  
</head>
<body>
<jsp:useBean id="enseignerDao" class="dao.enseignerDao.EnseignerDao"></jsp:useBean>
<jsp:useBean id="etudiant" class="dao.etudiantDao.EtudiantDao"></jsp:useBean>
<jsp:useBean id="niv" class="dao.niveauDao.NiveauDao"></jsp:useBean>
<jsp:useBean id="seance" class="dao.seanceDao.SeanceDao"></jsp:useBean>
<jsp:useBean id="module" class="dao.moduleDao.ModuleDao"></jsp:useBean>
<jsp:useBean id="enseignant" class="dao.enseignantDao.EnseignantDao"></jsp:useBean>

<jsp:include page="../../divs/headerEns.jsp">
 <jsp:param name="img" value="../../imgs/${enseignant.getImg(sessionScope.enseignant.getId() )}" />
</jsp:include>

<div class="fluid-container">
<div class="row">
<div class="col-sm-2">
<div class="sidebar sadmin" >
<a  href="http://localhost:8080/gestAbs2/Enseignant/espaceEnseig.jsp">Acceuil</a>
  <a class="active" class="" data-toggle="collapse" data-target="#etudiant" aria-controlls="etudiant" href="#">Absence des étudiants </a>

  <div class="collapse" id="etudiant">
  <a class="active" href="absEtuds/ajAbs.jsp">Absence</a>
  
  </div>
 
  <a href="../../logoutEnseig">Déconnexion</a>
  
  
</div>
</div>
	<div class="col-sm-9">
<div class="content">


<c:if test="${ not empty msg }">
<div class="alert alert-success" role="alert">
${msg}
</div>
</c:if>

<h4 class="titliste">Absences des etudiants > Liste</h4>

<form action="../../srv_listeAbs" method="POST">
<span class="listeabs">choisir un niveau :</span>

<div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01">Niveau</label>
  </div>

<select name="niv" class="custom-select" id="inputGroupSelect01">
<c:forEach items="${niv.getNiveau(enseignerDao.getByThisYear(sessionScope.enseignant.getId()))}" var="n">
<option value="${n.getIdNiveau()}">${n.getNomNiveau()}</option>
</c:forEach>
</select>
<input type="submit" class="btn btn-outline-secondary" name="subniv" value="Lister">
</div>
</form>


<c:if test="${not empty sessionScope.listeEtd }">
<span class="listeabs">Votre étudiants de cette annee:</span>

<table class="table">
<tr class="thead-dark"><th>Cne</th><th>Nom</th><th>Prénom</th><th>Date de Naissance</th><th>Email</th><th>Sexe</th><th>Lieu de Naissance</th><th>Niveau</th><th colspan="2"></th></tr>

<c:forEach items="${sessionScope.listeEtd }" var="e">

<tr><td>${e.getCne() }</td><td>${e.getNom() }</td><td>${e.getPrenom() }</td><td>${e.getDateNais() }</td><td>${e.getEmail() }</td>
<td>${e.getSexe()}</td><td>${e.getLieuNais()}</td><td>${niv.getNivById(e.getIdNiv()).getNomNiveau()}</td><td><a href="../../srv_listeAbs?cne=${e.getCne() }&niv=${e.getIdNiv()}">Consulter l'absence</a></td><td><a href="../../srv_ajAbs?cne=${e.getCne()}">Saisir l'absence</a></td></tr>

</c:forEach>

</table>

</c:if>

<c:if test="${not empty sessionScope.listeAbs}">

<span class="listeabs">Liste d'absences de l'étudiant:</span>


<table class="table">
<tr class="thead-dark"><th>Cne</th><th>Nom</th><th>Prénom</th><th>Niveau</th><th>de</th><th>à</th><th>Date Absence</th><th>Module</th><th>Etat d'absence</th></tr>

<c:forEach items="${sessionScope.listeAbs}" var="e">

<tr><td>${e.getCneEtd()}</td><td>${etudiant.getEtudiantByCn(e.getCneEtd()).getNom()}</td><td>${etudiant.getEtudiantByCn(e.getCneEtd()).getPrenom() }</td><td>${niv.getNivById(e.getIdniv()).getNomNiveau()}</td><td>${seance.getSeance(e.getIdSeance()).getHeureDeb() }</td>
<td>${seance.getSeance(e.getIdSeance()).getHeureFin() }</td><td>${e.getDateAbs()}</td><td>${module.getModule(seance.getSeance(e.getIdSeance()).getIdModule()).getNomModule()}</td><td>${e.getEtat()}</td></tr>


</c:forEach>

</table>
<% request.getSession().removeAttribute("listeAbs"); %>
<% request.getSession().removeAttribute("listeEtd"); %>
</c:if>

<c:if test="${not empty sessionScope.etudiant }">
 
 <span class="listeabs">Saisir l'absence de l'étudiant:</span>

 <form action="../../srv_ajAbs" method="POST">

 <table class="table">
 
 <tr class="thead-dark"><th>Cne</th><th>Nom</th><th>Prénom</th><th>Niveau</th><th>De</th><th>à</th><th>Module</th><th>Date Absence</th><th></th></tr>
  <tr><td><input type="hidden" name="cne" value="${sessionScope.etudiant.getCne() }">${sessionScope.etudiant.getCne() }</td><td>${sessionScope.etudiant.getNom()}</td>
  <td>${sessionScope.etudiant.getPrenom() }</td><td><input type="hidden" name="niv" value="${sessionScope.etudiant.getIdNiv()}">${niv.getNivById(sessionScope.etudiant.getIdNiv()).getNomNiveau()}</td>
  <td><input type="time" name="deb" /></td><td><input type="time" name="fin" /></td><td><input type="hidden" name="module" value="${enseignerDao.getEnseigner(sessionScope.etudiant.getIdNiv(),sessionScope.enseignant.getId()).getIdModule()}"/>${module.getModule(enseignerDao.getEnseigner(sessionScope.etudiant.getIdNiv(),sessionScope.enseignant.getId()).getIdModule()).getNomModule()}</td><td><input type="date" required name="dateabs"/></td><td colspan="8" ><input type="submit" class="btn btn-primary" name="abs" value="Enregister"/></td></tr>

 </table>
 </form>

 
</c:if>



<% request.getSession().removeAttribute("msg"); %>
<% request.getSession().removeAttribute("etudiant"); %>
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