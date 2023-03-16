package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.RegisterInfo;

public class SignUpDAO {
	//データベース接続に使用する情報
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";

	public boolean CreateAccount(RegisterInfo user) {

		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}

		try(Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			//INSERT文の準備
			String sql = "INSERT INTO ACCOUNT(USER_ID,USER_NAME,PASSWORD,MAIL,PRIVILEGE)VALUES(?,?,?,?,?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			//?を埋める
			pStmt.setString(1, user.getUserid());
			pStmt.setString(2, user.getUsername());
			pStmt.setString(3, user.getPass());
			pStmt.setString(4, user.getMail());
			pStmt.setString(5, user.getPrivilege());

			//INSERT文の実行
			int result = pStmt.executeUpdate();
			if(result != 1) {
				return false;
			}
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;

	}

}