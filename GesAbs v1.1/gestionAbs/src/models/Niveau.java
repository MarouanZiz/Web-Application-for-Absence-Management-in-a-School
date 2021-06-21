package models;

public class Niveau {
	private String idNiveau;
	private String nomNiveau;
	public Niveau() {
		
	}
	public Niveau(String idNiveau, String nomNiveau) {
		super();
		this.idNiveau = idNiveau;
		this.nomNiveau = nomNiveau;
	}
	public String getIdNiveau() {
		return idNiveau;
	}
	public void setIdNiveau(String idNiveau) {
		this.idNiveau = idNiveau;
	}
	public String getNomNiveau() {
		return nomNiveau;
	}
	public void setNomNiveau(String nomNiveau) {
		this.nomNiveau = nomNiveau;
	}
	@Override
	public String toString() {
		return "Niveau [idNiveau=" + idNiveau + ", nomNiveau=" + nomNiveau + "]";
	}
}