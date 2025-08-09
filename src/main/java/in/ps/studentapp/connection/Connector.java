package in.ps.studentapp.connection;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;


public class Connector {
	public static Connection requestConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/students", "root", "tiger");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
