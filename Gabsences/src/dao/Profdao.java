package dao;

import java.sql.*;

import model.Prof;

public class Profdao {
	
	
	public Prof getProf(String e,String p) {
		try {
			Statement st = Connexion.getConnection().createStatement();
			ResultSet rs = st.executeQuery("select p.idp,p.idn,nomp,prenomp,emailp,pswp from profs p,comptep c where emailp='"+e+"' and pswp='"+p+"' and p.idp=c.idp");
			Prof pro = null;
			while(rs.next()) {
				pro = new Prof(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
			}
			return pro;
			
		} catch (SQLException e2) {
			System.out.println(e2.getMessage());
			return null;
		}
	}
	
//	public static void main(String[] args) {
//        Profdao.getInstance().getProf("klj", "ljlk");
//		System.out.println("ok");
//	}
}
