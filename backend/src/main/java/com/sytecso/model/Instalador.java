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
@Table(name = "Instalador")
public class Instalador implements Serializable {

	private static final long serialVersionUID = 5225452214679965711L;
	@Id
	@Column(name = "idInstalador")
	@GeneratedValue(generator = "pkIdInstalador")
	@GenericGenerator(name = "pkIdInstalador", strategy = "increment")
	private BigDecimal idInstalador;
	@Column(name = "NombreInstalador")
	private String nombreInstalador;
	@Column(name = "NumeroEmpleado")
	private String numeroEmpleado;
	@Column(name = "apellidoPaterno")
	private String apellidoPaterno;
	@Column(name = "ApellidoMaterno")
	private String apellidoMaterno;
	@Id
	@Column(name = "Cuadrilla_idCuadrilla")
	private BigDecimal cuadrilla_idCuadrilla;
	@Column(name = "rol")
	private String rol;
	
	//se tiene una relacion de muchos a uno mapeada por la relacion
	//idCuadrilla que se encuentra en la clase cuadrilla(clase padre)
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "cuadrilla_idCuadrilla", nullable = false, updatable = true, insertable = true)
	private Cuadrilla cuadrilla;
	
	public BigDecimal getIdInstalador() {
		return idInstalador;
	}

	public void setIdInstalador(BigDecimal idInstalador) {
		this.idInstalador = idInstalador;
	}

	public String getNumeroEmpleado() {
		return numeroEmpleado;
	}

	public void setNumeroEmpleado(String numeroEmpleado) {
		this.numeroEmpleado = numeroEmpleado;
	}

	public String getApellidoPaterno() {
		return apellidoPaterno;
	}

	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}

	public String getApellidoMaterno() {
		return apellidoMaterno;
	}

	public void setApellidoMaterno(String apellidoMaterno) {
		this.apellidoMaterno = apellidoMaterno;
	}


	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public String getNombreInstalador() {
		return nombreInstalador;
	}

	public void setNombreInstalador(String nombreInstalador) {
		this.nombreInstalador = nombreInstalador;
	}

	public BigDecimal getCuadrilla_idCuadrilla() {
		return cuadrilla_idCuadrilla;
	}

	public void setCuadrilla_idCuadrilla(BigDecimal cuadrilla_idCuadrilla) {
		this.cuadrilla_idCuadrilla = cuadrilla_idCuadrilla;
	}

	public Cuadrilla getCuadrilla() {
		return cuadrilla;
	}

	public void setCuadrilla(Cuadrilla cuadrilla) {
		this.cuadrilla = cuadrilla;
	}
	
	

}
