package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AdminControlLogic;
import model.TemporaryItem;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		TemporaryItem item = (TemporaryItem) session.getAttribute("iinfo");
		
		AdminControlLogic deleteLogic = new AdminControlLogic();
		boolean did = deleteLogic.DeleteItem(id);
		
		//フォワード先
		String forwardPath = null;
		
		if(did == true) {
			File f = new File(this.getClass()
					.getClassLoader()
					.getResource("")
					.getPath());
			
			String classPath = f.getAbsolutePath();
			String contextPath = classPath.substring(0, classPath.lastIndexOf("\\.metadata"));
			String path = contextPath+"\\NAOE\\src\\main\\webapp\\image";
			
			File file = new File(path+File.separator+item.getImage());
			
			file.delete();
			
		    forwardPath = "/WEB-INF/jsp/admin.jsp";
		    session.setAttribute("successDelete", "削除成功しました");
		      
		}else if(did == false) {
			forwardPath ="/WEB-INF/jsp/admin.jsp";
			session.setAttribute("erorrDelete", "削除失敗しました");
	    	// 削除失敗時の処理
		}
		
		response.sendRedirect(request.getContextPath() + "/AdminServlet");
				  
	}
}
