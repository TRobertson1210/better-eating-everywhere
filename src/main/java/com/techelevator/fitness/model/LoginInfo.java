package com.techelevator.fitness.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class LoginInfo {

	@NotBlank(message="Your username/password is incorrect")
	@Email(message="You must enter a valid email")
	private String email;
	@NotBlank(message="Your username/password is incorrect")
	private String password;
	
	
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
	
	
	
}
