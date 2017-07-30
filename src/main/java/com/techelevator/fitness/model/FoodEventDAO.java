package com.techelevator.fitness.model;

import java.util.List;

public interface FoodEventDAO {

	public void addFoodEvent(FoodEvent foodEvent);
	public void removeFoodEvent(Long id);
	public List<FoodEvent> getAllUserFoodEvents(Long userId);
	public List<FoodEvent> getUserFoodEventsByDay(Long userId, String day);
	List<FoodEvent> getUserFoodEventsByWeek(Long userId, String date);
	List<FoodEvent> getUserFoodEventsByMonth(Long userId, String date);
	List<FoodEvent> getUserFoodEventsByYear(Long userId, String date);
}
