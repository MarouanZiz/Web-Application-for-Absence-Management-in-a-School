package models;

import java.sql.Time;

public class Seance {
private int idSeance;
private Time heureDeb;
private Time heureFin;
private int idAnnee;
private int idModule;

public Seance(int idSeance, Time heureDeb, Time heureFin, int idModule ,int idAnnee) {
	super();
	this.idSeance = idSeance;
	this.heureDeb = heureDeb;
	this.heureFin = heureFin;
	this.idAnnee = idAnnee;
	this.idModule = idModule;
}

public Seance(Time heureDeb, Time heureFin, int idModule , int idAnnee) {
	
	this.heureDeb = heureDeb;
	this.heureFin = heureFin;
	this.idAnnee = idAnnee;
	this.idModule = idModule;
	
}

public int getIdSeance() {
	return idSeance;
}

public void setIdSeance(int idSeance) {
	this.idSeance = idSeance;
}

public Time getHeureDeb() {
	return heureDeb;
}

public void setHeureDeb(Time heureDeb) {
	this.heureDeb = heureDeb;
}

public Time getHeureFin() {
	return heureFin;
}

public void setHeureFin(Time heureFin) {
	this.heureFin = heureFin;
}

public int getIdAnnee() {
	return idAnnee;
}

public void setIdAnnee(int idAnnee) {
	this.idAnnee = idAnnee;
}

public int getIdModule() {
	return idModule;
}

public void setIdModule(int idModule) {
	this.idModule = idModule;
}



}
