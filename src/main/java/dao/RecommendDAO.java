//おすすめ表示するためのテーブル　Recommendテーブルを操作するためのDAOクラス
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.TemporaryItem;

public class RecommendDAO {
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";
	
	//RECOMMENDテーブルに追加するメソッド
	//引数としてアイテムIDを渡す
	public boolean insertRecommend(int itemId) {
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			//INSERT文の準備
			String sql="INSERT INTO RECOMMEND(ITEM_ID,PRIORITY) VALUES(?,?)";

			PreparedStatement pStmt=conn.prepareStatement(sql);
			
			pStmt.setInt(1, itemId);
			pStmt.setInt(2, 1);
			
			int result=pStmt.executeUpdate();
			if(result!=1) {
				return false;
			}
		}catch(SQLException e) {
			System.out.println("すでに同じ商品が登録されているか入力情報に誤りがございます。お手数ですがもう一度お願いします");
			return false;
		}
		
		return true;
	}
	//RECOMMENDテーブルをアップデートするメソッド
	//引数としてアイテムIDを渡す
	public boolean UpdateRecommend(int itemId) {
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="UPDATE RECOMMEND JOIN ITEMS ON RECOMMEND.ITEM_ID=ITEMS.ITEM_ID SET PRIORITY=PRIORITY+1 WHERE RECOMMEND.ITEM_ID=?";
			PreparedStatement pStmt =conn.prepareStatement(sql);
		
			pStmt.setInt(1, itemId);
			
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
	
	//おすすめテーブルに入れられたアイテムを表示する機能（ITEMSテーブルの名前や、カテゴリなどの情報を取得できるようになっている)
	//第一引数はどこから表示するか、第二引数にどこまで表示するかを決めることができる。
	public List<TemporaryItem> SelectRecommend(int page ,int num){
		List<TemporaryItem> RecommendList=new ArrayList();
		
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEMS.ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,IMAGE,PRICE,STOCK,SALES,RECOMMEND.CREATED_AT,RECOMMEND.UPDATE_AT FROM ITEMS"
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID"
					+ " JOIN RECOMMEND ON ITEMS.ITEM_ID=RECOMMEND.ITEM_ID"
					+ " ORDER BY UPDATE_AT DESC,PRIORITY DESC LIMIT ?,?";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			pStmt.setInt(1, page);
			pStmt.setInt(2, num);
			
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
				//Date created_At=rs.getDate("CREATED_AT");
				//Date update_At=rs.getDate("UPDATE_AT");
				TemporaryItem itemInfo=new TemporaryItem(item_Id,item_Name,category,discription,image,price,
						stock,sales);
				RecommendList.add(itemInfo);
				}	
			
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		return RecommendList;
	}
}
