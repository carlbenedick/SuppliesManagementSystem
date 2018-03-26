package com.cpi.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;

import com.cpi.application.ApplicationContextFactory;
import com.cpi.entity.Issue;
import com.cpi.entity.Supply;
import com.cpi.service.IssueService;

public class AddIssue extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int updateStatus = 1;
		String updateMessage = null;
		try {

			ApplicationContext applicationContext = ApplicationContextFactory.getInstance().getApplicationContext();
			
			IssueService issueService = (IssueService) applicationContext.getBean("issueService");
			
			issueService.insertIssue(req);

			updateMessage = "Successfully added issue record.";
		} catch (Exception e) {
			e.printStackTrace();
			updateMessage = "Error while adding issue record:\\n" + e.getMessage();
			updateStatus = 0;
		}

		resp.getWriter().write("{'updateStatus': "+ updateStatus +", 'updateMessage': '" + updateMessage +"'}");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
}
