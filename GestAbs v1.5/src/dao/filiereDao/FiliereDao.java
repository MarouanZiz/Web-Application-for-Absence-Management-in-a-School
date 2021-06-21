package dao.filiereDao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dao.connexion.Connect;
import models.Filiere;
public class FiliereDao  {
	Connection con =Connect.getC();
     
	      public ArrayList<Filiere> getAllFiliereByIdEtab(int id) {
	    	  try {

				PreparedStatement st =con.prepareStatement("Select * from filiere where idetab=?");
				st.setInt(1,id);
				ResultSet rs = st.executeQuery();
				ArrayList<Filiere> f = new ArrayList<Filiere>();
				while(rs.next()) {
					f.add(new Filiere(rs.getInt(1),rs.getString(2),rs.getInt(3)));
				}
				return f;
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				return null;
			}
	      }
}
