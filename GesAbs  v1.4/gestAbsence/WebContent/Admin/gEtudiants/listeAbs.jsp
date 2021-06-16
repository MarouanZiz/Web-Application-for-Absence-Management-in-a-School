<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Liste des absences</title>
</head>
<body>

<jsp:useBean id="annee" class="dao.anneeDao.AnneeDao"></jsp:useBean>
<jsp:useBean id="niv" class="dao.niveauDao.NiveauDao"></jsp:useBean>
<jsp:useBean id="etudiant" class="dao.etudiantDao.EtudiantDao"></jsp:useBean>
<jsp:useBean id="seance" class="dao.seanceDao.SeanceDao"></jsp:useBean>
<jsp:useBean id="module" class="dao.moduleDao.ModuleDao"></jsp:useBean>
 <div class="menu">
  <a href="../espaceAdmin.jsp">Accueil</a><br>
  </div>
	
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
</body>
</html>