package com.Service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.DAO.memberVO;
import com.DAO.mymapDAO;
import com.DAO.mymapVO;

@WebServlet("/mymap")
public class mymap extends HttpServlet {
	static ArrayList<mymapVO> arr = new ArrayList<>();

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		memberVO vo = (memberVO) session.getAttribute("vo1");
		int uid = 0;
		String nic = null;
		if (vo == null) {
			System.out.println("vo값 널로 들어왔음");
			String re = "nologin";
			response.getWriter().print(re);
		} else {
			uid = vo.getUserid();
			nic = vo.getNick();
			System.out.println(uid + " " + nic + " < ----  mymap 유저정보");
		}
		
		String pok = request.getParameter("pok");
		String pname = request.getParameter("pname");
		String pcon = request.getParameter("pcon");
		String plat = request.getParameter("plat");
		String plng = request.getParameter("plng");
		String pgroup = request.getParameter("pgroup");

		if (pok.equals("f")) {

			arr.add(new mymapVO(pname, pcon, plat, plng, pgroup, uid)); // USER ID값이 들어가야한다.

		} else if (pok.equals("t")) {

			mymapDAO dao = new mymapDAO();

			if (dao.insertMymapList22(pgroup, nic, uid, arr)) { // 유저정보가져와야한다
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
