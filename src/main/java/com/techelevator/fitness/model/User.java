package com.techelevator.fitness.model;

public class User {
	
	private Long userId;
	private String email;
	private String password;
	private String confirmPassword;
	private String name;
	private Integer height;
	private Integer weight;
	private String sex;
	private Integer targetWeight;
	private Double targetBMI;
	private String phoneNumber;
	
	public User(String email, String password) {
		this.email = email;
		this.password = password;
	}
	
	public Integer getHeightInCentimeters(Integer feet, Integer inches) {
		Integer totalInches = inches + feet*12;
		return (int) (totalInches * 2.54);
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
	public Integer getWeight() {
		return weight;
	}
	public void setWeight(Integer weight) {
		this.weight = weight;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getTargetWeight() {
		return targetWeight;
	}
	public void setTargetWeight(Integer targetWeight) {
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
	
	
}
