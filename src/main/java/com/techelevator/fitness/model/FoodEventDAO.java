package com.techelevator.fitness.model;

import java.util.Date;
import java.util.List;

public interface FoodEventDAO {

	public void addFoodEvent(FoodEvent foodEvent);
	public void removeFoodEvent(Long id);
	public List<FoodEvent> getAllUserFoodEvents(Long userId);
}
