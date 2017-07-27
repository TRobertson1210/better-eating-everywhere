package com.techelevator.fitness.model;

import javax.validation.constraints.Min;

public class ProfileInfo {

	private String name;
	private Integer height; //Height and Weight stored in metric
	private Double weight;
	private String sex;
	private Double targetWeight;
	private Double targetBMI;
	
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
	
	
}
