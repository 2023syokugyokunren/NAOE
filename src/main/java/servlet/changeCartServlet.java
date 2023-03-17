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

@WebServlet("/changeCartServlet")
public class changeCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// cartNumberを受け取る
		request.setCharacterEncoding("UTF-8");
		int cartNumber = Integer.parseInt(request.getParameter("cartNumber"));
		//ランダムトークン情報
		int delToken = Integer.parseInt(request.getParameter("delToken"));
		HttpSession session = request.getSession();//セッションスコープ取得
		//今のセッショントークンを呼び出す。
		Integer delSessionToken =  (Integer) session.getAttribute("delSessionToken");
		//もしもsessionTokenがnullならsessionTokenにtokenを代入
		if(Objects.isNull(delSessionToken)) {
			session.setAttribute("delSessionToken",delToken);
			delSessionToken =  (Integer) session.getAttribute("delSessionToken");
			Cart cart = (Cart) session.getAttribute("cart");//カートインスタンスを取得
			// CartControlLogicインスタンスにcart・carNumberを与えて削除後のcartを返してもらう。
			CartControlLogic CartControlLogic = new CartControlLogic();
			cart = CartControlLogic.DeleteTemporaryItem(cart, cartNumber);
			// sessionに保存し直す。
			session.setAttribute("cart",cart);//インスタンス保存
		}
		//もしもsessionTokenとtokenが一致しないならば処理する
		if(delSessionToken != delToken) {
			Cart cart = (Cart) session.getAttribute("cart");//カートインスタンスを取得
			// CartControlLogicインスタンスにcart・carNumberを与えて削除後のcartを返してもらう。
			CartControlLogic CartControlLogic = new CartControlLogic();
			cart = CartControlLogic.DeleteTemporaryItem(cart, cartNumber);
			// sessionに保存し直す。
			session.setAttribute("cart",cart);//インスタンス保存
			session.setAttribute("delSessionToken",delToken);
		}
		//フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cartInfo.jsp");
		dispatcher.forward(request, response);

	}
}
