package model;

public class Prof {
private int IdP;
private int IdN;
private String NomP;
private String PrenomP;
private String EmailP;
private String psw;

public Prof(int idP, int idN, String nomP, String prenomP, String emailP, String psw) {
	super();
	IdP = idP;
	IdN = idN;
	NomP = nomP;
	PrenomP = prenomP;
	EmailP = emailP;
	this.psw = psw;
}

public int getIdP() {
	return IdP;
}

public void setIdP(int idP) {
	IdP = idP;
}

public int getIdN() {
	return IdN;
}

public void setIdN(int idN) {
	IdN = idN;
}

public String getNomP() {
	return NomP;
}

public void setNomP(String nomP) {
	NomP = nomP;
}

public String getPrenomP() {
	return PrenomP;
}

public void setPrenomP(String prenomP) {
	PrenomP = prenomP;
}

public String getEmailP() {
	return EmailP;
}

public void setEmailP(String emailP) {
	EmailP = emailP;
}

public String getPsw() {
	return psw;
}

public void setPsw(String psw) {
	this.psw = psw;
}

@Override
public String toString() {
	return "Prof [IdP=" + IdP + ", IdN=" + IdN + ", NomP=" + NomP + ", PrenomP=" + PrenomP + ", EmailP=" + EmailP
			+ ", psw=" + psw + "]";
}



}
