package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public static void initConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Driver Connect..");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws Exception{
		Connection conn = null;
	
		conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.7.56:1521:xe",
												"hr", "hr");
		System.out.println("DB Connect..");

		return conn;
	}
}
