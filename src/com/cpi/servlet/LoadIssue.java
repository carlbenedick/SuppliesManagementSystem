package com.cpi.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cpi.application.ApplicationContextFactory;
import com.cpi.entity.Department;
import com.cpi.entity.Issue;
import com.cpi.entity.Supply;
import com.cpi.service.IssueService;

public class LoadIssue extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			RequestDispatcher rd = null;
			ApplicationContext applicationContext = ApplicationContextFactory.getInstance().getApplicationContext();

			IssueService issueService = (IssueService) applicationContext.getBean("issueService");
			
			List<Issue> issuances = new ArrayList<>();
			
			if(req.getParameter("filter") == null || req.getParameter("filter").equals("")){
				issuances = issueService.getList();
				
			}else {
				issuances = issueService.searchIssue(req);
			}
		
			List<Supply> supplies = issueService.getSupply();
			Department dept = new Department();
			List<Department> departments = dept.getDepartment();
			
			for (Issue issue : issuances) {
				issue.setDepartment(departments);
			}
			
			for (Issue issue : issuances) {
				issue.setSupply(supplies);
			}
			
			req.setAttribute("issuances", issuances);
			req.setAttribute("supplies", supplies);
			req.setAttribute("departments", departments);
			
			req.setAttribute("updateStatus", req.getAttribute("updateStatus"));
			req.setAttribute("updateMessage", req.getAttribute("updateMessage"));
			
			rd = req.getRequestDispatcher("supplies_issuance_listing.jsp");
			rd.forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
