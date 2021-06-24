<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div class="col-sm-2">
<div class="sidebar" >
<a class="active" href="espaceAdmin.jsp">Acceuil</a>
  <a class="" data-toggle="collapse" data-target="#etudiant" aria-controlls="etudiant" href="#">Gestion des Etudiants</a>

  <div class="collapse" id="etudiant">
  <a href="gEtudiants/listerEtuds.jsp">Lister tout</a>
  <a href="gEtudiants/formAjout.jsp">Ajouter</a>
  </div>
  <a href="#"  data-toggle="collapse"  data-target="#enseignant" aria-controlls="enseignant">Gestion des Enseignants</a>
  <div class="collapse" id="enseignant">
  <a href="gEnseignants/listerEnseig.jsp">Lister</a>
  <a href="gEnseignants/formAjEnseig.jsp">Ajouter</a>
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
  
  
  <a href="#" data-target="#abs" aria-controlls="abs" data-toggle="collapse" >Gestion des absence</a>
  <div class="collapse" id="abs" >
  <a href="">Consulter tout</a>
  </div>
  <a href="../logoutAdmin">Déconnexion</a>
  
  
</div>
</div>