package dao.filiereDao;

import java.util.ArrayList;

import dao.connexion.Connect;
import models.Filiere;
import java.sql.*;
public class FiliereDao  {
	Connection c=Connect.getC();
  
  public boolean addFiliere(Filiere f) {
	  try {
		String req="insert into filiere values (?,?,?) ";
		PreparedStatement st =c.prepareStatement(req);
		st.setString(1, f.getIdF());
		st.setString(2, f.getNomF());
		st.setString(3, f.getIdEtab());
		st.executeUpdate();
	return true;
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
		return false;
	}
  }
  
  public boolean delFiliere(String idf){
	  try {
	    String req="delete from filiere where idFiliere =?";
	    PreparedStatement st =c.prepareStatement(req);
		st.setString(1,idf);
		st.executeUpdate();
		return true;
	} catch (Exception e) {
		e.printStackTrace();
		return false;
	}
  }
		 
		  public boolean updFiliere(String idf) {
		      try {
		    	  Filiere f=getByIdf(idf);
		    	  String req="update Filiere set nomFiliere=?,idEtab=? where idFiliere=?";
		    	  PreparedStatement st =c.prepareStatement(req);
		    	  st.setString(1, f.getNomF());
		    	  st.setString(2, f.getIdEtab());
		    	  st.executeUpdate();
		    	  return true;
		      }catch(Exception e) {
		    	  e.printStackTrace();
		    	  return false;
		      }
		  }
		  
	      
	      public ArrayList<Filiere> getAllFil(){
	    	  try {
	    		  ArrayList<Filiere> myList =new ArrayList<Filiere>();
				String req="select * from Filiere";
				PreparedStatement st =c.prepareStatement(req);
				ResultSet res =st.executeQuery();
				while(res.next()) {
					myList.add(new Filiere(res.getString(1),res.getString(2),res.getString(3)));
				}
				return myList;
						} catch (Exception  e) {
				
							return null;
			}
	    	
	      }
	      
	      public Filiere getByIdf(String idf) {
	    	  try {
	    		  Filiere f=new Filiere();
				String req="Select * from filiere where idFiliere=?";
				PreparedStatement st =c.prepareStatement(req);
				st.setString(1,idf);
				ResultSet res=st.executeQuery();
				while(res.next()) {
					
					f.setIdF(res.getString(1));
					f.setIdF(res.getString(2));
					f.setIdF(res.getString(3));
				}
				return f;
				
			} catch (Exception e) {
				// TODO: handle exception
				return null;
			}
	      }
}
