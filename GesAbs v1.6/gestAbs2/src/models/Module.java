package models;

public class Module {
private int idModule;
private String nomModule;

public Module(int idModule, String nomMdule) {
	super();
	this.idModule = idModule;
	this.nomModule = nomMdule;
}

public int getIdModule() {
	return idModule;
}

public void setIdModule(int idModule) {
	this.idModule = idModule;
}

public String getNomModule() {
	return nomModule;
}

public void setNomMdule(String nomMdule) {
	this.nomModule = nomMdule;
}



}
