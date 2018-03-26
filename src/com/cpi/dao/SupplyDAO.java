package com.cpi.dao;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cpi.entity.Supply;

public interface SupplyDAO {
	List<Supply> getSupply(HttpServletRequest request) throws SQLException;
	void insertSupply(HttpServletRequest request) throws SQLException;
	void updateSupply(HttpServletRequest request) throws SQLException;
	List<Supply> searchSupply(HttpServletRequest request) throws SQLException;
}
