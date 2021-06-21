package models;

public class Module {
private String idMod;
private String nomMdule;
		public Module() {
			
		}
public String getIdMod() {
	return idMod;
}
public void setIdMod(String idMod) {
	this.idMod = idMod;
}
public String getNomMdule() {
	return nomMdule;
}
@Override
public String toString() {
	return "Module [idMod=" + idMod + ", nomMdule=" + nomMdule + "]";
}
public void setNomMdule(String nomMdule) {
	this.nomMdule = nomMdule;
}
public Module(String idMod, String nomMdule) {
	super();
	this.idMod = idMod;
	this.nomMdule = nomMdule;
}
}
