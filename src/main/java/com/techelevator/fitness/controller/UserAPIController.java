package com.techelevator.fitness.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.fitness.model.JSONResponse;
import com.techelevator.fitness.model.User;
import com.techelevator.fitness.model.UserDAO;

@RestController
public class UserAPIController {
	
	
	//so this guy's gonna be able to update and insert information into the users table of the database
	//and also it should be able to get that information out
	
	private UserDAO userDAO;
	
	@Autowired
	public UserAPIController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/user/register", method=RequestMethod.POST)
	public JSONResponse createUser(@Valid @ModelAttribute User newUser,
			BindingResult result) {
		if(result.hasErrors()) {
			return new JSONResponse("failure", result.getFieldErrors());
		}
		if(userDAO.getUserByEmail(newUser.getEmail()) == null) {
			userDAO.addUser(newUser);
			return new JSONResponse("success", newUser);
		}
		return new JSONResponse("failure", null);
	}
	
	
	@RequestMapping(path="/users/updateUser", method=RequestMethod.POST)
	public JSONResponse updateUser(@ModelAttribute User currentUser){
		return new JSONResponse("success", currentUser);
	}

}
