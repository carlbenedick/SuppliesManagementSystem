package com.cpi.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;

import com.cpi.application.ApplicationContextFactory;
import com.cpi.service.IssueService;

public class UpdateIssue extends HttpServlet {

	private static final long serialVersionUID = 3L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int updateStatus = 1;
		String updateMessage = null;
		try {
			ApplicationContext applicationContext = ApplicationContextFactory.getInstance().getApplicationContext();
			
			IssueService issueService = (IssueService) applicationContext.getBean("issueService");
			
			issueService.updateIssue(req);
			
			updateMessage = "Successfully updated issue record.";
		} catch (Exception e) {
			e.printStackTrace();
			updateMessage = "Error while updating issue record:\\n" + e.getMessage();
			updateStatus = 0;
		}
		
		resp.getWriter().write("{'updateStatus': "+ updateStatus +", 'updateMessage': '" + updateMessage +"'}");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	
}
