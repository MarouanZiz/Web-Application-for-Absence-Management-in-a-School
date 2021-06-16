package dao.etudiantDao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.connexion.Connect;
import models.Etudiant;

public class EtudiantDao {
     Connection c=Connect.getC();
     
     public boolean addEtd(Etudiant et) {
    	 try {
    		 String req="insert into etudiant (cne,cin,nom,prenom,login,password,email,sexe,lieunais,idEtab,idNiv)"
    		 		+ "  values (?,?,?,?,?,?,?,?,?,?,?)";
    		 PreparedStatement st =c.prepareStatement(req);
    		 st.setString(1, et.getCne());
    		 st.setString(2, et.getCin());
    		 st.setString(3, et.getNom());
    		 st.setString(4, et.getPrenom());
    		 //st.setDate(5, et.getDateNais());
    	//	 st.setDate(5, null);
    		 st.setString(5, et.getLogin());
    		 st.setString(6, et.getPassword());
    		 st.setString(7, et.getEmail());
    		 st.setString(8, et.getSexe());
    		 st.setString(9, et.getLieuNais());
    		 st.setInt(10, et.getIdEtab());
    		 st.setInt(11, et.getIdNiv());
    		 st.executeUpdate();
    		 return true;
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
		}
    	 
     }
     
     
     public boolean delEtd(String cne , String cin) {
    	
    	 try {
			PreparedStatement st = c.prepareStatement("delete from etudiant where cne =? and cin=? ");
			st.setString(1, cne);
			st.setString(2, cin);
			st.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		  return false;
		}
     }
     
     
		public boolean updateEtd(Etudiant et) {
			System.out.println(et.getCne()+" "+et.getCin()+" "+et.getNom());
    	 try {
				PreparedStatement st=
						c.prepareStatement("update Etudiant set nom=? , prenom=? ,datenais=?,sexe=? ,lieuNais=? ,idEtab =? ,idNiv=? where cne=? and cin=?");
						st.setString(1, et.getNom());
						st.setString(2, et.getPrenom());
					   	st.setDate(3,(Date)et.getDateNais());
						st.setString(4, et.getSexe());
						st.setString(5, et.getLieuNais());
						st.setInt(6, et.getIdEtab());
						st.setInt(7, et.getIdNiv());
						st.setString(8, et.getCne());
						st.setString(9, et.getCin());
						st.executeUpdate();
				return true;
			} catch (Exception e) {
				System.out.println(e.getMessage());
				return false;
			}
     }
   
		public Etudiant getEtudiantByCne(String cne , String cin ) {
			try {
				Etudiant et =new Etudiant();
				PreparedStatement st =c.prepareStatement("select * from etudiant where cne=? and cin=?");
				st.setString(1, cne);
				st.setString(2, cin);
				ResultSet res=st.executeQuery();
			 while(res.next()) {
				 et.setCne(res.getString(1));
				 et.setCin(res.getString(2));
				 et.setNom(res.getString(3));
				 et.setPrenom(res.getString(4));
				 et.setDateNais(res.getDate(5));
				 et.setLogin(res.getString(6));
				 et.setPassword(res.getString(7));
				 et.setEmail(res.getString(8));
				 et.setSexe(res.getString(9));
				 et.setLieuNais(res.getString(10));
				 et.setEtab(res.getInt(11));
				 et.setNiveau(res.getInt(12));
				 }
			 return et;
			} catch (Exception e) {
				System.out.println(e.getMessage());			
				return null;
			}
			
		}
		
		public Etudiant getEtudiantByCn(String cne ) {
			try {
				Etudiant et =new Etudiant();
				PreparedStatement st =c.prepareStatement("select * from etudiant where cne=?");
				st.setString(1, cne);
				ResultSet res=st.executeQuery();
			 while(res.next()) {
				 et.setCne(res.getString(1));
				 et.setCin(res.getString(2));
				 et.setNom(res.getString(3));
				 et.setPrenom(res.getString(4));
				 et.setDateNais(res.getDate(5));
				 et.setLogin(res.getString(6));
				 et.setPassword(res.getString(7));
				 et.setEmail(res.getString(8));
				 et.setSexe(res.getString(9));
				 et.setLieuNais(res.getString(10));
				 et.setEtab(res.getInt(11));
				 et.setNiveau(res.getInt(12));
				 }
			 return et;
			} catch (Exception e) {
				System.out.println(e.getMessage());			
				return null;
			}
			
		}
    
		public ArrayList<Etudiant> getAllEtd(int idEtab){
    	 try {
    		 ArrayList<Etudiant> myList =new ArrayList<Etudiant>();
			PreparedStatement st=c.prepareStatement("select * from etudiant where idEtab=?");
			st.setInt(1, idEtab);
			ResultSet res=st.executeQuery();
		while(res.next()) {
			Etudiant et=new Etudiant();
			 et.setCne(res.getString(1));
			 et.setCin(res.getString(2));
			 et.setNom(res.getString(3));
			 et.setPrenom(res.getString(4));
			 et.setDateNais(res.getDate(5));
			 et.setLogin(res.getString(6));
			 et.setPassword(res.getString(7));
			 et.setEmail(res.getString(8));
			 et.setSexe(res.getString(9));
			 et.setLieuNais(res.getString(10));
			 et.setEtab(res.getInt(11));
			 et.setNiveau(res.getInt(12));
			myList.add(et);
		}return myList;
    	 } catch (Exception e) {
    		 System.out.println(e.getMessage());
    		 return null;
		}
			
     }
		
		public ArrayList<Etudiant> getAllByNiv(int idNiv){
	    	 try {
	    		 ArrayList<Etudiant> myList =new ArrayList<Etudiant>();
				PreparedStatement st=c.prepareStatement("select * from etudiant where idNiv=?");
				st.setInt(1, idNiv);
				ResultSet res=st.executeQuery();
			while(res.next()) {
				Etudiant et=new Etudiant();
				 et.setCne(res.getString(1));
				 et.setCin(res.getString(2));
				 et.setNom(res.getString(3));
				 et.setPrenom(res.getString(4));
				 et.setDateNais(res.getDate(5));
				 et.setLogin(res.getString(6));
				 et.setPassword(res.getString(7));
				 et.setEmail(res.getString(8));
				 et.setSexe(res.getString(9));
				 et.setLieuNais(res.getString(10));
				 et.setEtab(res.getInt(11));
				 et.setNiveau(res.getInt(12));
				myList.add(et);
			}return myList;
	    	 } catch (Exception e) {
	    		 System.out.println(e.getMessage());
	    		 return null;
			}
				
	     }
     
    
     public Etudiant getEtudiant(String log,String psw) {
    	 try {
			PreparedStatement st = c.prepareStatement("select * from etudiant where login=? and password=?");
			st.setString(1, log);
			st.setString(2,psw);
			ResultSet rs = st.executeQuery();
			Etudiant et = null;
			while(rs.next()) {
				et = new Etudiant(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getInt(11),rs.getInt(12));
			}
    		 return et;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
     }
     
     public String addEtudiant(Etudiant et) {
    		if(etudiantExist(et.getCne(),et.getCin()).equals("yes")) {
    			return "no";
    		}
    		
    		try {
    			PreparedStatement st = c.prepareStatement("insert into etudiant values(?,?,?,?,?,?,?,?,?,?,?,?)");
    			st.setString(1,et.getCne());
    			st.setString(2,et.getCin());
    			st.setString(3,et.getNom());
    			st.setString(4,et.getPrenom());
    			st.setDate(5, (Date) et.getDateNais());
    			st.setString(6, et.getLogin());
    			st.setString(7,et.getPassword());
    			st.setString(8,null);
    			st.setString(9, et.getSexe());
    			st.setString(10,et.getLieuNais());
    			st.setInt(11, et.getIdEtab());
    			st.setInt(12, et.getIdNiv());
    			st.executeUpdate();
    			return "yes";
    		} catch (SQLException e) {
    			System.out.println("error: "+e.getMessage());
    			return "error";
    		}
    		
    	}

    	public String etudiantExist(String cne,String cin) {
    	   try {
    		PreparedStatement st = c.prepareStatement("select count(cne) from etudiant where cne=? and cin=?");
    		st.setString(1,cne);
    		st.setString(2,cin);
    		ResultSet rs = st.executeQuery();
    		int n = 0;
    		while(rs.next()) {
    			 n = rs.getInt(1);
    		}
    		if(n !=0) {
    			return "yes";
    		}else {
    			return "no";
    		}
    	} catch (SQLException e) {
    		System.out.println(e.getMessage());
    		return "error";
    	}
    	   

    	}

     
}
