package com.Service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.mymapDAO;

@WebServlet("/MapBest")
public class MapBest extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		
		int num = Integer.parseInt(request.getParameter("num"));
		int recom = Integer.parseInt(request.getParameter("recom"))+1;
		
		mymapDAO dao = new mymapDAO();
		try {
			boolean upRecom = dao.updateRecom(num, recom);
			if(upRecom) {
				response.sendRedirect("Map.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
