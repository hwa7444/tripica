package com.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.memberDAO;


@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("text/html; charset=euc-kr");
		memberDAO dao = memberDAO.getInstance();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println(id+pw);
		
		try {
			int cnt = dao.login(id, pw);
			if (cnt == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				
				response.sendRedirect("Main.jsp");
			}else {
				response.setContentType("text/html;charset=euc-kr");
				PrintWriter out = response.getWriter();
				out.println("비밀번호나 아이디를 다시 확인하세요");
				
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}

}
