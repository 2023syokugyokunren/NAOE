package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.Post;

public class PostDAO {
	private final static String JDBC_URL="jdbc:mysql://localhost:3306/naoeshop?characterEncoding=UTF-8&serverTimezone=JST";
	private final static String DB_USER="root";
	private final static String DB_PASS="";
	
	//postテーブルに追加するメソッド
	public boolean insertPost(Post post) {
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}

		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			//INSERT文の準備
			String sql="INSERT INTO POST(USER_ID,ITEM_ID,SCORE,CONTENT) VALUE(?,?,?,?)";
			
			PreparedStatement pStmt=conn.prepareStatement(sql);
			
			pStmt.setInt(1, post.getUser_Id());
			pStmt.setInt(2, post.getItem_Id());
			pStmt.setDouble(3, post.getScore());
			pStmt.setString(4, post.getContent());
			
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
	
	//選択した商品のレビューだけを取得するメソッド 引数:ITEM_ID
	public List<Post> selectPost(int items_Id) {
		List<Post> postList=new ArrayList();
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}

		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT POST_ID, USER_ID,ITEM_ID,SCORE,CONTENT,CREATED_AT FROM POST WHERE ITEM_ID=?";
			PreparedStatement pStmt=conn.prepareStatement(sql);
			
			pStmt.setInt(1, items_Id);
			
			//SELECT文の実行
			ResultSet rs=pStmt.executeQuery();
			
			while(rs.next()) {
				int post_Id=rs.getInt("POST_ID");
				int item_Id=rs.getInt("ITEM_ID");
				int user_Id = rs.getInt("USER_ID");
				int score=rs.getInt("SCORE");
				String content=rs.getString("CONTENT");
				Date date = rs.getDate("CREATED_AT");
				
				Post post=new Post(post_Id,user_Id,item_Id,score,content,date);
				postList.add(0,post);
				}
			
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		return postList;
	}
	
	//スコアの平均を取得するメソッド
	public Post SelectPostAVG(int itemId) {
		Post post=null;
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}

		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT AVG(SCORE) AS AVGSCORE FROM POST WHERE ITEM_ID=?";
			PreparedStatement pStmt=conn.prepareStatement(sql);
			
			pStmt.setInt(1, itemId);
			
			//SELECT文の実行
			ResultSet rs=pStmt.executeQuery();
			
			while(rs.next()) {
				int avgScore=rs.getInt("AVGSCORE");
				post=new Post(avgScore);
				}
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		return post;
	}
	
	//レビューを削除するメソッド
	//第一引数にユーザーid,第二引数にアイテムidを渡す。
	public boolean deletePost(int postid) {
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}

		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			//INSERT文の準備
			String sql="DELETE FROM POST WHERE POST_ID = ?";
			
			PreparedStatement pStmt=conn.prepareStatement(sql);
			
			pStmt.setInt(1, postid);
			
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
	//レビューの1~5のスコアの数を取得するメソッド
	public ArrayList<Integer> allScoreget(int itemId){
		ArrayList<Integer> scoreList=new ArrayList();
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}

		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT COUNT(SCORE=5 OR NULL) AS SCORE5,COUNT(SCORE=4 OR NULL) AS SCORE4,COUNT(SCORE=3 OR NULL) AS SCORE3,"
					+ " COUNT(SCORE=2 OR NULL) AS SCORE2,COUNT(SCORE=1 OR NULL) AS SCORE1 FROM POST WHERE ITEM_ID=?";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			pStmt.setInt(1, itemId);
			
			ResultSet rs=pStmt.executeQuery();
			while(rs.next()) {
				int score5=rs.getInt("SCORE5");
				int score4=rs.getInt("SCORE4");
				int score3=rs.getInt("SCORE3");
				int score2=rs.getInt("SCORE2");
				int score1=rs.getInt("SCORE1");
				scoreList.add(score5);
				scoreList.add(score4);
				scoreList.add(score3);
				scoreList.add(score2);
				scoreList.add(score1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		return scoreList;
	}
	
	//レビューが投稿されているか確認するメソッド
	//レビューがあればTrueを返して、無ければFalseを返す
	public boolean CheckPost(int userId,int itemId) {
		List<Integer> list=new ArrayList();
		//ドライバーが見つからないエラーの場合記述すると治るかもしれない文
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try(Connection conn=DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)){
			String sql="SELECT POST_ID FROM POST WHERE USER_ID=? AND ITEM_ID=?";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			
			pStmt.setInt(1, userId);
			pStmt.setInt(2, itemId);
			
			ResultSet rs=pStmt.executeQuery();
			
			while(rs.next()) {
				int post_Id=rs.getInt("POST_ID");
				list.add(post_Id);
			}
			
			if(list.size()!=0) {
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
