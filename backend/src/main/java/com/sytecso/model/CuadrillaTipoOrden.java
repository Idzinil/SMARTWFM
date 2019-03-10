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
@Table(name = "CuadrillaTipoOrden")
public class CuadrillaTipoOrden implements Serializable {

	private static final long serialVersionUID = -8533362576770470993L;
	@Id
	@Column(name = "Cuadrilla_idCuadrilla")
	private BigDecimal cuadrillaIdCuadrilla;
	@Id
	@Column(name = "TipoOrden_idOrden")
	private BigDecimal tipoOrdenIdOrden;
	@Column(name = "TiempoPromedioOrden")
	private Integer tiempoPromedioOrden;
	
	//se tiene una relacion de muchos a uno mapeada en la propiedad
	//Cuadrilla_idCuadrilla que se encuentra en la clase cuadrilla(clase padre)
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name= "Cuadrilla_idCuadrilla", nullable = false, updatable = true, insertable = true)
	private Cuadrilla cuadrilla;
	

	public BigDecimal getCuadrillaIdCuadrilla() {
		return cuadrillaIdCuadrilla;
	}

	public void setCuadrillaIdCuadrilla(BigDecimal cuadrillaIdCuadrilla) {
		this.cuadrillaIdCuadrilla = cuadrillaIdCuadrilla;
	}

	public BigDecimal getTipoOrdenIdOrden() {
		return tipoOrdenIdOrden;
	}

	public void setTipoOrdenIdOrden(BigDecimal tipoOrdenIdOrden) {
		this.tipoOrdenIdOrden = tipoOrdenIdOrden;
	}

	public Integer getTiempoPromedioOrden() {
		return tiempoPromedioOrden;
	}

	public void setTiempoPromedioOrden(Integer tiempoPromedioOrden) {
		this.tiempoPromedioOrden = tiempoPromedioOrden;
	}

	public Cuadrilla getCuadrilla() {
		return cuadrilla;
	}

	public void setCuadrilla(Cuadrilla cuadrilla) {
		this.cuadrilla = cuadrilla;
	}

}
