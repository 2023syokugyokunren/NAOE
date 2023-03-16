//Favoriteテーブルを操作するDAOクラス
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.TemporaryItem;

public class FavoriteDAO {
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";
	
	//お気に入りを追加するメソッド
	public boolean insertFavorite(int itemId,int userId) {
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			//INSERT文の準備
			String sql="INSERT INTO FAVORITE(ITEM_ID,USER_ID) VALUES(?,?)";
			PreparedStatement pStmt=conn.prepareStatement(sql);
			
			pStmt.setInt(1, itemId);
			pStmt.setInt(2, userId);
			
			//INSERT文の実行
			int result=pStmt.executeUpdate();
			if(result!=1) {
				return false;
			}
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//お気にいりを削除するメソッド
	public boolean deleteFavorite(int itemId,int userId) {
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			//INSERT文の準備
			String sql="DELETE FROM FAVORITE WHERE ITEM_ID=? AND USER_ID=?";
			PreparedStatement pStmt=conn.prepareStatement(sql);
			
			pStmt.setInt(1, itemId);
			pStmt.setInt(2, userId);
		
		//INSERT文の実行
		int result=pStmt.executeUpdate();
		if(result!=1) {
			return false;
		}
	}catch(SQLException e) {
		e.printStackTrace();
		return false;
	}
		return true;
	}
	
	//Favoriteテーブルからユーザーがお気に入りしたアイテム情報を取得するメソッド
	public List<TemporaryItem> SelectFavorite(int userId){
		List<TemporaryItem> favoList=new ArrayList();
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEMS.ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,REGISTER_USER,IMAGE,PRICE,STOCK,SALES,ITEMS.CREATED_AT,ITEMS.UPDATE_AT FROM ITEMS"
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID"
					+ " JOIN FAVORITE ON ITEMS.ITEM_ID=FAVORITE.ITEM_ID "
					+ " JOIN (SELECT ID FROM ACCOUNT WHERE ID=?)AS ACCOUNT "
					+ " ON FAVORITE.USER_ID=ACCOUNT.ID ORDER BY FAVORITE_ID";
			
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			pStmt.setInt(1, userId);
			
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
				favoList.add(itemInfo);
				}	
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		return favoList;
	}
	
	//お気に入りをしているかどうかを判定する
	//あればTRUE,なければFALSEを返す
	public boolean checkFavorite(int itemId,int userId) {
		List<Integer> favoList=new ArrayList();
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT FAVORITE_ID FROM FAVORITE WHERE ITEM_ID=? AND USER_ID=?";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			pStmt.setInt(1, itemId);
			pStmt.setInt(2, userId);
			
			ResultSet rs=pStmt.executeQuery();
			
			while(rs.next()) {
				int favorite_Id=rs.getInt("FAVORITE_ID");
				favoList.add(favorite_Id);
			}
			
			if(favoList.size()!=0) {
				return true;
			}else {
				return false;
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
	
