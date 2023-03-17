package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.AdminControlLogic;
import model.TemporaryItem;
import model.User;

@WebServlet("/ConfirmServlet")
@MultipartConfig
public class ConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//フォワード先
		String forwardPath = null;
		
		//サーブレットクラスの動作を決定する「action」の値をリクエストパラメータから取得
		String action=request.getParameter("action");
		
		//管理画面へフォワード
		if (action == null) {
			// フォワード先を設定
			forwardPath = "/WEB-INF/jsp/adminAdd.jsp";
		}
		else if (action.equals("done")) {
			// セッションスコープに保存された登録ユーザ
			HttpSession session = request.getSession();
			TemporaryItem items = (TemporaryItem) session.getAttribute("items");
			User user = (User) session.getAttribute("user");
			
			//logic処理
			AdminControlLogic insertLogic = new AdminControlLogic();
			boolean tf = insertLogic.InsertItem(items,user);
			
			if(tf==true) {
			// 不要となったセッションスコープ内のインスタンスを削除
			session.setAttribute("successAdd", "商品を追加しました");
			
	    } else if(tf==false) {
	    	 
	    	 session.setAttribute("erorrAdd", "商品追加に失敗しました");
	    }
			
		}
		response.sendRedirect(request.getContextPath() + "/AdminServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    request.setCharacterEncoding("UTF-8");
	    String item = request.getParameter("item");
	    int price = Integer.parseInt(request.getParameter("price"));
	    String category =request.getParameter("category");
	    int stock = Integer.parseInt(request.getParameter("stock"));
	    String discription=request.getParameter("discription");
	    
		Part part=request.getPart("image");
		
		File f = new File(this.getClass()
				.getClassLoader()
				.getResource("")
				.getPath());

		String classPath = f.getAbsolutePath();
		String contextPath = classPath.substring(0, classPath.lastIndexOf("\\.metadata"));
        System.out.println(contextPath);
		
		String filename=part.getSubmittedFileName();
		
		String path = contextPath+"\\NAOE\\src\\main\\webapp\\image";
		//実際にファイルが保存されるパス確認
		System.out.println(path);
		//書き込み
		part.write(path+File.separator+filename);
		// +File.separator+filename
	    
	    TemporaryItem items=new TemporaryItem(item,category,discription,filename,price,stock);
	    
	    //セッションスコープに保存
	    HttpSession session = request.getSession();
	    session.setAttribute("items",items );
	    
	 // フォワード
	    RequestDispatcher dispatcher =
	        request.getRequestDispatcher
	            ("/WEB-INF/jsp/addConfirm.jsp");
	    dispatcher.forward(request, response);
	}

}
