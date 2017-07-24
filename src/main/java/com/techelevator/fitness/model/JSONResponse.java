package com.techelevator.fitness.model;

public class JSONResponse {
	
	private String status;
	private Object value;
	
	public JSONResponse(String status, Object value) {
		this.status = status;
		this.value = value;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Object getValue() {
		return value;
	}
	public void setValue(Object value) {
		this.value = value;
	}

}
