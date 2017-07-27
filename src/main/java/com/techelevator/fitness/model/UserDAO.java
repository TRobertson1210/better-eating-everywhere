package com.techelevator.fitness.model;

public interface UserDAO {

	public User getUserByEmail(String email);

	public User getUserById(Long userId);

	public void addUser(User newUser);
	
	public void updateUser(User user);
	
	public void updatePassword(User user);
	
	public void updateGoals(User user);
}
