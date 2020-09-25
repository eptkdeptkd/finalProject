package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

public class MemberDao {
	private static MemberDao dao = new MemberDao();
	
	private MemberDao() {
		DBConnection.initConnection();
	}
	
	public static MemberDao getInstance() {
		return dao;
	}
	
	public boolean checkId(String id) {
		String sql = " SELECT id FROM DMEMBER WHERE ID = ? ";
		boolean b = false;
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) b= true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return b;
	}
	public boolean checkPnumber(String pnumber) {
		String sql = " SELECT pnumber FROM DMEMBER WHERE pnumber = ? ";
		boolean b = false;
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, pnumber);
			rs = psmt.executeQuery();
			
			if(rs.next()) b= true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return b;
	}
	public boolean checkPemail(String email) {
		String sql = " SELECT email FROM DMEMBER WHERE email = ? ";
		boolean b = false;
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, email);
			rs = psmt.executeQuery();
			
			if(rs.next()) b= true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return b;
	}
	public boolean isLoginPos(String id, String pwd) {
		String sql = " SELECT 1 FROM DMEMBER WHERE ID = ? and PASSWORD = ? ";
		boolean b = false;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs = psmt.executeQuery();
		
			if(rs.next()) b= true;
			
		}catch (Exception e) {
		   	e.printStackTrace();	// 쿼리문이 틀렸다고 에러가 발생하는 곳
	    } finally {
		   	DBClose.close(psmt, conn, rs);
		}
		
		return b;
	}
	public void addMember(MemberDto dto) {
		String sql = " INSERT INTO DMEMBER VALUES (?,?,?,?,?,?,?,?,?,3)";
		String sql1 = " INSERT INTO DMENU VALUES(SEQ_DMENU.nextval,'게시판',1,? ) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println("(1/6)addMember Processing...");
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getNickname());
			psmt.setString(3, dto.getPassword());
			psmt.setString(4, dto.getBirthday());
			psmt.setString(5, dto.getAddress());
			psmt.setString(6, dto.getPnumber());
			psmt.setString(7, dto.getEmail());
			psmt.setInt(8, dto.getCemail());
			psmt.setInt(9, dto.getCpnumber());
			System.out.println("(2/6)addMember Processing...");
			
			psmt.executeUpdate();
			System.out.println("(3/6)addMember Processing...");
			
			psmt.clearParameters();
			System.out.println("(4/6)addMember Processing...");
			
			psmt = conn.prepareStatement(sql1);
			System.out.println("(5/6)addMember Processing...");
			
			psmt.setString(1, dto.getId());
			
			psmt.executeUpdate();
			System.out.println("(6/6)addMember Processing...");
		}catch (Exception e) {
		   	e.printStackTrace();	// 쿼리문이 틀렸다고 에러가 발생하는 곳
	    } finally {
		   	DBClose.close(psmt, conn, null);
		   	System.out.println("(7/6)addMember Processing...");
		}
	}
	public boolean Login(String id, String password) {
		String sql = " SELECT 1 FROM DMEMBER WHERE ID = ? AND PASSWORD = ? ";
		
		boolean b = false;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setString(2, password);
			rs = psmt.executeQuery();
		
			if(rs.next()) b= true;
			
		}catch (Exception e) {
		   	e.printStackTrace();	// 쿼리문이 틀렸다고 에러가 발생하는 곳
	    } finally {
		   	DBClose.close(psmt, conn, rs);
		}
		
		return b;
	}
}
