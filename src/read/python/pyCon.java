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
import com.DAO.mymapDAO;
import com.DAO.realVO;
import com.DAO.resultMapVO;

/**
 * Servlet implementation class pyCon
 */
@WebServlet("/pyCon")
public class pyCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String python35 = "C:/Users/pc-22/AppData/Local/Programs/Python/Python35/python.exe";

		int i = 0;
		ArrayList<String> pyArr = new ArrayList<String>();
		String id = (String) request.getAttribute("id");
		System.out.println(id);
		try {
			Runtime r = Runtime.getRuntime();

			Process p = r.exec("cmd /c " + python35 + " D:/jeju_recom.py " + id); // cmd�� �̿��� ���̽��� ��θ� �Է��� ���̽��� �����Ű��
																					// �����Ų ���̽��� �̿��� ���̽� ���Ͼ��� �ڵ带 ����

			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));

			System.out.println(".........start   process.........");
			String line = "";
			// System.out.println(bfr.readLine());

			ArrayList<resultMapVO> resultMap = new ArrayList<resultMapVO>();
			resultMapVO vo = null;

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

				for (int j = 0; j < result.length; j++) {
					String rate = "";
					String tourName = "";
					String lati = "";// ����
					String longti = "";// �浵

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

			}
			System.out.println("........end   process.......");
			
			mymapDAO dao = new mymapDAO();
			realVO rvo = null;
			ArrayList<realVO> alist = new ArrayList<>();
			
			System.out.println("#################################");
			for (int j = 0; j < resultMap.size(); j++) {
				String lat = resultMap.get(j).getPlat();
				String lng = resultMap.get(j).getPlong();
				rvo = dao.selectPlace(resultMap.get(j).getTour_name(),lat,lng);
				alist.add(rvo);
			}
			System.out.println("#################################");
			System.out.println("###########�����###############");
			for (int j = 0; j < alist.size(); j++) {
				System.out.println(alist.get(j).getPname() + " ####  " + alist.get(j).getPimg());
			}
			System.out.println("############�����###############");
			
			
			request.setAttribute("alist", alist);
			request.getRequestDispatcher("HotTour.jsp").forward(request, response);

			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
