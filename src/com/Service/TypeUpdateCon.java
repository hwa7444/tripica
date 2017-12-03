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


@WebServlet("/TypeUpdateCon")
public class TypeUpdateCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String type1 = request.getParameter("type1");
		String type2 = request.getParameter("type2");
		

		try {
			memberDAO dao = memberDAO.getInstance();
			PrintWriter out = response.getWriter();
			dao.typeUpdate(type1, type2, id);

			

		} catch (Exception e) {

		}
	}

}
