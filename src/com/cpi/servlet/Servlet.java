package com.cpi.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cpi.entity.User;
import com.cpi.service.UserService;

public class Servlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		try {
			@SuppressWarnings("resource")
			ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
					"/com/cpi/resource/applicationContext.xml");

			UserService userService = (UserService) applicationContext.getBean("userService");
			HttpSession session = request.getSession();

			@SuppressWarnings("unchecked")
			List<User> userList = (List<User>) session.getAttribute("sessionList");
			if (userList == null) {
				userList = new ArrayList<User>();
			}

			List<User> l = new ArrayList<>();
			l = userService.getUser();

			for (User u : l) {
				userList.add(new User(u.getUserId(), u.getPassword(), u.getActiveTag(), u.getAccessLevel()));
			}

			session.setAttribute("sessionList", userList);

			String page = "";
			String action = request.getParameter("action");

			if (action.equals("login")) {
				if (userService.login(request)) {
					System.out.println("test");
					userService.loginUser(request);
					page = "index.jsp";
					session.setAttribute("curPage", page);
					request.setAttribute("curpage", page);
				} else {
					System.out.println((Integer) session.getAttribute("tryCount"));
					if ((Integer) session.getAttribute("tryCount") >= 3) {
						userService.deactivateUser(request);
						session.invalidate();
					}
					page = "index.jsp";
				}
			} else if (action.equals("goHome")) {
				page = "index.jsp";
			}
			// response.sendRedirect("home.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String page = "";
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		System.out.println(action);
		if (action.equals("backToLogin")) {
			page = "index.jsp";
		} else if (action.equals("logOut")) {
			session.invalidate();
			page = "index.jsp";
		} else if (action.equals("goHome")) {
			page = "home.jsp";
		} else if (action.equals("goMainte")) {
			page = "mainte.jsp";
		} else if (action.equals("goIssue")) {
			page = "issue";
			System.out.println(page);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}
}
