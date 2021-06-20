package models;

public class Annee {
private int idAnnee;
private int Annee;
private int idFiliere;

public Annee(int idAnnee, int annee, int idFiliere) {
	super();
	this.idAnnee = idAnnee;
	Annee = annee;
	this.idFiliere = idFiliere;
}

public int getIdAnnee() {
	return idAnnee;
}

public void setIdAnnee(int idAnnee) {
	this.idAnnee = idAnnee;
}

public int getAnnee() {
	return Annee;
}

public void setAnnee(int annee) {
	Annee = annee;
}

public int getIdFiliere() {
	return idFiliere;
}

public void setIdFiliere(int idFiliere) {
	this.idFiliere = idFiliere;
}


}
