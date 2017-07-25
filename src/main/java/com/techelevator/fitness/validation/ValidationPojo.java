package com.techelevator.fitness.validation;

import java.util.List;
import java.util.Map;

import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

public class ValidationPojo {

	private String status;
	private Map<String, List<FieldError>> errors;
	
	
	public Map<String, List<FieldError>> generateErrorMessage(BindingResult result) {
		errors.put("fieldName", result.getFieldErrors().get(1));
	}
	
}
