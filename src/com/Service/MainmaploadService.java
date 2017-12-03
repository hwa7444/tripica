package com.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MainmaploadService")
public class MainmaploadService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("메인맵로드서비스");
		ArrayList<HashMap<Object, Object>> listmap = new ArrayList<HashMap<Object, Object>>();
		HashMap<Object, Object> map;
		String[] name = { "카멜리아힐", "제주허브동산", "한라산국립공원", "성산일출봉", "섭지코지", "오설록", "천지연폭포", "만장굴", "주상절리", "아쿠아플라넷",
				"에코랜드" };
		String[] lat = { "33.288998", "33.329798", "33.361837", "33.458058", "33.423656", "33.305895", "33.247215",
				"33.528477", "33.237764", "33.432810", "33.447290" };
		String[] lng = { "126.370156", "126.814958", "126.529170", "126.942500", "126.930064", "126.289431",
				"126.554670", "126.771481", "126.425067", "126.927895", "126.667720" };

		for (int i = 0; i < name.length; i++) {
			map = new HashMap<Object, Object>();
			map.put("name", name[i]);
			map.put("lat", lat[i]);
			map.put("lng", lng[i]);
			listmap.add(map);
		}

		request.setAttribute("listmap", listmap);

		RequestDispatcher dis = request.getRequestDispatcher("Main.jsp");
		dis.forward(request, response);
		/*
		 * 데이터 예제 HashMap<Object, Object> map; map = new HashMap<Object, Object>();
		 * 
		 * map.put("name", "홍길동"); map.put("lat", "33.37137"); map.put("lng",
		 * "126.56695"); listmap.add(map); map = new HashMap<Object, Object>();
		 * map.put("name", "김길동"); map.put("lat", "33.37137"); map.put("lng",
		 * "126.56695"); listmap.add(map);
		 * 
		 * 
		 * 
		 * request.setAttribute("listmap", listmap);
		 * 
		 * RequestDispatcher dis = request.getRequestDispatcher("Main.jsp");
		 * dis.forward(request, response);
		 */
	}

}
