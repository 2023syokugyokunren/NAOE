package model;

import java.io.Serializable;

public class TemporaryItem implements Serializable {
	private int id;
	private String item;
	private int price;
	private String category;
	private int order;
	private String image;
	private String discription;
	private int stock;
	private String registerUser;
	
	/**
	   * DisplayAllItemメソッド(すべての商品表示)で、返り値として渡されるときに使うコンストラクタ
	   * @see DsiplayItemLogic#DisplayAllItem()
	   */
	public TemporaryItem(int id,String item, String category, String discription, String registerUser, String image, int price,int stock, int order) {
		super();
		this.id = id;
		this.item = item;
		this.price = price;
		this.category = category;
		this.registerUser = registerUser;
		this.order = order;
		this.image = image;
		this.discription = discription;
		this.stock = stock;
	}
	
	/**
	   * UpdateItemメソッド(商品変更)で、値をDAOに渡すときに使うコンストラクタ
	   * @see AdminControlLogic#UpdateItem(TemporaryItem)
	   * 
	   * DisplayItemOrderRankingメソッド(ランキング表示)で、返り値として渡されるときに使うコンストラクタ
	   * @see DisplayItemLogic#DisplayItemOrderRanking()
	   * 
	   * DisplayItemInfoメソッド(商品詳細表示)で返り値として渡されるときに使うコンストラクタ
	   * @see DisplayItemLogic#DisplayItemInfo(int)
	   */
	public TemporaryItem(int id,String item, String category, String discription,String image, int price,int stock, int order) {
		super();
		this.id = id;
		this.item = item;
		this.price = price;
		this.category = category;
		this.order = order;
		this.image = image;
		this.discription = discription;
		this.stock = stock;
	}
	
	/**
	   * InsertItemメソッド（商品追加）で、値をDAOに渡すときに使うコンストラクタ
	   * @see AdminControlLogic#InsertItem(TemporaryItem,items  User user)
	   */
	public TemporaryItem(String item,String category, String discription,String image, int price, int stock) {
		super();
		this.item = item;
		this.category = category;
		this.discription = discription;
		this.image = image;
		this.price = price;
		this.stock = stock;
	}
	
	public boolean equals(Object o) {
		if (this == o) {
			return true;
			}
		if (o instanceof TemporaryItem) {
			TemporaryItem item = (TemporaryItem) o;
			if (this.getId() == item.getId()) {
				return true;
			}
		}
		return false;
		
	}
	
	public int getId() {
		return id;
	}
	
	public String getItem() {
		return item;
	}
	public int getPrice() {
		return price;
	}
	public String getCategory() {
		return category;
	}
	public int getOrder() {
		return order;
	}
	public String getImage() {
		return image;
	}
	public String getDiscription() {
		return discription;
	}
	public int getStock() {
		return stock;
	}
	public String getRegisterUser() {
		return registerUser;
	}
		
}
