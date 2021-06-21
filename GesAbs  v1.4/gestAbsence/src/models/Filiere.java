package models;

public class Filiere {
  private int id;
  private String nom;
  private int idEtab;
  public Filiere() {
	  
  }
  
public Filiere(int id, String nom, int idEtab) {
	super();
	this.id = id;
	this.nom = nom;
	this.idEtab = idEtab;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getNom() {
	return nom;
}

public void setNom(String nom) {
	this.nom = nom;
}

public int getIdEtab() {
	return idEtab;
}

public void setIdEtab(int idEtab) {
	this.idEtab = idEtab;
}


  
}
