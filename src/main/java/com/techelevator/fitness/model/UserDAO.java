package com.techelevator.fitness.model;

public interface UserDAO {

	public User getUserByEmail(String email);

	public User getUserById(Long userId);

	public void addUser(User newUser);
}
