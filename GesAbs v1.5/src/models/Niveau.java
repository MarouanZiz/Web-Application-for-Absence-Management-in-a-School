package models;

public class Niveau {
	private int idNiveau;
	private String nomNiveau;
	private int idFiliere;
	public Niveau(int idNiveau, String nomNiveau, int idFiliere) {
		super();
		this.idNiveau = idNiveau;
		this.nomNiveau = nomNiveau;
		this.idFiliere = idFiliere;
	}
	
	public Niveau() {
		
	}
	
	public int getIdNiveau() {
		return idNiveau;
	}
	public void setIdNiveau(int idNiveau) {
		this.idNiveau = idNiveau;
	}
	public String getNomNiveau() {
		return nomNiveau;
	}
	public void setNomNiveau(String nomNiveau) {
		this.nomNiveau = nomNiveau;
	}
	
	public int getIdFiliere() {
		return idFiliere;
	}
	public void setIdFiliere(int idFiliere) {
		this.idFiliere = idFiliere;
	}

	@Override
	public String toString() {
		return "Niveau [idNiveau=" + idNiveau + ", nomNiveau=" + nomNiveau + ", idFiliere=" + idFiliere + "]";
	}
	
	
}