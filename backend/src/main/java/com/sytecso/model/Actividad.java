package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


public class Actividad implements Serializable {
	private static final long serialVersionUID = 4384849848729545337L;
	private BigDecimal idActividad;
	private String nombreActivlidad;
	private String descripcionActividad;
	private Integer tiempoPromedioActividad;
	private BigDecimal fkIdCaracteristica;
	
	

	public BigDecimal getIdActividad() {
		return idActividad;
	}

	public void setIdActividad(BigDecimal idActividad) {
		this.idActividad = idActividad;
	}

	public String getNombreActivlidad() {
		return nombreActivlidad;
	}

	public void setNombreActivlidad(String nombreActivlidad) {
		this.nombreActivlidad = nombreActivlidad;
	}

	public String getDescripcionActividad() {
		return descripcionActividad;
	}

	public void setDescripcionActividad(String descripcionActividad) {
		this.descripcionActividad = descripcionActividad;
	}

	public Integer getTiempoPromedioActividad() {
		return tiempoPromedioActividad;
	}

	public void setTiempoPromedioActividad(Integer tiempoPromedioActividad) {
		this.tiempoPromedioActividad = tiempoPromedioActividad;
	}

	public BigDecimal getFkIdCaracteristica() {
		return fkIdCaracteristica;
	}

	public void setFkIdCaracteristica(BigDecimal fkIdCaracteristica) {
		this.fkIdCaracteristica = fkIdCaracteristica;
	}

}
