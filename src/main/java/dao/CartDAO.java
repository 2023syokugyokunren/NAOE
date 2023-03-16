//カート情報を追加するメソッド
//3/3 お金機能追加途中　今現在トランザクション機能追加している途中　SQL教科書のP285を参考に
//月曜日にまたやる
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Cart;
import model.TemporaryItem;

public class CartDAO {
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";
	
	
	//detailテーブルに追加するメソッド
	//引数としてmodelのCart型の引数と、int型の引数を用いる
	public boolean insertCart(Cart cart,int id) {

		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		ArrayList<Integer> numInfo=cart.getQuantity();
		int i = 0;
		
		for(TemporaryItem cartInfo:cart.getThingsInCart()) {
			// ArrayList<Integer> numInfo=cart.getQuantity();
			
			try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
				//INSERT文の準備
				String sql="INSERT INTO DETAIL(ITEM_ID,INFO_ID,ORDER_NUM) SELECT ?,USER_INFO.INFO_ID,? FROM USER_INFO "
						+ " JOIN (SELECT ID FROM ACCOUNT WHERE ID=?) AS ACCOUNT "
						+ " ON USER_INFO.USER_ID=ACCOUNT.ID ";
				
				PreparedStatement pStmt=conn.prepareStatement(sql);
				
				pStmt.setInt(1, cartInfo.getId());
				pStmt.setInt(2, numInfo.get(i));
				pStmt.setInt(3, id);
				
				int result = pStmt.executeUpdate();
				if(result != 1) {
					return false;
					
				}else {
					String sql2="UPDATE ITEMS SET STOCK=STOCK-?, SALES=SALES+? WHERE ITEM_ID=?" ;
					PreparedStatement pStmt2=conn.prepareStatement(sql2);
					
					pStmt2.setInt(1, numInfo.get(i));
					pStmt2.setInt(2, numInfo.get(i));
					pStmt2.setInt(3, cartInfo.getId());
					
					int result2=pStmt2.executeUpdate();
					
					if(result2 != 1) {
						return false;
					}
				}
				
				}catch(SQLException e) {
					e.printStackTrace();
					return false;
				}
				i++;
			}
			return true;
		}
	
	
	//detailテーブルに追加するメソッド
	//引数としてmodelのCart型の引数と、int型の引数を用いる
	public boolean insertMoneyCart(Cart cart,int id) {
		

		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		int i=0;
		for(TemporaryItem cartInfo:cart.getThingsInCart()) {
			ArrayList<Integer> numInfo=cart.getQuantity();
			try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
				conn.setAutoCommit(false);
				//INSERT文の準備
				String sql="INSERT INTO DETAIL(ITEM_ID,INFO_ID,ORDER_NUM) SELECT ?,USER_INFO.INFO_ID,? FROM USER_INFO"
						+ " JOIN (SELECT ID FROM ACCOUNT WHERE ID=?) AS ACCOUNT"
						+ " ON USER_INFO.USER_ID=ACCOUNT.ID ";


				PreparedStatement pStmt=conn.prepareStatement(sql);
				
				pStmt.setInt(1, cartInfo.getId());
				pStmt.setInt(2, numInfo.get(i));
				pStmt.setInt(3, id);
				
				int result=pStmt.executeUpdate();
				if(result!=1) {
					System.out.println("aaa");
					return false;
				}else {
					String sql2="UPDATE ITEMS SET STOCK=STOCK-?, SALES=SALES+? WHERE ITEM_ID=?";

					PreparedStatement pStmt2=conn.prepareStatement(sql2);
	
					pStmt2.setInt(1, numInfo.get(i));
					pStmt2.setInt(2, numInfo.get(i));
					pStmt2.setInt(3, cartInfo.getId());
										
					int result2=pStmt2.executeUpdate();
					if(result2!=1) {
						System.out.println("bbb");
						return false;
					}else {
						String sql3="UPDATE ACCOUNT SET MONEY=MONEY-? WHERE ID=?";
						PreparedStatement pStmt3=conn.prepareStatement(sql3);
						
						int all=numInfo.get(i)*cartInfo.getPrice();
						
						pStmt3.setInt(1, all);
						pStmt3.setInt(2, id);
												
						int result3=pStmt3.executeUpdate();
						if(result3!=1) {
							System.out.println("ccc");
							return false;
						}
					}
				}
				conn.commit();
				//ここから下はよくわからん　助けて
				//今エラー出てないのでこれでやってます
				}catch(SQLException e) {
					try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
						conn.rollback();
					}catch(SQLException e2) {
						e2.printStackTrace();
						return false;
					}
				}finally {
					try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
					if(conn !=null) {
					}
						}catch(SQLException e4) {
							e4.printStackTrace();
							return false;
						}
					
	                try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
	                    // オートコミット有効化
	                    conn.setAutoCommit(true);
	                    // データベース接続の切断
	                    conn.close();
	                } catch(SQLException e3) {
	                    // スタックトレースを出力
	                    e3.printStackTrace();
	                    return false;
	                }
					} 
				}
				i++;
		return true;
	}
}
