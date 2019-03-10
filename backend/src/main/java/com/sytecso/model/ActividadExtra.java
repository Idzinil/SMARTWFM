package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="ActividadExtra")
public class ActividadExtra implements Serializable {

	private static final long serialVersionUID = -6396053207993230829L;
	@Id
	@Column(name="Actividad_IdActividad")
	private BigDecimal actividadIdActivida;
	@Id
	@Column(name="Orden_IdOrden")
	private BigDecimal ordenIdOrden;
	public BigDecimal getActividadIdActivida() {
		return actividadIdActivida;
	}
	public void setActividadIdActivida(BigDecimal actividadIdActivida) {
		this.actividadIdActivida = actividadIdActivida;
	}
	public BigDecimal getOrdenIdOrden() {
		return ordenIdOrden;
	}
	public void setOrdenIdOrden(BigDecimal ordenIdOrden) {
		this.ordenIdOrden = ordenIdOrden;
	}
	
	
}
