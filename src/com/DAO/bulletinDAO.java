package com.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

public class bulletinDAO {

	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pst;
	private int cnt;

	private static bulletinDAO instance = new bulletinDAO();

	public static bulletinDAO getInstance() {
		return instance;
	}

	public void getConn() throws Exception {

		// 1.JDBC 업로드
		InputStream in = (this.getClass().getResourceAsStream("../../../../db.properties"));
		// 현재 작업하고 있는 자바파일의 클래스파일을 기준으로 db.properties를 읽어오겠다.
		/*
		 * Properties p = new Properties(); p.load(in);
		 * 
		 * String url = p.getProperty("dburl"); String dbid = p.getProperty("dbid");
		 * String dbpw = p.getProperty("dbpw"); Class.forName(p.getProperty("dbclass"));
		 */
		// 동적로딩

		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String dbid = "system";
		String dbpw = "123";
		String dbclass = "oracle.jdbc.driver.OracleDriver";

		Class.forName(dbclass);
		conn = DriverManager.getConnection(url, dbid, dbpw);
		System.out.println("DB연결완료");

	}// 연결기능

	public void close() throws Exception {
		if (rs != null)
			rs.close(); // rs, pst, conn .close예외 처리 해줘야 함
		if (pst != null)
			pst.close();
		if (conn != null)
			conn.close();
	}// 종료기능

	public int uploadFile(String title, String nick, String fileName, String content, int checkD) throws Exception {

		getConn();
		System.out.println("DAO 동작");

		// sql작성
		pst = conn.prepareStatement("insert into bulletin values(num.nextval,?,?,?,?,to_char(sysdate,'YYYY-MM-DD'),?)");
		pst.setString(1, title);
		pst.setString(2, nick);
		pst.setString(3, fileName);
		pst.setString(4, content);
		pst.setInt(5, checkD);

		cnt = pst.executeUpdate();
		close();
		return cnt;
	}

	public ArrayList<bulletinVO> selectAll() throws Exception {
		getConn();

		ArrayList<bulletinVO> tmpList = new ArrayList<bulletinVO>();

		// 모든 검색 sql 작성
		pst = conn.prepareStatement("select * from bulletin order by num");

		rs = pst.executeQuery();

		while (rs.next()) {
			System.out.println(rs.getString(2));
			tmpList.add(new bulletinVO(rs.getInt(1), // 번호
					rs.getString(2), rs.getString(3), // 제목 작성자
					rs.getString(4), rs.getString(5), // 파일명 작성내용
					rs.getString(6), rs.getInt(7))); // 등록일
		}
		close();

		return tmpList;
	}

	public bulletinVO selectOne(int num) throws Exception {
		getConn();

		// num를 이용하여 db에서 하나의 file에 대한 정보를 검색
		pst = conn.prepareStatement("select * from fileboard where num = ?");
		pst.setInt(1, num);

		rs = pst.executeQuery();

		bulletinVO vo = null;
		if (rs.next()) {
			vo = new bulletinVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), // 파일명 작성내용
					rs.getString(6), rs.getInt(7));
		}

		close();

		return vo;

	}
}
