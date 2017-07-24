package com.techelevator.fitness.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.fitness.model.JSONResponse;
import com.techelevator.fitness.model.User;
import com.techelevator.fitness.model.UserDAO;

@RestController
@SessionAttributes("user")
public class UserAPIController {
	
	
	//so this guy's gonna be able to update and insert information into the users table of the database
	//and also it should be able to get that information out
	
	private UserDAO userDAO;
	
	@Autowired
	public UserAPIController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/users/register", method=RequestMethod.PUT)
	public JSONResponse createUser(@RequestParam String email, @RequestParam String password){
		if(userDAO.getUserByEmail(email) == null) {
			User newUser = new User(email, password, 2);
			return new JSONResponse("success", newUser);
		}
		return new JSONResponse("failure", null);
	}
	
	@RequestMapping(path="/users/{userId}/updateUser", method=RequestMethod.POST)
	public User updateUser(@PathVariable Long userId, @RequestParam(value="email", required=false) String email, @RequestParam(value="password", required=false) String password, @RequestParam(value="confirmPassword", required=false) String confirmPassword,
			@RequestParam(value="name", required=false) String name, @RequestParam(value="height", required=false) Integer height, @RequestParam(value="weight", required=false) Double weight,
			@RequestParam(value="sex", required=false) String sex, @RequestParam(value="targetWeight", required=false) Double targetWeight,
			@RequestParam(value="targetBMI", required=false) Double targetBMI, @RequestParam(value="phoneNumber", required=false) String phoneNumber,
			ModelMap model){
		User user = getActiveUser(model);
		
		if(email != null){
			user.setEmail(email);
		}
		
		if(password != null){
			user.setPassword(password);
		}
		
		if(!confirmPassword.equals(null)){
			user.setConfirmPassword(confirmPassword);
		}
		
		if(!name.equals(null)){
			user.setName(name);
		}
		
		if(!height.equals(null)){
			user.setHeight(height);
		}
		
		if(!weight.equals(null)){
			user.setWeight(weight);
		}
		
		if(!sex.equals(null)){
			user.setSex(sex);
		}
		
		if(!targetWeight.equals(null)){
			user.setTargetWeight(targetWeight);
		}
		
		if(!targetBMI.equals(null)){
			user.setTargetBMI(targetBMI);
		}
		
		if(!phoneNumber.equals(null)){
			user.setPhoneNumber(phoneNumber);
		}
		
		return user;
	}
	
	private User getActiveUser(ModelMap model){
		return (User)model.get("user");
	}
}
