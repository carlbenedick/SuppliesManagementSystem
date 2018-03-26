package com.cpi.dao.impl;

import java.sql.SQLException;
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

	@Override
	public void insertSupply(HttpServletRequest request) throws SQLException {
		this.sqlMapClient.startTransaction();
		this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
		this.sqlMapClient.startBatch();

		Supply sup = new Supply(Integer.valueOf(request.getAttribute("supplyTypeID").toString()),
				request.getAttribute("itemName").toString(), request.getAttribute("itemUnit").toString(),
				request.getAttribute("obsTag").toString(), request.getAttribute("location").toString(),
				Integer.valueOf(request.getAttribute("reorderLvl").toString()),
				Integer.valueOf(request.getAttribute("actCount").toString()),
				request.getAttribute("remarks").toString(), request.getAttribute("dateAdded").toString(),
				request.getAttribute("lastUser").toString());

		System.out.println(" adding "+ sup.getSupplyTypeID() + " ," + sup.getItemName() + " ," + sup.getLastUser());

		this.getSqlMapClient().insert("insertSupply", sup);

		this.sqlMapClient.executeBatch();
		this.sqlMapClient.getCurrentConnection().commit();
	}

	@Override
	public void updateSupply(HttpServletRequest request) throws SQLException {
		this.sqlMapClient.startTransaction();
		this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
		this.sqlMapClient.startBatch();

		Supply sup = new Supply();
		
		sup.setSupplyID(Integer.valueOf(request.getAttribute("supplyID").toString()));
		sup.setItemName(request.getAttribute("itemName").toString());
		sup.setItemUnit(request.getAttribute("itemUnit").toString());
		sup.setObsTag(request.getAttribute("obsTag").toString());
		sup.setLocation(request.getAttribute("location").toString());
		sup.setReorderLvl(Integer.valueOf(request.getAttribute("reorderLvl").toString()));
		sup.setRemarks(request.getAttribute("remarks").toString());

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

}
