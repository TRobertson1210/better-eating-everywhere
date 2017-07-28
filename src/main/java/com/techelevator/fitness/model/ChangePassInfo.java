package com.techelevator.fitness.model;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class ChangePassInfo {

	@NotBlank(message="You must enter your current password")
	private String currentPassword;
	@NotBlank(message="You must enter a new password") @Size(min=10, message="Your new password must be at least 10 characters long")
	private String newPassword;
	@NotBlank(message="You must enter a matching password")
	private String confirmNewPassword;
	
	private boolean passwordMatching;
	@AssertTrue(message="Passwords must match")
	public boolean isPasswordMatching() {
		if(newPassword != null){
			return newPassword.equals(confirmNewPassword);
		}else{
			return false;
		}
	}
	
	public String getPassword() {
		return currentPassword;
	}
	public void setPassword(String currentPassword) {
		this.currentPassword = currentPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getConfirmNewPassword() {
		return confirmNewPassword;
	}
	public void setConfirmNewPassword(String confirmNewPassword) {
		this.confirmNewPassword = confirmNewPassword;
	}
	
}
