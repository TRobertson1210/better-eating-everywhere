package com.techelevator.fitness.validation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

public class ErrorMessageGenerator {	
	

	public List<Map<String, String>> generateErrorMessage(BindingResult result) {
		List<FieldError> fieldErrorList = result.getFieldErrors();
		
		List<Map<String, String>> bigErrorList = new ArrayList<>();
		
		for(FieldError fieldError : fieldErrorList){
			String defaultMessage = fieldError.getDefaultMessage();
			String field = fieldError.getField();
			Map<String, String> errorMap = new HashMap<>();
			//errorMap.put("Field", field);
			errorMap.put(field, defaultMessage);
			bigErrorList.add(errorMap);
		}
				
			
		return bigErrorList;
	}
	
}
