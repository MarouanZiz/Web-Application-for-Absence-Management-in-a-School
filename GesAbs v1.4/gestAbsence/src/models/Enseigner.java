package models;

public class Enseigner {

	private int idNiv;
	private int idEns;
	private int idModule;
	private int annee;
	public Enseigner(int idNiv, int idEns, int idModule, int annee) {
		super();
		this.idNiv = idNiv;
		this.idEns = idEns;
		this.idModule = idModule;
		this.annee = annee;
	}
	
	public int getIdNiv() {
		return idNiv;
	}
	public void setIdNiv(int idNiv) {
		this.idNiv = idNiv;
	}
	public int getIdEns() {
		return idEns;
	}
	public void setIdEns(int idEns) {
		this.idEns = idEns;
	}
	public int getIdModule() {
		return idModule;
	}
	public void setIdModule(int idModule) {
		this.idModule = idModule;
	}
	public int getAnnee() {
		return annee;
	}
	public void setAnnee(int annee) {
		this.annee = annee;
	}

	@Override
	public String toString() {
		return "Enseigner [idNiv=" + idNiv + ", idEns=" + idEns + ", idModule=" + idModule + ", annee=" + annee + "]";
	}
	
	
	
}
