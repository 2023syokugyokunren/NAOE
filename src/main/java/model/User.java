package model;

public class User {
//フィールド
	private int id;
	private String user_Id;
	private String user_Name;
	private String pass;
	private String mail;
	private String privilege;
	private int post_Code;
	private String address;
	private String tel;
	private int money;
	
//コンストラクタ
	
	public User() {}
	
	//DELETE用のコンストラクタ
	public User(int id) {
		this.id=id;
	}
	
	//アカウント作成、ログインなどのコンストラクタ
	public User(String user_Id,String user_Name,String pass,String mail,String privilege) {
		this.user_Id=user_Id;
		this.user_Name=user_Name;
		this.pass=pass;
		this.mail=mail;
		this.privilege=privilege;
	}
	public User(int id,String user_Id,String user_Name,String pass,String mail,int money ,String privilege) {
		this.id=id;
		this.user_Id=user_Id;
		this.user_Name=user_Name;
		this.pass=pass;
		this.mail=mail;
		this.money = money;
		this.privilege=privilege;
	}
	
	//UPDATE用のコンストラクタ　2/16日に追加
	public User(int id,String user_Id,String user_Name,String pass,String mail,String privilege) {
		this.id=id;
		this.user_Id=user_Id;
		this.user_Name=user_Name;
		this.pass=pass;
		this.mail=mail;
		this.privilege=privilege;
	}
	
	/**
	* DisplayUserAddressメソッド（登録先表示）で、返り値として使うコンストラクタ
	* @see UserInfoLogic#DisplayUserAddress(User)
	* 
	* InsertUserAddressメソッド(住所登録)で、引数に渡すコンストラクタ
	* @see UserInfoLogic#InsertUserAddress(User)
	* 
	* UpdateUserAddressメソッド（登録先住所変更)で、引数に渡すコンストラクタ
	* @see UserInfoLogic#UpdateUserAddress(User)
	*/
	public User(int id,int post_Code,String address,String tel) {
		this.id=id;
		this.post_Code=post_Code;
		this.address=address;
		this.tel=tel;
	}
	public User(int id,String user_Id,int post_Code,String address,String tel) {
		this.id=id;
		this.user_Id=user_Id;
		this.post_Code=post_Code;
		this.address=address;
		this.tel=tel;
	}
	
	public User(int id,String user_Id,String user_Name,String pass,String mail,String privilege,int post_Code,String address,String tel) {
		this.id=id;
		this.user_Id=user_Id;
		this.user_Name=user_Name;
		this.pass=pass;
		this.mail=mail;
		this.privilege=privilege;
		this.post_Code=post_Code;
		this.address=address;
		this.tel=tel;
	}

	//メソッド
	public int getId() {
		return id;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public String getUser_Name() {
		return user_Name;
	}

	public String getPass() {
		return pass;
	}

	public String getMail() {
		return mail;
	}

	public String getPrivilege() {
		return privilege;
	}

	public int getPost_Code() {
		return post_Code;
	}

	public String getAddress() {
		return address;
	}

	public String getTel() {
		return tel;
	}
	
	public int getMoney() {
		return money;
	}
}
