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

	public int Join(String id, String pw, String nick, int gender, String ph, String birth) throws Exception {// 회원가입메소드

		// throws와 try/catch 차이
		getConn();

		// DBMS에 id의 pw를 인증을 받고 DB를 핸들링 할 수 있는 Connection 객체를 생성
		// insert into fileboard values(1,'a','b','c',to_char(sysdate, 'YYYY-MM-DD'))
		pst = conn.prepareStatement("insert into member values(member_num.nextval,?,?,?,?,?,?,?,?)");
		
		pst.setString(1, id);
		pst.setString(2, pw);
		pst.setString(3, nick);
		pst.setInt(4, gender);
		pst.setString(5, ph);
		pst.setString(6, birth);
		
		// 값이 필요한지? 삽입시 에러뜸 회원가입창 수정필요? //
		pst.setString(7, "zz");
		pst.setString(8, "bb");
		//////////////////////
		
		
		cnt = pst.executeUpdate();
		
		close();
		return cnt;
	}

	public memberVO login(String id, String pw) throws Exception { // 로그인 메소드
		getConn();
		// DBMS에 id의 pw를 인증을 받고 DB를 핸들링 할 수 있는 Connection 객체를 생성
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

	public int update(String pw, String nick, String ph, String birth, String id) {// 회원정보 수정 메소드
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

	public String nickselect(String id) throws Exception { // 닉네임 세션에 저장하기 위해 값 가져오는 메소드
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
