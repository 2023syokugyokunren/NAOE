package model;

import dao.CategoryDAO;
import dao.DeleteItemDAO;
import dao.InsertItemDAO;
import dao.UpdateItemDAO;

/**
* 管理者画面の操作に関するメソッドが集まっています
* 
* InsertItemメソッド	商品追加時に使用するメソッド(ConfirmServlet)
* UpdateItemメソッド	商品変更時に使用するメソッド(ChangeItemServlet))
* DeleteItemメソッド	商品削除時に使用するメソッド(DeleteServlet)
*/

public class AdminControlLogic {
	 /**
	   * InsertItemメソッド
	   * 管理画面から商品を追加するメソッド
	   * @param　TemporaryItem(item,category,discription,filename,price,order),User
	   * @return boolean(成功時True,失敗時False
	   */
	public boolean InsertItem(TemporaryItem items, User user) {
		InsertItemDAO dao = new InsertItemDAO();
		boolean result = dao.insertItem(items,user);
		
		return result;
	}
	
	/**
	   * UpdateItemメソッド
	   * 管理画面から商品を変更するメソッド
	   * @param　TemporaryItem(id,name,category,discription,filename,price,stock,sales);
	   * @return boolean(成功時True,失敗時False)
	   */
	public boolean UpdateItem(TemporaryItem items) {
		UpdateItemDAO dao = new UpdateItemDAO();
		boolean result = dao.updateItem(items);
		return result;
	}
	
	/**
	   * DeleteItemメソッド
	   * 管理画面から商品を削除するメソッド
	   * @param　itemid(商品のID)
	   * @return boolean(成功時True,失敗時False)
	   */
	public boolean DeleteItem(int itemid) {
		DeleteItemDAO dao = new DeleteItemDAO();
		boolean result = dao.deleteItem(itemid);
		
		return result;
	}
	
	/**
	   * InsertCategoryメソッド
	   * 管理画面からカテゴリーを削除するメソッド
	   * @param　String category(登録したいカテゴリー名), int userid(userの番号のほうのid)
	   * @return boolean(成功時True,失敗時False)
	   */
	public boolean InsertCategory(String category,int userid) {
		CategoryDAO dao = new CategoryDAO();
		boolean result = dao.insertCategory(category,userid);
		
		return result;
		}
}
