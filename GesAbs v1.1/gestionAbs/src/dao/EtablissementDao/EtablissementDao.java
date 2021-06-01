package dao.EtablissementDao;


import models.Etablissement;

import java.sql.*;
import java.util.*;

import dao.connexion.Connect;
public class EtablissementDao implements IntEtablissement {
  
	Connection c =Connect.getC();
             @Override
			  public boolean addEtab(Etablissement etab) {
				  try {
					String req="insert into etablissement values(?,?,?)";
					PreparedStatement st =c.prepareStatement(req);
					st.setString(1, etab.getIdEtab());
					st.setString(2, etab.getNomF());
					st.setString(3, etab.getVill());
					st.executeUpdate();
					return true;
				} catch (Exception e) {
					e.printStackTrace();
					return false ;
					
				}
			  }
     @Override
     public boolean delEtab(Etablissement etab) {
    	 return true;
     }
     
     @Override 
     public boolean updEtab(Etablissement etab) {
    	 return true;
     }
     @Override 
     public ArrayList<Etablissement> getAllEtab(){
    	 return new ArrayList<Etablissement>();
     }
}
