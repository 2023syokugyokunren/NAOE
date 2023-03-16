package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.TemporaryItem;

public class ItemCategorySearchDAO {
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";
	
	//カテゴリー検索且つキーワード検索を行うメソッド
	//カテゴリーなしの場合は行えない
	//引数は第一引数にint型、第二引数にString型を渡す
	public List<TemporaryItem> ItemSearch(int cate,String word) {
		List<TemporaryItem> categorySearchList=new ArrayList();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,IMAGE,PRICE,STOCK,SALES,ITEMS.CREATED_AT,ITEMS.UPDATE_AT FROM ITEMS"
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID"
					+ " WHERE (ITEM_NAME LIKE ? OR DISCRIPTION LIKE ?) "
					+ " AND CATEGORY=? "
					+ " ORDER BY ITEM_ID ";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			pStmt.setString(1, "%"+word+"%");
			pStmt.setString(2, "%"+word+"%");
			pStmt.setInt(3, cate);
			
			ResultSet rs=pStmt.executeQuery();
			
			while(rs.next()) {
				int item_Id=rs.getInt("ITEM_ID");
				String item_Name=rs.getString("ITEM_NAME");
				String category=rs.getString("CATEGORY_NAME");
				String discription=rs.getString("DISCRIPTION");
				String image=rs.getString("IMAGE");
				int price=rs.getInt("PRICE");
				int stock=rs.getInt("STOCK");
				int sales=rs.getInt("SALES");
				TemporaryItem itemInfo=new TemporaryItem(item_Id,item_Name,category,discription,image,price,
						stock,sales);
				categorySearchList.add(itemInfo);
				}					
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return categorySearchList;
	}
	
	//上のカテゴリー且つキーワード検索に限界値を追加したメソッド
	//pageでどこから表示するか、numでどこまで表示するかを決める
	public List<TemporaryItem> ItemSearchLimit(int cate,String word,int page,int num) {
		List<TemporaryItem> categorySearchList=new ArrayList();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,IMAGE,PRICE,STOCK,SALES,ITEMS.CREATED_AT,ITEMS.UPDATE_AT FROM ITEMS"
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID"
					+ " WHERE (ITEM_NAME LIKE ? OR DISCRIPTION LIKE ?) "
					+ " AND CATEGORY=? "
					+ " ORDER BY ITEM_ID LIMIT ?,?";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			pStmt.setString(1, "%"+word+"%");
			pStmt.setString(2, "%"+word+"%");
			pStmt.setInt(3, cate);
			pStmt.setInt(4, page);
			pStmt.setInt(5, num);
			
			ResultSet rs=pStmt.executeQuery();
			
			while(rs.next()) {
				int item_Id=rs.getInt("ITEM_ID");
				String item_Name=rs.getString("ITEM_NAME");
				String category=rs.getString("CATEGORY_NAME");
				String discription=rs.getString("DISCRIPTION");
				String image=rs.getString("IMAGE");
				int price=rs.getInt("PRICE");
				int stock=rs.getInt("STOCK");
				int sales=rs.getInt("SALES");
				TemporaryItem itemInfo=new TemporaryItem(item_Id,item_Name,category,discription,image,price,
						stock,sales);
				categorySearchList.add(itemInfo);
				}					
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return categorySearchList;
	}
}
