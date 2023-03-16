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

import model.AdminControlLogic;
import model.Category;
import model.DisplayItemLogic;
import model.TemporaryItem;
import model.User;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		DisplayItemLogic admin = new DisplayItemLogic();
		List<TemporaryItem> tempoList = admin.DisplayAllItem();
		request.setAttribute("tempoList", tempoList);
		
	
		List<TemporaryItem> rankingList = admin.DisplayItemOrderRanking();
		request.setAttribute("rankingList", rankingList);
		
		//値段昇順(小さい順)
	
		List<TemporaryItem> priceList = admin.SearcAdmin("PRICE","ASC");
		request.setAttribute("priceList", priceList);
		
		//値段降順(大きい順)

		List<TemporaryItem> priceDescList = admin.SearcAdmin("PRICE","DESC");
		request.setAttribute("priceDescList", priceDescList);
				
		//カテゴリー昇順(小さい順)

		List<TemporaryItem> categoryList = admin.SearcAdmin("CATEGORY","ASC");
		request.setAttribute("categoryList", categoryList);
		
		//カテゴリー降順(大きい順)
	
		List<TemporaryItem> categoryDescList = admin.SearcAdmin("CATEGORY","DESC");
		request.setAttribute("categoryDescList", categoryDescList);
		
		//在庫昇順(小さい順)
		
		List<TemporaryItem> stockList = admin.SearcAdmin("STOCK","ASC");
		request.setAttribute("stockList", stockList);
		
		//在庫降順(大きい順)
		
		List<TemporaryItem> stockDescList = admin.SearcAdmin("STOCK","DESC");
		request.setAttribute("stockDescList", stockDescList);
		
		//登録ID降順(新しい順)
	
		List<TemporaryItem> itemDescList = admin.SearcAdmin("ITEM_ID","DESC");
		request.setAttribute("itemDescList", itemDescList);
		
		//売上昇順(小さい順)
	
		List<TemporaryItem> salesList = admin.SearcAdmin("SALES","ASC");
		request.setAttribute("salesList", salesList);
		
		//売上降順(大きい順)
	
		List<TemporaryItem> salesDescList = admin.SearcAdmin("SALES","DESC");
		request.setAttribute("salesDescList", salesDescList);
		
		//フォワード先
		String forwardPath=null;

		//サーブレットクラスの動作を決定する「action」の値をリクエストパラメータから取得
		String action=request.getParameter("action");

		//管理画面へフォワード
		if (action == null) {
			// フォワード先を設定
			forwardPath = "/WEB-INF/jsp/admin.jsp";

		} else if (action.equals("add")) {
			//optionの
			DisplayItemLogic logic = new DisplayItemLogic();
			List<Category> category =logic.DisplayCategory();
			HttpSession session = request.getSession();//セッションスコープ取得
			session.setAttribute("category",category);
			
			forwardPath ="/WEB-INF/jsp/adminAdd.jsp";
		} else if(action.equals("cateadd")) {
			forwardPath="/WEB-INF/jsp/categoryAdd.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String category = request.getParameter("category");
		
		String forwardPath = null;

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int id=user.getId();

		AdminControlLogic logic = new AdminControlLogic();
		boolean result=logic.InsertCategory(category,id);

		if(result == true) {
			DisplayItemLogic selectLogic = new DisplayItemLogic();
			List<Category> reload = selectLogic.DisplayCategory();
			session.setAttribute("category", reload);
			
			session.setAttribute("successCategory", "カテゴリーを追加しました");
			
		}else if(result==false) {
			session.setAttribute("erorrCategory", "カテゴリーの追加に失敗しました");
		}

		response.sendRedirect(request.getContextPath() + "/AdminServlet");		
		
	}

}
