package com.DAO;

import java.io.IOException;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public class mymapDAO {
	private static Connection conn;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;
	private ResultSet rs;

	private void getConnection() throws ClassNotFoundException, SQLException, IOException {
		// 1.JDBC 업로드
		InputStream in = (this.getClass().getResourceAsStream("../../../../db.properties"));
		// 현재 작업하고 있는 자바파일의 클래스파일을 기준으로 db.properties를 읽어오겠다.

		Properties p = new Properties();
		p.load(in);

		String url = p.getProperty("dburl");
		String dbid = p.getProperty("dbid");
		String dbpw = p.getProperty("dbpw");
		Class.forName(p.getProperty("dbclass"));

		// 동적로딩

		conn = DriverManager.getConnection(url, dbid, dbpw);
		System.out.println("DB연결완료");
	}

	public mymapVO getMap(String id) {
		mymapVO dto = null;
		try {
			getConnection();

			String sql = "SELECT * FROM member WHERE id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			ResultSet r = pstmt.executeQuery();

			if (r.next()) {
				String nid = r.getString("id");
				String pw = r.getString("pw");
				String nick = r.getString("nickname");
				dto = new mymapVO();
			} else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("예외발생:getMember()=> " + e.getMessage());
		} finally {
			dbClose();
		}

		return dto;
	}

	public boolean insertMap(String pname, String pgroup) {

		boolean result = false;
		try {
			getConnection();

			String sql = "INSERT INTO member VALUES (?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, pname);
			pstmt.setString(2, pgroup);

			int r = pstmt.executeUpdate();

			if (r > 0)
				result = true;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("예외발생:insertMember()=> " + e.getMessage());
		} finally {
			dbClose();
		}
		return result;
	}

	public void dbClose() {

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println("예외:ResultSet객체 close():" + e.getMessage());
			}
		}

		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				System.out.println("예외:PreparedStatement객체 close():" + e.getMessage());
			}
		}

		if (cstmt != null) {
			try {
				cstmt.close();
			} catch (SQLException e) {
				System.out.println("예외:CallableStatement객체 close():" + e.getMessage());
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("예외:Connection객체 close():" + e.getMessage());
			}
		}

		conn = null;
	}// dbClose()---------

	public boolean insertMymapList(String pgroup,String nick,int userid) {
		boolean result = false;
		
		try {
			getConnection();

			String sql = "INSERT INTO mymap VALUES (mymap_n.nextval,?,?,?,sysdate,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pgroup);
			pstmt.setString(2, nick);
			pstmt.setInt(3, 0);
			pstmt.setInt(4, userid);
			
			int r = pstmt.executeUpdate();

			if (r > 0) {
				result = true;
			}
				
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("예외발생:insertMember()=> " + e.getMessage());
		} finally {
			dbClose();
		}
		return result;
	}

	public boolean insertMap3(ArrayList<mymapVO> myarr) {
		boolean result = false;
		try {
				
			String sql = "INSERT INTO mymap_p VALUES (?,?,?,?,?,?,mymap_n.CURRVAL)";
			pstmt = conn.prepareStatement(sql);
			int r = 0;
			
			for (int j = 0; j < myarr.size(); j++) {
				pstmt.setString(1, myarr.get(j).getPname());
				pstmt.setString(2, myarr.get(j).getPcontent());
				pstmt.setString(3, myarr.get(j).getPlat());
				pstmt.setString(4, myarr.get(j).getPlng());
				pstmt.setString(5, myarr.get(j).getPgroup());
				pstmt.setInt(6, myarr.get(j).getUserid());
				r = pstmt.executeUpdate();
			}
			if (r > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("예외발생:insertMember()=> " + e.getMessage());
		} finally {
			dbClose();
		}
		return result;
	}

	public boolean insertMymapList22(String pgroup, String nick, int userid, ArrayList<mymapVO> arr)  {
		boolean result = false;
		
		try {
			getConnection();

			String sql = "INSERT INTO mymap VALUES (mymap_n.nextval,?,?,?,sysdate,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pgroup);
			pstmt.setString(2, nick);
			pstmt.setInt(3, 0);
			pstmt.setInt(4, userid);
			
			int r = pstmt.executeUpdate();

			if (r > 0) {
				result = insertMap3(arr);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("예외발생:insertMember()=> " + e.getMessage());
		} finally {
			dbClose();
		}
		return result;
	}

}
