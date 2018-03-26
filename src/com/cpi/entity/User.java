package com.cpi.entity;

import java.util.Date;

public class User {

	private String userId;
	private String password;
	private String firstName;
	private String lastName;
	private String middleInitial;
	private String email;
	private String activeTag;
	private String accessLevel;
	private Date entryDate;
	private Date lastLogin;
	private String lastUser;
	private Date lastUpdate;
	private String newPassword;

	public User(String userID, String password, String active, String accessLevel) {
		// TODO Auto-generated constructor stub
		this.userId = userID;
		this.password = password;
		this.activeTag = active;
		this.accessLevel = accessLevel;
	}

	public User() {
		// TODO Auto-generated constructor stub
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userID) {
		this.userId = userID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMiddleInitial() {
		return middleInitial;
	}

	public void setMiddleInitial(String middleInitial) {
		this.middleInitial = middleInitial;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getActiveTag() {
		return activeTag;
	}

	public void setActiveTag(String active) {
		this.activeTag = active;
	}

	public String getAccessLevel() {
		return accessLevel;
	}

	public void setAccessLevel(String level) {
		this.accessLevel = level;
	}

	public Date getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Date entry) {
		this.entryDate = entry;
	}

	public Date getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	public String getLastUser() {
		return lastUser;
	}

	public void setLastUser(String lastUser) {
		this.lastUser = lastUser;
	}

	public Date getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

}
