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

@WebServlet("/SelectBest")
public class SelectBest extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		
		int num = Integer.parseInt(request.getParameter("num"));
		int checkD = Integer.parseInt(request.getParameter("checkD"))+1;
		
		bulletinDAO dao = bulletinDAO.getInstance();
		
		try {
			boolean updateD = dao.updateCheckD(num, checkD); // 추천수 증가하면 true, 아니면 false
			bulletinVO vo = dao.selectOne(num);
			if(updateD) {
				request.setAttribute("vo", vo);
				request.setAttribute("num", num);
				RequestDispatcher dis = request.getRequestDispatcher("view.jsp");
				dis.forward(request, response);
			}else {
				System.out.println("추천실패");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
