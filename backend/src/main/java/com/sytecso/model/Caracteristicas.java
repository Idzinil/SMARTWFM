package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

public class Caracteristicas implements Serializable{

	private static final long serialVersionUID = 3730703194209792371L;
	@Id
	@Column(name="idCaracteristicas")
	@GeneratedValue(generator="pkIdCaracteristica")
	@GenericGenerator(name="pkIdDatosUsuarioFinal",strategy="increment")
	private BigDecimal idCaracteristica;
	@Column(name="NombreCaracteristica")
	private String nombreCaracteristica;
	@Column(name="DescripcionCaracteristica")
	private String descripcionCaracteristica;
	@Column(name="TiempoPromedio")
	private Integer tiempoPromedioCaracteristica;
	@Column(name="TipoOrden_idOrden")
	private BigDecimal fkTipoOrdenIdOrden;
	
	public BigDecimal getIdCaracteristica() {
		return idCaracteristica;
	}
	public void setIdCaracteristica(BigDecimal idCaracteristica) {
		this.idCaracteristica = idCaracteristica;
	}
	public String getNombreCaracteristica() {
		return nombreCaracteristica;
	}
	public void setNombreCaracteristica(String nombreCaracteristica) {
		this.nombreCaracteristica = nombreCaracteristica;
	}
	public String getDescripcionCaracteristica() {
		return descripcionCaracteristica;
	}
	public void setDescripcionCaracteristica(String descripcionCaracteristica) {
		this.descripcionCaracteristica = descripcionCaracteristica;
	}
	public Integer getTiempoPromedioCaracteristica() {
		return tiempoPromedioCaracteristica;
	}
	public void setTiempoPromedioCaracteristica(Integer tiempoPromedioCaracteristica) {
		this.tiempoPromedioCaracteristica = tiempoPromedioCaracteristica;
	}
	public BigDecimal getFkTipoOrdenIdOrden() {
		return fkTipoOrdenIdOrden;
	}
	public void setFkTipoOrdenIdOrden(BigDecimal fkTipoOrdenIdOrden) {
		this.fkTipoOrdenIdOrden = fkTipoOrdenIdOrden;
	}
	
	
}
