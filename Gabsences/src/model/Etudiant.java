package model;

import java.sql.Date;

public class Etudiant {
private String cne;
private int idN;
private String nomE;
private String prenomE;
private Date dateNais;

public Date getDateNais() {
	return dateNais;
}

public void setDateNais(Date dateNais) {
	this.dateNais = dateNais;
}



public Etudiant(String cne, int idN, String nomE, String prenomE, Date dateNais) {
	super();
	this.cne = cne;
	this.idN = idN;
	this.nomE = nomE;
	this.prenomE = prenomE;
	this.dateNais = dateNais;
}

public String getCne() {
	return cne;
}

public void setCne(String cne) {
	this.cne = cne;
}

public int getIdN() {
	return idN;
}

public void setIdN(int idN) {
	this.idN = idN;
}

public String getNomE() {
	return nomE;
}

public void setNomE(String nomE) {
	this.nomE = nomE;
}

public String getPrenomE() {
	return prenomE;
}

public void setPrenomE(String prenomE) {
	this.prenomE = prenomE;
}


}
