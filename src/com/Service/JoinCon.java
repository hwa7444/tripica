package com.Service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;
import com.DAO.memberVO;

@WebServlet("/JoinCon")
public class JoinCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("text/html; charset=euc-kr");
		memberDAO dao = memberDAO.getInstance();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw"); 
		String nick = request.getParameter("nick");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String ph = request.getParameter("phone");
		String birth = request.getParameter("birth");
		
	
		try {
			int cnt = dao.Join(id, pw, nick, gender, ph, birth);
			
			if (cnt>0) {
				
				System.out.println("회원가입 성공");
				
			}else {
				System.out.println("회원가입 실패");
			}
			response.sendRedirect("Main.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
