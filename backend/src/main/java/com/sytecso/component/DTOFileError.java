package com.sytecso.component;

import java.io.Serializable;

public class DTOFileError implements Serializable{

	private static final long serialVersionUID = 6169333846818481246L;
	
	public DTOFileError() {
		
	}
	public DTOFileError(Integer fila, String errorMessage) {
		super();
		this.fila = fila;
		this.errorMessage = errorMessage;
	}
	
	private Integer fila;
	private String errorMessage;
	public Integer getFila() {
		return fila;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setFila(Integer fila) {
		this.fila = fila;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
}
