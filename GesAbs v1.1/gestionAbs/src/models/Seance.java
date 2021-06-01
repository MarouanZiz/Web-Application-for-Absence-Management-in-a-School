package models;

public class Seance {
private String idSeance;
private String heureDeb;
private String heureFin;
private String idAnne;
private String idModul;
		public Seance() {
			
		}
public Seance(String idSeance, String heureDeb, String heureFin, String idAnne, String idModul) {
	
	this.idSeance = idSeance;
	this.heureDeb = heureDeb;
	this.heureFin = heureFin;
	this.idAnne = idAnne;
	this.idModul = idModul;
}
public String getIdSeance() {
	return idSeance;
}
public void setIdSeance(String idSeance) {
	this.idSeance = idSeance;
}
public String getHeureDeb() {
	return heureDeb;
}
public void setHeureDeb(String heureDeb) {
	this.heureDeb = heureDeb;
}
public String getHeureFin() {
	return heureFin;
}
public void setHeureFin(String heureFin) {
	this.heureFin = heureFin;
}
public String getIdAnne() {
	return idAnne;
}
public void setIdAnne(String idAnne) {
	this.idAnne = idAnne;
}
public String getIdModul() {
	return idModul;
}
public void setIdModul(String idModul) {
	this.idModul = idModul;
}
  
}
