package com.Service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.bulletinDAO;
import com.DAO.bulletinVO;

@WebServlet("/SelectOne")
public class SelectOne extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// board.jsp���� Ŭ���� ���Ͽ� ���� ��ȣ�� �����´�.
				int num = Integer.parseInt(request.getParameter("num"));

				bulletinDAO dao = bulletinDAO.getInstance();
				
				try {
					bulletinVO vo = dao.selectOne(num);

					if (vo != null) {
						request.setAttribute("vo", vo);
					}
					RequestDispatcher dis = request.getRequestDispatcher("view.jsp");
					dis.forward(request, response);

				} catch (

				Exception e) {
					e.printStackTrace();
				}
	}

}