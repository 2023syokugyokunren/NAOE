package model;

import java.io.Serializable;
import java.util.Date;

public class Detail implements Serializable {
	private String item_Name;
	private String category;
	private String discription;
	private String image;
	private int price;
	private int order_Num;
	private int priceAll;
	private Date order_At;
	
	public Detail(String item_Name,String category,String discription,String image,int price,int order_Num,int priceAll,Date order_At) {
		this.item_Name=item_Name;
		this.category=category;
		this.discription=discription;
		this.image=image;
		this.price=price;
		this.order_Num=order_Num;
		this.priceAll=priceAll;
		this.order_At=order_At;
	}

	public String getItem_Name() {
		return item_Name;
	}

	public String getCategory() {
		return category;
	}

	public String getDiscription() {
		return discription;
	}

	public String getImage() {
		return image;
	}

	public int getPrice() {
		return price;
	}
	
	public int getOrder_Num() {
		return order_Num;
	}

	public int getPriceAll() {
		return priceAll;
	}

	public Date getOrder_At() {
		return order_At;
	}
}
