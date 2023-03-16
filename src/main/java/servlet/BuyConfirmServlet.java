package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.Login;
import model.User;
import model.UserAuthLogic;
import model.UserInfoLogic;

/**
 * Servlet implementation class BuyConfirmServlet
 */
@WebServlet("/BuyConfirmServlet")
public class BuyConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		//保存されたユーザー情報を取得
		User loginConf = (User) session.getAttribute("user");
		//取得したユーザー情報をもとにselect文の実行
		UserInfoLogic ui_SelectLogic = new UserInfoLogic();
		List<User>userInfoList = ui_SelectLogic.DisplayUserAddress(loginConf);

		//returnされた値をセッションスコープに保存
		HttpSession session2 = request.getSession();
		session2.setAttribute("userInfoList",userInfoList );

		HttpSession session3=request.getSession();
		session3.setAttribute("loginConf", loginConf);
		response.setContentType("text/html; charset=UTF-8");
		
		//残高情報の取得、セッションスコープに保存
		String userId=loginConf.getUser_Id();
		String pass=loginConf.getPass();
		Login login = new Login(userId,pass);
		UserAuthLogic bo = new UserAuthLogic();
		User result = bo.LoginCheck(login);
		int userMoney=result.getMoney();
		session.setAttribute("userMoney", userMoney);
		
		//保存されたカート情報を取得
		Cart cart=(Cart) session.getAttribute("cart");
		
		//住所が入っているかの確認
		UserInfoLogic userInfoLogic=new UserInfoLogic();
		List<User> userAddress=userInfoLogic.DisplayUserAddress(result);
		//CartControlLogic CartControlLogic=new CartControlLogic();
		//CartControlLogic.ChangeStock(cart,loginConf.getId());
		
		if(userAddress.size()==0) {
			session.setAttribute("registerDmd", "購入するには住所登録してください");
			response.sendRedirect(request.getContextPath() + "/NaoeServlet");
		} else {
		//フォワード
			RequestDispatcher dispatcher =request.getRequestDispatcher("/WEB-INF/jsp/buyConfirm.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpSsrvletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
