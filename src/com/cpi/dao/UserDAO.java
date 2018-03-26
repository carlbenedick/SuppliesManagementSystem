package com.cpi.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cpi.entity.User;

public interface UserDAO {
	List<User> getUserLogin() throws SQLException;
	
	List<User> getUser() throws SQLException;

	void deactivateUser(HttpServletRequest request) throws SQLException;

	void loginUser(HttpServletRequest request) throws SQLException;

	public void insertUser(Map<String, Object> params) throws SQLException;

	public void changePassword(Map<String, Object> params) throws SQLException;

	public void updateUser(Map<String, Object> params) throws SQLException;

	public void updateProfile(Map<String, Object> params) throws SQLException;
}
