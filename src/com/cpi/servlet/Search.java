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

public class Search extends HttpServlet {

	private static final long serialVersionUID = -8368262557912544254L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String page = "";

		try {
			@SuppressWarnings("resource")
			ApplicationContext context = new ClassPathXmlApplicationContext("com/cpi/resource/applicationContext.xml");
			UserService userService = (UserService) context.getBean("userService");
			List<User> l = new ArrayList<>();
			
				if(request.getParameter("searchId") == null){					
					l = userService.getUser();
				}else{			
					l = userService.searchUser(request);								
				}
				request.setAttribute("lists", l);
				System.out.println(l.get(0).getFirstName());
				
				page = "Admin_UserListingPage.jsp";
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}

	}
}
