package dao.etudiantDao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dao.connexion.Connect;
import models.Etudiant;

public class EtudiantDao implements IntEtud{
     Connection c=Connect.getC();
     @Override
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
    		 st.setString(10, et.getEtab());
    		 st.setString(11, et.getNiveau());
    		 st.executeUpdate();
    		 return true;
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
		}
    	 
     }
     
     @Override
     public boolean delEtd(String cne) {
    	
    	 try {
			PreparedStatement st = c.prepareStatement("delete * from Etudiant where cne =? ");
			st.setString(1, cne);
			st.executeUpdate();
			return true;
		} catch (Exception e) {
		  return false;
		}
     }
     
     @Override
		public boolean updateEtd(Etudiant et) {
    	 	Etudiant std =getByCne(et.getCne());
    	 try {
				PreparedStatement st=
						c.prepareStatement
						       ("update Etudiant set nom=? , prenom=? "
								+ ",datenais=?,login=? ,password=? ,"
								+ "email=? ,sexe=? ,"
								+ "lieuNais=? ,idEtab =? ,idNiv=?");
						st.setString(1, std.getNom());
						st.setString(2, std.getPrenom());
					   	st.setDate(3,(Date)std.getDateNais());
						st.setString(4, std.getLogin());
						st.setString(5, std.getPassword());
						st.setString(6, std.getEmail());
						st.setString(7, std.getSexe());
						st.setString(8, std.getLieuNais());
						st.setString(1, std.getEtab());
						st.setString(1, std.getNiveau());
						st.executeUpdate();
				return true;
			} catch (Exception e) {
				return false;
			}
     }
     @Override
		public Etudiant getByCne(String cne ) {
			try {
				Etudiant et =new Etudiant();
				PreparedStatement st =c.prepareStatement("select * from etudiant where cne=?");
				st.setString(1, cne);
				ResultSet res=st.executeQuery();
			 while(res.next()) {
				 et.setCin(res.getString(1));
				 et.setCne(res.getString(2));
				 et.setNom(res.getString(3));
				 et.setPrenom(res.getString(4));
				 et.setDateNais(res.getDate(5));
				 et.setLogin(res.getString(6));
				 et.setPassword(res.getString(7));
				 et.setEmail(res.getString(8));
				 et.setSexe(res.getString(9));
				 et.setLieuNais(res.getString(10));
				 et.setEtab(res.getString(11));
				 et.setNiveau(res.getString(12));
				 }
			 return et;
						} catch (Exception e) {
				// TODO: handle exception
							return null;
			}
		}
     @Override
		public ArrayList<Etudiant> getAllEtd(){
    	 try {
    		 ArrayList<Etudiant> myList =new ArrayList<Etudiant>();
			PreparedStatement st=c.prepareStatement("select * from etudiant");
		ResultSet res=st.executeQuery();
		while(res.next()) {
			Etudiant et=new Etudiant();
			 et.setCin(res.getString(1));
			 et.setCne(res.getString(2));
			 et.setNom(res.getString(3));
			 et.setPrenom(res.getString(4));
			 et.setDateNais(res.getDate(5));
			 et.setLogin(res.getString(6));
			 et.setPassword(res.getString(7));
			 et.setEmail(res.getString(8));
			 et.setSexe(res.getString(9));
			 et.setLieuNais(res.getString(10));
			 et.setEtab(res.getString(11));
			 et.setNiveau(res.getString(12));
			myList.add(et);
		}return myList;
    	 } catch (Exception e) {
    		 return null;
		}
			
     }
     
     @Override
     public Etudiant getEtudiant(String log,String psw) {
    	 try {
			PreparedStatement st = c.prepareStatement("select * from etudiant where login=? and password=?");
			st.setString(1, log);
			st.setString(2,psw);
			ResultSet rs = st.executeQuery();
			Etudiant et = null;
			while(rs.next()) {
				et = new Etudiant(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12));
			}
    		 return et;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
     }
     
}
