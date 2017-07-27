package com.techelevator.fitness.model;

import javax.validation.constraints.Min;

public class GoalInfo {

	private Double targetWeight;
	private Double targetBMI;
	
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
