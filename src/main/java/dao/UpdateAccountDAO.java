//アカウントテーブルの情報を変更するDAOクラス
//idで渡した行の値を変更する
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.User;

public class UpdateAccountDAO {
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";
	
	public boolean updateAccount(User user) {
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			//UPDATE文の準備
			String sql="UPDATE ACCOUNT SET USER_ID=?,USER_NAME=?,PASSWORD=?,MAIL=?,PRIVILEGE=? WHERE ID=?";
			PreparedStatement pStmt=conn.prepareStatement(sql);
			
			//?を埋める
			pStmt.setString(1, user.getUser_Id());
			pStmt.setString(2, user.getUser_Name());
			pStmt.setString(3, user.getPass());
			pStmt.setString(4, user.getMail());
			pStmt.setString(5, user.getPrivilege());
			pStmt.setInt(6, user.getId());
			
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
	
	//お金チャージ機能
	public boolean chargeMoney(int money,int id) {
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			//UPDATE文の準備
			String sql="UPDATE ACCOUNT SET MONEY=MONEY+? WHERE ID=?";
			PreparedStatement pStmt=conn.prepareStatement(sql);
			
			//?を埋める
			pStmt.setInt(1, money);
			pStmt.setInt(2, id);
			
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
