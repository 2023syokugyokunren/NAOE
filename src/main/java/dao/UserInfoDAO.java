//UserInfoに関するDAOクラス
//3つのメソッドがあり、情報を取得するメソッド、情報を変更するメソッド、情報を追加するメソッドがある。
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class UserInfoDAO {
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";
	
	//データベースから引数のIDにあったデータがあれば持ってくるメソッド
	public List<User> userInfoSelect(User user){
		List<User> userInfoList =new ArrayList();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT USER_ID,POST_CODE,ADDRESS,TEL FROM USER_INFO WHERE USER_ID=?";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			pStmt.setInt(1, user.getId());
			
			ResultSet rs=pStmt.executeQuery();
			
			while(rs.next()) {
				
				int id=rs.getInt("USER_ID");
				int post_Code=rs.getInt("POST_CODE");
				String address=rs.getString("ADDRESS");
				String tel=rs.getString("TEL");
				
				User userInfo=new User(id,post_Code,address,tel);
				userInfoList.add(userInfo);	
			}			
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}		
		return userInfoList;
	}
	
	//引数のIDの箇所の情報を変更するメソッド
	public boolean userInfoUpdate(User user) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="UPDATE USER_INFO SET POST_CODE=?,ADDRESS=?,TEL=? WHERE USER_ID=?";
			PreparedStatement pStmt=conn.prepareStatement(sql);
			
			pStmt.setInt(1, user.getPost_Code());
			pStmt.setString(2, user.getAddress());
			pStmt.setString(3, user.getTel());
			pStmt.setInt(4, user.getId());
			
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
	
	//引数で貰ったIDでデータを追加するメソッド
	public boolean userInfoInsert(User user) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="INSERT INTO USER_INFO(USER_ID,POST_CODE,ADDRESS,TEL) VALUE(?,?,?,?)";
			PreparedStatement pStmt=conn.prepareStatement(sql);
			pStmt.setInt(1, user.getId());
			pStmt.setInt(2, user.getPost_Code());
			pStmt.setString(3, user.getAddress());
			pStmt.setString(4,user.getTel());
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
