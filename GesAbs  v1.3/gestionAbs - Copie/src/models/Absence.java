package models;
import java.util.*;
public class Absence {
	private int idAbs;
	private String cneEtd;
	private int idniv;
	private int idSeance;
	private Date dateAbs;
	private String etat;
	
	public Absence(int idAbs, String cneEtd, int idniv, int idSeance, Date dateAbs, String etat) {
		super();
		this.idAbs = idAbs;
		this.cneEtd = cneEtd;
		this.idniv = idniv;
		this.idSeance = idSeance;
		this.dateAbs = dateAbs;
		this.etat = etat;
	}

	public int getIdAbs() {
		return idAbs;
	}

	public void setIdAbs(int idAbs) {
		this.idAbs = idAbs;
	}

	public String getCneEtd() {
		return cneEtd;
	}

	public void setCneEtd(String cneEtd) {
		this.cneEtd = cneEtd;
	}

	public int getIdniv() {
		return idniv;
	}

	public void setIdniv(int idniv) {
		this.idniv = idniv;
	}

	public int getIdSeance() {
		return idSeance;
	}

	public void setIdSeance(int idSeance) {
		this.idSeance = idSeance;
	}

	public Date getDateAbs() {
		return dateAbs;
	}

	public void setDateAbs(Date dateAbs) {
		this.dateAbs = dateAbs;
	}

	public String getEtat() {
		return etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}

	
	
}