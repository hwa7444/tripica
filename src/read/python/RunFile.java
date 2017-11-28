package read.python;

import java.io.*;
import java.util.*;

public class RunFile {
	public static void main(String args[]) throws IOException {

		try {
			Runtime r = Runtime.getRuntime();
			Process p = r.exec("cmd /c C:\\Python32\\python.exe C:\\Users//home//db.ipnyb"); //cmd를 이용해 파이썬의 경로를 입력해 파이썬을 실행시키고 실행시킨 파이썬을 이용해 파이썬 파일안의 코드를 실행

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