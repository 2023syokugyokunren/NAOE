package model;

import dao.AccountDAO;
import dao.DeleteAccountDAO;
import dao.SignUpDAO;

/**
* ユーザー認証関連のメソッドが集まっています
* 
* LoginCheckメソッド		ログイン時に使用するメソッド(LoginServlet)
* RegisterUserメソッド		アカウント登録時に使用するメソッド(RegisterServlet)
* DeleteUserメソッド		退会時のアカウント削除に使用するメソッド(DeleteServlet)) 
*/
public class UserAuthLogic {
	
	 /**
	   * LoginCheckメソッド
	   * ログインができた場合、User情報を返すメソッド
	   * @param　Login(userId,pass)
	   * @return User(id,userId,name,pass,mail,privilege);
	   */
	public User LoginCheck(Login login) {
		AccountDAO dao = new AccountDAO();
		User user = dao.findByLogin(login);
		return user;
	}
	
	/**
	   * RegisterUserメソッド
	   * アカウント登録時に、TrueかFalseを返すメソッド
	   * @param　RegisterInfo(String userid,String pass,String username,String mail)
	   * @return boolean(登録成功時True,失敗時False)
	   */
	public boolean RegisterUser(RegisterInfo registerInfo) {
		SignUpDAO dao = new SignUpDAO();
		boolean result = dao.CreateAccount(registerInfo);

		if(result == false) {
			return false;
		}
		return true;
	}
	
	/**
	   * DeleteUserメソッド
	   * 退会時に、ユーザー情報を削除するメソッド
	   * @param　int型のid(ユーザーの番号のほうのID)
	   * @return boolean(成功時True,失敗時False)
	   */
	public boolean DeleteUser(int id) {
		DeleteAccountDAO dao = new DeleteAccountDAO();
		boolean result = dao.deleteAccount(id);
		return result;
	}
	/**
	   * CheckUserメソッド
	   * 退会時に、ユーザー情報を削除するメソッド
	   * @param　String型のuserId(ユーザーID)
	   * @return boolean(アカウントが無い場合はTrue、ある場合はfalse)
	   */
	
	public boolean CheckUser(String userId) {
		AccountDAO dao=new AccountDAO();
		boolean result=dao.CheckUserId(userId);
		
		return result;
	}
}
