package model;

import java.io.Serializable;
import java.util.ArrayList;

public class Cart implements Serializable {
//フィールド
	private ArrayList<TemporaryItem> thingsInCart; // 商品そのもの
	private ArrayList<Integer> quantity;		// その個数
	private int Pricetotal;
//コンストラクタ
	public Cart() {}
//メソッド
	public ArrayList<TemporaryItem> getThingsInCart() {
		return thingsInCart;
	}
	public void setThingsInCart(ArrayList<TemporaryItem> thingsInCart) {
		this.thingsInCart = thingsInCart;
	}
	public ArrayList<Integer> getQuantity() {
		return quantity;
	}
	public void setQuantity(ArrayList<Integer> quantity) {
		this.quantity = quantity;
	}
	public int getPricetotal() {
		return Pricetotal;
	}
	public void setPricetotal(int pricetotal) {
		Pricetotal = pricetotal;
	}
	
}
