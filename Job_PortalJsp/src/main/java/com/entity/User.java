package com.entity;

public class User {
	
	private int id;
	private String name;
	private String qualification;
	private String contact;
	private String email;
	private String password;
	private String role;
	
	public User() {
		super();
	}
	public User(String name, String qualification, String contact, String email, String password, String role) {
	    this.name = name;
	    this.qualification = qualification;
	    this.contact = contact;
	    this.email = email;
	    this.password = password;
	    this.role = role;
	}

	

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	
	

}
