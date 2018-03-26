package com.cpi.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;

import com.cpi.application.ApplicationContextFactory;
import com.cpi.entity.Department;
import com.cpi.entity.Supply;
import com.cpi.service.IssueService;

public class LoadAddIssue extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			RequestDispatcher rd = null;
			ApplicationContext applicationContext = ApplicationContextFactory.getInstance().getApplicationContext();

			IssueService issueService = (IssueService) applicationContext.getBean("issueService");

			List<Supply> supplies = issueService.getSupply();
			Department dept = new Department();
			List<Department> departments = dept.getDepartment();
			
			req.setAttribute("departments", departments);
			req.setAttribute("supplies", supplies);

			rd = req.getRequestDispatcher("supplies_issuance.jsp");
			rd.forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
