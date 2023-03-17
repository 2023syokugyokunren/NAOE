package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserInfoLogic;

@WebServlet("/ChargeMoneyServlet")
public class ChargeMoneyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//フォワード先
				String forwardPath=null;
				forwardPath = "/WEB-INF/jsp/chargeMoney.jsp";

				RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
				dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//フォワード先
		String forwardPath=null;
		request.setCharacterEncoding("UTF-8");

		int money=Integer.parseInt(request.getParameter("money"));
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println("id:"+id);

		UserInfoLogic userInfoLogic=new UserInfoLogic();
		boolean judge=userInfoLogic.charge(money, id);
		if(judge==true) {
			request.setAttribute("money", money);
			forwardPath = "/WEB-INF/jsp/chargeMoneyOK.jsp";

		}else {
			System.out.println("チャージ失敗");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
		dispatcher.forward(request, response);
	}

}
