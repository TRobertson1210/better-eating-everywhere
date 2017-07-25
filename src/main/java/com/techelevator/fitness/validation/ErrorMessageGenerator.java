package com.techelevator.fitness.validation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

public class ErrorMessageGenerator {	
	

	public Map<String, String> generateErrorMessage(BindingResult result) {
		List<FieldError> fieldErrorList = result.getFieldErrors();
				
		Map<String, String> errorMap = new HashMap<>();
		
		for(FieldError fieldError : fieldErrorList){
			String defaultMessage = fieldError.getDefaultMessage();
			String field = fieldError.getField();
			errorMap.put(field, defaultMessage);
		}
				
			
		return errorMap;
	}
	
}
