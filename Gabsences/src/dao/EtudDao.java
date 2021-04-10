package dao;

import java.util.ArrayList;
import java.sql.*;
import model.Etudiant;

public class EtudDao {
	
public static ArrayList<Etudiant> getEtudiantsByNiv(String idn)	{
	
	try {
		Statement st = Connexion.getConnection().createStatement();
		ResultSet rs = st.executeQuery("select * from etudiant where idn='"+idn+"'");
		ArrayList<Etudiant> t = new ArrayList<Etudiant>(); 
		while(rs.next()) {
			t.add(new Etudiant(rs.getString(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getDate(5)));
		}
		return t;
	} catch (Exception e) {
		System.out.println(e.getMessage());
		return null;
		
	}
	
}

}
