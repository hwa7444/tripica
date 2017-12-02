package com.Service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.mymapDAO;
import com.DAO.mymapVO;

@WebServlet("/mymap")
public class mymap extends HttpServlet {
	static ArrayList<mymapVO> arr = new ArrayList<>();

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String pok = request.getParameter("pok");
		String pname = request.getParameter("pname");
		;
		String pcon = request.getParameter("pcon");
		;
		String plat = request.getParameter("plat");
		;
		String plng = request.getParameter("plng");
		;
		String pgroup = request.getParameter("pgroup");

		if (pok.equals("f")) {

			arr.add(new mymapVO(pname, pcon, plat, plng, pgroup, 1)); // USER ID값이 들어가야한다.

		} else if (pok.equals("t")) {

			mymapDAO dao = new mymapDAO();

			if (dao.insertMymapList22(pgroup, "nick", 1, arr)) { // 유저정보가져와야한다
				System.out.println("db 삽입 완료 (나만의여행지도)");
				arr.clear();
				String re = "reload";
				response.getWriter().print(re);
			} else {
				System.out.println("db 삽입 에러 (나만의여행지도)");
			}

		}

	}

}
