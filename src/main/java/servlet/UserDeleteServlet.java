package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import model.UserAuthLogic;

@WebServlet("/UserDeleteServlet")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forwardPath = null;
		String action=request.getParameter("id");
		
		HttpSession session = request.getSession();
		
		if(action != null) {
			//保存されたユーザー情報を取得
			User login= (User) session.getAttribute("user");
			//セッションスコープに保存
			HttpSession session2 = request.getSession();
			session2.setAttribute("login", login);
			forwardPath = "/WEB-INF/jsp/ADeleteConfirm.jsp";

		} else {
			int id = Integer.parseInt(request.getParameter("action"));

			if(id == 0) {
				forwardPath="/WEB-INF/jsp/UserInfo.jsp";

			} else {
				UserAuthLogic deleteLogic = new UserAuthLogic();
				boolean result = deleteLogic.DeleteUser(id);

				if(result == true) {
					forwardPath="/WEB-INF/jsp/ADeleteOK.jsp";
					session.invalidate();

				} else if(result == false) {
					forwardPath="/WEB-INF/jsp/DeleteFalse.jsp";
				}
			}
		}

		RequestDispatcher dispatcher=request.getRequestDispatcher(forwardPath);
		dispatcher.forward(request,response);
	}
}
