package model;

import java.util.List;

import dao.ItemSearchDAO;


public class SearchItemLogic {

	/**
	   * SearchItemNameメソッド
	   * 商品名から商品を検索するメソッド
	   * @param　String (検索キーワードが入る)
	   * @return List<TemporaryItem> TemporaryItem(item_Id,item_Name,category,discription,image,price,stock,sales);
	   */
	public List<TemporaryItem> SearchItemName(String word){
		ItemSearchDAO select=new ItemSearchDAO();
		List<TemporaryItem> SearchItemNameList = select.ItemSearch(word);

		return SearchItemNameList;
	}

	public List<TemporaryItem> SearchCategory(int cate){
		ItemSearchDAO select=new ItemSearchDAO();
		List<TemporaryItem> list=select.CategorySearch(cate);
		return list;
	}

	public List<TemporaryItem> SearchNameCate(int cate,String word){
		ItemSearchDAO select=new ItemSearchDAO();
		 List<TemporaryItem> list=select.WordandCateSearch(cate,word);
		return list;
	}
}
