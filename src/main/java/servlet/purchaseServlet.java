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
import model.DisplayItemLogic;
import model.TemporaryItem;
import model.User;


@WebServlet("/purchaseServlet")
public class purchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*RequestDispatcher logdispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cartInfo.jsp");
		logdispatcher.forward(request, response);*/
		RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/jsp/cartInfo.jsp");
		dispatcher.forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//リクエストパラメータの値を取得
		request.setCharacterEncoding("UTF-8");
		//セッションインスタンスの作成
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		// ログインしていない状態で,addCartが押された場合ログインページに飛ぶ
		if (user == null) {
			response.sendRedirect("/NAOE/LoginServlet");
			
		} else {

			int quantity = Integer.parseInt(request.getParameter("quantity"));
			int token = Integer.parseInt(request.getParameter("token"));
			
			// shop.jspからAddcartが押されたときに受け取るパラメーター
			int itemNumber = Integer.parseInt(request.getParameter("itemNumber"));
			String access = request.getParameter("access");
			
			//今のセッショントークンを呼び出す。
			Integer sessionToken =  (Integer) session.getAttribute("sessionToken");
			
			//もしもsessionTokenがnullならsessionTokenにtokenを代入
			if(Objects.isNull(sessionToken)) {
				session.setAttribute("sessionToken",token);
				sessionToken =  (Integer) session.getAttribute("sessionToken");
			
			// shop.jspのaddCartが押されたとき
			if (access != null) {
				// findItem起動
				DisplayItemLogic find = new DisplayItemLogic();
				TemporaryItem iteminfo = find.DisplayItemInfo(itemNumber);
				
				session.setAttribute("iteminfo",iteminfo);//インスタンス保存
			}
			
			TemporaryItem item = (TemporaryItem) session.getAttribute("iteminfo");
			
			//カートの取得
			Cart cart = (Cart) session.getAttribute("cart");
			//もしカートが空ならば新たなカートをつくる。そこへいれる。
			if(cart == null) {
				CartControlLogic newCart = new CartControlLogic();
				cart = newCart.MakeNewCart(item,quantity);
				newCart.TotalPrice(cart);
				session.setAttribute("cart",cart);
			} else {
				//カートがあるならばカートから配列を呼び出す。
				CartControlLogic newCart = new CartControlLogic();
				//呼び出した各配列に新たにitemとquantityを入れる。
				cart = newCart.PutItemInCart(item, quantity, cart);
				newCart.TotalPrice(cart);
				//セッションに保存する。
				session.setAttribute("cart",cart);
			}
			}
			//もしもsessionTokenとtokenが一致しないならば処理する
			if(sessionToken != token) {
				//iteminfoの取得
				TemporaryItem item = (TemporaryItem) session.getAttribute("iteminfo");
				//カートの取得
				Cart cart = (Cart) session.getAttribute("cart");
				//もしカートが空ならば新たなカートをつくる。そこへいれる。
				if(cart == null) {
					CartControlLogic newCart = new CartControlLogic();
					cart = newCart.MakeNewCart(item,quantity);
					newCart.TotalPrice(cart);
					session.setAttribute("cart",cart);
				} else {
					//カートがあるならばカートから配列を呼び出す。
					CartControlLogic newCart = new CartControlLogic();
					//呼び出した各配列に新たにitemとquantityを入れる。
					cart = newCart.PutItemInCart(item, quantity, cart);
					newCart.TotalPrice(cart);
					//セッションに保存する。
					session.setAttribute("cart",cart);
				}
				//sessionTokenにtokenを代入
				session.setAttribute("sessionToken",token);
			}
			
			//フォワード
			RequestDispatcher dispatcher =request.getRequestDispatcher("/WEB-INF/jsp/cartInfo.jsp");
			dispatcher.forward(request, response);
		}		
	}

}
