package model;

import java.io.Serializable;

public class Category implements Serializable {
	private int category_Id;
	private String category_Name;
	private int user_Id;
	
	public Category() {}
	public Category(int category_Id, String category_Name) {
		this.category_Id=category_Id;
		this.category_Name=category_Name;
	}
	public int getCategory_Id() {
		return category_Id;
	}
	public String getCategory_Name() {
		return category_Name;
	}
	public int getUser_Id() {
		return user_Id;
	}
}
