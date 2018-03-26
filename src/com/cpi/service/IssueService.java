package com.cpi.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cpi.entity.Issue;
import com.cpi.entity.Supply;

public interface IssueService {
	List<Issue> getList() throws SQLException;
	List<Supply> getSupply() throws SQLException;
	List<Issue> getList(HttpServletRequest request) throws SQLException;
	List<Issue> searchIssue(HttpServletRequest request) throws SQLException;
	void insertIssue(HttpServletRequest request) throws Exception;
	void updateIssue(HttpServletRequest request) throws Exception;
}
