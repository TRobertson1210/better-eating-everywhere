package com.techelevator.fitness.model;

import java.sql.Date;

public class FoodEvent {

	private Long id;
	private Long userId;
	private String name;
	private double calories;
	private double servingSize;
	private Date dateEaten;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getCalories() {
		return calories;
	}
	public void setCalories(double calories) {
		this.calories = calories;
	}
	public double getServingSize() {
		return servingSize;
	}
	public void setServingSize(double servingSize) {
		this.servingSize = servingSize;
	}
	public Date getDateEaten() {
		return dateEaten;
	}
	public void setDateEaten(Date dateEaten) {
		this.dateEaten = dateEaten;
	}
	
	
}
