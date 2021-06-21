package models;

public class Enseignant {
   private String cnp;
   private String cin;
   private String nom;
   private String prenom;
   private String dateNais;
   private String login;
   private String email;
   private String sexe;
   private String tele;
   private String etab;
   private String niveau;
   private String psw;
   private String module;
   
public Enseignant(String cnp, String cin, String nom, String prenom, String dateNais, String login, String email,
		String sexe, String tele, String etab, String niveau, String psw, String module) {
	super();
	this.cnp = cnp;
	this.cin = cin;
	this.nom = nom;
	this.prenom = prenom;
	this.dateNais = dateNais;
	this.login = login;
	this.email = email;
	this.sexe = sexe;
	this.tele = tele;
	this.etab = etab;
	this.niveau = niveau;
	this.psw = psw;
	this.module = module;
}

public String getCnp() {
	return cnp;
}

public void setCnp(String cnp) {
	this.cnp = cnp;
}

public String getCin() {
	return cin;
}

public void setCin(String cin) {
	this.cin = cin;
}

public String getNom() {
	return nom;
}

public void setNom(String nom) {
	this.nom = nom;
}

public String getPrenom() {
	return prenom;
}

public void setPrenom(String prenom) {
	this.prenom = prenom;
}

public String getDateNais() {
	return dateNais;
}

public void setDateNais(String dateNais) {
	this.dateNais = dateNais;
}

public String getLogin() {
	return login;
}

public void setLogin(String login) {
	this.login = login;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getSexe() {
	return sexe;
}

public void setSexe(String sexe) {
	this.sexe = sexe;
}

public String getTele() {
	return tele;
}

public void setTele(String tele) {
	this.tele = tele;
}

public String getEtab() {
	return etab;
}

public void setEtab(String etab) {
	this.etab = etab;
}

public String getNiveau() {
	return niveau;
}

public void setNiveau(String niveau) {
	this.niveau = niveau;
}

public String getPsw() {
	return psw;
}

public void setPsw(String psw) {
	this.psw = psw;
}

public String getModule() {
	return module;
}

public void setModule(String module) {
	this.module = module;
}

@Override
public String toString() {
	return "Enseignant [cnp=" + cnp + ", cin=" + cin + ", nom=" + nom + ", prenom=" + prenom + ", dateNais=" + dateNais
			+ ", login=" + login + ", email=" + email + ", sexe=" + sexe + ", tele=" + tele + ", etab=" + etab
			+ ", niveau=" + niveau + ", psw=" + psw + ", module=" + module + "]";
}


   
}
