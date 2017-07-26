package com.techelevator.fitness.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	@RequestMapping(path="foodevent/add", method=RequestMethod.POST)
	public JSONResponse addFoodEvent(@ModelAttribute FoodEvent newFoodEvent) {
		foodEventDAO.addFoodEvent(newFoodEvent);
		return new JSONResponse("success", newFoodEvent);
	}

	@RequestMapping(path="foodevent/delete", method=RequestMethod.DELETE)
	public JSONResponse deleteFoodEvent(@ModelAttribute FoodEvent foodEvent) {
		foodEventDAO.removeFoodEvent(foodEvent.getId());
		return new JSONResponse("success", foodEvent);
	}

	@RequestMapping(path="foodevent/getevents", method=RequestMethod.GET)
	public JSONResponse getAllUserFoodEvents(ModelMap model) {
		List<FoodEvent> foodEventList = new ArrayList<>();
		if(model.containsAttribute("loggedInUser")) {
			User user = (User) model.get("loggedInUser");
			foodEventList = foodEventDAO.getAllUserFoodEvents(user.getUserId());
			return new JSONResponse("success", foodEventList);
		} else {
			return new JSONResponse("failure", "You must be logged in");
		}

	}
}

