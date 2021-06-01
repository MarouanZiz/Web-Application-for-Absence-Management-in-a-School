package models;

public class Etablissement {
  private String idEtab,nomF,vill;
  public Etablissement() {
	  
  }

public Etablissement(String idEtab, String nomF, String vill) {
	super();
	this.idEtab = idEtab;
	this.nomF = nomF;
	this.vill = vill;
}

		public String getIdEtab() {
			return idEtab;
		}
		
		public void setIdEtab(String idEtab) {
			this.idEtab = idEtab;
		}
		
		public String getNomF() {
			return nomF;
		}
		
		public void setNomF(String nomF) {
			this.nomF = nomF;
		}
		
		public String getVill() {
			return vill;
		}
		
		public void setVill(String vill) {
			this.vill = vill;
		}

		@Override
		public String toString() {
			return "Etablissement [idEtab=" + idEtab + ", nomF=" + nomF + ", vill=" + vill + "]";
		}
		
		


}