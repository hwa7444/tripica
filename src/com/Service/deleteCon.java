package com.Service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.bulletinDAO;


@WebServlet("/deleteCon")
public class deleteCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));

		bulletinDAO dao = bulletinDAO.getInstance();

		try {
			boolean isSuccess = dao.delete(num);

			if (isSuccess) {
				response.sendRedirect("SelectService?start=0&end=8");
			}else {
				// ���� ���� ���� ��, ���� �˸� ����
				System.out.println("��������");
			}
			

		} catch (

		Exception e) {
			e.printStackTrace();
		}
	}

}
