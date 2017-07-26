package com.techelevator.fitness.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.techelevator.fitness.model.JSONResponse;
import com.techelevator.fitness.model.LoginInfo;
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
		if(result.hasErrors()) {
			ErrorMessageGenerator emg = new ErrorMessageGenerator();
			return new JSONResponse("failure", emg.generateErrorMessage(result));
		}
		if(userDAO.getUserByEmail(newUser.getEmail()) == null) {
			userDAO.addUser(newUser);
			return new JSONResponse("success", newUser);
		}
		return new JSONResponse("failure", null);
	}


	@RequestMapping(path="/user/updateUser", method=RequestMethod.POST)
	public JSONResponse updateUser(@ModelAttribute User currentUser){
		return new JSONResponse("success", currentUser);
	}

	@RequestMapping(path="/user/login", method=RequestMethod.POST)
	public JSONResponse login(@Valid @ModelAttribute LoginInfo loginInfo, ModelMap model, BindingResult result){

		if(result.hasErrors()){
			ErrorMessageGenerator emg = new ErrorMessageGenerator();
			return new JSONResponse("failure", emg.generateErrorMessage(result));
		}
		if(!model.containsAttribute("loggedInUser")){
			User compareUser = userDAO.getUserByEmail(loginInfo.getEmail());
			if(compareUser != null){
				PasswordHasher pboy = new PasswordHasher();
				if(compareUser.getHashedPassword().equals(pboy.computeHash(loginInfo.getPassword(), compareUser.getSalt()))){
					model.addAttribute("loggedInUser", compareUser);
					return new JSONResponse("success", compareUser);
				}else{
					Map<String, String> errorMap = new HashMap<>();
					errorMap.put("confirmPassword", "You must enter an identical password");
					return new JSONResponse("failure", errorMap);
				}
			}
		}
		return new JSONResponse("failure", null);
	}
	
	@RequestMapping(path="/user/logout", method=RequestMethod.POST)
	public JSONResponse logout(ModelMap model, HttpSession session, SessionStatus status){
		if(model.containsAttribute("loggedInUser")){
			status.setComplete();
			return new JSONResponse("success", "logged out");
		}else{
			return new JSONResponse("failure", "you are not logged in");
		}
	}

}
