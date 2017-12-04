package read.python;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.memberVO;
import com.DAO.resultMapVO;

/**
 * Servlet implementation class pyCon
 */
@WebServlet("/pyCon")
public class pyCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String python35 = "D:/Anaconda/Ananconda3/python.exe";
		int i = 0;
		ArrayList<String> pyArr = new ArrayList<String>();
		String id = (String) request.getAttribute("id");
		System.out.println(id);
		try {
			Runtime r = Runtime.getRuntime();

			Process p = r.exec("cmd /c " + python35 + " D:/jeju_recom.py " + id); // cmd를 이용해 파이썬의 경로를 입력해 파이썬을 실행시키고
																					// 실행시킨 파이썬을 이용해 파이썬 파일안의 코드를 실행

			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));

			System.out.println(".........start   process.........");
			String line = "";
			// System.out.println(bfr.readLine());
			while ((line = bfr.readLine()) != null) {
				pyArr.add(line);
				// System.out.println("Python Output: " + line);
				// System.out.println(pyArr.get(i));
				String str = pyArr.get(i);
				str = str.replace("[", "");
				str = str.replace("(", "");
				str = str.replace("]", "");
				str = str.replace("'", "");
				str = str.replace("'", "");

				System.out.println(str);
				String[] result = str.split("\\)");

				ArrayList<resultMapVO> resultMap = new ArrayList<resultMapVO>();
				resultMapVO vo = null;
				for (int j = 0; j < result.length; j++) {
					String rate = "";
					String tourName = "";
					String lati = "";// 위도
					String longti = "";// 경도

					if (j == 0) {
						String[] recomList1 = result[j].split(", ");
						rate = recomList1[0];
						tourName = recomList1[1];
						lati = recomList1[2];
						longti = recomList1[3];
						vo = new resultMapVO(tourName, rate, lati, longti);
						resultMap.add(vo);

					} else {
						String recom = result[j].replaceFirst(", ", "");
						String[] recomList2 = recom.split(", ");
						rate = recomList2[0];
						tourName = recomList2[1];
						lati = recomList2[2];
						longti = recomList2[3];
						vo = new resultMapVO(tourName, rate, lati, longti);
						resultMap.add(vo);

					}
					
				}
				System.out.println("사이즈:" + resultMap.size());
				request.setAttribute("resultMap", resultMap);
				request.getRequestDispatcher("HotTour.jsp").forward(request, response);
			}
			
			
			

			System.out.println("........end   process.......");

		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
