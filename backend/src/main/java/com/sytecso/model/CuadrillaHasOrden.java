package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "CuadrillaHasOrden")
public class CuadrillaHasOrden implements Serializable {

	private static final long serialVersionUID = 724987713601967548L;
	@Id
	@Column(name = "Cuadrilla_idCuadrilla")
	private BigDecimal cuadrillaIdCuadrilla;
	@Id
	@Column(name = "Orden_idOrden")
	private BigDecimal ordenIdOrden;
	@Column(name = "fechaInicio")
	private String fechaInicio;
	@Column(name = "fechafin")
	private String fechafin;
	
	//se tiene una relacion de muchos a uno mapeada con la propiedad 
	//idCuadrilla que s encuentra en la clase cuadrilla(clase padre)
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "cuadrillaIdCuadrilla", nullable = false, updatable = true, insertable = true)
	private Cuadrilla cuadrilla;
	
	
	public BigDecimal getCuadrillaIdCuadrilla() {
		return cuadrillaIdCuadrilla;
	}

	public void setCuadrillaIdCuadrilla(BigDecimal cuadrillaIdCuadrilla) {
		this.cuadrillaIdCuadrilla = cuadrillaIdCuadrilla;
	}

	public BigDecimal getOrdenIdOrden() {
		return ordenIdOrden;
	}

	public void setOrdenIdOrden(BigDecimal ordenIdOrden) {
		this.ordenIdOrden = ordenIdOrden;
	}

	public String getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public String getFechafin() {
		return fechafin;
	}

	public void setFechafin(String fechafin) {
		this.fechafin = fechafin;
	}

	public Cuadrilla getCuadrilla() {
		return cuadrilla;
	}

	public void setCuadrilla(Cuadrilla cuadrilla) {
		this.cuadrilla = cuadrilla;
	}

}
