//購入履歴を取得するメソッド　2/17現在作成中 現在試作品
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.Detail;

public class SelectBuyHistoryDAO {
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";
	
	
	//購入履歴を取得するメソッド 2/17現在試作品なのでまだ使えるか分からない
	public List<Detail> selectBuyHistory(int num){
		List<Detail> BuyList=new ArrayList();
		
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT ITEM_NAME,CATEGORY.CATEGORY_NAME,DISCRIPTION,IMAGE,PRICE,DETAIL.ORDER_AT,DETAIL.ORDER_NUM FROM ITEMS "
					+ " JOIN CATEGORY ON ITEMS.CATEGORY=CATEGORY.CATEGORY_ID "
					+ "JOIN DETAIL ON ITEMS.ITEM_ID=DETAIL.ITEM_ID "
					+ "JOIN USER_INFO ON DETAIL.INFO_ID=USER_INFO.INFO_ID "
					+ "JOIN (SELECT ID FROM ACCOUNT WHERE ID=?)AS ACCOUNT ON USER_INFO.USER_ID=ACCOUNT.ID ";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			pStmt.setInt(1,num);
			
			//SELECT文の実行
			ResultSet rs=pStmt.executeQuery();
			while(rs.next()) {
				String itemName=rs.getString("ITEM_NAME");
				String category=rs.getString("CATEGORY_NAME");
				String discription=rs.getString("DISCRIPTION");
				String image=rs.getString("IMAGE");
				int price=rs.getInt("PRICE");
				int order_Num=rs.getInt("ORDER_NUM");
				int priceAll=price*order_Num;
				Date order_At=rs.getDate("ORDER_AT");
				Detail detail=new Detail(itemName, category, discription, image, price,order_Num, priceAll, order_At);
				BuyList.add(detail);				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		return BuyList;
	}
}
