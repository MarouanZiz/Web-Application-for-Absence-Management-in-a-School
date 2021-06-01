package dao.EtablissementDao;


import models.Etablissement;
import java.util.*;

public interface IntEtablissement {
  public boolean addEtab(Etablissement etab);
  public boolean delEtab(Etablissement etab);
  public boolean updEtab(Etablissement etab);
  public ArrayList<Etablissement> getAllEtab();
}
