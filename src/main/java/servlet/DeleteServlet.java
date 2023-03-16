package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AdminControlLogic;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		
		AdminControlLogic deleteLogic = new AdminControlLogic();
		boolean did = deleteLogic.DeleteItem(id);
		
		//フォワード先
		String forwardPath=null;
		if(did == true) {
		      session.removeAttribute("id");
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
