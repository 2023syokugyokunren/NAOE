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

import model.Login;
import model.User;
import model.UserAuthLogic;
import model.UserInfoLogic;

@WebServlet("/UserInfoServlet")
public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String forwardPath=null;
		//サーブレットクラスの動作を決定する「path」の値をリクエストパラメータから取得

		String path=request.getParameter("path");
		if(path==null) {
			// ここからスタート
			HttpSession session = request.getSession();
			User userInfo = (User) session.getAttribute("user");

			//ここから追加してください
            //残高情報の取得、セッションスコープに保存
            String userId=userInfo.getUser_Id();
            String pass=userInfo.getPass();

            Login login = new Login(userId,pass);
            UserAuthLogic bo = new UserAuthLogic();
            
            User result = bo.LoginCheck(login);
            
            int userMoney=result.getMoney();
            session.setAttribute("userMoney", userMoney);


			UserInfoLogic logic = new UserInfoLogic();
			List<User> list=logic.DisplayUserAddress(userInfo);

			HttpSession user=request.getSession();
			user.setAttribute("userInfo", list);

			HttpSession info = request.getSession();
			//保存されたユーザー情報を取得
			info.getAttribute("userInfo");

			HttpSession sessio = request.getSession();
			//保存されたユーザー情報を取得
			User loginConf = (User) sessio.getAttribute("user");
			//取得したユーザー情報をもとにselect文の実行
			UserInfoLogic ui_SelectLogic = new UserInfoLogic();
			List<User>userInfoList = ui_SelectLogic.DisplayUserAddress(loginConf);

			//returnされた値をセッションスコープに保存
			HttpSession session2 = request.getSession();
			session2.setAttribute("userInfoList",userInfoList );

			HttpSession session3=request.getSession();
			session3.setAttribute("loginConf", loginConf);
			forwardPath="/WEB-INF/jsp/UserInfo.jsp";

		}else if(path.equals("address")) {
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
			forwardPath="/WEB-INF/jsp/UserInfo.jsp";
			System.out.println(forwardPath);
		}else if(path.equals("pass")) {
			forwardPath="/WEB-INF/jsp/auth.jsp";
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher(forwardPath);
		dispatcher.forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forwardPath=null;
		request.setCharacterEncoding("UTF-8");

		//リクエストパラメータの取得
		int id=Integer.parseInt(request.getParameter("id"));
		int post_Code = Integer.parseInt(request.getParameter("post_Code"));
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		//userインスタンスを生成し保存
		User addressInfo=new User(id,post_Code,address,tel);

		HttpSession session = request.getSession();
		session.setAttribute("addressInfo", addressInfo);

		HttpSession session2 = request.getSession();
		List<User>userInfoList=(List<User>)session2.getAttribute("userInfoList");

		if(userInfoList.size() == 0) {

			UserInfoLogic userA_InsertLogic=new UserInfoLogic();
			boolean ij = userA_InsertLogic.InsertUserAddress(addressInfo);

			if(ij == true) {
				session.setAttribute("addressMsg", "住所登録が完了しました。お買い物をお楽しみください");
				forwardPath="/NaoeServlet";

			} else {
				System.out.println("住所登録失敗しました");
			}

		} else {
			UserInfoLogic userA_UpdateLogic=new UserInfoLogic();
			boolean uj=userA_UpdateLogic.UpdateUserAddress(addressInfo);

			if(uj==true) {
				System.out.println("住所変更成功しました");
				session.setAttribute("addressMsg", "住所登録が完了しました。お買い物をお楽しみください");
				forwardPath="/NaoeServlet";

			} else if(uj == false) {
				System.out.println("住所変更失敗しました");
			}
		}

		RequestDispatcher dispatcher=request.getRequestDispatcher(forwardPath);
		dispatcher.forward(request,response);
	}

}
