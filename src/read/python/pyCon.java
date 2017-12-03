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

/**
 * Servlet implementation class pyCon
 */
@WebServlet("/pyCon")
public class pyCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String python35 = "D:/Anaconda/Ananconda3/python.exe";
		int i = 0;
		ArrayList<String> pyArr = new ArrayList<String>();
		try {
			Runtime r = Runtime.getRuntime();
			
			Process p = r.exec("cmd /c "+python35+" D:/travle.py"); //cmd를 이용해 파이썬의 경로를 입력해 파이썬을 실행시키고 실행시킨 파이썬을 이용해 파이썬 파일안의 코드를 실행

			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));
			
			
			System.out.println(".........start   process.........");
			String line = "";
			//System.out.println(bfr.readLine());
			while ((line = bfr.readLine()) != null) {
				pyArr.add(line);
				//System.out.println("Python Output: " + line);
				//System.out.println(pyArr.get(i));
				String str = pyArr.get(i);
				str=str.replace("[", "");
				str = str.replace("(", "");
				str = str.replace("]", "");
				str = str.replace("'", "");
				str = str.replace("'", "");
				
				System.out.println(str);
				String[] result = str.split("\\)");
				for (int j = 0; j < result.length; j++) {
					String rate ="";
					String tourName="";
					String lati ="";//위도
					String longti ="";//경도
					
					
					if(j>0) {
						String recom = result[j].replaceFirst(", ","");
						String[] recomList = recom.split(", ");
						rate = recomList[0];
						tourName = recomList[1];
						lati = recomList[2];
						longti = recomList[3];
						
						
						
					}else {
						String[] recomList = result[j].split(", ");
						rate = recomList[0];
						tourName = recomList[1];
						lati = recomList[2];
						longti = recomList[3];
						
						
					}
					
					System.out.println(rate +" "+tourName +" "+ lati +" "+longti );
					
					
				}
				
			}
			System.out.println("........end   process.......");

		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
