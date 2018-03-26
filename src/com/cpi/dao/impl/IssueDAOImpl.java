package com.cpi.dao.impl;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.cpi.dao.IssueDAO;
import com.cpi.entity.Issue;
import com.cpi.entity.Supply;

public class IssueDAOImpl implements IssueDAO {

	private SqlMapClient sqlMapClient;

	public SqlMapClient getSqlMapClient(){
		return sqlMapClient;
	}
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	
	@SuppressWarnings("unchecked")
	public List<Issue> getList() throws SQLException {
		return this.getSqlMapClient().queryForList("getList");
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Supply> getSupply() throws SQLException {
		return this.getSqlMapClient().queryForList("getSupply");
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Issue> getList(HttpServletRequest request) throws SQLException {
		Issue issue = new Issue();
		
		issue.setIssueId(Integer.parseInt(request.getParameter("filter")));
		
		return this.getSqlMapClient().queryForList("getIssue", issue);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Issue> searchIssue(HttpServletRequest request) throws SQLException {
		Issue issue = new Issue();
		
		String text = "%" + request.getParameter("filter") + "%";
		issue.setRequestor(text);
		
		return this.getSqlMapClient().queryForList("searchIssue", issue);
	}

	@Override
	public void insertIssue(HttpServletRequest request) throws Exception {
		this.sqlMapClient.startTransaction();
		this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
		this.sqlMapClient.startBatch();
		
		try {
			Issue iss = new Issue();
			Supply sup = new Supply();
			
			Integer supplyId = Integer.parseInt(request.getParameter("supplyId"));
			Integer quantity = Integer.parseInt(request.getParameter("quantity"));
			Integer reorderLevel = 0;
			
			Supply supply = (Supply) this.getSqlMapClient().queryForObject("getSupplyByID", supplyId);
			if(supply == null) {
				throw new Exception("Supply does not Exist");
			}
			Integer currentSupply = supply.getActCount();
			
			if(supply.getReorderLvl() == null) {
				reorderLevel = 0;
			}else {
				reorderLevel = supply.getReorderLvl();
			}
			
			if(currentSupply <= reorderLevel) {
				throw new Exception("The actual count of the item " + supply.getItemName() + " is below or equal the reorder level.");
			}
			
			if(currentSupply < quantity) {
				throw new Exception(supply.getItemName() + " only has " + currentSupply + ", which is below the requested number of items.");
			}
			   
			iss.setSupplyId(supplyId);
			iss.setDate( new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("issueDate")) );
			iss.setRequestor((String)request.getParameter("requestor"));
			iss.setQuantity(quantity);
			iss.setDeptId((String)request.getParameter("deptId"));
			iss.setLastUser((String)request.getParameter("lastUser"));
			iss.setLastUpdate(new Date());
			
			sup.setActCount(currentSupply - quantity);
			sup.setSupplyID(supplyId);
	
			this.getSqlMapClient().insert("insertIssue", iss);
			this.getSqlMapClient().update("updateSupplyCount", sup);
			
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
		} catch(Exception e) {
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
		} finally {
			this.sqlMapClient.endTransaction();
			
			if(this.sqlMapClient.getCurrentConnection() != null) {
				this.sqlMapClient.getCurrentConnection().close();
			}
		}
	}

	@Override
	public void updateIssue(HttpServletRequest request) throws Exception {
		this.sqlMapClient.startTransaction();
		this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
		this.sqlMapClient.startBatch();
		
		try {
			String id = request.getParameter("issueId");
			
			if(id == null || "".equals(id.trim())) {
				throw new Exception("Can not update a record without an ID. Please click Issue Request button if you want to add a new issue.");
			}
			
			Integer issueId = Integer.parseInt(request.getParameter("issueId"));
			Integer supplyId = Integer.parseInt(request.getParameter("itemName"));
			
			Issue oldIssue = (Issue) this.getSqlMapClient().queryForObject("getIssue", issueId);
			Integer reorderLevel = 0;
			Integer oldQuantity = 0;
			
			if(oldIssue != null) {
				oldQuantity = oldIssue.getQuantity();
			}
			Integer newQuantity = Integer.parseInt(request.getParameter("quantity"));
			Integer diffQuantity  = oldQuantity - newQuantity;
			
			Supply supply = (Supply) this.getSqlMapClient().queryForObject("getSupplyByID", supplyId);
			if(supply == null) {
				throw new Exception("Supply does not Exist");
			}
			
			Integer currentSupply = supply.getActCount();
			currentSupply = currentSupply + diffQuantity;
			
			if(supply.getReorderLvl() == null) {
				reorderLevel = 0;
			}else {
				reorderLevel = supply.getReorderLvl();
			}
			
			if(diffQuantity < 0) {
				if(supply.getActCount() < Math.abs(diffQuantity)) {
					throw new Exception(supply.getItemName() + " only has " + supply.getActCount() + ", which is below the requested number of items.");
				}
				if(supply.getActCount() <= reorderLevel) {
					throw new Exception("The actual count of the item " + supply.getItemName() + " is below or equal the reorder level.");
				}
			}
			
			Issue iss = new Issue();
			Supply sup = new Supply();
			   
			iss.setIssueId(issueId);
			iss.setSupplyId(supplyId);
			iss.setRequestor((String)request.getParameter("requestor"));
			iss.setDate( new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("issueDate")) );
			iss.setQuantity(newQuantity);
			iss.setDeptId((String)request.getParameter("departmentName"));
			iss.setLastUser((String)request.getParameter("userId"));
			iss.setLastUpdate(new Date());
			
			sup.setActCount(currentSupply);
			sup.setSupplyID(supplyId);

			this.getSqlMapClient().insert("updateIssue", iss);
			this.getSqlMapClient().update("updateSupplyCount", sup);
			
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
		} catch(Exception e) {
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
		} finally {
			this.sqlMapClient.endTransaction();
			
			if(this.sqlMapClient.getCurrentConnection() != null) {
				this.sqlMapClient.getCurrentConnection().close();
			}
		}
	}

}
