package com.cpi.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cpi.entity.User;
import com.cpi.service.UserService;

public class UserServiceImpl implements UserService {

	@Override
	public boolean login(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Boolean loginSucces = false;

		HttpSession session = request.getSession();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");

		if (userName.equals("CPI") && password.equals("123")) {
			loginSucces = true;
		}

		@SuppressWarnings("unchecked")
		List<User> users = (List<User>) session.getAttribute("sessionList");

		if (users != null) {
			for (User user : users) {
				if (userName.equals(user.getUsername()) && password.equals(user.getPassword())) {
					loginSucces = true;
					break;
				}
			}
		}

		return loginSucces;
	}

	@Override
	public void addToSession(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		String username = request.getParameter("userName");
		String password = request.getParameter("password");

		session.setAttribute("userName", username);
		session.setAttribute("password", password);

		@SuppressWarnings("unchecked")
		List<User> userList = (List<User>) session.getAttribute("sessionList");
		if (userList == null) {
			userList = new ArrayList<User>();
		}

		userList.add(new User(username, password));
		session.setAttribute("sessionList", userList);
		request.setAttribute("userList", session.getAttribute("sessionList"));

	}

	@Override
	public List<User> getUsers(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		List<User> userList = (List<User>) session.getAttribute("sessionList");

		return userList;
	}

}
