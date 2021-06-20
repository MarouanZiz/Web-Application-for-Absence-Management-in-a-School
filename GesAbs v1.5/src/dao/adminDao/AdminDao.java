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

public String getImg(int idEtab) {
	try {
	PreparedStatement st = con.prepareStatement("select photo from admin where idEtab=?");
    st.setInt(1, idEtab);
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


}
