package com.techelevator.fitness.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.fitness.model.FoodEvent;
import com.techelevator.fitness.model.FoodEventDAO;
import com.techelevator.fitness.model.JSONResponse;
import com.techelevator.fitness.model.User;

@RestController
@SessionAttributes("loggedInUser")
public class FoodEventAPIController {

	private FoodEventDAO foodEventDAO;

	@Autowired
	FoodEventAPIController(FoodEventDAO foodEventDAO) {
		this.foodEventDAO = foodEventDAO;
	}

	@RequestMapping(path="foodEvent/add", method=RequestMethod.POST)
	public JSONResponse addFoodEvent(@ModelAttribute FoodEvent newFoodEvent, ModelMap model) {
		if(model.containsAttribute("loggedInUser")){
			User user = (User) model.get("loggedInUser");
			newFoodEvent.setUserId(user.getUserId());
			try{
			foodEventDAO.addFoodEvent(newFoodEvent);
			}catch(DataAccessException exception){
				return new JSONResponse("failure", exception.getMessage());
			}
			return new JSONResponse("success", newFoodEvent);
		}else{
			return new JSONResponse("failure", "no user in session");
		}
	}

	@RequestMapping(path="foodEvent/delete", method=RequestMethod.DELETE)
	public JSONResponse deleteFoodEvent(@RequestParam Long foodEventId, ModelMap model) {
		if(model.containsAttribute("loggedInUser")){
			try{
			foodEventDAO.removeFoodEvent(foodEventId);
			}catch(DataAccessException exception){
				return new JSONResponse("failure", exception.getMessage());
			}
			return new JSONResponse("success", foodEventId);
		}else{
			return new JSONResponse("failure", "no user in session");
		}
	}

	@RequestMapping(path="foodEvent/getEvents", method=RequestMethod.GET)
	public JSONResponse getAllUserFoodEvents(ModelMap model) {
		List<FoodEvent> foodEventList = new ArrayList<>();
		if(model.containsAttribute("loggedInUser")) {
			User user = (User) model.get("loggedInUser");
			try{
			foodEventList = foodEventDAO.getAllUserFoodEvents(user.getUserId());
			}catch(DataAccessException exception){
				return new JSONResponse("failure", exception.getMessage());
			}
			return new JSONResponse("success", foodEventList);
		} else {
			return new JSONResponse("failure", "no user in session");
		}
	}
	
}

