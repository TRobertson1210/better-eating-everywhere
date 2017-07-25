package com.techelevator.fitness.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.fitness.model.JSONResponse;
import com.techelevator.fitness.model.User;
import com.techelevator.fitness.model.UserDAO;
import com.techelevator.fitness.security.PasswordHasher;
import com.techelevator.fitness.validation.ErrorMessageGenerator;

@RestController
@SessionAttributes("loggedInUser")
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
		ErrorMessageGenerator emg = new ErrorMessageGenerator();
		if(result.hasErrors()) {
			return new JSONResponse("failure", emg.generateErrorMessage(result));
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

	@RequestMapping(path="/user/login", method=RequestMethod.GET)
	public JSONResponse login(@RequestParam String email, @RequestParam String password, ModelMap model){
		if(!model.containsAttribute("loggedInUser")){
			User compareUser = userDAO.getUserByEmail(email);
			if(compareUser != null){
				PasswordHasher pboy = new PasswordHasher();
				if(compareUser.getHashedPassword().equals(pboy.computeHash(password, compareUser.getSalt()))){
					model.addAttribute("loggedInUser", compareUser);
					return new JSONResponse("success", compareUser);
				}
			}
		}
		return new JSONResponse("failure", null);
	}

}
