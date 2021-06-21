package models;

public class Etablissement {
  private String nomEtab,ville;;
  private int idEtab;
  public Etablissement() {
	  
  }

public Etablissement(int idEtab, String nomEtab, String ville) {
	super();
	this.idEtab = idEtab;
	this.nomEtab = nomEtab;
	this.ville = ville;
}

		public int getIdEtab() {
			return idEtab;
		}
		
		public void setIdEtab(int idEtab) {
			this.idEtab = idEtab;
		}
		
		public String getNomEtab() {
			return nomEtab;
		}
		
		public void setNomF(String nomEtab) {
			this.nomEtab = nomEtab;
		}
		
		public String getVille() {
			return ville;
		}
		
		public void setVill(String ville) {
			this.ville = ville;
		}

		@Override
		public String toString() {
			return "Etablissement [idEtab=" + idEtab + ", nomEtab=" + nomEtab + ", ville=" + ville + "]";
		}
		
		


}