package com.jiayang.db.entity;

import com.sys.base.BaseEntity;

/**
 *Tool.java
 */
public class Tool extends BaseEntity{
	private String name;
	private String descs;
	private String remarks;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescs() {
		return descs;
	}
	public void setDescs(String descs) {
		this.descs = descs;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
}
