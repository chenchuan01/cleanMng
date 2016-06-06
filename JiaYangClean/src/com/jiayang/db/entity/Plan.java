package com.jiayang.db.entity;

import com.sys.base.BaseEntity;

/**
 *Tool.java
 */
public class Plan extends BaseEntity{
	private String recon;
	private Integer userId;
	private Integer cleanerId;
	private Integer itemId;
	private String tools;
	private Integer status;
	private String address;
	private String remarks;
	
	
	
	public String getRecon() {
		return recon;
	}
	public void setRecon(String recon) {
		this.recon = recon;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getCleanerId() {
		return cleanerId;
	}
	public void setCleanerId(Integer cleanerId) {
		this.cleanerId = cleanerId;
	}
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	public String getTools() {
		return tools;
	}
	public void setTools(String tools) {
		this.tools = tools;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
}
