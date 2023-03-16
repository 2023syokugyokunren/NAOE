//検索値のキーワードを部分一致するデータを取得するDAOクラス


package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.TemporaryItem;

public class ItemSearchDAO {
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";
	
	//検索メソッド　文字列型の引数を渡す
	public List<TemporaryItem> ItemSearch(String word) {
		List<TemporaryItem> searchList=new ArrayList();
		
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,REGISTER_USER,IMAGE,PRICE,STOCK,SALES,ITEMS.CREATED_AT,ITEMS.UPDATE_AT FROM ITEMS "
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID"
					+ " WHERE ( ITEM_NAME LIKE ? OR DISCRIPTION LIKE ?) "
					+ " ORDER BY ITEM_ID ";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			pStmt.setString(1, "%"+word+"%");
			pStmt.setString(2, "%"+word+"%");
			
			ResultSet rs=pStmt.executeQuery();
			
			while(rs.next()) {
				int item_Id=rs.getInt("ITEM_ID");
				String item_Name=rs.getString("ITEM_NAME");
				String category=rs.getString("CATEGORY_NAME");
				String discription=rs.getString("DISCRIPTION");
				String registerUser=rs.getString("REGISTER_USER");
				String image=rs.getString("IMAGE");
				int price=rs.getInt("PRICE");
				int stock=rs.getInt("STOCK");
				int sales=rs.getInt("SALES");
				TemporaryItem itemInfo=new TemporaryItem(item_Id,item_Name,category,discription,registerUser,image,price,
						stock,sales);
				searchList.add(itemInfo);
				}					
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		return searchList;
	}
	
	//限界値を追加したキーワード検索メソッド
	//page にどこから表示するか　numに何個表示するかを定める。
	public List<TemporaryItem> ItemSearchLimit(String word,int page,int num) {
		List<TemporaryItem> searchList=new ArrayList();
		
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,IMAGE,PRICE,STOCK,SALES,ITEMS.CREATED_AT,ITEMS.UPDATE_AT FROM ITEMS "
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID"
					+ " WHERE ( ITEM_NAME LIKE ? OR DISCRIPTION LIKE ?) "
					+ " ORDER BY ITEM_ID LIMIT ?,?";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			pStmt.setString(1, "%"+word+"%");
			pStmt.setString(2, "%"+word+"%");
			pStmt.setInt(3, page);
			pStmt.setInt(4,num);
			
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
				searchList.add(itemInfo);
				}					
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		return searchList;
	}
	
	
	//カテゴリー検索を行うメソッド　
	//int型の引数を渡す
	public List<TemporaryItem> CategorySearch(int cate){
		List<TemporaryItem> categoryList=new ArrayList();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,REGISTER_USER,IMAGE,PRICE,STOCK,SALES,ITEMS.CREATED_AT,ITEMS.UPDATE_AT FROM ITEMS"
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID"
					+ " WHERE CATEGORY=? "
					+ " ORDER BY ITEM_ID ";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			pStmt.setInt(1, cate);
			
			ResultSet rs=pStmt.executeQuery();
			
			while(rs.next()) {
				int item_Id=rs.getInt("ITEM_ID");
				String item_Name=rs.getString("ITEM_NAME");
				String category=rs.getString("CATEGORY_NAME");
				String discription=rs.getString("DISCRIPTION");
				String registerUser=rs.getString("REGISTER_USER");
				String image=rs.getString("IMAGE");
				int price=rs.getInt("PRICE");
				int stock=rs.getInt("STOCK");
				int sales=rs.getInt("SALES");
				TemporaryItem itemInfo=new TemporaryItem(item_Id,item_Name,category,discription,registerUser,image,price,
						stock,sales);
				categoryList.add(itemInfo);
				}					
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		return categoryList;
	}
	
	//限界地を追加したカテゴリ検索メソッド
	//page にどこから表示するか、numにどれぐらい表示するかきめる
	public List<TemporaryItem> CategorySearchLimit(int cate,int page,int num){
		List<TemporaryItem> categoryList=new ArrayList();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,REGISTER_USER,IMAGE,PRICE,STOCK,SALES,ITEMS.CREATED_AT,ITEMS.UPDATE_AT FROM ITEMS"
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID"
					+ " WHERE CATEGORY=? "
					+ " ORDER BY ITEM_ID LIMIT ?,?";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			pStmt.setInt(1, cate);
			pStmt.setInt(2, page);
			pStmt.setInt(3, num);
			
			ResultSet rs=pStmt.executeQuery();
			
			while(rs.next()) {
				int item_Id=rs.getInt("ITEM_ID");
				String item_Name=rs.getString("ITEM_NAME");
				String category=rs.getString("CATEGORY_NAME");
				String discription=rs.getString("DISCRIPTION");
				String registerUser=rs.getString("REGISTER_USER");
				String image=rs.getString("IMAGE");
				int price=rs.getInt("PRICE");
				int stock=rs.getInt("STOCK");
				int sales=rs.getInt("SALES");
				TemporaryItem itemInfo=new TemporaryItem(item_Id,item_Name,category,discription,registerUser,image,price,
						stock,sales);
				categoryList.add(itemInfo);
				}					
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		return categoryList;
	}
	
	public List<TemporaryItem> WordandCateSearch(int cate,String word) {
		List<TemporaryItem> categorySearchList=new ArrayList();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,REGISTER_USER,IMAGE,PRICE,STOCK,SALES,ITEMS.CREATED_AT,ITEMS.UPDATE_AT FROM ITEMS"
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
				String registerUser=rs.getString("REGISTER_USER");
				String image=rs.getString("IMAGE");
				int price=rs.getInt("PRICE");
				int stock=rs.getInt("STOCK");
				int sales=rs.getInt("SALES");
				TemporaryItem itemInfo=new TemporaryItem(item_Id,item_Name,category,discription,registerUser,image,price,
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
	public List<TemporaryItem> WordandSearchLimit(int cate,String word,int page,int num) {
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
