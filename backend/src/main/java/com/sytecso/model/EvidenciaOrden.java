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
@Table(name = "evidenciaOrden")
public class EvidenciaOrden implements Serializable {

	private static final long serialVersionUID = -8180443014814091522L;

	@Id
	@Column(name = "idevidenciaOrden")
	@GeneratedValue(generator = "pkIdevidenciaOrden")
	@GenericGenerator(name = "pkIdevidenciaOrden", strategy = "increment")
	private BigDecimal idevidenciaOrden;
	@Column(name = "tipoEvidencia")
	private String tipoEvidencia;
	@Column(name = "idCuadrilla")
	private String idCuadrilla;
	@Column(name = "evidencia")
	private String evidencia;
	
	//se tiene una relacion de muchos a uno mapeada por la propiedad
	//idOrden que se encuentra en la clase orden(clase padre)
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name="Orden_idOrden", nullable = false, updatable = true, insertable = true)
	private Orden orden;
	
	
	public BigDecimal getIdevidenciaOrden() {
		return idevidenciaOrden;
	}

	public void setIdevidenciaOrden(BigDecimal idevidenciaOrden) {
		this.idevidenciaOrden = idevidenciaOrden;
	}

	public String getTipoEvidencia() {
		return tipoEvidencia;
	}

	public void setTipoEvidencia(String tipoEvidencia) {
		this.tipoEvidencia = tipoEvidencia;
	}

	public String getIdCuadrilla() {
		return idCuadrilla;
	}

	public void setIdCuadrilla(String idCuadrilla) {
		this.idCuadrilla = idCuadrilla;
	}

	public String getEvidencia() {
		return evidencia;
	}

	public void setEvidencia(String evidencia) {
		this.evidencia = evidencia;
	}

	public Orden getOrden() {
		return orden;
	}

	public void setOrden(Orden orden) {
		this.orden = orden;
	}


}
