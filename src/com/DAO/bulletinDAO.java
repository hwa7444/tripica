package com.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

		Properties p = new Properties();
		p.load(in);

		String url = p.getProperty("dburl");
		String dbid = p.getProperty("dbid");
		String dbpw = p.getProperty("dbpw");
		Class.forName(p.getProperty("dbclass"));

		// �����ε�

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
		pst = conn.prepareStatement("insert into bulletin values(b_num.nextval,?,?,?,?,to_char(sysdate,'YYYY-MM-DD'),?)");
		System.out.println("DAO ���� upload����");
		pst.setString(1, title);
		System.out.println("DAO ���� upload�����̸�");
		pst.setString(2, nick);
		System.out.println("DAO ���� upload���۾��̵�");
		pst.setString(3, fileName);
		System.out.println("DAO ���� upload��������");
		pst.setString(4, content);
		System.out.println("DAO ���� upload����");
		pst.setInt(5, checkD);
		System.out.println("DAO ���� uploadüũ");

		cnt = pst.executeUpdate();
		close();
		return cnt;
	}

	// �Խ��� ������ �ѱ��
	

	public ArrayList<bulletinVO> selectAll2(int start, int end) throws Exception { // �Խù� �ҷ����̱�
		getConn();

		ArrayList<bulletinVO> tmpList = new ArrayList<bulletinVO>();

		System.out.println("select�۵�");

		// ��� �˻� sql �ۼ�
		pst = conn.prepareStatement(
				"select * from (select * from bulletin order by bulletin_num desc) where rownum between ? and ?");
		pst.setInt(1, start);
		pst.setInt(2, end);

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

	public ArrayList<bulletinVO> selectAll() throws Exception { // �Խù� �ҷ����̱�
		getConn();

		ArrayList<bulletinVO> tmpList = new ArrayList<bulletinVO>();

		System.out.println("select�۵�");

		// ��� �˻� sql �ۼ�
		pst = conn.prepareStatement("select * from bulletin order by bulletin_num desc");

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
	
	public bulletinVO selectOne(int num) throws Exception {
		getConn();

		// num�� �̿��Ͽ� db���� �ϳ��� file�� ���� ������ �˻�
		pst = conn.prepareStatement("select * from bulletin where bulletin_num = ?");
		pst.setInt(1, num);

		rs = pst.executeQuery();

		bulletinVO vo = null;
		if (rs.next()) {
			vo = new bulletinVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), // ���ϸ�
																													// �ۼ�����
					rs.getString(6), rs.getInt(7));
		}

		close();

		return vo;

	}
	
	public int countRows() throws Exception {
		
		getConn();
		
		pst = conn.prepareStatement("select count(*) as cnt from bulletin");
		
		rs = pst.executeQuery();
	
		int count = 0;
		if(rs.next()) {
			count = rs.getInt("cnt");
		}	
		
		
		return count;
	}

	public boolean delete(int num) throws Exception {

		getConn();

		// num�� �̿��Ͽ� db���� �ϳ��� file�� ���� ������ �˻�
		pst = conn.prepareStatement("delete from bulletin where bulletin_num = ?");
		pst.setInt(1, num);

		rs = pst.executeQuery();

		if (rs.next()) {
			return true; // ���� ����
		}
		close();

		return false; // ���� ����

	}

	public boolean updateCheckD(int num, int checkD) throws Exception {
		
		getConn();
		
		pst = conn.prepareStatement("update bulletin set checkD = ? where bulletin_num = ?");
		pst.setInt(1, checkD);
		pst.setInt(2, num);
		
		rs = pst.executeQuery();
		
		if(rs.next()) {
			return true; //������Ʈ ����
		}
		close();
		
		return false; //������Ʈ ����
	}
}
