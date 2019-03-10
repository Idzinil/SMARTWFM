package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name = "UsuariosAccesoHasCuadrilla")
public class UsuariosAccesoHasCuadrilla implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5634376325408263292L;

	@Id
	//@Column(name = "Cuadrilla_idCuadrilla")
	//@GeneratedValue(generator = "pkCuadrilla_idCuadrilla")
	//private BigDecimal Cuadrilla_idCuadrilla;
	//se tiene una relacion de muchos a uno mapeada por la relacion 
	//idCuadrilla que se encuentra en la clase Cuadrilla(clase padre)
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "Cuadrilla_idCuadrilla", nullable = false, updatable = true, insertable = true)
	private Cuadrilla cuadrilla;

	
	@Column(name = "fechaConexion")
	private String fechaConexion;
	@Column(name = "primeraConexion")
	private String primeraConexion;
	
	
	
//	public BigDecimal getCuadrilla_idCuadrilla() {
//		return Cuadrilla_idCuadrilla;
//	}
//
//	public void setCuadrilla_idCuadrilla(BigDecimal cuadrilla_idCuadrilla) {
//		Cuadrilla_idCuadrilla = cuadrilla_idCuadrilla;
//	}

	public String getFechaConexion() {
		return fechaConexion;
	}

	public void setFechaConexion(String fechaConexion) {
		this.fechaConexion = fechaConexion;
	}

	public String getPrimeraConexion() {
		return primeraConexion;
	}

	public void setPrimeraConexion(String primeraConexion) {
		this.primeraConexion = primeraConexion;
	}

	public Cuadrilla getCuadrilla() {
		return cuadrilla;
	}

	public void setCuadrilla(Cuadrilla cuadrilla) {
		this.cuadrilla = cuadrilla;
	}

}
