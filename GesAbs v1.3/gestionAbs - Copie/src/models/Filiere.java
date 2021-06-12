package models;

public class Filiere {
  private String idF;
  private String nomF;
  private String idEtab;
  public Filiere() {
	  
  }
public Filiere(String idF, String nomF, String idEtab) {
	super();
	this.idF = idF;
	this.nomF = nomF;
	this.idEtab = idEtab;
}
public String getIdF() {
	return idF;
}
public void setIdF(String idF) {
	this.idF = idF;
}
public String getNomF() {
	return nomF;
}
public void setNomF(String nomF) {
	this.nomF = nomF;
}
public String getIdEtab() {
	return idEtab;
}
public void setIdEtab(String idEtab) {
	this.idEtab = idEtab;
}
@Override
public String toString() {
	return "Filiere [idF=" + idF + ", nomF=" + nomF + ", idEtab=" + idEtab + "]";
}
  
}
