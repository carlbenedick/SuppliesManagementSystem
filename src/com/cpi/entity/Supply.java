package com.cpi.entity;


public class Supply {
	private Integer supplyID, supplyTypeID, reorderLvl, actCount;
	private String itemName, itemUnit, location, remarks, lastUser, typeName, dateAdded, lastUpdate;
	private String obsTag;
	//private String dateAdded, lastUpdate;

	public Supply() {

	}
	
	public Supply(Integer supplyTypeID, String typeName) {
		this.supplyTypeID = supplyTypeID;
		this.typeName = typeName;
	}
	
	public Supply(Integer supplyID, String itemName, String itemUnit, String obsTag, String location,
			Integer reorderLvl, String remarks, String lastUser) {
		this.supplyID = supplyID;
		this.itemName = itemName;
		this.itemUnit = itemUnit;
		this.obsTag = obsTag;
		this.location = location;
		this.reorderLvl = reorderLvl;
		this.remarks = remarks;
		this.lastUser = lastUser;

	}
	
	public Supply(Integer supplyID, Integer supplyTypeID,String typeName, String itemName, String itemUnit, String obsTag, String location,
			Integer reorderLvl, Integer actCount, String remarks, String dateAdded, String lastUser, String lastUpdate) {
		this.supplyID = supplyID;
		this.supplyTypeID = supplyTypeID;
		this.typeName = typeName;
		this.itemName = itemName;
		this.itemUnit = itemUnit;
		this.obsTag = obsTag;
		this.location = location;
		this.reorderLvl = reorderLvl;
		this.actCount = actCount;
		this.remarks = remarks;
		this.dateAdded = dateAdded;
		this.lastUser = lastUser;
		this.lastUpdate = lastUpdate;

	}
	
	public Supply(Integer supplyTypeID, String itemName, String itemUnit, String obsTag, String location,
			Integer reorderLvl, Integer actCount, String remarks, String dateAdded, String lastUser) {
		this.supplyTypeID = supplyTypeID;
		this.itemName = itemName;
		this.itemUnit = itemUnit;
		this.obsTag = obsTag;
		this.location = location;
		this.reorderLvl = reorderLvl;
		this.actCount = actCount;
		this.remarks = remarks;
		this.dateAdded = dateAdded;
		this.lastUser = lastUser;

	}	

	public Supply(Integer supplyID, Integer supplyTypeID, String itemName, String itemUnit, String obsTag, String location,
			Integer reorderLvl, Integer actCount, String remarks, String dateAdded, String lastUser, String lastUpdate) {
		this.supplyID = supplyID;
		this.supplyTypeID = supplyTypeID;
		this.itemName = itemName;
		this.itemUnit = itemUnit;
		this.obsTag = obsTag;
		this.location = location;
		this.reorderLvl = reorderLvl;
		this.actCount = actCount;
		this.remarks = remarks;
		this.dateAdded = dateAdded;
		this.lastUser = lastUser;
		this.lastUpdate = lastUpdate;

	}

	public Integer getSupplyID() {
		return supplyID;
	}

	public Integer getSupplyTypeID() {
		return supplyTypeID;
	}

	public Integer getReorderLvl() {
		return reorderLvl;
	}

	public Integer getActCount() {
		return actCount;
	}

	public String getItemName() {
		return itemName;
	}

	public String getItemUnit() {
		return itemUnit;
	}

	public String getLocation() {
		return location;
	}

	public String getRemarks() {
		return remarks;
	}

	public String getLastUser() {
		return lastUser;
	}

	public String getObsTag() {
		return obsTag;
	}

	public String getDateAdded() {
		return dateAdded;
	}

	public String getlastUpdate() {
		return lastUpdate;
	}

	public void setSupplyID(Integer supplyID) {
		this.supplyID = supplyID;
	}

	public void setSupplyTypeID(Integer supplyTypeID) {
		this.supplyTypeID = supplyTypeID;
	}

	public void setReorderLvl(Integer reorderLvl) {
		this.reorderLvl = reorderLvl;
	}

	public void setActCount(Integer actCount) {
		this.actCount = actCount;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public void setItemUnit(String itemUnit) {
		this.itemUnit = itemUnit;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public void setLastUser(String lastUser) {
		this.lastUser = lastUser;
	}

	public void setObsTag(String obsTag) {
		this.obsTag = obsTag;
	}

	public void setdateAdded(String dateAdded) {
		this.dateAdded = dateAdded;
	}

	public void setlastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

}
