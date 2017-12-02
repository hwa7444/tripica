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
	}// 종료기능

	public int Join(String id, String pw, String nick, int gender, String ph, String birth) throws Exception {//회원가입메소드

		// throws와 try/catch 차이
		getConn();

		// DBMS에 id의 pw를 인증을 받고 DB를 핸들링 할 수 있는 Connection 객체를 생성
		// insert into fileboard values(1,'a','b','c',to_char(sysdate, 'YYYY-MM-DD'))
		pst = conn.prepareStatement("insert into member values(member_num.nextval,?,?,?,?,?,?)");
		pst.setString(1, id);
		pst.setString(2, pw);
		pst.setString(3, nick);
		pst.setInt(4, gender);
		pst.setString(5, ph);
		pst.setString(6, birth);
		cnt = pst.executeUpdate();
		close();
		return cnt;
	}

	public int login(String id, String pw) throws Exception { //로그인 메소드
		getConn();
		// DBMS에 id의 pw를 인증을 받고 DB를 핸들링 할 수 있는 Connection 객체를 생성

		pst = conn.prepareStatement("select * from member where mem_id = ? ");
		pst.setString(1, id);

		rs = pst.executeQuery();
		int cnt = 0;
		if (rs.next()) {
			String getpw = rs.getString("pw");
			String getnick = rs.getString("nick");

			if (pw.equals(getpw)) {

				cnt = 1;

			}
		} else {

			cnt = 2;

		}

		return cnt;
	}

	public memberVO idselect(String id) throws Exception { // 해당아이디 정보 불러오는 메소드
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

	public int update(String pw, String nick, String ph, String birth, String id) throws Exception {// 회원정보 수정 메소드
		getConn();

		pst = conn.prepareStatement("update member set pw=?,nick=?,phone=?,birthday=? where mem_id=?");
		pst.setString(1, pw);
		pst.setString(2, nick);
		pst.setString(3, ph);
		pst.setString(4, birth);
		pst.setString(5, id);

		int cnt = pst.executeUpdate();
		return cnt;
	}

	public String nickselect(String id) throws Exception { //닉네임 세션에 저장하기 위해 값 가져오는 메소드
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

}
