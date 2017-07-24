package com.techelevator;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.techelevator.fitness.model.User;

public class UserTest {

	@Before
	public void setUp() throws Exception {
		
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testWeightConversion() {
		User test = new User("email", "password", 1);
		assertEquals(77.11, test.getWeightInKilograms(170), 0.0);
	}
	
	@Test
	public void testHeightConversion() {
		User test = new User("email", "password", 1);
		assertEquals(193, test.getHeightInCentimeters(6, 4), 0.0);
		assertEquals(195, test.getHeightInCentimeters(6, 5), 0.0);
	}

}
