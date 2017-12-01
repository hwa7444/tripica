package com.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

public class tourDAO {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private int cnt;

	private static tourDAO instance = new tourDAO();

	public static tourDAO getInstance() {
		return instance;
	}

	public void getConn() throws Exception {

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
	}// 연결기능

	public void close() throws Exception {
		if (rs != null)
			rs.close(); // rs, pst, conn .close예외 처리 해줘야 함
		if (pst != null)
			pst.close();
		if (conn != null)
			conn.close();
	}
	public tourVO tourselect(String name) throws Exception { // 해당아이디 정보 불러오는 메소드
		getConn();

		pst = conn.prepareStatement("select * from tour_list where tour_name=?");
		pst.setString(1, name);

		tourVO vo = null;
		
		String type = null;
		int num = 0;
		String comment= null;
		String img= null;
		rs = pst.executeQuery();
		
		if (rs.next()) {
			num = rs.getInt(1);
			type = rs.getString(3);
			comment= rs.getString(5);
			img= rs.getString(6);

			vo = new tourVO(num,name,type,comment,img);

		}
		return vo;
	}
	
}
