package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Category;

public class CategoryDAO {

	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";

	public boolean insertCategory(String name,int id) {
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}

		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="INSERT INTO CATEGORY(CATEGORY_NAME,USER_ID) SELECT ?, USER_INFO.USER_ID FROM USER_INFO "
					+ " JOIN (SELECT ID FROM ACCOUNT WHERE ID=?) AS ACCOUNT"
					+ " ON USER_INFO.USER_ID=ACCOUNT.ID ";
			PreparedStatement pStmt=conn.prepareStatement(sql);

			pStmt.setString(1, name);
			pStmt.setInt(2, id);
			System.out.println(name);
			System.out.println(id);

			//INSERT文の実行
			int result=pStmt.executeUpdate();
			System.out.println(result);
			if(result!=1) {
				return false;
			}

		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public List<Category> selectCategory(){
		List<Category> cateList=new ArrayList();
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}

		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT CATEGORY_ID,CATEGORY_NAME FROM CATEGORY";
			PreparedStatement pStmt =conn.prepareStatement(sql);

			//SELECT文の実行
			ResultSet rs=pStmt.executeQuery();
			while(rs.next()) {
				int category_Id=rs.getInt("CATEGORY_ID");
				String category_Name=rs.getString("CATEGORY_NAME");
				Category cate=new Category(category_Id,category_Name);
				cateList.add(cate);
			}

		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		return cateList;
	}
}
