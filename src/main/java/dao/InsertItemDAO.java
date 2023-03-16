//テーブルitemsに新規登録するためのDAOクラス
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.TemporaryItem;
import model.User;

public class InsertItemDAO {
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";
	
	public boolean insertItem(TemporaryItem itemInfo,User user) {
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			//INSERT文の準備
			String sql="INSERT INTO ITEMS(ITEM_NAME,CATEGORY,DISCRIPTION,REGISTER_USER,IMAGE,PRICE,STOCK)VALUES(?,?,?,?,?,?,?)";
			PreparedStatement pStmt=conn.prepareStatement(sql);
			
			//?を埋める
			pStmt.setString(1, itemInfo.getItem());
			pStmt.setString(2, itemInfo.getCategory());
			pStmt.setString(3, itemInfo.getDiscription());
			pStmt.setString(4, user.getUser_Name());
			pStmt.setString(5, itemInfo.getImage());
			pStmt.setInt(6, itemInfo.getPrice());
			pStmt.setInt(7, itemInfo.getStock());
			
			//INSERT文の実行
			int result=pStmt.executeUpdate();
			if(result!=1) {
				return false;
			}
		
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	
}
