package com.techelevator.fitness.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FrontEndController {
	@RequestMapping(path="/", method=RequestMethod.GET)
	public String indexPage(){
		return "index";
		
	}
}
