package servlet;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.CartControlLogic;
import model.User;

@WebServlet("/BuyDecideServlet")
public class BuyDecideServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forwardPath=null;
		int confirmToken = 0;
		request.setCharacterEncoding("UTF-8");
		//支払い方法取得
		String beforePaymentMethod = request.getParameter("paymentMethod");
		//セッションインスタンスを作成
		HttpSession session = request.getSession();
		//保存されたカート情報を取得
		Cart cart=(Cart) session.getAttribute("cart");
		//保存されたユーザー情報を取得
		User loginConf = (User) session.getAttribute("user");
		//token情報を取得
		String beforeConfirmToken = request.getParameter("confirmToken");
		if(beforeConfirmToken != null) {
		   confirmToken = Integer.parseInt(beforeConfirmToken);
		} else {
			confirmToken = 0;
		}
		//今のセッショントークンを呼び出す。
		Integer sessionToken =  (Integer) session.getAttribute("sessionToken");
		//もしもsessionTokenがnullならsessionTokenにtokenを代入
		if(Objects.isNull(sessionToken)) {
			session.setAttribute("sessionToken",confirmToken);
			sessionToken =  (Integer) session.getAttribute("sessionToken");
			//購入処理
			if(beforePaymentMethod != null) {
				int paymentMethod = Integer.parseInt(beforePaymentMethod);
				//代引きの時の処理
				if(paymentMethod ==1) {
					CartControlLogic CartControlLogic=new CartControlLogic();
					boolean cbl=CartControlLogic.ChangeStock(cart,loginConf.getId());
					if(cbl==true) {
						System.out.println("購入完了");
						forwardPath="/WEB-INF/jsp/purchaseOK.jsp";
					}else if(cbl==false) {
						forwardPath="/WEB-INF/jsp/RegisterDemand.jsp";
						System.out.println("購入失敗しました");
					}
				} else if(paymentMethod == 2) {
					CartControlLogic CartControlLogic=new CartControlLogic();
					boolean cbl=CartControlLogic.ChangeStockAndMoney(cart,loginConf.getId());
					if(cbl==true) {
						System.out.println("購入完了");
						forwardPath="/WEB-INF/jsp/purchaseOK.jsp";
					}else if(cbl==false) {
						forwardPath="/WEB-INF/jsp/RegisterDemand.jsp";
						System.out.println("購入失敗しました");
					}	
				} 
			} else {
				forwardPath="/WEB-INF/jsp/cartInfo.jsp";
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher(forwardPath);
			dispatcher.forward(request,response);
		}
		//もしもsessionTokenとtokenが一致しないならば処理する
		if(sessionToken != confirmToken) {
			//購入処理
			if(beforePaymentMethod != null) {
				int paymentMethod = Integer.parseInt(beforePaymentMethod);
				//代引きの時の処理
				if(paymentMethod ==1) {
					CartControlLogic CartControlLogic=new CartControlLogic();
					boolean cbl=CartControlLogic.ChangeStock(cart,loginConf.getId());
					if(cbl==true) {
						forwardPath="/WEB-INF/jsp/purchaseOK.jsp";
					}else if(cbl==false) {
						forwardPath="/WEB-INF/jsp/RegisterDemand.jsp";
					}
				} else if(paymentMethod == 2) {
					CartControlLogic CartControlLogic=new CartControlLogic();
					boolean cbl=CartControlLogic.ChangeStockAndMoney(cart,loginConf.getId());
					if(cbl==true) {
						forwardPath="/WEB-INF/jsp/purchaseOK.jsp";
					}else if(cbl==false) {
						forwardPath="/WEB-INF/jsp/RegisterDemand.jsp";
					}	
				} 
			} else {
				forwardPath="/WEB-INF/jsp/cartInfo.jsp";
			}
			//sessionTokenにtokenを代入
			session.setAttribute("sessionToken",confirmToken);
			//フォワード
			RequestDispatcher dispatcher=request.getRequestDispatcher(forwardPath);
			dispatcher.forward(request,response);
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/jsp/purchaseOK.jsp");
		dispatcher.forward(request,response);
	}

}
