package com.cpi.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cpi.entity.Supply;

public interface SuppliesMaintenanceService {
	List<Supply> getSupply(HttpServletRequest request) throws SQLException;
	void insertSupply(HttpServletRequest request) throws SQLException;
	void updateSupply(HttpServletRequest request) throws SQLException;
	List<Supply> searchSupply(HttpServletRequest request) throws SQLException;
	Integer getResultFunctionHasChild(HttpServletRequest request) throws SQLException;
}
