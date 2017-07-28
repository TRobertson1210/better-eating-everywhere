package com.techelevator.fitness.model;

import javax.validation.constraints.Min;

public class GoalInfo {

	private Double targetWeight;
	private Integer targetCalories;
	
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
