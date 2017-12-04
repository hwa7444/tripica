package com.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.memberDAO;
import com.DAO.memberVO;


@WebServlet("/TypeUpdateCon")
public class TypeUpdateCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		memberVO vo1 = (memberVO) session.getAttribute("vo1");
		String id = vo1.getId();
		String type1 = request.getParameter("type1");
		String type2 = request.getParameter("type2");
		if(type1.contains("Learning")) {
			type1="L";
		}else if(type1.contains("Activity")) {
			type1="A";
		}else if(type1.contains("View")) {
			type1="V";
		}else if(type1.contains("Relaxation")) {
			type1="R";
		}
		
		
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
		System.out.println(id);
		System.out.println(type1);
		System.out.println(type2);
		
		
		try {
			memberDAO dao = memberDAO.getInstance();
			int cnt = dao.typeUpdate(type1, type2, id);
			
			if(cnt>0) {
				System.out.println("타입업데이트성공");
				request.setAttribute("id", id);
				request.getRequestDispatcher("pyCon").forward(request, response);
				
				
				
				
			}else {
				System.out.println("타입업데이트실패");
			}
			
		} catch (Exception e) {

		}
	}

}
