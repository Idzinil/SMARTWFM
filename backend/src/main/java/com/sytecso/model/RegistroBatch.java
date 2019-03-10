package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
@Table(name = "registroBatch")
public class RegistroBatch implements Serializable {

	private static final long serialVersionUID = 952412147933288060L;

	@Id
	@Column(name = "idregistroBatch")
	@GeneratedValue(generator = "pkidregistroBatch")
	@GenericGenerator(name = "pkidregistroBatch", strategy = "increment")
	private BigDecimal idregistroBatch;
	//se tiene una relacion de uno a muchos mapeada por la propiedad
	//registroBatch que esta en la clase eventoSistema(clase hija)
	@OneToMany(mappedBy = "registroBatch", cascade = CascadeType.ALL)
	@NotFound(action = NotFoundAction.IGNORE)
	private List<EventoSistema> eventoSistema;
	
	@OneToMany(mappedBy = "registroBatch", cascade = CascadeType.ALL)
	@NotFound(action = NotFoundAction.IGNORE)
	private List<InsumosCte> insumocte;
	
	@OneToMany(mappedBy = "registroBatch", cascade = CascadeType.ALL)
	@NotFound(action = NotFoundAction.IGNORE)
	private List<InsumosEmpresa> insumosEmpresa;
	
	@Column(name = "nombreArchivo")
	private String nombreArchivo;
	@Column(name = "tipoCarga")
	private String tipoCarga;
	@Column(name = "registrosInsertados")
	private BigDecimal registrosInsertados;
	@Column(name = "registrosRechazados")
	private BigDecimal registrosRechazados;

	public String getNombreArchivo() {
		return nombreArchivo;
	}

	public void setNombreArchivo(String nombreArchivo) {
		this.nombreArchivo = nombreArchivo;
	}

	public String getTipoCarga() {
		return tipoCarga;
	}

	public void setTipoCarga(String tipoCarga) {
		this.tipoCarga = tipoCarga;
	}

	public BigDecimal getRegistrosInsertados() {
		return registrosInsertados;
	}

	public void setRegistrosInsertados(BigDecimal registrosInsertados) {
		this.registrosInsertados = registrosInsertados;
	}

	public BigDecimal getRegistrosRechazados() {
		return registrosRechazados;
	}

	public BigDecimal getIdregistroBatch() {
		return idregistroBatch;
	}

	public void setIdregistroBatch(BigDecimal idregistroBatch) {
		this.idregistroBatch = idregistroBatch;
	}

	public void setRegistrosRechazados(BigDecimal registrosRechazados) {
		this.registrosRechazados = registrosRechazados;
	}

	public List<EventoSistema> getEventoSistema() {
		return eventoSistema;
	}

	public void setEventoSistema(List<EventoSistema> eventoSistema) {
		this.eventoSistema = eventoSistema;
	}

	public List<InsumosCte> getInsumocte() {
		return insumocte;
	}

	public void setInsumocte(List<InsumosCte> insumocte) {
		this.insumocte = insumocte;
	}

}
