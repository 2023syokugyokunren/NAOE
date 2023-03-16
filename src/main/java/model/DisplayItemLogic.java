package model;

import java.util.List;

import dao.CategoryDAO;
import dao.ItemSearchDAO;
import dao.SelectItemDAO;

/**
* 商品・カテゴリーの表示のさせ方に関するメソッドが集まっています
* 
* DisplayAllItemメソッド	データベースに存在するすべての商品を返します。(NaoeServlet,AdminServlet)
* DisplayCategoryメソッド	データベースに存在するすべてのカテゴリーを返します。	(AdminServlet)
* DisplayItemOrderRankingメソッド	データベースに存在するすべての商品を注文数順に返します。 (NaoeServlet)
* DisplayItemInfoメソッド	選択された一つの商品の詳細情報を返します。	(ItemServlet,ChangeItemServlet,DeleteConfirmServlet)
*/

public class DisplayItemLogic {
	
	/**
	   * DisplayAllItemメソッド
	   * データベースに存在するすべての商品を表示するメソッド
	   * @param　void
	   * @return List<TemporaryItem> TemporaryItem(item_Id,item_Name,category,discription,registerUser,image,price,stock,sales);
	   */
	public List<TemporaryItem> DisplayAllItem() {
		SelectItemDAO dao = new SelectItemDAO();
		List<TemporaryItem> allItem = dao.CreateItemList();
			
		return allItem;
	}
	
	/**
	   * DisplayCategoryメソッド
	   * データベースに存在するすべてのカテゴリーを表示するメソッド
	   * @param　void
	   * @return List<Category> Category(int category_Id, String category_Name)
	   */
	public List<Category> DisplayCategory(){
		CategoryDAO dao = new CategoryDAO();
		List<Category> category = dao.selectCategory();

		return category;
	}
	
	/**
	   * DisplayItemOrderRankingメソッド
	   * データベースに存在するすべての商品をを注文数順で表示するメソッド
	   * @param　void
	   * @return List<TemporaryItem> TemporaryItem(item_Id,item_Name,category,discription,registerUser,image,price,stock,sales);
	   */
	public List<TemporaryItem> DisplayItemOrderRanking(){
		SelectItemDAO dao = new SelectItemDAO();
		List<TemporaryItem> OrderRanking = dao.selectItemRanking();
		
		return OrderRanking;
	}
	
	/**
	   * DisplayItemInfoメソッド
	   * 一つの商品の詳細情報を表示するメソッド
	   * @param　int (itemのid)
	   * @return TemporaryItem(item_Id, item_Name, category, discription,image, price, stock,sales);
	   */
	public TemporaryItem DisplayItemInfo(int itemid){
		SelectItemDAO dao = new SelectItemDAO();
		TemporaryItem ItemInfo = dao.SelectItem(itemid);
		
		return ItemInfo;
		
	}
	// RankingCategpryLimit5メソッド
	public List<TemporaryItem> selectCategoryRank(int cate, int page, int num){
		SelectItemDAO dao = new SelectItemDAO();
		List<TemporaryItem> cateRankList = dao.selectCategoryRank(cate,page ,num);
			
		return cateRankList;
	}
	
	// RankingCategpryLimit5メソッド
		public List<TemporaryItem> CategorySearchLimit(int cate, int page, int num){
			ItemSearchDAO dao = new ItemSearchDAO();
			List<TemporaryItem> categoryList = dao.CategorySearchLimit(cate,page ,num);
				
			return categoryList;
		}
		
	// ランキングTOP５メソッド
		public List<TemporaryItem> CreateItemListLimit(int page, int num){
			SelectItemDAO dao = new SelectItemDAO();
			List<TemporaryItem> itemList = dao.CreateItemListLimit(page, num);
				
			return itemList;
		}
	
	//adminでの絞り込み機能
        public List<TemporaryItem> SearcAdmin(String key,String sort){
            SelectItemDAO dao=new SelectItemDAO();
            List<TemporaryItem> searc =dao.selectItemSort(key,sort);
            
            return searc;
        }
	
}
