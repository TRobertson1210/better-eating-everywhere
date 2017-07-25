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
		String sqlStatement = "INSERT INTO users (email, hashed_password, name, height, weight, sex, target_weight, target_bmi, phone_number, permission_level, salt) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		jdbc.update(sqlStatement, newUser.getEmail(), newUser.getHashedPassword(), newUser.getName(), newUser.getHeight(), newUser.getWeight(), newUser.getSex(), newUser.getTargetWeight(), newUser.getTargetBMI(), newUser.getPhoneNumber(), newUser.getPermissionLevel(), newUser.getSalt());
	}
	
	private User mapRowToUser(SqlRowSet results){
		User user = new User();
		
		user.setUserId(results.getLong("user_id"));
		user.setEmail(results.getString("email"));
		user.setPassword(results.getString("hashed_password"));
		user.setName(results.getString("name"));
		user.setHeight(results.getInt("height"));
		user.setWeight(results.getDouble("weight"));
		user.setSex(results.getString("sex"));
		user.setTargetWeight(results.getDouble("target_weight"));
		user.setTargetBMI(results.getDouble("target_BMI"));
		user.setPhoneNumber(results.getString("phone_number"));
		user.setPermissionLevel(results.getInt("permission_level"));
		user.setSalt(results.getString("salt"));
		
		return user;
	}

}
