package dao.connexion;
import java.sql.*;
public class Connect {
	private static Connection con;
	static{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbGestAbs","root","");
			
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	
	}
	
	public static Connection getC() {
		return con;
		}
	
	public static void main(String[] args) {
		Connection c =Connect.getC();
		
	}
	
}
