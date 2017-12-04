package com.Service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.tourDAO;
import com.DAO.tourVO;


@WebServlet("/tourSelectCon")
public class tourSelectCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("euc-kr");
		String name =request.getParameter("name");
		tourDAO dao = tourDAO.getInstance();
		System.out.println(name);
		try {
			tourVO vo = dao.tourselect(name);
			if (vo != null) {
				
				request.setAttribute("vo", vo);
				
			}
			RequestDispatcher dis = request.getRequestDispatcher("HotTour.jsp");
			dis.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}

