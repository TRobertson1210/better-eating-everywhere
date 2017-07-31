package com.techelevator.fitness.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.techelevator.fitness.model.ChangePassInfo;
import com.techelevator.fitness.model.GoalInfo;
import com.techelevator.fitness.model.JSONResponse;
import com.techelevator.fitness.model.LoginInfo;
import com.techelevator.fitness.model.ProfileInfo;
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

		try{
			if(userDAO.getUserByEmail(newUser.getEmail()) == null) {
				userDAO.addUser(newUser);
				return new JSONResponse("success", newUser);
			}
		}catch(DataAccessException exception){
			return new JSONResponse("failure", exception.getMessage());
		}
		return new JSONResponse("failure", null);
	}


	@RequestMapping(path="/user/updateProfile", method=RequestMethod.POST)
	public JSONResponse updateUser(@ModelAttribute ProfileInfo profileInfo, ModelMap model){
		if(model.containsAttribute("loggedInUser")){
			User loggedInUser = (User) model.get("loggedInUser");
			loggedInUser.setHeight(profileInfo.getHeight());
			loggedInUser.setWeight(profileInfo.getWeight());
			loggedInUser.setGender(profileInfo.getGender());
			loggedInUser.setName(profileInfo.getName());
			loggedInUser.setIsImperial(profileInfo.isImperial());
			try{
				userDAO.updateUser(loggedInUser);
			}catch(DataAccessException exception){
				return new JSONResponse("failure", exception.getMessage());
			}
			return new JSONResponse("success", profileInfo);
		}else{
			return new JSONResponse("failure", "there is no user in the session");
		}
	}

	@RequestMapping(path="/user/updateGoals", method=RequestMethod.POST)
	public JSONResponse updateGoals(@ModelAttribute GoalInfo goalInfo, ModelMap model){
		if(model.containsAttribute("loggedInUser")){
			User loggedInUser = (User) model.get("loggedInUser");
			loggedInUser.setTargetWeight(goalInfo.getTargetWeight());
			loggedInUser.setTargetCalories(goalInfo.getTargetCalories());
			try{
				userDAO.updateGoals(loggedInUser);
			}catch(DataAccessException exception){
				return new JSONResponse("failure", exception.getMessage());
			}
			return new JSONResponse("success", goalInfo);
		}else{
			return new JSONResponse("failure", "no user in session");
		}
	}

	@RequestMapping(path="/user/changePassword", method=RequestMethod.POST)
	public JSONResponse changePassword(@ModelAttribute ChangePassInfo changePassInfo, 
			ModelMap model){
		
		
//		if(result.hasErrors()) {
//			ErrorMessageGenerator emg = new ErrorMessageGenerator();
//			return new JSONResponse("failure", emg.generateErrorMessage(result));
//		}
		
		if(model.containsAttribute("loggedInUser")){
			User loggedInUser = (User) model.get("loggedInUser");
			PasswordHasher pboy = new PasswordHasher();
			String newHashedPassword = pboy.computeHash(changePassInfo.getNewPassword(), loggedInUser.getSalt());
			loggedInUser.setHashedPassword(newHashedPassword);
			try{
				userDAO.updatePassword(loggedInUser);
			}catch(DataAccessException exception){
				return new JSONResponse("failure", exception.getMessage());
			}
			return new JSONResponse("success", loggedInUser);
		}else{
			return new JSONResponse("failure", "there is no user in the session");
		}
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
					errorMap.put("password", "your email/password is incorrect");
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

	@RequestMapping(path="/user/getProfile", method=RequestMethod.GET)
	public JSONResponse logout(ModelMap model){
		if(model.containsAttribute("loggedInUser")){
			User user = (User) model.get("loggedInUser");
			ProfileInfo profileInfo = new ProfileInfo();
			profileInfo.setName(user.getName());
			profileInfo.setHeight(user.getHeight());
			profileInfo.setWeight(user.getWeight());
			profileInfo.setGender(user.getGender());
			return new JSONResponse("success", profileInfo);
		}
		return new JSONResponse("failure", "there is no user in the session");
	}

	@RequestMapping(path="/user/getGoals", method=RequestMethod.GET)
	public JSONResponse getGoals(ModelMap model){
		if(model.containsAttribute("loggedInUser")){
			User user = (User) model.get("loggedInUser");
			GoalInfo goalInfo = new GoalInfo();
			goalInfo.setTargetWeight(user.getTargetWeight());
			goalInfo.setTargetCalories(user.getTargetCalories());
			return new JSONResponse("success", goalInfo);
		}else{
			return new JSONResponse("failure", "there is no user in the session");
		}
	}

}
