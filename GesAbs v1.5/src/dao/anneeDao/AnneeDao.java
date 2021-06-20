package dao.anneeDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import dao.connexion.Connect;
import models.Annee;

public class AnneeDao {
	private Connection con = Connect.getC();
	
	public Annee getActuelAnnee() {
		try {
			PreparedStatement st = con.prepareStatement("select * from anneescolaire where annee=?");
			Date d = new Date();
			SimpleDateFormat f = new SimpleDateFormat("yyyy");
			String year = f.format(d);
			st.setString(1, year);
			ResultSet rs = st.executeQuery();
			Annee an = null;
			while(rs.next()) {
				an = new Annee(rs.getInt(1),rs.getInt(2),rs.getInt(3));
			}
			return an;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	public ArrayList<Annee> getAllAnnee() {
		try {
			
			PreparedStatement st = con.prepareStatement("select * from anneescolaire order by annee desc");
			ResultSet rs = st.executeQuery();
			ArrayList<Annee> an = new ArrayList<Annee>();
			while(rs.next()) {
				an.add(new Annee(rs.getInt(1),rs.getInt(2),rs.getInt(3)));
			}
			return an;
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
}
