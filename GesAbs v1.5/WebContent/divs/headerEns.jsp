<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <nav class="navbar navbar-expand-lg navbar-light bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a href="http://localhost:8080/gestAbs2/Admin/espaceAdmin.jsp" class="navbar-brand"><img src="../imgs/default.jpg"/></a>
  <span class="username" > ${sessionScope.enseignant.getPrenom()}   ${sessionScope.enseignant.getNom()}</span>

</nav>