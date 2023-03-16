package model;

import java.util.List;

import dao.FavoriteDAO;

/*favoriteテーブルに挿入、削除したり。
 * favoriteテーブルのデータを取得できます。
 * 
 * InsertFavoriteメソッド	お気に入り登録時に使用するメソッド(FavoriteServlet)
 * DeleteFavoriteメソッド	お気に入り解除時に使用するメソッド(FavoriteServlet)
 * SelectFavoriteメソッド	お気に入り一覧を表示するときに使用するメソッド(NaoeServlet)
 * CheckFavoriteメソッド	お気に入りをしているか判定するメソッド(ItemServet)
 * */

public class FavoriteLogic {
	 /**
	   * InsertFavoriteメソッド
	   * 商品の画面からお気に入り登録をするメソッド
	   * @param　itemId(商品のID),userId(ユーザー情報のID)
	   * @return boolean(成功時True,失敗時False
	   */
	public boolean InsertFavorite(int itemId,int userId) {
		FavoriteDAO dao=new FavoriteDAO();
		boolean result= dao.insertFavorite(itemId, userId);
		return result;
	}
	
	 /**
	   * DeleteFavoriteメソッド
	   * 商品の画面からお気に入り解除をするメソッド
	   * @param　itemId(商品のID),userId(ユーザー情報のID)
	   * @return boolean(成功時True,失敗時False
	   */
	public boolean DeleteFavorite(int itemId,int userId) {
		FavoriteDAO dao=new FavoriteDAO();
		boolean result=dao.deleteFavorite(itemId, userId);
		return result;
	}
	
	 /**
	   * SelectFavoriteメソッド
	   * アカウントに紐づいたお気に入りを表示するメソッド
	   * @param　userId(ユーザー情報のID)
	   * @return List<TemporaryItem>(item_Id,item_Name,category,discription,registerUser,image,price,stock,sales)
	   */
	public List<TemporaryItem> SelectFavorite(int userId){
		FavoriteDAO dao=new FavoriteDAO();
		List<TemporaryItem> favorite=dao.SelectFavorite(userId);
		
		return favorite;
	}
	
	 /**
	   * CheckFavoriteメソッド
	   * ユーザーがお気に入りしているかを判定するメソッド
	   * @param　itemId(商品のID),userId(ユーザー情報のID)
	   * @return boolean(お気にいりされていたときTrue,されていない時False)
	   */
	public boolean CheckFavorite(int itemId,int userId) {
		FavoriteDAO dao=new FavoriteDAO();
		boolean result=dao.checkFavorite(itemId, userId);
		
		return result;
	}
	
}
