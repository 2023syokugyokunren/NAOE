package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

public class Post implements Serializable {
	private int post_Id;
	private int user_Id;
	private int item_Id;
	private int score;
	private int avgScore;
	private ArrayList<Integer> allScore;
	private String content;
	private Date created_At;
	
	public Post() {}
	
	//レビュー書込みの際に必要なコンストラクタ
	// レビュー取得
	public Post(int user_Id,int item_Id,int score,String content ) {
		this.user_Id = user_Id;
		this.item_Id=item_Id;
		this.score=score;
		this.content=content;
	}
	
	public Post(int avgScore) {
		this.avgScore=avgScore;
	}
	
	
	//レビュー取得の際に必要なコンストラクタ（スコアの平均も取得できるように）
	public Post(int post_Id, int user_Id,int item_Id,int score,String content, Date created_At) {
		this.post_Id = post_Id;
		this.user_Id=user_Id;
		this.item_Id=item_Id;
		this.score=score;
		this.content=content;
		this.created_At = created_At;
	}
	
	public Post(int post_Id,int user_Id,int item_Id,int score ,int avgScore,String content ,Date created_At ) {
		this.post_Id=post_Id;
		this.user_Id=user_Id;
		this.item_Id=item_Id;
		this.score=score;
		this.avgScore=avgScore;
		this.content=content;
		this.created_At=created_At;
	}

	public int getPost_Id() {
		return post_Id;
	}

	public int getUser_Id() {
		return user_Id;
	}

	public int getItem_Id() {
		return item_Id;
	}

	public int getScore() {
		return score;
	}
	
	public int getAvgScore() {
		return avgScore;
	}

	public String getContent() {
		return content;
	}

	public Date getCreated_At() {
		return created_At;
	}

}
