package com.cpi.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cpi.entity.User;
import com.cpi.service.UserService;
import com.cpi.service.impl.UserServiceImpl;

public class Servlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String page = "";
		String action = request.getParameter("action");
		UserService userService = new UserServiceImpl();

		if (action.equals("login")) {
			if (userService.login(request)) {
				List<User> userList = userService.getUsers(request);
				request.setAttribute("userList", userList);
				page = "login.jsp";
			}else {
				request.setAttribute("message", "Invalid username/password");
				page = "index.jsp";
			}
		} else if (action.equals("addUser")) {
			userService.addToSession(request);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String page = "";
		String action = request.getParameter("action");
		HttpSession session = request.getSession();

		if (action.equals("backToLogin")) {
			page = "index.jsp";
		}else if (action.equals("deleteSession")) {
			session.invalidate();
			page = "index.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}
}
