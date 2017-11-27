package com.Service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.bulletinDAO;
import com.DAO.bulletinVO;

@WebServlet("/SelectService")
public class SelectService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			ArrayList<bulletinVO> list = (ArrayList<bulletinVO>)request.getAttribute("list");
				
			if(list!=null) {
				request.setAttribute("list", list);
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("bulletin.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {			
			e.printStackTrace();
		}
	}

}
