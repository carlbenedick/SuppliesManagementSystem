package com.cpi.dao.impl;

import java.sql.SQLException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cpi.dao.UserDAO;
import com.cpi.entity.User;
import com.ibatis.sqlmap.client.SqlMapClient;

public class UserDAOImpl implements UserDAO {

	private SqlMapClient sqlMapClient;

	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	@SuppressWarnings("unchecked")
	public List<User> getUserLogin() throws SQLException {
		return this.getSqlMapClient().queryForList("getUserLogin");
	}
	
	@SuppressWarnings("unchecked")
	public List<User> getUser() throws SQLException {
		return this.getSqlMapClient().queryForList("getUser");
	}
	
	@Override
	public void deactivateUser(HttpServletRequest request) throws SQLException {
		// deactivates account
		
		this.sqlMapClient.startTransaction();
		this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
		this.sqlMapClient.startBatch();
		
		HttpSession session = request.getSession();
		
		User user = new User();
		   
		user.setUserId(request.getParameter("userName"));
		user.setActiveTag("N");
		user.setLastUpdate(new Date());	

		this.getSqlMapClient().insert("deactivateUser", user);
		
		this.sqlMapClient.executeBatch();
		this.sqlMapClient.getCurrentConnection().commit();				
	}
	
	@Override
	public void loginUser(HttpServletRequest request) throws SQLException {
		// updates last_login date
		this.sqlMapClient.startTransaction();
		this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
		this.sqlMapClient.startBatch();
		
		HttpSession session = request.getSession();
		
		User user = new User();
		   
		user.setUserId((String)session.getAttribute("userId"));
		user.setLastLogin(new Date());	

		this.getSqlMapClient().insert("loginUser", user);
		
		this.sqlMapClient.executeBatch();
		this.sqlMapClient.getCurrentConnection().commit();				
	}
	
	@Override
	public void insertUser(Map<String, Object> params) throws SQLException {
		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			this.sqlMapClient.update("insertUser", params);
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();

		} catch (SQLException e) {
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
		} finally {
			this.sqlMapClient.endTransaction();
		}
	}

	@Override
	public void changePassword(Map<String, Object> params) throws SQLException {
		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			this.sqlMapClient.update("changePassword", params);
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
		} catch (SQLException e) {
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
		} finally {
			this.sqlMapClient.endTransaction();
		}
	}

	@Override
	public void updateUser(Map<String, Object> params) throws SQLException {
		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			this.sqlMapClient.update("updateUser", params);
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
		} catch (SQLException e) {
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
		} finally {
			this.sqlMapClient.endTransaction();
		}
	}
	
	@Override
	public void updateProfile(Map<String, Object> params) throws SQLException {
		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			this.sqlMapClient.update("updateProfile", params);
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
		} catch (SQLException e) {
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
		} finally {
			this.sqlMapClient.endTransaction();
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> searchUser(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		String search = "%" + request.getParameter("searchId") + "%";
		params.put("userId", search);
		//User user = new User();
		
		
		//user.setFirstName(search);
		return (List<User>) this.getSqlMapClient().queryForList("searchUser", params);
	}

}
