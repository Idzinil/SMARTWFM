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
@Table(name = "RecesoCuadrilla")
public class RecesoCuadrilla implements Serializable {

	
	private static final long serialVersionUID = -7476130200578526707L;

	@Column(name = "horaFin")
	private String horaFin;
	@Id
	//se tiene una relacion de muchos a uno mapeada con la propiedad
	//idCuadrilla que se encuentra en la clase cuadrilla(clase padre)
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name= "Cuadrilla_idCuadrilla", nullable = false, updatable = true, insertable = true)
	private Cuadrilla cuadrilla;
	@Column(name = "tipoReceso")
	private String tipoReceso;
	

	
	
	
	public String getHoraFin() {
		return horaFin;
	}

	public void setHoraFin(String horaFin) {
		this.horaFin = horaFin;
	}


	public String getTipoReceso() {
		return tipoReceso;
	}

	public void setTipoReceso(String tipoReceso) {
		this.tipoReceso = tipoReceso;
	}

	public Cuadrilla getCuadrilla() {
		return cuadrilla;
	}

	public void setCuadrilla(Cuadrilla cuadrilla) {
		this.cuadrilla = cuadrilla;
	}

}
