package com.techelevator.fitness.model;

import org.springframework.stereotype.Component;

@Component
public class User {
	
	private Long userId;
	private String email;
	private String password;
	private String confirmPassword;
	private String name;
	private Integer height; //Height and Weight stored in metric
	private Double weight;
	private String sex;
	private Double targetWeight;
	private Double targetBMI;
	private String phoneNumber;
	private Integer permissionLevel;
	private String salt;
	
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public Integer getHeight() {
		return height;
	}
	public void setHeight(Integer height) {
		this.height = height;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Double getTargetWeight() {
		return targetWeight;
	}
	public void setTargetWeight(Double targetWeight) {
		this.targetWeight = targetWeight;
	}
	public Double getTargetBMI() {
		return targetBMI;
	}
	public void setTargetBMI(Double targetBMI) {
		this.targetBMI = targetBMI;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
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
	public void setSalt(String salt) {
		this.salt = salt;
	}
}
