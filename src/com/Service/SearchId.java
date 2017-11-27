package com.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;
import com.DAO.memberVO;

/**
 * Servlet implementation class SearchId
 */
@WebServlet("/SearchId")
public class SearchId extends HttpServlet {

   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println("id�� : "+id);
		memberDAO dao = memberDAO.getInstance();
		try {
			memberVO vo = dao.idselect(id);
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			if (vo != null) {
				out.print("id�� �����մϴ�.");
			}else {
				
				out.print("��� ������ ID�Դϴ�.");
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
