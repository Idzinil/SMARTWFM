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
@Table(name = "manejoEjecucionesSistema")
public class ManejoEjecucionesSistema implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6281207156859604451L;

	@Id
	@Column(name = "usuarioCuenta_idusuarioCuenta")
	@GeneratedValue(generator = "pkUsuarioCuenta_idusuarioCuenta")
	@GenericGenerator(name = "pkUsuarioCuenta_idusuarioCuenta", strategy = "increment")
	private BigDecimal usuarioCuenta_idusuarioCuenta;
	
	@Column(name = "fechaAccion")
	private String fechaAccion;
	@Column(name = "ipAccion")
	private String ipAccion;

	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "eventoSistema_ideventoSistema")
	private EventoSistema eventoSistema;
	

	public BigDecimal getUsuarioCuenta_idusuarioCuenta() {
		return usuarioCuenta_idusuarioCuenta;
	}

	public void setUsuarioCuenta_idusuarioCuenta(BigDecimal usuarioCuenta_idusuarioCuenta) {
		this.usuarioCuenta_idusuarioCuenta = usuarioCuenta_idusuarioCuenta;
	}

	public String getFechaAccion() {
		return fechaAccion;
	}

	public void setFechaAccion(String fechaAccion) {
		this.fechaAccion = fechaAccion;
	}

	public String getIpAccion() {
		return ipAccion;
	}

	public void setIpAccion(String ipAccion) {
		this.ipAccion = ipAccion;
	}

	public EventoSistema getEventoSistemas() {
		return eventoSistema;
	}

	public void setEventoSistemas(EventoSistema eventoSistema) {
		this.eventoSistema = eventoSistema;
	}

	

}
