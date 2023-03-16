//購入後に同じカテゴリのアイテムを表示する用のDAO
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.TemporaryItem;

public class CategoryItemDAO {
	
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";
	
	//第一引数で指定したカテゴリーと同じカテゴリーの物を表示且つ、第二引数で指定したid(この場合購入した商品のitem_id)を除外して取得できる
	public List<TemporaryItem> CategoryBuy(int cate,int id){
		List<TemporaryItem> cateList=new ArrayList();
		
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEM_ID,ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,IMAGE,PRICE,STOCK,SALES,ITEMS.CREATED_AT,ITEMS.UPDATE_AT FROM ITEMS "
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID"
					+ " WHERE CATEGORY=? AND ITEM_ID NOT IN (?) "
					+ " ORDER BY ITEM_ID ";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			pStmt.setInt(1, cate);
			pStmt.setInt(2, id);
			
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
				TemporaryItem itemInfo=new TemporaryItem(item_Id,item_Name,category,discription,image,price,
						stock,sales);
				cateList.add(itemInfo);
				}					
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}

		return cateList;
	}
}
