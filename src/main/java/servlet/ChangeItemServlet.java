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
import model.DisplayItemLogic;
import model.TemporaryItem;

@WebServlet("/ChangeItemServlet")
@MultipartConfig
public class ChangeItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//action属性からid値から取得
		//System.out.println(request.getParameter("id"));
		 int num = Integer.parseInt(request.getParameter("id"));
		 
		 //logicを生成しselect文を実行
		 DisplayItemLogic selectLogic=new DisplayItemLogic();
		 TemporaryItem iinfo=selectLogic.DisplayItemInfo(num);
		 
		 //returnされた値をセッションスコープに保存
		 HttpSession session = request.getSession();
		 session.setAttribute("iinfo",iinfo );
		 
		 //フォワード
		 RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/changeItem.jsp");
	    	dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//フォワード先
		String forwardPath = null;
		// リクエストパラメータの取得
		request.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id_c"));
		String name = request.getParameter("item");
		String category = request.getParameter("category");
		String discription = request.getParameter("discription");
		
		int price=Integer.parseInt(request.getParameter("price")); 
		int stock=Integer.parseInt(request.getParameter("stock"));
		int sales=Integer.parseInt(request.getParameter("sales"));
		//インスタンスを生成
		Part part = request.getPart("image");
		String filename = null;
		
		HttpSession session = request.getSession();
		
		if (part.getSize() != 0) { 
			filename=part.getSubmittedFileName();
			// 環境が変わっても変化するようにしたいが、できなかった
			// いい案があれば教えて
			String path="C:\\work3\\NAOE\\src\\main\\webapp\\image";
			part.write(path+File.separator+filename);
			
		} else {
			TemporaryItem item = (TemporaryItem) session.getAttribute("iinfo");
			filename = item.getImage();
		}
		
		TemporaryItem u_item=new TemporaryItem(id,name,category,discription,filename,price,stock,sales);
		
		AdminControlLogic updateLogic = new AdminControlLogic();
		boolean ul = updateLogic.UpdateItem(u_item);
		
		if(ul == true) {
			 // 設定されたフォワード先にフォワード
	    	 forwardPath ="/WEB-INF/jsp/updateOK.jsp";

			session.setAttribute("ChangeOK", "商品内容を変更しました");
	    	 
		}else if(ul == false) {
			 forwardPath ="/WEB-INF/jsp/admin.jsp";
			 session.setAttribute("ChangeErorr", "商品内容の変更に失敗しました");
	    	 // update失敗時
		}

		response.sendRedirect(request.getContextPath() + "/AdminServlet");	
	}

}
