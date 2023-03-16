//テーブルitemsから情報を取得するDAOクラス
//CreateItemListがデータベースから情報を取得し、itemListに格納するメソッド
//SelectItemが指定した数値のitem_idで検索してデータを取得するメソッド
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.TemporaryItem;

public class SelectItemDAO {
	
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";
	
	//全てのアイテム情報を取得するメソッド
	public List<TemporaryItem> CreateItemList() {
		List<TemporaryItem> itemList=new ArrayList();
		
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,REGISTER_USER,IMAGE,PRICE,STOCK,SALES,ITEMS.CREATED_AT,ITEMS.UPDATE_AT FROM ITEMS "
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID"
					+ " ORDER BY ITEM_ID";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			ResultSet rs=pStmt.executeQuery();
			
			while(rs.next()) {
				int item_Id=rs.getInt("ITEM_ID");
				String item_Name=rs.getString("ITEM_NAME");
				String category=rs.getString("CATEGORY_NAME");
				String discription=rs.getString("DISCRIPTION");
				String registerUser = rs.getString("REGISTER_USER");
				String image=rs.getString("IMAGE");
				int price=rs.getInt("PRICE");
				int stock=rs.getInt("STOCK");
				int sales=rs.getInt("SALES");
				//Date created_At=rs.getDate("CREATED_AT");
				//Date update_At=rs.getDate("UPDATE_AT");
				TemporaryItem itemInfo=new TemporaryItem(item_Id,item_Name,category,discription,registerUser,image,price,
						stock,sales);
				itemList.add(itemInfo);
				}					
			}catch(SQLException e) {
				e.printStackTrace();
				return null;
			}
			return itemList;
	}
	
	//全ての商品を限界地まで表示する
	//実際にはitem_id順でとってきた物に指定された値までの数の情報を取得
	public List<TemporaryItem> CreateItemListLimit(int page,int num) {
		List<TemporaryItem> itemList=new ArrayList();
		
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,REGISTER_USER,IMAGE,PRICE,STOCK,SALES,ITEMS.CREATED_AT,ITEMS.UPDATE_AT FROM ITEMS "
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID"
					+ " ORDER BY ITEM_ID LIMIT ?,?";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			pStmt.setInt(1, page);
			pStmt.setInt(2, num);
			
			ResultSet rs=pStmt.executeQuery();
			
			while(rs.next()) {
				int item_Id=rs.getInt("ITEM_ID");
				String item_Name=rs.getString("ITEM_NAME");
				String category=rs.getString("CATEGORY_NAME");
				String discription=rs.getString("DISCRIPTION");
				String registerUser = rs.getString("REGISTER_USER");
				String image=rs.getString("IMAGE");
				int price=rs.getInt("PRICE");
				int stock=rs.getInt("STOCK");
				int sales=rs.getInt("SALES");
				//Date created_At=rs.getDate("CREATED_AT");
				//Date update_At=rs.getDate("UPDATE_AT");
				TemporaryItem itemInfo=new TemporaryItem(item_Id,item_Name,category,discription,registerUser,image,price,
						stock,sales);
				itemList.add(itemInfo);
				}					
			}catch(SQLException e) {
				e.printStackTrace();
				return null;
			}
			return itemList;
	}
	
	
	
	//指定された数値からアイテム情報を取得するメソッド
	public TemporaryItem SelectItem(int num) {
		TemporaryItem itemInfo=null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,REGISTER_USER,IMAGE,PRICE,STOCK,SALES,ITEMS.CREATED_AT,ITEMS.UPDATE_AT FROM ITEMS "
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID"
					+ " WHERE ITEM_ID=?";
			PreparedStatement pStmt=conn.prepareStatement(sql);
			pStmt.setInt(1, num);
		
			//SELECT文の実行
			ResultSet rs=pStmt.executeQuery();
			if(rs.next()) {
				//結果表からデータ取得
				int item_Id=rs.getInt("ITEM_ID");
				String item_Name=rs.getString("ITEM_NAME");
				String category=rs.getString("CATEGORY_NAME");
				String discription=rs.getString("DISCRIPTION");
				String registerUser = rs.getString("REGISTER_USER");
				String image=rs.getString("IMAGE");
				int price=rs.getInt("PRICE");
				int stock=rs.getInt("STOCK");
				int sales=rs.getInt("SALES");
				//Date created_At=rs.getDate("CREATED_AT");
				//Date update_At=rs.getDate("UPDATE_AT");
				itemInfo=new TemporaryItem(item_Id, item_Name, category, discription,registerUser,image, price, stock,
						sales);
			}		
		}catch(SQLException e2) {
			e2.printStackTrace();
			return null;
		}
		return itemInfo;		
	}
	
	
	//2/24試作　アイテム情報を売れてる順で取得するメソッド
	public List<TemporaryItem> selectItemRanking(){
		List<TemporaryItem> itemList=new ArrayList();
		
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,REGISTER_USER,IMAGE,PRICE,STOCK,SALES,ITEMS.CREATED_AT,ITEMS.UPDATE_AT FROM ITEMS "
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID"
					+ " ORDER BY SALES DESC";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
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
				//Date created_At=rs.getDate("CREATED_AT");
				//Date update_At=rs.getDate("UPDATE_AT");
				TemporaryItem itemInfo=new TemporaryItem(item_Id,item_Name,category,discription,registerUser,image,price,
						stock,sales);
				itemList.add(itemInfo);
				}					
			}catch(SQLException e) {
				e.printStackTrace();
				return null;
			}
			return itemList;
	}
	
	//管理者画面にてアイテム順やカテゴリ順で表示するためのメソッド　3/2試作開始
	//管理者順で並べたい場合はIDという文字列を渡せばいい
	//keyに順にしたいカテゴリ、sortには昇順か降順かをASC,DESCを引数にすれば良い
	public List<TemporaryItem> selectItemSort(String key,String sort){
		List<TemporaryItem> itemList=new ArrayList();
		
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,REGISTER_USER,IMAGE,PRICE,STOCK,SALES,ITEMS.CREATED_AT,ITEMS.UPDATE_AT FROM ITEMS "
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID "
					+ " JOIN ACCOUNT ON ITEMS.REGISTER_USER=ACCOUNT.USER_NAME "
					+ " ORDER BY "+key+" "+sort;
			
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			ResultSet rs=pStmt.executeQuery();
			
			while(rs.next()) {
				int item_Id=rs.getInt("ITEM_ID");
				String item_Name=rs.getString("ITEM_NAME");
				String category=rs.getString("CATEGORY_NAME");
				String discription=rs.getString("DISCRIPTION");
				String registerUser = rs.getString("REGISTER_USER");
				String image=rs.getString("IMAGE");
				int price=rs.getInt("PRICE");
				int stock=rs.getInt("STOCK");
				int sales=rs.getInt("SALES");
				//Date created_At=rs.getDate("CREATED_AT");
				//Date update_At=rs.getDate("UPDATE_AT");
				TemporaryItem itemInfo=new TemporaryItem(item_Id,item_Name,category,discription,registerUser,image,price,
						stock,sales);
				itemList.add(itemInfo);
				}					
			}catch(SQLException e) {
				e.printStackTrace();
				return null;
			}
			return itemList;
	}
	
	//全てのデータの上位５位を取得するメソッド
	public List<TemporaryItem> selectRank(int page,int num){
		List<TemporaryItem> cateRankList=new ArrayList();	
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,REGISTER_USER,IMAGE,PRICE,STOCK,SALES,ITEMS.CREATED_AT,ITEMS.UPDATE_AT FROM ITEMS"
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID "
					+ " ORDER BY SALES DESC "
					+ " LIMIT ?,?";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			pStmt.setInt(1, page);
			pStmt.setInt(2, num);
			
			ResultSet rs=pStmt.executeQuery();
			
			while(rs.next()) {
				int item_Id=rs.getInt("ITEM_ID");
				String item_Name=rs.getString("ITEM_NAME");
				String category=rs.getString("CATEGORY_NAME");
				String discription=rs.getString("DISCRIPTION");
				String registerUser = rs.getString("REGISTER_USER");
				String image=rs.getString("IMAGE");
				int price=rs.getInt("PRICE");
				int stock=rs.getInt("STOCK");
				int sales=rs.getInt("SALES");
				//Date created_At=rs.getDate("CREATED_AT");
				//Date update_At=rs.getDate("UPDATE_AT");
				TemporaryItem itemInfo=new TemporaryItem(item_Id,item_Name,category,discription,registerUser,image,price,
						stock,sales);
				cateRankList.add(itemInfo);
				}	
			
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		return cateRankList;
	}
	
	//カテゴリごとの上位5位のデータを取得するメソッド
	public List<TemporaryItem> selectCategoryRank(int cate, int page,int num){
		List<TemporaryItem> cateRankList=new ArrayList();	
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,REGISTER_USER,IMAGE,PRICE,STOCK,SALES,ITEMS.CREATED_AT,ITEMS.UPDATE_AT FROM ITEMS"
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID "
					+ " WHERE CATEGORY=? ORDER BY SALES DESC "
					+ " LIMIT ?,?";
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
				String registerUser = rs.getString("REGISTER_USER");
				String image=rs.getString("IMAGE");
				int price=rs.getInt("PRICE");
				int stock=rs.getInt("STOCK");
				int sales=rs.getInt("SALES");
				//Date created_At=rs.getDate("CREATED_AT");
				//Date update_At=rs.getDate("UPDATE_AT");
				TemporaryItem itemInfo=new TemporaryItem(item_Id,item_Name,category,discription,registerUser,image,price,
						stock,sales);
				cateRankList.add(itemInfo);
				}	
			
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		return cateRankList;
	}
}
