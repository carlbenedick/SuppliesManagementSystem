package com.cpi.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cpi.entity.User;

public interface UserService {

	boolean login(HttpServletRequest request);
	
	List<User> getUser() throws SQLException;
	
	List<User> getUserLogin() throws SQLException;
		
	void deactivateUser(HttpServletRequest request) throws SQLException;
	
	void loginUser(HttpServletRequest request) throws SQLException;
	
	public void insertUser(HttpServletRequest request) throws SQLException;
	
	public void changePassword(HttpServletRequest request) throws SQLException;
	
	public void updateUser(HttpServletRequest request) throws SQLException;
	
	public void updateProfile(HttpServletRequest request) throws SQLException;
	
	public List<User> searchUser(HttpServletRequest request) throws SQLException;
}
