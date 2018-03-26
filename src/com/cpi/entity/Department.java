package com.cpi.entity;

import java.util.ArrayList;
import java.util.List;

public class Department {
	
	private String departmentName, departmentId;
	
	List<Department> list = new ArrayList<>();
	
	public Department(){
	}
	
	public List<Department> getDepartment(){
		list.add(new Department("hr", "Human Resources"));
		list.add(new Department("act", "Accounting"));
		list.add(new Department("adm", "Admin"));
		list.add(new Department("dev", "Development"));
		list.add(new Department("etc", "Misc"));
		
		return list;
	}
	
	public Department(String id, String name){
		this.setDepartmentId(id);
		this.setDepartmentName(name);
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

}
