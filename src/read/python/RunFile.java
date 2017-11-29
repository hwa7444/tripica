package read.python;

import java.io.*;
import java.util.*;

public class RunFile {
	static String python35 = "C:\\Users\\home\\AppData\\Local\\Programs\\Python\\Python35\\python.exe";//파이썬 경로 지정해주면됨
	public static void main(String args[]) throws IOException {
		
		try {
			Runtime r = Runtime.getRuntime();
			Process p = r.exec(
					"cmd /c "+python35+" D://다운로드//db.py");//cmd창
					
			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));

			
			System.out.println(".........start   process.........");
			String line = "";
			while ((line = bfr.readLine()) != null) {
				System.out.println("Python Output: " + line);
			}
			System.out.println("........end   process.......");

		} catch (Exception e) {
			System.out.println(e);
		}
	}
}