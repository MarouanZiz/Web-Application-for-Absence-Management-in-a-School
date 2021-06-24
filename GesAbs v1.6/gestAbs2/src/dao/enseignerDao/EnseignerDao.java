package dao.enseignerDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import dao.connexion.Connect;
import models.Enseigner;

public class EnseignerDao {
private Connection con = Connect.getC();


public ArrayList<Enseigner> getByThisYear(int idEns) {
	try {
		PreparedStatement st = con.prepareStatement("select * from enseigner where annee=? and idEns=?");
		Date d = new Date();
		SimpleDateFormat f = new SimpleDateFormat("yyyy");
		String year = f.format(d);
		st.setString(1, year);
		st.setInt(2, idEns);
		ResultSet rs = st.executeQuery();
		ArrayList<Enseigner> l = new ArrayList<Enseigner>();
		while(rs.next()) {
			l.add(new Enseigner(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4)));
		}
		return l;
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		return null;
	}
}

public Enseigner getEnseigner(int idNiv,int idEns) {
	try {
		PreparedStatement st = con.prepareStatement("select * from enseigner where idNiv=? and idEns=?");
		st.setInt(1, idNiv);
		st.setInt(2, idEns);
		ResultSet rs = st.executeQuery();
		Enseigner ens = null;
		while(rs.next()) {
			ens = new Enseigner(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4));
		}
		return ens;
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		return null;
	}
}

public ArrayList<Enseigner> getEnseigner(int idEns) {
	try {
		System.out.println(idEns);
		PreparedStatement st = con.prepareStatement("select * from enseigner where idEns=?");
		st.setInt(1, idEns);
		ResultSet rs = st.executeQuery();

		ArrayList<Enseigner> ens = new ArrayList<Enseigner>();
		while(rs.next()) {
			ens.add(new Enseigner(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4)));
		}
		return ens;
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		return null;
	}
}


public boolean addEnseigner(int[] nivs,int idEns,int idModule){
	try {
		
		for(int i=0;i<nivs.length;i++) {
			PreparedStatement st = con.prepareStatement("insert into enseigner(idniv,idEns,idmodule) values(?,?,?)");
			st.setInt(1, nivs[i]);
			st.setInt(2, idEns);
			st.setInt(3, idModule);
			st.executeUpdate();
		}
		return true;
		
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		return false;
	}
}

}
