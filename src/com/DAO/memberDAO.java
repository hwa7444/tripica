package com.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

public class memberDAO {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private int cnt;

	private static memberDAO instance = new memberDAO();

	public static memberDAO getInstance() {
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
	}// ������

	public int Join(String id, String pw, String nick, int gender, String ph, String birth) throws Exception {// ȸ�����Ը޼ҵ�

		// throws�� try/catch ����
		getConn();

		// DBMS�� id�� pw�� ������ �ް� DB�� �ڵ鸵 �� �� �ִ� Connection ��ü�� ����
		// insert into fileboard values(1,'a','b','c',to_char(sysdate, 'YYYY-MM-DD'))
		pst = conn.prepareStatement("insert into member values(member_num.nextval,?,?,?,?,?,?,?,?)");
		
		pst.setString(1, id);
		pst.setString(2, pw);
		pst.setString(3, nick);
		pst.setInt(4, gender);
		pst.setString(5, ph);
		pst.setString(6, birth);
		
		// ���� �ʿ�����? ���Խ� ������ ȸ������â �����ʿ�? //
		pst.setString(7, "zz");
		pst.setString(8, "bb");
		//////////////////////
		
		
		cnt = pst.executeUpdate();
		
		close();
		return cnt;
	}

	public memberVO login(String id, String pw) throws Exception { // �α��� �޼ҵ�
		getConn();
		// DBMS�� id�� pw�� ������ �ް� DB�� �ڵ鸵 �� �� �ִ� Connection ��ü�� ����
		memberVO vo = null;
		pst = conn.prepareStatement("select * from member where mem_id = ? ");
		pst.setString(1, id);

		rs = pst.executeQuery();
		

		String getpw = null;

		if (rs.next()) {
			getpw = rs.getString("pw");
			if (pw.equals(getpw)) {
				
				vo = new memberVO(rs.getInt("userid"), rs.getString("mem_id"), rs.getString("pw"), rs.getString("nick"),
						rs.getInt("gender"), rs.getString("phone"), rs.getString("birthday"));

			}

		} else {

			vo = null;

		}

		return vo;
	}

	public memberVO idselect(String id) throws Exception { // �ش���̵� ���� �ҷ����� �޼ҵ�
		getConn();

		pst = conn.prepareStatement("select * from member where mem_id=?");
		pst.setString(1, id);

		memberVO vo = null;

		rs = pst.executeQuery();
		if (rs.next()) {
			id = rs.getString(1);

			vo = new memberVO(id);

		}
		return vo;
	}

	public int update(String pw, String nick, String ph, String birth, String id) {// ȸ������ ���� �޼ҵ�
		int cnt = -1;
		try {
			getConn();
			pst = conn.prepareStatement("update member set pw=?,nick=?,phone=?,birthday=? where mem_id=?");
			pst.setString(1, pw);
			pst.setString(2, nick);
			pst.setString(3, ph);
			pst.setString(4, birth);
			pst.setString(5, id);

			cnt = pst.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
		}

		
		return cnt;
	}

	public String nickselect(String id) throws Exception { // �г��� ���ǿ� �����ϱ� ���� �� �������� �޼ҵ�
		getConn();
		pst = conn.prepareStatement("select * from member where mem_id=?");
		pst.setString(1, id);
		rs = pst.executeQuery();
		String nick = null;
		if (rs.next()) {
			nick = rs.getString("nick");
		}
		return nick;
	}

	public int typeUpdate(String type1, String type2, String id) throws Exception {
		getConn();
		pst = conn.prepareStatement("update member set t_type1=?,t_type2=? where mem_id=?");
		pst.setString(1, type1);
		pst.setString(2, type2);
		pst.setString(3, id);
		
		
		int cnt = pst.executeUpdate();
		
		return cnt;

	}

}
