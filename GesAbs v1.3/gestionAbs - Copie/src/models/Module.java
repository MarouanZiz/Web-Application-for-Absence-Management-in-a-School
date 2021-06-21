package models;

public class Module {
private int idMod;
private String nomMdule;

		public Module() {}
		
public int getIdMod() {
	return idMod;
}
public void setIdMod(int idMod) {
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
public Module(int idMod, String nomMdule) {
	super();
	this.idMod = idMod;
	this.nomMdule = nomMdule;
}
}
