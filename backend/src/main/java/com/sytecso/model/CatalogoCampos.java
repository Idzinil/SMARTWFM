package com.sytecso.model;

import java.io.Serializable;

import javax.persistence.Column;

public class CatalogoCampos implements Serializable{

	private static final long serialVersionUID = -1213187340581104917L;
	@Column(name="nombreCampoPantalla")
	private String nombreCampoPantalla;
	@Column(name="nombreCampoVariable")
	private String nombreCampoVariable;
	public String getNombreCampoPantalla() {
		return nombreCampoPantalla;
	}
	public void setNombreCampoPantalla(String nombreCampoPantalla) {
		this.nombreCampoPantalla = nombreCampoPantalla;
	}
	public String getNombreCampoVariable() {
		return nombreCampoVariable;
	}
	public void setNombreCampoVariable(String nombreCampoVariable) {
		this.nombreCampoVariable = nombreCampoVariable;
	}
	
	
}
