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

import model.DisplayItemLogic;
import model.Post;
import model.PostLogic;
import model.SearchItemLogic;
import model.TemporaryItem;
import model.User;
import model.UserInfoLogic;

@WebServlet("/AdminSearchServlet")
public class AdminSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// itemNumberを受け取る
		request.setCharacterEncoding("UTF-8");
		int itemNumber = Integer.parseInt(request.getParameter("itemNumber"));
		// findItem起動
		DisplayItemLogic find = new DisplayItemLogic();
		TemporaryItem iteminfo = find.DisplayItemInfo(itemNumber);

		//セッションスコープ
		HttpSession session = request.getSession();//セッションスコープ取得
		session.setAttribute("iteminfo",iteminfo);//インスタンス保存
		//TemporaryItem h = (TemporaryItem) session.getAttribute("iteminfo");//インスタンス取り出し
		// HttpSession session2 = request.getSession();
		User loginConf = (User) session.getAttribute("user");
		if(loginConf!=null) {

			UserInfoLogic itemBoughtCheckLogic=new UserInfoLogic();
			boolean ibc=itemBoughtCheckLogic.BuyCheck(itemNumber, loginConf.getId());
			System.out.println(ibc);
			// HttpSession session3=request.getSession();
			session.setAttribute("ibc", ibc);
		}

		//レビュー取得処理
		PostLogic postSelectLogic=new PostLogic();
		List<Post> postList=postSelectLogic.DisplayReview(itemNumber);

		PostLogic avgSelect =new PostLogic();
		int avgScore = avgSelect.DisplayAvgScore(itemNumber);
		System.out.println(avgScore);

		if(postList.size()!=0) {
			session.setAttribute("postList", postList);
			session.setAttribute("avgScore",avgScore);
		}

		//フォワード
		response.sendRedirect(request.getContextPath() + "/AdminSearchServlet");	

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String word=request.getParameter("word");
		String cate=request.getParameter("hardness");


		System.out.println(cate);

		System.out.println(word);
		//何も入っていない
		if(word.length()!=0||cate.length()!=0) {

			//検索欄だけ入ってる
			if(word.length()!=0&&cate.length()==0) {
				SearchItemLogic logic=new SearchItemLogic();
				// ok
				List<TemporaryItem> result=logic.SearchItemName(word);

				HttpSession session = request.getSession();//セッションスコープ取得
				session.setAttribute("search",result);

				List<TemporaryItem> search = (List<TemporaryItem>) session.getAttribute("search");

				//カテゴリだけ
			}else if(word.length()==0&&cate.length()!=0) {
				int num=Integer.parseInt(cate);
				// ok
				SearchItemLogic logic=new SearchItemLogic();
				List<TemporaryItem>result=logic.SearchCategory(num);

				HttpSession session = request.getSession();
				session.setAttribute("search",result);

				List<TemporaryItem> search=(List<TemporaryItem>)session.getAttribute("search");

				//両方入ってる
			}else if(word.length()!=0&&cate.length()!=0) {
				int num=Integer.parseInt(cate);
				SearchItemLogic logic=new SearchItemLogic();
				List<TemporaryItem> result=logic.SearchNameCate(num,word);

				HttpSession session = request.getSession();
				session.setAttribute("search",result);

				List<TemporaryItem> search = (List<TemporaryItem>)session.getAttribute("search");
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/adminSearch.jsp");
			dispatcher.forward(request, response);


		}else {
			response.sendRedirect(request.getContextPath() + "/AdminServlet");	
		}

	}

}
