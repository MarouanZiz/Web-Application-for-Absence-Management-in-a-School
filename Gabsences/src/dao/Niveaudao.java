package dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Niveau;

public class Niveaudao {


public ArrayList<Niveau> getNiveau() {
	
	try {
		Statement st = Connexion.getConnection().createStatement();
		ResultSet rs = st.executeQuery("select * from niveau");
		ArrayList<Niveau> n = new ArrayList<Niveau>();
		while(rs.next()) {
			n.add(new Niveau(rs.getInt(1),rs.getNString(2)));
		}
		return n;
			
	} catch (Exception e) {
		System.out.println(e.getMessage());
		return null;
	}
	
}

}
