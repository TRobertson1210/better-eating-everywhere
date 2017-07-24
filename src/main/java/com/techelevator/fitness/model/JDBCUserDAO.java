package com.techelevator.fitness.model;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCUserDAO implements UserDAO {
	
	private JdbcTemplate jdbc;
	
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
	
	private User mapRowToUser(SqlRowSet results){
		User user = new User(results.getString("email"), results.getString("hashed_password"), results.getInt("permission_level"));
		
		user.setUserId(results.getLong("user_id"));

		//user.setPassword(results.getString("hashed_password"));
		user.setName(results.getString("name"));
		user.setHeight(results.getInt("height"));
		user.setWeight(results.getDouble("weight"));
		user.setSex(results.getString("sex"));
		user.setTargetWeight(results.getDouble("target_weight"));
		user.setTargetBMI(results.getDouble("target_BMI"));
		user.setPhoneNumber(results.getString("phone_number"));
		
		return user;
	}

}
