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


@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("�α��μ���");
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("text/html; charset=euc-kr");
		memberDAO dao = memberDAO.getInstance();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		memberVO vo = null;
		System.out.println(id+pw);
		
		try {
			vo = dao.login(id,pw);
			if (vo != null) {
				HttpSession session = request.getSession();
				session.setAttribute("vo1", vo);
				response.sendRedirect("Main.jsp");
			}else {
				response.setContentType("text/html;charset=euc-kr");
				PrintWriter out = response.getWriter();
				/*out.println("��й�ȣ�� ���̵� �ٽ� Ȯ���ϼ���");*/
				out.print("<script>alert('��й�ȣ�� ���̵� �ٽ� Ȯ���ϼ���'); history.back();</script>");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}

