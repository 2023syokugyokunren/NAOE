package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DisplayItemLogic;
import model.TemporaryItem;

@WebServlet("/DeleteConfimServlet")
public class DeleteConfimServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//action属性からid値から取得
		//System.out.println(request.getParameter("id"));
		int num = Integer.parseInt(request.getParameter("id"));
		System.out.println(num);
		//logicを生成しselect文を実行
		DisplayItemLogic selectLogic = new DisplayItemLogic();
		TemporaryItem iinfo = selectLogic.DisplayItemInfo(num);
		
		//returnされた値をセッションスコープに保存
		HttpSession session = request.getSession();
		session.setAttribute("iinfo",iinfo );
		//フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/DeleteConfim.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
