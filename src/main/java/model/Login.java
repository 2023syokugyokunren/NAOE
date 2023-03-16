package model;

public class Login {
	public String userId;
	public String pass;
	public Login(String userId,String pass) {
		this.userId=userId;
		this.pass=pass;
	}
	public String getUserId() {return userId;}
	public String getPass() {return pass;}
}
