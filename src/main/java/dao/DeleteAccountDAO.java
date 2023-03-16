//idで渡した行の情報を削除するメソッド
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteAccountDAO {
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";
	
	public boolean deleteAccount(int number) {
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			//DELETE文の準備
			String sql="DELETE FROM ACCOUNT WHERE ID=?";
			PreparedStatement pStmt=conn.prepareStatement(sql);
			
			//?を埋める
			pStmt.setInt(1, number);
			
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
