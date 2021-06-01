package models;
import java.util.*;
public class Absence {
	private String idAbsence;
	private String dEtd;
	private String idniveau;
	private String idSeance;
	private Date dateAbs;
	private int nbrAbsence;
	private String Status;//état
	public Absence(String idAbsence, String dEtd, String idniveau, String idSeance, Date dateAbs, int nbrAbsence,
			String status) {
		super();
		this.idAbsence = idAbsence;
		this.dEtd = dEtd;
		this.idniveau = idniveau;
		this.idSeance = idSeance;
		this.dateAbs = dateAbs;
		this.nbrAbsence = nbrAbsence;
		Status = status;
	}
	public String getIdAbsence() {
		return idAbsence;
	}
	public void setIdAbsence(String idAbsence) {
		this.idAbsence = idAbsence;
	}
	public String getdEtd() {
		return dEtd;
	}
	public void setdEtd(String dEtd) {
		this.dEtd = dEtd;
	}
	public String getIdniveau() {
		return idniveau;
	}
	public void setIdniveau(String idniveau) {
		this.idniveau = idniveau;
	}
	public String getIdSeance() {
		return idSeance;
	}
	public void setIdSeance(String idSeance) {
		this.idSeance = idSeance;
	}
	public Date getDateAbs() {
		return dateAbs;
	}
	public void setDateAbs(Date dateAbs) {
		this.dateAbs = dateAbs;
	}
	public int getNbrAbsence() {
		return nbrAbsence;
	}
	public void setNbrAbsence(int nbrAbsence) {
		this.nbrAbsence = nbrAbsence;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	@Override
	public String toString() {
		return "Absence [idAbsence=" + idAbsence + ", dEtd=" + dEtd + ", idniveau=" + idniveau + ", idSeance="
				+ idSeance + ", dateAbs=" + dateAbs + ", nbrAbsence=" + nbrAbsence + ", Status=" + Status + "]";
	}
	
}