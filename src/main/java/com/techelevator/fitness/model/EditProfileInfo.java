package com.techelevator.fitness.model;

public class EditProfileInfo {

	private String name;
	private Integer height; //Height and Weight stored in metric
	private Double weight;
	private String gender;
	private String isImperial;
	private Double targetWeight;
	private Integer targetCalories;
	
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIsImperial() {
		return isImperial;
	}
	public void setIsImperial(String isImperial) {
		this.isImperial = isImperial;
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
	
	
}
