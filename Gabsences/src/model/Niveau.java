package model;

public class Niveau {
private int idN;
private String nomN;
public Niveau(int idN, String nomN) {
	super();
	this.idN = idN;
	this.nomN = nomN;
}
public int getIdN() {
	return idN;
}
public void setIdN(int idN) {
	this.idN = idN;
}
public String getNomN() {
	return nomN;
}
public void setNomN(String nomN) {
	this.nomN = nomN;
}

}
