package com.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.DAO.bulletinDAO;
import com.DAO.memberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/WriteCon")
public class WriteCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * - 파일업로드 필요한 정보 1)전송방식 post 2)enctype "multipart/form-data" - MultipartRequest
		 * : 파일 업로드 시 요청한 정보를 가지고 있는 객체 1) 객체 생성시, request객체, 파일경로, 파일크기, 인코딩, 이름중복방지객체를
		 * 넘겨줘야한다. -ServletContext: 웹 어플리케이션에 대한 정보를 가지고 있는 객체 1)getRealPath(): 서버의
		 * 절대경로에 대한 정보를 반환
		 */
		// 파일전송 Form인지를 체크
		
		/*request.setCharacterEncoding("UTF-8");*/
		boolean isMulti = ServletFileUpload.isMultipartContent(request);
		
		String computerName = null;
      
		MultipartRequest multi = null;

		// ServletContext: 웹 어플리케이션에 대한 정보를 가지고 있는 객체
		ServletContext context = getServletContext();
		String saveDir = context.getRealPath("upload");
		
		int maxSize = 100 * 1024 * 1024; // 3MB
		String encoding = "euc-kr";
		System.out.println("절대경로 >>" + saveDir);
		
		if(isMulti) {
			multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
			bulletinDAO dao = bulletinDAO.getInstance();
			
			String title = multi.getParameter("title"); //제목
			
			memberVO vo1= null; // 닉네임
			String nick = "";
			HttpSession session = request.getSession();
			
			if (session.getAttribute("vo1") != null) {
				vo1 = (memberVO) session.getAttribute("vo1");
				nick = vo1.getNick();
			}		

			String fileName = multi.getFilesystemName("fileName"); //파일 이름
			String content = multi.getParameter("content"); //content
			int checkD = 0; //글 존재 여부
			
			
			try {
				int cnt = dao.uploadFile(title, nick, fileName, content, checkD);
				String moveUrl = "";
				
				if(cnt > 0) {
					System.out.println("저장완료");
					moveUrl = "SelectService?start=0&end=8";
				}else {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('저장 실패'); history.back();</script>");
					/*System.out.println("저장실패");
					moveUrl = "bulletin.jsp";*/
				}
				response.sendRedirect(moveUrl);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			System.out.println("일반전송Form입니다.");
		}

	}

}
