package dao.seanceDao;

import java.sql.*;

import dao.connexion.Connect;
import models.Seance;

public class SeanceDao {
	private Connection con = Connect.getC();
	
	public Seance getSeance(int id) {
		try {
			
			PreparedStatement st = con.prepareStatement("select * from seance where idSeance=?");
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			Seance s = null;
			while(rs.next()) {
				s  = new Seance(rs.getInt(1),rs.getTime(2),rs.getTime(3),rs.getInt(4),rs.getInt(5));

			}
			return s;
		} catch (SQLException e) {
			System.out.println("Error :"+e.getMessage());
			return null;
		}
	}
	
	/**
	 * @param s
	 * @return
	 */
	public boolean addSeance(Seance s) {
		
		try {
			PreparedStatement st = con.prepareStatement("insert into seance values(null,?,?,?,?)");
			st.setTime(1,s.getHeureDeb());
			st.setTime(2, s.getHeureFin());
			st.setInt(3, s.getIdModule());
			System.out.println(s.getIdModule());
			st.setInt(4, s.getIdAnnee());
			st.executeUpdate();
			return true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		
	}
	
	public int getMaxId() {
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select max(idSeance) from seance");
			int id = 0;
			while(rs.next()) {
				id = rs.getInt(1);
			}
			return id;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return -1;
		}
	}
	
	public static void main(String[] args) {
     SeanceDao s = new SeanceDao();
     System.out.println(s.getSeance(1));

	}
}
