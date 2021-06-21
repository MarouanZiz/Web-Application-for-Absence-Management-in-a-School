package dao.etudiantDao;


import java.util.*;
import models.*;

public interface IntEtud {
		public boolean addEtd(Etudiant et);
		public boolean delEtd(String cne);
		public boolean updateEtd(Etudiant et);
		public Etudiant getByCne(String cne );
		public ArrayList<Etudiant> getAllEtd();
		public Etudiant getEtudiant(String log,String psw);
		
}
