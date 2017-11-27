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
		//DB�� ����� file������ ��� �˻��ؼ� jsp�� ����
		bulletinDAO dao = new bulletinDAO();
		try {
			ArrayList<bulletinVO> list;
			list = dao.selectAll();
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
