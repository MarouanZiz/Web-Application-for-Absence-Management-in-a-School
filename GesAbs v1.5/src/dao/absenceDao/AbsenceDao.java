package dao.absenceDao;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.connexion.Connect;
import models.Absence;

public class AbsenceDao {
private Connection con = Connect.getC();

public ArrayList<Absence> getAbsence(int idNiv,String cne){
	try {
		PreparedStatement st = con.prepareStatement("select * from absence where cneEtd=? and idNiv=? order by dateabs desc");
		st.setString(1, cne);
		st.setInt(2, idNiv);
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

public boolean changeJustification(int id,String etat) {
	
	try {
		
		if(etat.equals("non justifiee")) {
			
			PreparedStatement st = con.prepareStatement("update absence set etat='justifiee' where idAbs=?");
			st.setInt(1, id);
			st.executeUpdate();
			return true;
	
	}else if(etat.equals("justifiee")) {
		
			PreparedStatement st = con.prepareStatement("update absence set etat='non justifiee' where idAbs=?");
			st.setInt(1, id);
			st.executeUpdate();
			return true;
		
	}else {
		return false;
	}
		
	} catch (Exception e) {
		System.out.println(e.getMessage());
		return false;
	}
	
	
	
}

public boolean addAbsence(Absence abs) {
	try {
		
		PreparedStatement st = con.prepareStatement("insert into absence(idAbs,cneEtd,idniv,idseance,dateAbs) value(null,?,?,?,?)");
		st.setString(1, abs.getCneEtd());
		st.setInt(2, abs.getIdniv());
		st.setInt(3, abs.getIdSeance());
		st.setDate(4, (Date) abs.getDateAbs());
		st.executeUpdate();
		return true;
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		return false;
	}
}

}
