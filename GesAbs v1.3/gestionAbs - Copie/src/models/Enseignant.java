package models;

import java.util.Date;

public class Enseignant {
	private int id;
   private String cnp;
   private String cin;
   private String nom;
   private String prenom;
   private Date dateNais;
   private String login;
   private String email;
   private String sexe;
   private String tele;
   private int idEtab;
   private String psw;

  public Enseignant() {
}
  
public Enseignant(int id,String cnp, String cin, String nom, String prenom, Date dateNais, String login,String psw, String email,String sexe,String tele, int idEtab) {
	this.id = id;
	this.cnp = cnp;
	this.cin = cin;
	this.nom = nom;
	this.prenom = prenom;
	this.dateNais = dateNais;
	this.login = login;
	this.email = email;
	this.sexe = sexe;
	this.tele = tele;
	this.idEtab = idEtab;
	this.psw = psw;
	
}
public Enseignant(String cnp, String cin, String nom, String prenom, Date dateNais, String login,String psw, String email,
		String sexe,String tele, int idEtab) {
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
	this.idEtab = idEtab;
	this.psw = psw;

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

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
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

public Date getDateNais() {
	return dateNais;
}

public void setDateNais(Date dateNais) {
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

public int getIdEtab() {
	return idEtab;
}

public void setIdEtab(int idEtab) {
	this.idEtab = idEtab;
}


public String getPsw() {
	return psw;
}

public void setPsw(String psw) {
	this.psw = psw;
}



@Override
public String toString() {
	return "Enseignant [cnp=" + cnp + ", cin=" + cin + ", nom=" + nom + ", prenom=" + prenom + ", dateNais=" + dateNais
			+ ", login=" + login + ", email=" + email + ", sexe=" + sexe + ", tele=" + tele + ", etab=" + idEtab
			+ ", psw=" + psw +  "]";
}


   
}
