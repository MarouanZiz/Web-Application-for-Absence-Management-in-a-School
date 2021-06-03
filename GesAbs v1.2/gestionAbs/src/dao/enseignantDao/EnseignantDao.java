package dao.enseignantDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.connexion.Connect;
import models.Enseignant;


public class EnseignantDao {
private Connection con = Connect.getC();

public Enseignant getEnseignant(String log,String psw) {
	 try {
			PreparedStatement st = con.prepareStatement("select * from enseignant where login=? and password=?");
			st.setString(1, log);
			st.setString(2,psw);
			ResultSet rs = st.executeQuery();
			Enseignant ens = null;
			while(rs.next()) {
				ens = new Enseignant(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13));
			}
 		 return ens;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
}

}
