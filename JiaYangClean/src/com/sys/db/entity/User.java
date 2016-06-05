package com.sys.db.entity;

import com.sys.base.BaseEntity;
/**
 * ϵͳ�û�
 */
public class User extends BaseEntity{
	private String name;
	private String tel;
	private String address;
	private String userName;
	private String password;
	private String roles;
	
    public User() {
    }
    public User(String userName) {
		super();
		this.userName = userName;
	}
    
	public User(String userName, String password) {
		super();
		this.userName = userName;
		this.password = password;
	}
	

	public User(Integer id) {
		super.setId(id);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRoles() {
		return roles;
	}
	public void setRoles(String roles) {
		this.roles = roles;
	}

	
	
	
}
