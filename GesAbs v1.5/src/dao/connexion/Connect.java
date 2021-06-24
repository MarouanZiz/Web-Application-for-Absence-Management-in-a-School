package dao.connexion;
import java.sql.*;
public class Connect {
	private static Connection con;
	private static Connect c = null;
	private Connect(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbgestabs","root","");
			
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	
	}
	
	public static Connection getC() {
		if(c == null) c = new Connect();
		return con;
		}
	
	
}
