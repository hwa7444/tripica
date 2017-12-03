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
		type1=type1.replace("http://localhost:8082/tripica/images/Activity/", "");
		type1=type1.replace(".jpg", "");
		
		
		type2=type2.replace("http://localhost:8082/tripica/images/Activity/", "");
		
		if(type2.contains("nat")) {
			type2="nat";
		}else if(type2.contains("spo")) {
			type2="spo";
		}else if(type2.contains("amu")) {
			type2="amu";
		}else if(type2.contains("his")) {
			type2="his";
		}else if(type2.contains("mus")) {
			type2="mus";
		}else if(type2.contains("art")) {
			type2="art";
		}else if(type2.contains("res")) {
			type2="res";
		}
		
		System.out.println(type1);
		System.out.println(type2);
		
		try {
			memberDAO dao = memberDAO.getInstance();
			PrintWriter out = response.getWriter();
			dao.typeUpdate(type1, type2, id);
			response.sendRedirect("HotTour.jsp");

			

		} catch (Exception e) {

		}
	}

}
