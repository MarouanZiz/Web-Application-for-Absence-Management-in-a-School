package dao.enseignantDao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dao.connexion.Connect;
import models.Enseignant;


public class EnseignantDao {
private static Connection con = Connect.getC();

public Enseignant getEnseignant(String log,String psw) {
	 try {
			PreparedStatement st = con.prepareStatement("select * from enseignant where login=? and password=?");
			st.setString(1,log);
			st.setString(2,psw);
			ResultSet rs = st.executeQuery();
			Enseignant ens = null;
			while(rs.next()) {
				ens = new Enseignant(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getInt(12));
			}
 		 return ens;
		} catch (Exception e) {
			System.out.println("Error:"+e.getMessage());
			return null;
		}
}

public Enseignant getEnseignantByCnp(String cnp,String cin) {
	 try {
			PreparedStatement st = con.prepareStatement("select * from enseignant where cnp=? and cin=?");
			st.setString(1, cnp);
			st.setString(2,cin);
			ResultSet rs = st.executeQuery();
			Enseignant ens = null;
			while(rs.next()) {
				ens = new Enseignant(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getInt(12));
			}
		 return ens;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
}

public String addEnseignant(Enseignant ens) {
	
	
	if(enseignantExist(ens.getCnp(),ens.getCin()).equals("yes")) {
		return "no";
	}
	
	 try {
		 String req="insert into enseignant(idEns,cnp,cin,nom,prenom,datenais,login,password,email,sexe,tele,idEtab)"
		 		+ "  values(null,?,?,?,?,?,?,?,?,?,?,?)";
		 PreparedStatement st =con.prepareStatement(req);
		 st.setString(1, ens.getCnp());
		 st.setString(2, ens.getCin());
		 st.setString(3, ens.getNom());
		 st.setString(4, ens.getPrenom());
		 st.setDate(5,(Date) ens.getDateNais());
		 st.setString(6, ens.getLogin());
		 st.setString(7, ens.getPsw());
		 st.setString(8, ens.getEmail());
		 st.setString(9, ens.getSexe());
		 st.setString(10, ens.getTele());
		 st.setInt(11, ens.getIdEtab());

		 st.executeUpdate();
		 return "yes";
	} catch (Exception e) {
		System.out.println(e.getMessage());
		return "error";
	}
}

public String enseignantExist(String cnp,String cin) {
	   try {
		PreparedStatement st = con.prepareStatement("select count(cnp) from enseignant where cnp=? and cin=?");
		st.setString(1,cnp);
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

public static ArrayList<Enseignant> getAllEnseig(int idEtab){
	 try {
		 ArrayList<Enseignant> myList =new ArrayList<Enseignant>();
		PreparedStatement st=con.prepareStatement("select * from enseignant where idEtab=?");
		st.setInt(1, idEtab);
		ResultSet res=st.executeQuery();
	while(res.next()) {
		Enseignant ens = new Enseignant();
		ens.setId(res.getInt(1));
		ens.setCnp(res.getString(2));
		ens.setCin(res.getString(3));
		ens.setNom(res.getString(4));
		ens.setPrenom(res.getString(5));
		ens.setDateNais(res.getDate(6));
		ens.setLogin(res.getString(7));
		ens.setPsw(res.getString(8));
		ens.setEmail(res.getString(9));
		ens.setSexe(res.getString(10));
		ens.setTele(res.getString(11));
		ens.setIdEtab(res.getInt(12));
		myList.add(ens);
	}return myList;
	 } catch (Exception e) {
		 System.out.println(e.getMessage());
		 return null;
	}
		
}


public boolean updateEnseig(Enseignant ens) {

 try {
		PreparedStatement st=
				con.prepareStatement("update Enseignant  set cnp =?, cin=?,nom=? , prenom=? , datenais=? , email=?,sexe=? , tele=? , idEtab =? where idEns=? ");
				st.setString(1, ens.getCnp());
				st.setString(2, ens.getCin());
				st.setString(3, ens.getNom());
				st.setString(4, ens.getPrenom());
			   	st.setDate(5,(Date)ens.getDateNais());
			   	st.setString(6,ens.getEmail());
				st.setString(7, ens.getSexe());
				st.setString(8, ens.getTele());
				st.setInt(9, ens.getIdEtab());
				st.setInt(10, ens.getId());
				st.executeUpdate();
		return true;
	} catch (Exception e) {
		System.out.println(e.getMessage());
		return false;
	}
}

		public boolean delEnseigant(String cnp , String cin) {
			
			 try {
				PreparedStatement st = con.prepareStatement("delete from enseignant where cnp =? and cin=? ");
				st.setString(1, cnp);
				st.setString(2, cin);
				st.executeUpdate();
				return true;
			} catch (Exception e) {
				System.out.println(e.getMessage());
			  return false;
			}
		}
		
		public String getImg(int id) {
			try {
			PreparedStatement st = con.prepareStatement("select photo from enseignant where idEns=?");
		    st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			String photo = null;
			while(rs.next()) {
				photo = rs.getString(1);
			}
		 return photo;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		}
		
		public int getMaxId() {
			try {
				
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select max(idEns) from enseignant");
				int  idEns = -1;
				while(rs.next()){
					idEns  = rs.getInt(1);
				}
				return idEns;
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				return -1;
			}
		}


}
