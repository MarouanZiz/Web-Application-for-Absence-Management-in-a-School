package dao.EtablissementDao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.connexion.Connect;
import models.Etablissement;
public class EtablissementDao{
  
	Connection c =Connect.getC();
             
			  public boolean addEtab(Etablissement etab) {
				  try {
					String req="insert into etablissement values(?,?,?)";
					PreparedStatement st = c.prepareStatement(req);
					st.setInt(1, etab.getIdEtab());
					st.setString(2, etab.getNomEtab());
					st.setString(3, etab.getVille());
					st.executeUpdate();
					return true;
				} catch (Exception e) {
					e.printStackTrace();
					return false ;
					
				}
			  }

     public boolean delEtab(Etablissement etab) {
    	 return true;
     }
     

     public boolean updEtab(Etablissement etab) {
    	 return true;
     }
 
     public ArrayList<Etablissement> getAllEtab(){
    	 return new ArrayList<Etablissement>();
     }
     
     public Etablissement getEtabliById(int id) {
    	 try {
			PreparedStatement st = c.prepareStatement("select * from etablissement where idEtab=?");
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			Etablissement et = null;
			while(rs.next()) {
				et = new Etablissement(rs.getInt(1),rs.getString(2),rs.getString(3));
			}
			

			return et;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
     }
}
