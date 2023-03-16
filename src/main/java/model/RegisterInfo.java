package model;

import java.io.Serializable;

public class RegisterInfo implements Serializable {

	private String userid;
	private String pass;
	private String username;
	private String mail;
	private String privilege="general";

	public RegisterInfo() {}
	public RegisterInfo(String userid,String pass,String username,String mail) {
		this.userid=userid;
		this.pass=pass;
		this.username=username;
		this.mail=mail;


	}

	public String getUserid() {
		return userid;
	}
	public String getPass() {
		return pass;
	}
	public String getUsername() {
		return username;
	}
	public String getMail() {
		return mail;
	}
	public String getPrivilege() {
		return privilege;
	}



}
