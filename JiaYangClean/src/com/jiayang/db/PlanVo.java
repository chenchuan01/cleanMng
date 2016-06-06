package com.jiayang.db;

import java.util.List;

import com.jiayang.db.entity.Item;
import com.jiayang.db.entity.Plan;
import com.jiayang.db.entity.Tool;
import com.sys.db.entity.User;

/**
 *PlanVo.java
 */
public class PlanVo {
	private Plan info;
	private User user;
	private User cleaner;
	private Item item;
	private List<Tool> tools;
	public PlanVo() {
	}
	public PlanVo(Plan plan) {
		this.info = plan;
	}
	public Plan getInfo() {
		return info;
	}
	public void setInfo(Plan info) {
		this.info = info;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public User getCleaner() {
		return cleaner;
	}
	public void setCleaner(User cleaner) {
		this.cleaner = cleaner;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public List<Tool> getTools() {
		return tools;
	}
	public void setTools(List<Tool> tools) {
		this.tools = tools;
	}
	
	
	
}
