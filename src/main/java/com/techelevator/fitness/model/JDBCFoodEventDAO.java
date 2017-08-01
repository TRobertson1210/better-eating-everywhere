package com.techelevator.fitness.model;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
	public List<FoodEvent> getAllUserFoodEvents(Long userId) {
		String sqlStatement = "SELECT * FROM food_events WHERE user_id = ? ORDER BY date_eaten DESC";
		SqlRowSet results = jdbc.queryForRowSet(sqlStatement, userId);
		List<FoodEvent> userFoodEvents = new ArrayList<>();
		while(results.next()) {
			userFoodEvents.add(mapRowToFoodEvent(results));
		}
		return userFoodEvents;
	}
	
	@Override
	public List<FoodEvent> getUserFoodEventsByDay(Long userId, String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date searchDate = null;
		try {
			searchDate = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date searchSqlDate = new Date(searchDate.getTime());
		String sqlStatement = "SELECT * FROM food_events WHERE user_id = ? AND date_eaten = ?";
		SqlRowSet results = jdbc.queryForRowSet(sqlStatement, userId, searchSqlDate);
		List<FoodEvent> userFoodEventsByDay = new ArrayList<>();
		while(results.next()){
			userFoodEventsByDay.add(mapRowToFoodEvent(results));
		}
		return userFoodEventsByDay;
	}

	@Override
	public List<FoodEvent> getUserFoodEventsByWeek(Long userId, String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date searchDate = null;
		try {
			searchDate = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date searchSqlDate = new Date(searchDate.getTime());
		String sqlStatement = "SELECT * FROM food_events WHERE user_id = ? AND "
				+ "date_eaten BETWEEN (?::DATE + interval '-1 week') AND ? "
				+ "ORDER BY date_eaten DESC";
		SqlRowSet results = jdbc.queryForRowSet(sqlStatement, userId, searchSqlDate, searchSqlDate);
		List<FoodEvent> userFoodEventsByWeek = new ArrayList<>();
		while(results.next()){
			userFoodEventsByWeek.add(mapRowToFoodEvent(results));
		}
		return userFoodEventsByWeek;
	}

	@Override
	public List<FoodEvent> getUserFoodEventsByMonth(Long userId, String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date searchDate = null;
		try {
			searchDate = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date searchSqlDate = new Date(searchDate.getTime());
		String sqlStatement = "SELECT * FROM food_events WHERE user_id = ? "
				+ "AND date_eaten BETWEEN (?::DATE + interval '-30 day') AND ? "
				+ "ORDER BY date_eaten DESC";
		SqlRowSet results = jdbc.queryForRowSet(sqlStatement, userId, searchSqlDate, searchSqlDate);
		List<FoodEvent> userFoodEventsByMonth = new ArrayList<>();
		while(results.next()){
			userFoodEventsByMonth.add(mapRowToFoodEvent(results));
		}
		return userFoodEventsByMonth;
	}

	@Override
	public List<FoodEvent> getUserFoodEventsByYear(Long userId, String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date searchDate = null;
		try {
			searchDate = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date searchSqlDate = new Date(searchDate.getTime());
		String sqlStatement = "SELECT * FROM food_events WHERE user_id = ? "
				+ "AND date_eaten BETWEEN (?::DATE + interval '-1 year') AND ? "
				+ "ORDER BY date_eaten DESC";
		SqlRowSet results = jdbc.queryForRowSet(sqlStatement, userId, searchSqlDate, searchSqlDate);
		List<FoodEvent> userFoodEventsByYear = new ArrayList<>();
		while(results.next()){
			userFoodEventsByYear.add(mapRowToFoodEvent(results));
		}
		return userFoodEventsByYear;
	}
	
	
	private FoodEvent mapRowToFoodEvent(SqlRowSet results){
		FoodEvent foodEvent = new FoodEvent();
		foodEvent.setId(results.getLong("food_event_id"));
		foodEvent.setUserId(results.getLong("user_id"));
		foodEvent.setName(results.getString("food_name"));
		foodEvent.setCalories(results.getDouble("food_calories"));
		foodEvent.setEventCalories(results.getDouble("event_calories"));
		foodEvent.setAmountOfServings(results.getDouble("amount_of_servings"));
		foodEvent.setDateEaten(results.getDate("date_eaten"));
		
		return foodEvent;
	}

	
}
