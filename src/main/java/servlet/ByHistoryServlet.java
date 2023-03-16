package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Detail;
import model.User;
import model.UserInfoLogic;


@WebServlet("/ByHistoryServlet")
public class ByHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		if (user != null) {
			int id=user.getId();
			
			UserInfoLogic logic = new UserInfoLogic();
			// 購入商品
			List<Detail> list = logic.DisplayBuyHistory(id);
			
			List<Date> date = new ArrayList<>();
			
			for (int i=0; i < list.size(); i++) {
				date.add((Date) list.get(i).getOrder_At());
			}
			
			// 重複のない日付のリストを作成　List<Dates>
			List<Date> dates = new ArrayList<Date>(new HashSet<>(date));
			
			request.setAttribute("dates", dates);
			request.setAttribute("history",list);
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/jsp/buyHistory.jsp");
			dispatcher.forward(request, response);
			
		} else {
			RequestDispatcher dispatcher=request.getRequestDispatcher("/LoginServlet");
			dispatcher.forward(request, response);
		}

	}

}
