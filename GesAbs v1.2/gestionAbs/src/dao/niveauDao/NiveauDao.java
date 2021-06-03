package dao.niveauDao;

import java.sql.*;
import java.util.ArrayList;

import dao.connexion.Connect;
import models.Niveau;

public class NiveauDao {
private Connection con = Connect.getC();

public ArrayList<Niveau> getNiveau(){
	try {
		PreparedStatement st = con.prepareStatement("select * from niveau");
		ResultSet rs = st.executeQuery();
		ArrayList<Niveau> nv = new ArrayList();
		while(rs.next()) {
			nv.add(new Niveau(rs.getInt(1),rs.getString(2)));
		}
		return nv;
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		return null;
	}
}

}