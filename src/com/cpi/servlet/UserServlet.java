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
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cpi.entity.User;
import com.cpi.service.UserService;

public class UserServlet extends HttpServlet {

	private static final long serialVersionUID = 350813781089847206L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action") == null ? "" : request.getParameter("action");
		String page = "";
		ApplicationContext context;
		try {
			context = new ClassPathXmlApplicationContext("com/cpi/resource/applicationContext.xml");
			UserService userService = (UserService) context.getBean("userService");
			/* userService.changePassword(request); */

			if (action.equals("maintain")) {
				List<User> l = new ArrayList<>();
				l = userService.getUser();
				request.setAttribute("lists", l);
				page = "Admin_UserListingPage.jsp";
			} else if (action.equals("updateProfiles")) {
				List<User> l = new ArrayList<>();
				userService.updateProfile(request);
				l = userService.getUser();
				request.setAttribute("lists", l);
				page = "Admin_UserListingPage.jsp";
			}else if(action.equals("addNew")){
				page = "Admin_AddNewUser.jsp";
			}else if(action.equals("insertUsers")){
				userService.insertUser(request);
				/*page = "Admin_AddNewUser.jsp";*/
			}
			else {
				page = "main_user.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}
}
