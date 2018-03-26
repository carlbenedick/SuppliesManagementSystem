package com.cpi.entity;

import java.util.Date;
import java.util.List;

public class Issue {
	private Supply supply;
	private Integer issueId;
	private Integer supplyId;
	private Date date;
	private String requestor;
	private Integer quantity;
	private String deptId;
	private String lastUser;
	private Date lastUpdate;
	private Department department;

	public void setSupply(List<Supply> supplies) {
		if(supplies == null || supplies.size() == 0) {
			return;
		}
		for (Supply s : supplies) {
			if(s.getSupplyID().equals(this.supplyId)) {
				
				this.supply = s;
			}
		}
	}
	
	public void setDepartment(List<Department> dept){
		if(dept == null || dept.size() == 0) {
			return;
		}
		for (Department d: dept) {
			if(d.getDepartmentId().equals(this.deptId)) {
				this.department = d;
			}
		}
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Supply getSupply() {
		return supply;
	}


	public void setSupply(Supply supply) {
		this.supply = supply;
	}


	public Integer getActualCount() {
		return actualCount;
	}

	public void setActualCount(Integer actualCount) {
		this.actualCount = actualCount;
	}

	private Integer actualCount;

	public Integer getIssueId() {
		return issueId;
	}

	public void setIssueId(Integer issueId) {
		this.issueId = issueId;
	}

	public Integer getSupplyId() {
		return supplyId;
	}

	public void setSupplyId(Integer supplyId) {
		this.supplyId = supplyId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getRequestor() {
		return requestor;
	}

	public void setRequestor(String requestor) {
		this.requestor = requestor;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getLastUser() {
		return lastUser;
	}

	public void setLastUser(String lastUser) {
		this.lastUser = lastUser;
	}

	public Date getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

}
