package com.Service;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.DAO.bulletinDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/WriteCon")
public class WriteCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * - ���Ͼ��ε� �ʿ��� ���� 1)���۹�� post 2)enctype "multipart/form-data" - MultipartRequest
		 * : ���� ���ε� �� ��û�� ������ ������ �ִ� ��ü 1) ��ü ������, request��ü, ���ϰ��, ����ũ��, ���ڵ�, �̸��ߺ�������ü��
		 * �Ѱ�����Ѵ�. -ServletContext: �� ���ø����̼ǿ� ���� ������ ������ �ִ� ��ü 1)getRealPath(): ������
		 * �����ο� ���� ������ ��ȯ
		 */
		// �������� Form������ üũ
		
		/*request.setCharacterEncoding("UTF-8");*/
		boolean isMulti = ServletFileUpload.isMultipartContent(request);
		MultipartRequest multi = null;

		// ServletContext: �� ���ø����̼ǿ� ���� ������ ������ �ִ� ��ü
		ServletContext context = getServletContext();
		String saveDir = context.getRealPath("upload");
		
		int maxSize = 10 * 1024 * 1024; // 3MB
		String encoding = "utf-8";
		System.out.println("������ >>" + saveDir);
		
		if(isMulti) {
			multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
			bulletinDAO dao = bulletinDAO.getInstance();
			
			String title = multi.getParameter("title"); //����
			
			String nick= null; // �г���
			HttpSession session = request.getSession();
			
			if (session.getAttribute("nick") != null) {
				nick = (String) session.getAttribute("nick");
			}		

			String fileName = multi.getFilesystemName("fileName"); //���� �̸�
			String content = multi.getParameter("content"); //content
			int checkD = 1; //�� ���� ����
			
			
			try {
				int cnt = dao.uploadFile(title, nick, fileName, content, checkD);
				String moveUrl = "";
				
				if(cnt > 0) {
					System.out.println("����Ϸ�");
					moveUrl = "SelectService?start=0&end=8";
				}else {
					System.out.println("�������");
					moveUrl = "bulletin.jsp";
				}
				response.sendRedirect(moveUrl);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			System.out.println("�Ϲ�����Form�Դϴ�.");
		}

	}

}
