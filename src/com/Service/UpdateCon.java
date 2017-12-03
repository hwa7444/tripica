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
import com.DAO.memberVO;


@WebServlet("/UpdateCon")
public class UpdateCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		//response.setCharacterEncoding("text/html; charset=euc-kr");
		HttpSession session = request.getSession();
		memberVO vo = (memberVO) session.getAttribute("vo1");
		String id = vo.getId();
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String ph = request.getParameter("phone");
		String birth = request.getParameter("birth");
		System.out.println("id"+id);
		System.out.println(pw);
		System.out.println(nick);
		System.out.println(ph);
		System.out.println(birth);

		try {
			memberDAO dao = memberDAO.getInstance();
			PrintWriter out = response.getWriter();
			int cnt = dao.update(pw, nick, ph, birth,id);

			if (cnt >= 1) {
				response.sendRedirect("Main.jsp");
			} else {
				response.setContentType("text/html;charset=euc-kr");
				out.println("다시 입력하세요");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
