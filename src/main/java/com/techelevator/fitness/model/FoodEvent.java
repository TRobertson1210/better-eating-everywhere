package com.techelevator.fitness.model;

import java.sql.Date;

public class FoodEvent {

	private Long id;
	private Long userId;
	private String name;
	private Double calories;
	private Double eventCalories;
	private Double amountOfServings;
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
	public Double getCalories() {
		return calories;
	}
	public void setCalories(Double calories) {
		this.calories = calories;
	}
	public Double getEventCalories() {
		return eventCalories;
	}
	public void setEventCalories(Double eventCalories) {
		this.eventCalories = eventCalories;
	}
	public Double getAmountOfServings() {
		return amountOfServings;
	}
	public void setAmountOfServings(Double amountOfServings) {
		this.amountOfServings = amountOfServings;
	}
	public Date getDateEaten() {
		return dateEaten;
	}
	public void setDateEaten(Date dateEaten) {
		this.dateEaten = dateEaten;
	}
	
	
}
