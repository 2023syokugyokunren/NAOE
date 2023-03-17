package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Login;
import model.User;
import model.UserAuthLogic;
import model.UserInfoLogic;

@WebServlet("/AuthServlet")
public class AuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String pass = request.getParameter("pass");
		Login login = new Login(userId,pass);

		UserAuthLogic bo = new UserAuthLogic();
		User result = bo.LoginCheck(login);

		if(result != null) {
			HttpSession session = request.getSession();

			System.out.println(result.getPass());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/updateUser_i.jsp");
			dispatcher.forward(request, response);
		}else {
			//エラーメッセージをリクエストスコープに保存
			//request.setAttribute("errorMsg", "useridまたはパスワードが間違っています");
			HttpSession session2 = request.getSession();
			session2.setAttribute("errorMsg", "パスワードが間違っています");
			response.sendRedirect("/NAOE/UserInfoServlet?path=pass");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forwardPath=null;

		request.setCharacterEncoding("UTF-8");

		int id=Integer.parseInt(request.getParameter("id"));
		String user_Id=request.getParameter("user_Id");
		String user_Name=request.getParameter("userName");
		String pass=request.getParameter("pass");
		String mail=request.getParameter("mail");
		String privilege=request.getParameter("privilege");

		User user=new User(id,user_Id,user_Name,pass,mail,privilege);
		UserInfoLogic updateAccountLogic=new UserInfoLogic();
		boolean ua=updateAccountLogic.UpdateUserInfo(user);
		if(ua==true) {
			HttpSession session = request.getSession();
			session.removeAttribute("user");
			session.setAttribute("user", user);
			session.setAttribute("userMsg", "ユーザー情報の変更が完了しました。お買い物をお楽しみください");
			forwardPath="/NaoeServlet";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
		dispatcher.forward(request, response);
	}

}
