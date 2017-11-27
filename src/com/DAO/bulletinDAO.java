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

		// 1.JDBC ���ε�
		InputStream in = (this.getClass().getResourceAsStream("../../../../db.properties"));
		// ���� �۾��ϰ� �ִ� �ڹ������� Ŭ���������� �������� db.properties�� �о���ڴ�.
		/*
		 * Properties p = new Properties(); p.load(in);
		 * 
		 * String url = p.getProperty("dburl"); String dbid = p.getProperty("dbid");
		 * String dbpw = p.getProperty("dbpw"); Class.forName(p.getProperty("dbclass"));
		 */
		// �����ε�

		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String dbid = "system";
		String dbpw = "123";
		String dbclass = "oracle.jdbc.driver.OracleDriver";

		Class.forName(dbclass);
		conn = DriverManager.getConnection(url, dbid, dbpw);
		System.out.println("DB����Ϸ�");

	}// ������

	public void close() throws Exception {
		if (rs != null)
			rs.close(); // rs, pst, conn .close���� ó�� ����� ��
		if (pst != null)
			pst.close();
		if (conn != null)
			conn.close();
	}// ������

	public int uploadFile(String title, String nick, String fileName, String content, int checkD) throws Exception {

		getConn();
		System.out.println("DAO ����");

		// sql�ۼ�
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
	//�Խ��� ������ �ѱ��
	public int getNext() {
		String sql="SELECT num FROM bulletin ORDER BY num DESC";
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			System.out.println("���⼭ ���� ����� ������! ��Ÿ!!");	
			rs = psmt.executeQuery();
			System.out.println("������??");
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;//ù ��° �Խù��� ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//�����ͺ��̽� ����
	}

	public ArrayList<bulletinVO> selectAll() throws Exception { //�Խù� �ҷ����̱�
		getConn();

		ArrayList<bulletinVO> tmpList = new ArrayList<bulletinVO>();

		// ��� �˻� sql �ۼ�
		pst = conn.prepareStatement("select * from bulletin order by num desc limit 10");

		rs = pst.executeQuery();

		while (rs.next()) {
			System.out.println(rs.getString(2));
			tmpList.add(new bulletinVO(rs.getInt(1), // ��ȣ
					rs.getString(2), rs.getString(3), // ���� �ۼ���
					rs.getString(4), rs.getString(5), // ���ϸ� �ۼ�����
					rs.getString(6), rs.getInt(7))); // �����
		}
		close();

		return tmpList;
	}
	public boolean nextPage(int pageNumber) { //���� ������ �ҷ�����
		String sql="SELECT * FROM bulletin WHERE num < ?";
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, getNext() - (pageNumber -1)*10);
			rs = psmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public bulletinVO selectOne(int num) throws Exception {
		getConn();

		// num�� �̿��Ͽ� db���� �ϳ��� file�� ���� ������ �˻�
		pst = conn.prepareStatement("select * from bulletin where num = ?");
		pst.setInt(1, num);

		rs = pst.executeQuery();

		bulletinVO vo = null;
		if (rs.next()) {
			vo = new bulletinVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), // ���ϸ� �ۼ�����
					rs.getString(6), rs.getInt(7));
		}

		close();

		return vo;

	}

	public boolean delete(int num) throws Exception {
		
		getConn();

		// num�� �̿��Ͽ� db���� �ϳ��� file�� ���� ������ �˻�
		pst = conn.prepareStatement("delete from bulletin where num = ?");
		pst.setInt(1, num);

		rs = pst.executeQuery();
		
		if(rs.next()) {
			return true; // ���� ����
		}
		close();
		
		return false; // ���� ����
		
	}
}
