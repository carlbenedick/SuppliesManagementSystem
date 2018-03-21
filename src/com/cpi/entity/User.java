package com.cpi.entity;

public class User {

	String userName;
	String password;
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(String username, String password) {
		// TODO Auto-generated constructor stub
		this.userName = username;
		this.password = password;
	}
	

	public String getUsername() {
		return userName;
	}

	public void setUsername(String username) {
		this.userName = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
