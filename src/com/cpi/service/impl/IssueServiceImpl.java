package com.cpi.service.impl;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cpi.dao.IssueDAO;
import com.cpi.entity.Issue;
import com.cpi.entity.Supply;
import com.cpi.service.IssueService;

public class IssueServiceImpl implements IssueService {
	
	private IssueDAO issueDAO;
	
	public IssueDAO getIssueDAO(){
		return issueDAO;
	}
	
	public void setIssueDAO(IssueDAO issueDAO){
		this.issueDAO = issueDAO;
	}
	

	@Override
	public List<Issue> getList() throws SQLException {
		return issueDAO.getList();
	}
	
	@Override
	public List<Issue> getList(HttpServletRequest request) throws SQLException {
		return issueDAO.getList(request);
	}
	
	@Override
	public List<Issue> searchIssue(HttpServletRequest request) throws SQLException {
		return issueDAO.searchIssue(request);
	}
	
	@Override
	public List<Supply> getSupply() throws SQLException {
		return issueDAO.getSupply();
	}
	
	@Override
	public void insertIssue(HttpServletRequest request) throws Exception {
		this.issueDAO.insertIssue(request);

	}

	@Override
	public void updateIssue(HttpServletRequest request) throws Exception {
		this.issueDAO.updateIssue(request);

	}


}
