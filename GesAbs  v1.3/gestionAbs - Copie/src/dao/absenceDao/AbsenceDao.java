package dao.absenceDao;


import java.sql.*;
import java.util.ArrayList;

import dao.connexion.Connect;
import models.Absence;

public class AbsenceDao {
private Connection con = Connect.getC();

public ArrayList<Absence> getAbsence(int idNiv,String cne){
	try {
		PreparedStatement st = con.prepareStatement("select * from absence where cneEtd=? and idNiv=?");
		ResultSet rs = st.executeQuery();
		ArrayList<Absence> liste = new ArrayList<Absence>();
		while(rs.next()) {
			liste.add(new Absence(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getDate(5),rs.getString(6)));
		}
		return liste;
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		return null;
	}
}

}
