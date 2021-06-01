package dao.filiereDao;


import models.Filiere;
import java.util.*;
public interface IntFiliere {
   public boolean addFiliere(Filiere f);
   public boolean delFiliere(String idf);
   public boolean updFiliere(String idf);
   public ArrayList<Filiere> getAllFil();
}
