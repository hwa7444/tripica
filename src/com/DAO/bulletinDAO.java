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
	//게시판 페이지 넘기기
	public int getNext() {
		String sql="SELECT num FROM bulletin ORDER BY num DESC";
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			System.out.println("여기서 나는 오루는 무조건! 오타!!");	
			rs = psmt.executeQuery();
			System.out.println("들어오니??");
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;//첫 번째 게시물일 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}

	public ArrayList<bulletinVO> selectAll() throws Exception { //게시물 불러들이기
		getConn();

		ArrayList<bulletinVO> tmpList = new ArrayList<bulletinVO>();

		// 모든 검색 sql 작성
		pst = conn.prepareStatement("select * from bulletin order by num desc limit 10");

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
	public boolean nextPage(int pageNumber) { //다음 페이지 불러오기
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

		// num를 이용하여 db에서 하나의 file에 대한 정보를 검색
		pst = conn.prepareStatement("select * from bulletin where num = ?");
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

	public boolean delete(int num) throws Exception {
		
		getConn();

		// num를 이용하여 db에서 하나의 file에 대한 정보를 검색
		pst = conn.prepareStatement("delete from bulletin where num = ?");
		pst.setInt(1, num);

		rs = pst.executeQuery();
		
		if(rs.next()) {
			return true; // 삭제 성공
		}
		close();
		
		return false; // 삭제 실패
		
	}
}
