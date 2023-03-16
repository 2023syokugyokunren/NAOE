package model;

import dao.UpdateAccountDAO;

public class UpdateAccountLogic {
	public boolean execute(User user) {
		UpdateAccountDAO dao=new UpdateAccountDAO();
		boolean ua=dao.updateAccount(user);
		return ua;
	}
}
