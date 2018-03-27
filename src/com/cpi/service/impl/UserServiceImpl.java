package com.cpi.service.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cpi.dao.UserDAO;
import com.cpi.entity.User;
import com.cpi.service.UserService;

public class UserServiceImpl implements UserService {

	private UserDAO userDAO;

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public List<User> getUserLogin() throws SQLException {
		// TODO Auto-generated method stub
		return userDAO.getUserLogin();
	}
	
	@Override
	public List<User> getUser() throws SQLException {
		// TODO Auto-generated method stub
		return userDAO.getUser();
	}
	
	

	@Override
	public boolean login(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Boolean loginSuccess = false;
		String activeTag = "";

		HttpSession session = request.getSession();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");

		Integer tryCount = new Integer(0);
		String tryCountKey = new String("tryCount");
		String userIDKey = new String("userId");
		String userId = "";

		if (session.getAttribute(tryCountKey) == null) {
			session.setAttribute(tryCountKey, tryCount);
		}

		tryCount = (Integer) session.getAttribute(tryCountKey);
		userId = (String) session.getAttribute(userIDKey);

		@SuppressWarnings("unchecked")
		List<User> users = (List<User>) session.getAttribute("sessionList");

		if (users != null) {
			for (User user : users) {					
				if (userName.equals(user.getUserId())) {
					activeTag = user.getActiveTag();					
					if (activeTag.equals("Y")) {
						if (password.equals(user.getPassword())) {
							request.setAttribute("accesslevel", user.getAccessLevel());
							loginSuccess = true;
							session.setAttribute(userIDKey, userName);
							session.setAttribute("accessType", user.getAccessLevel());
							session.setAttribute("firstName", user.getFirstName());
							session.setAttribute("lastName", user.getLastName());
							tryCount = 0;
							session.setAttribute(tryCountKey, tryCount);
						} else {
							if (userName.equals(user.getUserId())) {
								tryCount = tryCount + 1;
								session.setAttribute(tryCountKey, tryCount);
							}
							request.setAttribute("message", "Invalid username/password");
						}
					} else if (activeTag.equals("N")) {
						request.setAttribute("message", "Account Locked. Please contact Administrator");
						tryCount = 0;
						session.setAttribute(tryCountKey, tryCount);
					}
					break;
				}
			}
		}
		
		if (activeTag == "") {
			request.setAttribute("message", "Invalid username/password");
			tryCount = 0;
			session.setAttribute(tryCountKey, tryCount);
		}
		
		return loginSuccess;
	}

	@Override
	public void deactivateUser(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		this.userDAO.deactivateUser(request);
	}

	@Override
	public void loginUser(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		this.userDAO.loginUser(request);
	}

	@Override
	public void insertUser(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		Date newDate = new Date();
		params.put("userId", request.getParameter("userid"));
		params.put("password", request.getParameter("pass"));
		params.put("firstName", request.getParameter("firstname"));
		params.put("lastName", request.getParameter("lastname"));
		params.put("middleInitial", request.getParameter("middleinitial"));
		params.put("email", request.getParameter("emailadd"));
		params.put("activeTag", request.getParameter("activetag"));
		params.put("accessLevel", request.getParameter("accesslevel"));
		params.put("entryDate", newDate);
		params.put("lastLogin", newDate);
		params.put("lastUser", "admin");
		params.put("lastUpdate", newDate);
		this.getUserDAO().insertUser(params);
	}

	@Override
	public void changePassword(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		params.put("newPassword", request.getParameter("newPasswords"));
		params.put("password", request.getParameter("passwords"));
		this.getUserDAO().changePassword(params);
	}

	@Override
	public void updateUser(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		params.put("userId", request.getParameter("userIds"));
		params.put("password", request.getParameter("passwords"));
		params.put("firstName", request.getParameter("firstNames"));
		params.put("lastName", request.getParameter("lastNames"));
		params.put("middleInitial", request.getParameter("middleInitials"));
		params.put("email", request.getParameter("emailss"));
		this.getUserDAO().updateUser(params);
	}

	@Override
	public void updateProfile(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		params.put("userId", request.getParameter("userId"));
		params.put("firstName", request.getParameter("firstName"));
		params.put("lastName", request.getParameter("lastName"));
		params.put("middleInitial", request.getParameter("middleInitial"));
		params.put("email", request.getParameter("emails"));
		params.put("activeTag", request.getParameter("activeTag"));
		params.put("accessLevel", request.getParameter("accessLevel"));
		this.getUserDAO().updateProfile(params);
	}
	
	@Override
	public List<User> searchUser(HttpServletRequest request) throws SQLException {
		return this.getUserDAO().searchUser(request);
	}
	
}
