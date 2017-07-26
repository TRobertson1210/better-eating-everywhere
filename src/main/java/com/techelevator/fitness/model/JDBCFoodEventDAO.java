package com.techelevator.fitness.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCFoodEventDAO implements FoodEventDAO{

	private JdbcTemplate jdbc;
	
	@Autowired
	public JDBCFoodEventDAO(DataSource dataSource){
		this.jdbc = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void addFoodEvent(FoodEvent foodEvent) {
		String sqlStatement = "INSERT INTO food_events (user_id, food_name, food_calories, "
				+ "event_calories, amount_of_servings, date_eaten) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";
		jdbc.update(sqlStatement, foodEvent.getUserId(), foodEvent.getName(), foodEvent.getCalories(), foodEvent.getEventCalories(), foodEvent.getAmountOfServings(), foodEvent.getDateEaten());
	}

	@Override
	public void removeFoodEvent(Long id) {
		String sqlStatement = "DELETE FROM food_events WHERE food_event_id = ?";
		jdbc.update(sqlStatement, id);
		
	}

	@Override
	public List<FoodEvent> getAllUserFoodEvents(Long id) {
		String sqlStatement = "SELECT * FROM food_events WHERE user_id = ? ORDER BY date_eaten DESC";
		SqlRowSet results = jdbc.queryForRowSet(sqlStatement, id);
		List<FoodEvent> userFoodEvents = new ArrayList<>();
		while(results.next()) {
			userFoodEvents.add(mapRowToFoodEvent(results));
		}
		return userFoodEvents;
	}
	
	private FoodEvent mapRowToFoodEvent(SqlRowSet results){
		FoodEvent foodEvent = new FoodEvent();
	
		foodEvent.setUserId(results.getLong("user_id"));
		foodEvent.setName(results.getString("name"));
		foodEvent.setCalories(results.getDouble("food_calories"));
		foodEvent.setEventCalories(results.getDouble("event_calories"));
		foodEvent.setAmountOfServings(results.getDouble("amount_of_servings"));
		foodEvent.setDateEaten(results.getDate("date_eaten"));
		
		return foodEvent;
	}

	
}
