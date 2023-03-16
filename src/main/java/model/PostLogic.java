package model;

import java.util.ArrayList;
import java.util.List;

import dao.PostDAO;

/**
* レビューに関するメソッドが集まっています
* 
* DisplayReviewメソッド		商品に紐づいたレビューの一覧を表示するメソッド(ItemServlet)
* InsertReviewメソッド		レビューを投稿するメソッド(PostServlet)
* AllScoreGetメソッド		商品の各スコアの数を取得するメソッド(ItemServlet)
*/

public class PostLogic {
	
	/**
	   * DisplayReviewメソッド
	   * 商品に紐づいたレビューを表示するメソッド
	   * @param　int (商品のid)
	   * @return List<Post> Post(user_Id,item_Id,score,content,created);
	   */
	public List<Post> DisplayReview(int item_id) {
		PostDAO dao = new PostDAO();
		List<Post> reviewList = dao.selectPost(item_id);
		
		return reviewList;
	}
	
	/**
	   * InsertReviewメソッド
	   * レビューを投稿する機能
	   * @param　Post(int user_Id,int item_Id,int score,String content )
	   * @return boolean(成功したらTrue,失敗したらFalse)
	   */
	public boolean InsertReview(Post post) {
		PostDAO dao = new PostDAO();
		boolean result = dao.insertPost(post);
		
		return result;
	}
	
	public int DisplayAvgScore(int itemid) {
		PostDAO dao = new PostDAO();
		Post score = dao.SelectPostAVG(itemid);
		int avgScore = score.getAvgScore();
		
		return avgScore;
	}
	
	public boolean DeletePost(int postid) {
		PostDAO dao = new PostDAO();
		boolean result = dao.deletePost(postid);
		
		return result;
	}
	
	/* AllScoreGetメソッド
	 * それぞれのスコアの数を取得するメソッド
	 * 
	 * @param　int itemId(商品のID)
	 * @return ArrayList<Integer>
	 */
	
	public ArrayList<Integer> AllScoreGet(int itemId){
		PostDAO dao=new PostDAO();
		ArrayList<Integer> scoreList=dao.allScoreget(itemId);
		
		return scoreList;
	}
	
	/*
	 * CheckPostメソッド
	 * レビューが投稿されているか確認するメソッド
	 * @param int userId(アカウントのid),itemId(商品のID)
	 * @return boolean(レビューがすでにあればTrue,無ければfalse)
	*/
	public boolean CheckPost(int userId,int itemId) {
		PostDAO dao=new PostDAO();
		boolean result=dao.CheckPost(userId, itemId);
		
		return result;
	}
}
