package dao.niveauDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.connexion.Connect;
import models.Enseigner;
import models.Niveau;

public class NiveauDao {
private Connection con = Connect.getC();

public ArrayList<Niveau> getNiveau(){
	try {
		PreparedStatement st = con.prepareStatement("select * from niveau");
		ResultSet rs = st.executeQuery();
		ArrayList<Niveau> nv = new ArrayList<Niveau>();
		while(rs.next()) {
			nv.add(new Niveau(rs.getInt(1),rs.getString(2),rs.getInt(3)));
		}
		return nv;
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		return null;
	}
}

public ArrayList<Niveau> getNiveau(ArrayList<Enseigner> l){
	try {
		ArrayList<Niveau> nv = new ArrayList<Niveau>();
		for(Niveau n : getNiveau()) {
			for(Enseigner e : l) {
				if(n.getIdNiveau() == e.getIdNiv()) {
					nv.add(n);
				}
			}
		}
		return nv;
	} catch (Exception e) {
		System.out.println(e.getMessage());
		return null;
	}
	
	
}

public ArrayList<Niveau> getNiveauByIdFiliere(int id){
	
	try {
		PreparedStatement st = con.prepareStatement("select * from niveau where idfiliere=?");
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();
		ArrayList<Niveau> nv = new ArrayList<Niveau>();
		while(rs.next()) {
			nv.add(new Niveau(rs.getInt(1),rs.getString(2),rs.getInt(3)));
		}
		return nv;
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		return null;
	}
	
}

public Niveau getNivById(int id) {
	try {

		PreparedStatement st = con.prepareStatement("select * from Niveau where idNiveau=?");
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();
		Niveau niv = null;
		while(rs.next()) {
			niv = new Niveau(rs.getInt(1),rs.getString(2),rs.getInt(3));
		}
		
		return niv;
	} catch (SQLException e) {
		System.out.println(e.getMessage());
		return null;
	}
}

}