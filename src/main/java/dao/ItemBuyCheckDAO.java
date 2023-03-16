//商品を買っているかどうか判定するDAO
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemBuyCheckDAO {
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";
	
	//detailテーブルに購入情報があるか調べるメソッド
	//引数として、itemidとuseridを使う予定
	public boolean checkBuy(int item_Id,int id) {
		List<Integer> idList=new ArrayList();
		
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT DETAIL_ID FROM DETAIL JOIN USER_INFO ON  "
					+ " DETAIL.INFO_ID=USER_INFO.INFO_ID "
					+ " WHERE ITEM_ID=? AND USER_INFO.USER_ID=? ";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			pStmt.setInt(1, item_Id);
			pStmt.setInt(2, id);
			
			ResultSet rs=pStmt.executeQuery();
			
			while(rs.next()) {
				int detail_Id=rs.getInt("DETAIL_ID");
				idList.add(detail_Id);
			}
			
			if(idList.size()!=0) {
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
