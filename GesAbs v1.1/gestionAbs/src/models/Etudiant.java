package models;
import java.util.*;
public class Etudiant {
	    private String cne;
	    private String cin;
	    private String nom;
	    private String prenom;
	    private Date dateNais;
	    private String login;
	    private String password;
	    private String email;
	    private String sexe;
	    private String lieuNais;
	    private String etab;
	    private String Niveau;
		public Etudiant(String cne, String cin, String nom, String prenom, Date dateNais, String login, String password,
				String email, String sexe, String lieuNais, String etab, String niveau) {
			super();
			this.cne = cne;
			this.cin = cin;
			this.nom = nom;
			this.prenom = prenom;
			this.dateNais = dateNais;
			this.login = login;
			this.password = password;
			this.email = email;
			this.sexe = sexe;
			this.lieuNais = lieuNais;
			this.etab = etab;
			Niveau = niveau;
		}
		public Etudiant() {
			
		}
		public String getCne() {
			return cne;
		}
		public void setCne(String cne) {
			this.cne = cne;
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
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
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
		public String getLieuNais() {
			return lieuNais;
		}
		public void setLieuNais(String lieuNais) {
			this.lieuNais = lieuNais;
		}
		public String getEtab() {
			return etab;
		}
		public void setEtab(String etab) {
			this.etab = etab;
		}
		public String getNiveau() {
			return Niveau;
		}
		public void setNiveau(String niveau) {
			Niveau = niveau;
		}
		@Override
		public String toString() {
			return "Etudiant [cne=" + cne + ", cin=" + cin + ", nom=" + nom + ", prenom=" + prenom + ", dateNais="
					+ dateNais + ", login=" + login + ", password=" + password + ", email=" + email + ", sexe=" + sexe
					+ ", lieuNais=" + lieuNais + ", etab=" + etab + ", Niveau=" + Niveau + "]";
		}
		
	   
	    
}