package com.jiayang.db.entity;

import com.sys.base.BaseEntity;

/**
 *Tool.java
 */
public class Tool extends BaseEntity{
	private String name;
	private String desc;
	private String remarks;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
}
