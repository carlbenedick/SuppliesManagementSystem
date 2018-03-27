package com.cpi.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cpi.dao.SupplyDAO;
import com.cpi.entity.Supply;
import com.ibatis.sqlmap.client.SqlMapClient;

public class SupplyDAOImpl implements SupplyDAO {

	private SqlMapClient sqlMapClient;

	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	@SuppressWarnings("unchecked")
	public List<Supply> getSupply(HttpServletRequest request) throws SQLException {
		System.out.println("HERE");
		/*Supply sup = new Supply();
		
		sup.setSupplyID(Integer.valueOf(request.getAttribute("supplyID").toString()));*/
		String getType = request.getAttribute("getType").toString();
		return this.getSqlMapClient().queryForList(getType);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void insertSupply(HttpServletRequest request) throws SQLException {
		this.sqlMapClient.startTransaction();
		this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
		this.sqlMapClient.startBatch();

		List<Supply> addSupply = new ArrayList<Supply>();
		addSupply = (List<Supply>) request.getAttribute("addSupply");
		
		
		Supply sup = new Supply(addSupply.get(0).getSupplyTypeID(),addSupply.get(0).getItemName(), addSupply.get(0).getItemUnit(),
				addSupply.get(0).getObsTag(), addSupply.get(0).getLocation(), addSupply.get(0).getReorderLvl(), addSupply.get(0).getActCount(),
				addSupply.get(0).getRemarks(), addSupply.get(0).getDateAdded(),addSupply.get(0).getLastUser());

		System.out.println(" adding "+ sup.getSupplyTypeID() + " ," + sup.getItemName() + " ," + sup.getLastUser());

		this.getSqlMapClient().insert("insertSupply", sup);

		this.sqlMapClient.executeBatch();
		this.sqlMapClient.getCurrentConnection().commit();
	}

	@SuppressWarnings("unchecked")
	@Override
	public void updateSupply(HttpServletRequest request) throws SQLException {
		this.sqlMapClient.startTransaction();
		this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
		this.sqlMapClient.startBatch();

		
		
		List<Supply> updateSupply = new ArrayList<Supply>();
		updateSupply = (List<Supply>) request.getAttribute("updateSupply");
		
		System.out.println("DAO "+updateSupply.get(0).getRemarks());
		
		Supply sup = new Supply(updateSupply.get(0).getSupplyID(), updateSupply.get(0).getItemName(), updateSupply.get(0).getItemUnit(),
				updateSupply.get(0).getObsTag(), updateSupply.get(0).getLocation(), updateSupply.get(0).getReorderLvl(), updateSupply.get(0).getRemarks(), 
				updateSupply.get(0).getLastUser());

		this.getSqlMapClient().update("updateSupply", sup);
		
		this.sqlMapClient.executeBatch();
		this.sqlMapClient.getCurrentConnection().commit();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Supply> searchSupply(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("HERE");
		/*Supply sup = new Supply();
		
		sup.setSupplyID(Integer.valueOf(request.getAttribute("supplyID").toString()));*/
		
		Map supply = new HashMap();
		supply.put("supplyID", "%"+request.getAttribute("supplyID")+"%");
		
		String getType = request.getAttribute("getType").toString();
		return this.getSqlMapClient().queryForList(getType, supply);
	}

	@Override
	public Integer getResultFunctionHasChild(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		Supply supply = new Supply();
		
		supply.setSupplyID(Integer.valueOf(request.getAttribute("supplyID").toString()));;
		
		String getType = request.getAttribute("getType").toString();
		return (Integer) this.getSqlMapClient().queryForObject(getType, supply);
	}

}
