package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name = "eventosOrden")
public class EventosOrden implements Serializable {

	private static final long serialVersionUID = 2631314847214717710L;

	@Id
	@Column(name = "ideventosOrden")
	@GeneratedValue(generator = "pkIdeventosOrden")
	@GenericGenerator(name = "pkIdeventosOrden", strategy = "increment")
	private BigDecimal ideventosOrden;
	@Column(name = "fechaEvento")
	private String fechaEvento;
	@Column(name = "descripcion")
	private String descripcion;
	@Column(name = "estatus")
	private String estatus;

	
	//se tiene una relacion de muchos a uno mapeada por la propiedad
	//idOrden(PK) que se encuentra en la clase Orden(Clase padre)
	@ManyToOne(cascade = CascadeType.ALL, fetch =  FetchType.LAZY)
	@JoinColumn(name =  "Orden_idOrden", updatable=true, insertable=true)
	private Orden orden;

	public Orden getOrden() {
		return orden;
	}

	public void setOrden(Orden orden) {
		this.orden = orden;
	}

	public BigDecimal getIdeventosOrden() {
		return ideventosOrden;
	}

	public void setIdeventosOrden(BigDecimal ideventosOrden) {
		this.ideventosOrden = ideventosOrden;
	}

	public String getFechaEvento() {
		return fechaEvento;
	}

	public void setFechaEvento(String fechaEvento) {
		this.fechaEvento = fechaEvento;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getEstatus() {
		return estatus;
	}

	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}


}
