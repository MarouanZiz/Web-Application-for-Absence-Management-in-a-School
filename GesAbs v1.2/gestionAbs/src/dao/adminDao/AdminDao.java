package dao.adminDao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.connexion.Connect;
import models.Etudiant;
import models.Admin;


public class AdminDao {
private Connection con = Connect.getC();

public Admin getAdmin(String log,String psw) {
	 try {
			PreparedStatement st = con.prepareStatement("select * from admin where login=? and password=?");
			st.setString(1, log);
			st.setString(2,psw);
			ResultSet rs = st.executeQuery();
			Admin admin = null;
			while(rs.next()) {
				admin = new Admin(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getInt(8));
			}
		 return admin;
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
		PreparedStatement st = con.prepareStatement("insert into etudiant values(?,?,?,?,?,?,?,?,?,?,?,?)");
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
	PreparedStatement st = con.prepareStatement("select count(cne) from etudiant where cne=? and cin=?");
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
