package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.MenuDto;

public class ListDao {

	private static ListDao dao = new ListDao();
	
	private ListDao() {
		DBConnection.initConnection();
	}
	
	public static ListDao getInstance() {
		return dao;
	}
	
	public List<MenuDto> getMenuList(String id){
		String sql = " SELECT NAME,ORDERNUM,Seq  FROM DMENU WHERE ID = ? ORDER BY ORDERNUM ";
		
		List<MenuDto> mlist = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println("(1/6) getmenulist success.. ");
			
			psmt.setString(1, id);
			System.out.println("(2/6) getmenulist success.. ");
			
			rs = psmt.executeQuery();
			System.out.println("(3/6) getmenulist success.. ");
			
			while(rs.next()) {
				mlist.add(new MenuDto(rs.getString(1), rs.getInt(2),rs.getInt(3)));
			}
			System.out.println("(4/6) getmenulist success.. ");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return mlist;
	}
	public boolean addMenuOne(String id, String name) {
		String sql = " SELECT MAX(ORDERNUM) FROM DMENU WHERE ID = ? GROUP BY ID ";
		String sql1 = " INSERT INTO DMENU VALUES(SEQ_DMENU.nextval, ?, ?, ?) ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int count = 0;
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println("(1/9) menu add success ");
			
			psmt.setString(1, id);
			System.out.println("(2/9) menu add success ");
			
			rs = psmt.executeQuery();
			int num = -1;
			if(rs.next()) num = rs.getInt(1)+1;
			
			psmt.clearParameters();
			
			psmt = conn.prepareStatement(sql1);
			System.out.println("(3/9) menu add success ");
			psmt.setString(1, name);
			psmt.setInt(2,num);
			psmt.setString(3, id);
			System.out.println("(4/9) menu add success ");
			
			count = psmt.executeUpdate();
			System.out.println("(5/9) menu add success ");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return count>0?true:false;
	}
	public boolean chgOrdernum(int index, int count, String id, int seq) {
		String sql = "";
		int loc = index + count;
		if(count < 0) { // loc~index  loc<= ordernum < index
			sql = " UPDATE DMENU SET ORDERNUM = ORDERNUM + 1 WHERE ORDERNUM >= ? AND ORDERNUM < ? AND ID = ? ";
		}else { // index < ordernum <= loc
			sql = " UPDATE DMENU SET ORDERNUM = ORDERNUM - 1 WHERE ORDERNUM <= ? AND ORDERNUM > ? AND ID = ? ";
		}
		String sql1 = " UPDATE DMENU SET ORDERNUM = ? WHERE seq = ? AND ID = ? "; 
	
		Connection conn = null;
		PreparedStatement psmt = null;
		int c = 0;
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println("(1/9) chgordernum success ");
			
			psmt.setInt(1, loc);
			psmt.setInt(2, index);
			psmt.setString(3, id);
			System.out.println("(2/9) chgordernum success ");
			
			c = psmt.executeUpdate();
			System.out.println("(3/9) chgordernum success ");
			psmt.clearParameters();
			
			psmt = conn.prepareStatement(sql1);
			
			psmt.setInt(1, loc);
			psmt.setInt(2, seq);
			psmt.setString(3, id);
			System.out.println("(4/9) chgordernum success ");
			c = psmt.executeUpdate();
			System.out.println("(5/9) chgordernum success ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		return c>0?true:false;
	}
	public boolean delMenu(int seq){
		String sql = " DELETE FROM DMENU WHERE SEQ = ? ";
		String sql1 = " SELECT ORDERNUM FROM DMENU WHERE SEQ = ? ";
		String sql2 = " UPDATE DMENU SET ORDERNUM = ORDERNUM -1 WHERE ORDERNUM > ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int count = 0;
		int onum = 0;
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql1);
			System.out.println("(1/6) delMenu success.. ");
			
			psmt.setInt(1, seq);
			System.out.println("(2/6) delMenu success.. ");
			
			rs = psmt.executeQuery();
			System.out.println("(3/6) delMenu success.. ");
			if(rs.next()) onum = rs.getInt(1);
			
			psmt.clearParameters();
			
			psmt = conn.prepareStatement(sql2);
			psmt.setInt(1, onum);
			
			psmt.executeUpdate();
			System.out.println("(4/6) delMenu success.. ");
			psmt.clearParameters();
			
			psmt.clearParameters();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, seq);
			count = psmt.executeUpdate();
			System.out.println("(5/6) delMenu success.. ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return count>0?true:false;
	}
}
