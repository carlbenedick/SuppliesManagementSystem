package com.cpi.entity;


public class Supply {
	private int supplyID, supplyTypeID, reorderLvl, actCount;
	private String itemName, itemUnit, location, remarks, lastUser, typeName, dateAdded, lastUpdate;
	private String obsTag;
	//private String dateAdded, lastUpdate;

	public Supply() {

	}
	
	public Supply(int supplyTypeID, String typeName) {
		this.supplyTypeID = supplyTypeID;
		this.typeName = typeName;
	}
	
	public Supply(int supplyID, int supplyTypeID,String typeName, String itemName, String itemUnit, String obsTag, String location,
			int reorderLvl, int actCount, String remarks, String dateAdded, String lastUser, String lastUpdate) {
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
	
	public Supply(int supplyTypeID, String itemName, String itemUnit, String obsTag, String location,
			int reorderLvl, int actCount, String remarks, String dateAdded, String lastUser) {
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

	public Supply(int supplyID, int supplyTypeID, String itemName, String itemUnit, String obsTag, String location,
			int reorderLvl, int actCount, String remarks, String dateAdded, String lastUser, String lastUpdate) {
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

	public int getSupplyID() {
		return supplyID;
	}

	public int getSupplyTypeID() {
		return supplyTypeID;
	}

	public int getReorderLvl() {
		return reorderLvl;
	}

	public int getActCount() {
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

	public void setSupplyID(int supplyID) {
		this.supplyID = supplyID;
	}

	public void setSupplyTypeID(int supplyTypeID) {
		this.supplyTypeID = supplyTypeID;
	}

	public void setReorderLvl(int reorderLvl) {
		this.reorderLvl = reorderLvl;
	}

	public void setActCount(int actCount) {
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
