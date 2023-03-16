package model;

import java.util.List;

import dao.ItemBuyCheckDAO;
import dao.SelectBuyHistoryDAO;
import dao.UpdateAccountDAO;
import dao.UserInfoDAO;

/**
* ユーザーの情報の取得関係のメソッドが集まっています
* 
* DisplayUserAddressメソッド	ユーザーの住所、郵便番号、電話番号などを返すメソッドです。(UserInfoServlet)
* InsertUserAddressメソッド		ユーザーの住所、郵便番号、電話番号などを登録するメソッド（UserInfoServlet)
* UpdateUserAddressメソッド		ユーザーの住所、郵便番号、電話番号などを更新するメソッド (UserInfoServlet)
* DisplayBuyHitoryメソッド		ユーザーの購入履歴を表示するメソッドです。(ByHistoryServlet))
* BuyCheckメソッド				ログインしているユーザーが選択した商品を買ったことがあるかを判定するメソッド(ItemServlet)
*/

public class UserInfoLogic {
	
	/**
	   * DisplayUserAddressメソッド
	   * ユーザーが登録している住所などを返すメソッド
	   * @param　User
	   * @return List<User> User(id,post_Code,address,tel)
	   */
	public List<User> DisplayUserAddress(User user){
		UserInfoDAO userInfoDAO = new UserInfoDAO();
		 List<User> userAddressList = userInfoDAO.userInfoSelect(user);
		 
		 return userAddressList;
	}
	
	/**
	   * InsertUserAddressメソッド
	   * 住所や連絡先、郵便番号などを登録するメソッド
	   * @param　User(int id,int post_Code,String address,String tel)
	   * @return boolean(成功したらTrue,失敗したらFalse)
	   */
	public boolean InsertUserAddress(User AddressInfo) {
		UserInfoDAO dao = new UserInfoDAO();
		boolean result = dao.userInfoInsert(AddressInfo);
		
		return result;
	}
	
	/**
	   * UpdateUserAddressメソッド
	   * 住所や連絡先、郵便番号などを更新するメソッド
	   * @param　User(int id,int post_Code,String address,String tel)
	   * @return boolean(成功したらTrue,失敗したらFalse)
	   */
	public boolean UpdateUserAddress(User AddressInfo) {
		UserInfoDAO dao = new UserInfoDAO();
		boolean result = dao.userInfoUpdate(AddressInfo);
		
		return result;
	}
	
	/**
	   * DisplayBuyHistoryメソッド
	   * アカウントに紐づいた購入履歴を表示するメソッド
	   * @param　int (Userのid)
	   * @return List<Detail> Detail(itemName, category, discription, image, price,order_Num, priceAll, order_At)
	   */
	public List<Detail> DisplayBuyHistory(int userid){
		SelectBuyHistoryDAO dao = new SelectBuyHistoryDAO();
		List<Detail> BuyHistory = dao.selectBuyHistory(userid);

		return BuyHistory;
	}
	
	/**
	   * BuyCheckメソッド
	   * ログインしているユーザーが選択した商品を買ったことがあるかを判定するメソッド
	   * @param　int (itemのid),int(userのid)
	   * @return boolean(買ったことがあるならTrue,ないならFalse)
	   */
	public boolean BuyCheck(int item_id,int user_id) {
		ItemBuyCheckDAO dao=new ItemBuyCheckDAO();
		boolean result = dao.checkBuy(item_id, user_id);
		
		return result;
	}
	
	public boolean UpdateUserInfo(User user) {
		UpdateAccountDAO dao = new UpdateAccountDAO();
		boolean result = dao.updateAccount(user);
		
		return result;
	}
	
	public boolean charge(int money,int id) {
		UpdateAccountDAO dao=new UpdateAccountDAO();
		boolean judge=dao.chargeMoney(money, id);
		
		return judge;
	}
}
