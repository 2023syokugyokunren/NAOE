package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Post;
import model.PostLogic;
import model.TemporaryItem;
import model.User;

@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PostServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postId = Integer.parseInt(request.getParameter("id"));
		
		PostLogic deleteLogic = new PostLogic();
		boolean result = deleteLogic.DeletePost(postId);
		System.out.println(result);
		
		//保存された商品情報を取得
		HttpSession session = request.getSession();
		TemporaryItem itemInfo=(TemporaryItem)session.getAttribute("iteminfo");
		response.sendRedirect(request.getContextPath() + "/ItemServlet?itemNumber=" + itemInfo.getId());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String redirectpath=null;
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		//保存されたユーザー情報を取得
		User loginConf = (User) session.getAttribute("user");
		//保存された商品情報を取得
		TemporaryItem itemInfo=(TemporaryItem)session.getAttribute("iteminfo");
		int score=Integer.parseInt(request.getParameter("score"));
		String content=request.getParameter("review");
		
		if (content.length() <= 5 || content.length() >= 30) {
			session.setAttribute("errorReview", "5文字以上30文字以下で入力してください");
			
		} else {
			Post post=new Post(loginConf.getId(),itemInfo.getId(),score,content);
			
			PostLogic postInsertLogic = new PostLogic();
			boolean result = postInsertLogic.InsertReview(post);
			
			if(result == true) {
				System.out.println("レビュー書き込み成功しました");
				session.setAttribute("successMsg", "レビューを投稿しました");
				
			} else {
				System.out.println("書き込みに失敗");
			}
		}
		
		response.sendRedirect(request.getContextPath() + "/ItemServlet?itemNumber=" + itemInfo.getId());
	}

}
