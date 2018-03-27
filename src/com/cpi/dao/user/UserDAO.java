package com.cpi.dao.user;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import com.cpi.entity.User;

public interface UserDAO {

	public List<User> getUser() throws SQLException;

	public void insertUser(Map<String, Object> params) throws SQLException;

	public void changePassword(Map<String, Object> params) throws SQLException;

	public void updateUser(Map<String, Object> params) throws SQLException;
	
	public void updateProfile(Map<String, Object> params) throws SQLException;
	
	public List<User> searchUser(HttpServletRequest request) throws SQLException;
}
