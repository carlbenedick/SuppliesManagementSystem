package com.cpi.service.impl;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cpi.dao.SupplyDAO;
import com.cpi.entity.Supply;
import com.cpi.service.SuppliesMaintenanceService;

public class SuppliesMaintenanceServiceImpl implements SuppliesMaintenanceService {

	private SupplyDAO supplyDAO;
	
	public SupplyDAO getSupplyDAO() {
		return supplyDAO;
	}

	public void setSupplyDAO(SupplyDAO supplyDAO) {
		this.supplyDAO = supplyDAO;
	}

	@Override
	public List<Supply> getSupply(HttpServletRequest request) throws SQLException {
		return this.supplyDAO.getSupply(request);
	}

	@Override
	public void insertSupply(HttpServletRequest request) throws SQLException {
		this.supplyDAO.insertSupply(request);
		
	}

	@Override
	public void updateSupply(HttpServletRequest request) throws SQLException {
		this.supplyDAO.updateSupply(request);
		
	}
	
	@Override
	public List<Supply> searchSupply(HttpServletRequest request) throws SQLException {
		return this.supplyDAO.searchSupply(request);
		
	}

	@Override
	public Integer getResultFunctionHasChild(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		return this.supplyDAO.getResultFunctionHasChild(request);
	}

}
