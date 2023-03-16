//Item_Idの箇所を、渡した値に変更するメソッド
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.TemporaryItem;

public class UpdateItemDAO {
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";
	
	public boolean updateItem(TemporaryItem itemInfo) {
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			//UPDATE文の準備
			String sql="UPDATE ITEMS SET ITEM_NAME=?,CATEGORY=?,DISCRIPTION=?,IMAGE=?,PRICE=?,STOCK=? WHERE ITEM_ID=?";
			PreparedStatement pStmt=conn.prepareStatement(sql);
			
			//?を埋める
			pStmt.setString(1, itemInfo.getItem());
			pStmt.setString(2, itemInfo.getCategory());
			pStmt.setString(3, itemInfo.getDiscription());
			pStmt.setString(4, itemInfo.getImage());
			pStmt.setInt(5, itemInfo.getPrice());
			pStmt.setInt(6, itemInfo.getStock());			
			pStmt.setInt(7, itemInfo.getId());
			
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
}
