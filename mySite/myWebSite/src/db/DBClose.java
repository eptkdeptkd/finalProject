package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBClose {
	
	public static void close(PreparedStatement psmt, Connection conn, ResultSet rs) {
			try {
				if(psmt != null) {
					psmt.close();
				}
				if(conn != null) {
					conn.close();
				}
				if(rs != null) {// Select 절일때는 필요함
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
}
