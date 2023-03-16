package model;

import java.util.ArrayList;

import dao.CartDAO;

/**
 * カートを作成し、中身を変更するメソッドが集まっています。
 * 
 * MakeNewCartメソッド			カートを作成し商品とその数を入れるメソッド(purchaseServlet)
 * PutItemInCartメソッド		既存カートに商品を追加するメソッド(purchaseServlet)
 * TotalPriceメソッド			カート内のアイテムの合計金額を計算するメソッド(purchaseServlet,DeleteTemporaryItem)
 * ChangeStockメソッド			購入された商品の在庫数・売り上げ個数を変更するメソッド(purchaseServlet)
 * MakeRandomNumbersメソッド	ランダムな変数を作成するメソッド(cartInfo.jsp,ItemDetail.jsp)
 * DeleteTemporaryItemメソッド	カート内の商品を削除するメソッド(changeCartServlet)
 */

public class CartControlLogic {
	
	/**
	 * MakeNewCartメソッド
	 * カートを作成し商品とその数を入れるメソッド
	 * @param TemporaryItem
	 * @param int
	 * @return Cart
	 */
	public Cart MakeNewCart(TemporaryItem things, int quantity) {
		
		 ArrayList<TemporaryItem> thingsInCart = new ArrayList<TemporaryItem>();
		 ArrayList<Integer> quantityInCart = new ArrayList<Integer>();
		 Integer quantityInteger = quantity;
		 
		 thingsInCart.add(things);
		 quantityInCart.add(quantityInteger);
		 
		 Cart cart = new Cart();
		 cart.setThingsInCart(thingsInCart);
		 cart.setQuantity(quantityInCart);
		 
		 return cart;
	 }
	
	/**
	 * PutItemInCartメソッド
	 * 既存カートに商品を追加するメソッド
	 * @param TemporaryItem
	 * @param int
	 * @param Cart
	 * @return Cart
	 */
	public Cart PutItemInCart(TemporaryItem things, int quantity, Cart cart) {
		ArrayList<TemporaryItem> existingCart = cart.getThingsInCart();
		ArrayList<Integer> existingQuantity = cart.getQuantity();
		
		if(existingCart.contains(things)) {
			
			int existingItemNumber = existingCart.indexOf(things);
			Integer existingQuantityNumber = existingQuantity.get(existingItemNumber);
			Integer quantityInteger = quantity;
			existingQuantityNumber += quantityInteger;
			existingQuantity.set(existingItemNumber, existingQuantityNumber);
			
		} else {
			existingCart.add(things);
			Integer quantityInteger = quantity;
			existingQuantity.add(quantityInteger);
			cart.setThingsInCart(existingCart);
			cart.setQuantity(existingQuantity);
		}
		
		return cart;
	}
	
	/**
	 * TotalPriceメソッド
	 * カート内のアイテムの合計金額を計算するメソッド
	 * @param Cart
	 */
	 public void TotalPrice(Cart cart) {
		 
		 int total = 0;
		 ArrayList<TemporaryItem> totalThings = cart.getThingsInCart();
		 ArrayList<Integer> totalQuantity = cart.getQuantity();
		 
		 for(int i = 0; i < totalQuantity.size(); i++) {
			 int oneItemTotal = totalThings.get(i).getPrice() * totalQuantity.get(i);
			 total += oneItemTotal;
		 }
		 
		 cart.setPricetotal(total);
	 }
	 
	 /**
	  * ChangeStockメソッド
	  * 購入された商品の在庫数・売り上げ個数を変更するメソッド
	  * @param Cart
	  * @param int
	  * @return boolean
	  */
	 public boolean ChangeStock(Cart cart,int id) {
		 
		 CartDAO dao=new CartDAO();
		 boolean buy=dao.insertCart(cart, id);
		 
		 return buy;
	 }
	 
	 /*
	  * ChangeStockAndMoneyメソッド
	  * 購入された商品の在庫数・売り上げ個数を変更するメソッド
	  * @param Cart
	  * @param int
	  * @return boolean
	  */
	 public boolean ChangeStockAndMoney(Cart cart,int id) {
		 CartDAO dao=new CartDAO();
		 boolean buy=dao.insertMoneyCart(cart, id);
		 
		 return buy;
	 }
	 
	 /**
	  * MakeRandomNumbersメソッド
	  * ランダムな変数を作成するメソッド
	  * @return int
	  */
	 public int MakeRandomNumbers() {
		 
		 int token = (int) (Math.random() * 1000000000);
		 
		 return token;
	 }
	 
	 /**
	  * DeleteTemporaryItemメソッド
	  * カート内の商品を削除するメソッド
	  * @param Cart
	  * @param int
	  * @return Cart
	  */
		public Cart DeleteTemporaryItem(Cart cart, int number) {
			
			ArrayList<TemporaryItem> thingsInCart = cart.getThingsInCart();
			ArrayList<Integer> quantity =cart.getQuantity();
			
			if(thingsInCart.size() != 0) {
				thingsInCart.remove(number);
				quantity.remove(number);
			}
			cart.setThingsInCart(thingsInCart);
			cart.setQuantity(quantity);
			
			CartControlLogic changePlice = new CartControlLogic();
			changePlice.TotalPrice(cart);
			
			return cart;
		}
}

