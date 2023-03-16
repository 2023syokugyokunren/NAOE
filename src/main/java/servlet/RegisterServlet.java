package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.RegisterInfo;
import model.UserAuthLogic;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forwardPath = null;
		String action = request.getParameter("action");
		
		if(action == null) {
			forwardPath="/WEB-INF/jsp/register.jsp";
			
		}else if(action.equals("done")) {
		
			HttpSession session = request.getSession();
			RegisterInfo registerInfo =(RegisterInfo)session.getAttribute("registerInfo");

			UserAuthLogic registerLogic = new UserAuthLogic();
			boolean logic = registerLogic.RegisterUser(registerInfo);
			
			// 登録失敗時の動作がない
			
			session.removeAttribute("registerInfo");
			forwardPath="/WEB-INF/jsp/registerOK.jsp";
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(forwardPath);
		dispatcher.forward(request,response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("userid");
		String pass = request.getParameter("pass");
		String username = request.getParameter("username");
		String mail = request.getParameter("mail");
		
		boolean flag = true;
		String fowardPath = null;
		
//		if(userid.length() > 11 || userid.length() < 3 || userid.matches("[^a-zA-Z]")) {
//			request.setAttribute("errorMsgId", "ユーザーIDはローマ字のみで、4文字以上10文字以下で入力してください");
//			flag = false;
//		}
//		
//		if(pass.length() > 11 || userid.length() < 3){ 
//			request.setAttribute("errorMsgPass", "パスワードは4文字以上11文字以下で入力してください");
//			flag = false;
//		}
//		
//		if(username.length() > 11 || userid.length() < 3 ){
//			request.setAttribute("errorMsgName", "お名前は4文字以上10文字以下で入力してください");
//			flag = false;
//		}
		UserAuthLogic userLogic=new UserAuthLogic();
		if(!userLogic.CheckUser(userid)) {
			request.setAttribute("errorMsgId", "このユーザーIDはすでに使われています");
			flag=false;
		}
		
		
		if (flag == true) {
			RegisterInfo registerInfo = new RegisterInfo(userid,pass,username,mail);
			HttpSession session = request.getSession();
			session.setAttribute("registerInfo",registerInfo);
			fowardPath = "/WEB-INF/jsp/registerConfirm.jsp";
		} else {
			fowardPath = "/WEB-INF/jsp/register.jsp";
		}
		RequestDispatcher dispatcher=
				request.getRequestDispatcher(fowardPath);
		dispatcher.forward(request,response);
		
	}
	
}
