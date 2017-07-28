package com.techelevator.fitness.model;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCUserDAO implements UserDAO {
	
	private JdbcTemplate jdbc;
	
	@Autowired
	public JDBCUserDAO(DataSource dataSource){
		this.jdbc = new JdbcTemplate(dataSource);
	}

	@Override
	public User getUserByEmail(String email) {
		User user = null;
		SqlRowSet results = jdbc.queryForRowSet("SELECT * FROM users WHERE email = ?", email);
		if(results.next()){
			user = mapRowToUser(results);
		}	
		return user;
	}
	
	@Override
	public User getUserById(Long userId) {
		String sqlStatement = "SELECT * FROM users WHERE user_id = ?";
		SqlRowSet results = jdbc.queryForRowSet(sqlStatement, userId);
		if(results.next()) {
			return mapRowToUser(results);
		} else {
			return null;
		}
	}

	@Override
	public void addUser(User newUser) {
		String sqlStatement = "INSERT INTO users (email, hashed_password, name, height, weight, gender, "
				+ "target_weight, target_calories, is_imperial, permission_level, salt) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		jdbc.update(sqlStatement, newUser.getEmail(), newUser.getHashedPassword(), newUser.getName(), newUser.getHeight(), newUser.getWeight(), newUser.getGender(), newUser.getTargetWeight(), newUser.getTargetCalories(), newUser.isImperial(), newUser.getPermissionLevel(), newUser.getSalt());
	}
	
	@Override
	public void updateUser(User user) {
		String sqlStatement = "UPDATE users SET name = ?, height = ?, "
				+ "weight = ?, gender = ?, is_imperial = ? "
				+ "WHERE user_id = ?";
		jdbc.update(sqlStatement, user.getName(), user.getHeight(), user.getWeight(),
				user.getGender(), user.isImperial(), user.getUserId());
	}
	
	@Override
	public void updatePassword(User user){
		String sqlStatement = "UPDATE users SET hashed_password = ? WHERE user_id = ?";
		jdbc.update(sqlStatement, user.getHashedPassword(), user.getUserId());
	}
	
	@Override
	public void updateGoals(User user){
		String sqlStatement = "UPDATE users SET target_weight = ?, target_calories = ?"
				+ "WHERE user_id = ?";
		jdbc.update(sqlStatement,  user.getTargetWeight(), user.getTargetCalories(), user.getUserId());
	}
	
	private User mapRowToUser(SqlRowSet results){
		User user = new User();
		
		user.setUserId(results.getLong("user_id"));
		user.setEmail(results.getString("email"));
		user.setHashedPassword(results.getString("hashed_password"));
		user.setName(results.getString("name"));
		user.setHeight(results.getInt("height"));
		user.setWeight(results.getDouble("weight"));
		user.setGender(results.getString("gender"));
		user.setTargetWeight(results.getDouble("target_weight"));
		user.setTargetCalories(results.getInt("target_calories"));
		user.setImperial(results.getString("is_imperial"));
		user.setPermissionLevel(results.getInt("permission_level"));
		user.setSalt(results.getString("salt"));
		
		return user;
	}


}
