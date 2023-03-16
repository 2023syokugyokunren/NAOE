package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Login;
import model.User;

public class AccountDAO {
	//データベース接続に使用する情報
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";
	
	public User findByLogin(Login login) {
		User user=null;
		
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}

		//データーベースへ接続
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			//SELCET文を準備
			String sql= "SELECT ID,USER_ID,USER_NAME,PASSWORD,MAIL,MONEY,PRIVILEGE FROM ACCOUNT WHERE USER_ID=? AND PASSWORD=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, login.getUserId());
			pStmt.setString(2, login.getPass());
			
			//SELECT文を実行し、結果表を取得
			ResultSet rs=pStmt.executeQuery();
			
			//一致したユーザーが存在した場合
			//そのユーザーが表すAccountインスタンスを生成
			if(rs.next()) {
				//結果表からデータを取得
				int id = rs.getInt("ID");
				String userId = rs.getString("USER_ID");
				String name = rs.getString("USER_NAME");
				String pass = rs.getString("PASSWORD");
				String mail = rs.getString("MAIL");
				int money=rs.getInt("MONEY");
				String privilege = rs.getString("PRIVILEGE");
				
				user = new User(id,userId,name,pass,mail,money,privilege);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}return user;	
	}
	//userIdが被っているかのチェック
	public boolean CheckUserId(String userId) {
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}

		//データーベースへ接続
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			List<String> user=new ArrayList();
			//SELCET文を準備
			String sql= "SELECT USER_ID FROM ACCOUNT WHERE USER_ID=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, userId);
			
			//SELECT文を実行し、結果表を取得
			ResultSet rs=pStmt.executeQuery();
			
			if(rs.next()) {
				String user_Id=rs.getString("USER_ID");
				user.add(user_Id);
			}
			
			if(user.size()==0) {
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
