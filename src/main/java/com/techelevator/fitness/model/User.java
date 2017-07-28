package com.techelevator.fitness.model;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;

import com.techelevator.fitness.security.PasswordHasher;

@Component
public class User {
	
	private Long userId;
	@NotBlank(message="Please enter a valid email address") @Email (message="Please enter a valid email")
	private String email;
	@NotBlank(message="Please enter a password") @Size(min=10, message="Your password must be at least 10 characters long")
	private String password;
	private String hashedPassword;
	private String confirmPassword;
	private String name;
	private boolean isImperial;
	@Min(1)
	private Integer height; //Height and Weight stored in metric
	@Min(1)
	private Double weight;
	private String gender;
	@Min(1)
	private Double targetWeight;
	@Min(1)
	private Integer targetCalories;
	private Integer permissionLevel;
	private String salt;
	
	private boolean passwordMatching; // Dummy property to get matching vaildation working
	@AssertTrue(message="Passwords must match")
	public boolean isPasswordMatching() {
		if(password != null) {
			return password.equals(confirmPassword);
		} else {
			return false;
		}
	}
	
	//These methods allow for the user to input their information in imperial units
	public Integer getHeightInCentimeters(Integer feet, Integer inches) {
		Integer totalInches = inches + feet*12;
		return (int) (totalInches * 2.54);
	}
	public Double getWeightInKilograms(Integer weightInPounds) {
		return (double) Math.round((weightInPounds * 0.45359237)*100)/100;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		PasswordHasher pboy = new PasswordHasher();
		this.salt = pboy.generateRandomSalt();
		this.hashedPassword = pboy.computeHash(password, this.salt);
		this.password = password;
	}
	public String getHashedPassword() {
		return hashedPassword;
	}
	public void setHashedPassword(String hashedPassword) {
		this.hashedPassword = hashedPassword;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isImperial() {
		return isImperial;
	}

	public void setImperial(boolean isImperial) {
		this.isImperial = isImperial;
	}

	public Integer getHeight() {
		return height;
	}
	public void setHeight(Integer height) {
		if(this.isImperial) {
			
		}
		this.height = height;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Double getTargetWeight() {
		return targetWeight;
	}
	public void setTargetWeight(Double targetWeight) {
		this.targetWeight = targetWeight;
	}
	public Integer getTargetCalories() {
		return targetCalories;
	}
	public void setTargetCalories(Integer targetCalories) {
		this.targetCalories = targetCalories;
	}
	public Integer getPermissionLevel() {
		return permissionLevel;
	}
	public void setPermissionLevel(Integer permissionLevel) {
		this.permissionLevel = permissionLevel;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String string) {
		this.salt = string;
	}
}
