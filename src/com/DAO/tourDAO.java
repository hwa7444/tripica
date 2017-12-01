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

		// 1.JDBC ���ε�
		InputStream in = (this.getClass().getResourceAsStream("../../../../db.properties"));
		// ���� �۾��ϰ� �ִ� �ڹ������� Ŭ���������� �������� db.properties�� �о���ڴ�.
		Properties p = new Properties();
		p.load(in);

		String url = p.getProperty("dburl");
		String dbid = p.getProperty("dbid");
		String dbpw = p.getProperty("dbpw");
		Class.forName(p.getProperty("dbclass"));
		// �����ε�

		conn = DriverManager.getConnection(url, dbid, dbpw);
	}// ������

	public void close() throws Exception {
		if (rs != null)
			rs.close(); // rs, pst, conn .close���� ó�� ����� ��
		if (pst != null)
			pst.close();
		if (conn != null)
			conn.close();
	}
	public tourVO tourselect(String name) throws Exception { // �ش���̵� ���� �ҷ����� �޼ҵ�
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
