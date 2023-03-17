package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FavoriteLogic;
import model.TemporaryItem;
import model.User;

@WebServlet("/FavoriteServlet")
public class FavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//フォワード先
		String redirectPath=null;
		
		HttpSession session = request.getSession();
		//保存されたユーザー情報を取得
		User loginConf = (User) session.getAttribute("user");
		//保存された商品情報を取得
		TemporaryItem itemInfo=(TemporaryItem)session.getAttribute("iteminfo");

		//サーブレットクラスの動作を決定する「action」の値をリクエストパラメータから取得
		String action=request.getParameter("action");
		
		if(action.equals("favoadd")) {
			FavoriteLogic favoriteLogic=new FavoriteLogic();
			favoriteLogic.InsertFavorite(itemInfo.getId(), loginConf.getId());
		}else if(action.equals("favodel")) {
			FavoriteLogic favoriteLogic=new FavoriteLogic();
			favoriteLogic.DeleteFavorite(itemInfo.getId(), loginConf.getId());
		}
		
		redirectPath="/NAOE/ItemServlet?itemNumber="+itemInfo.getId();
		
		response.sendRedirect(redirectPath);
	}

}
