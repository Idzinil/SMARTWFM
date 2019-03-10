package com.sytecso.ws.dto.request;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;


import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.sytecso.component.CustomDateDeserializer;
import com.sytecso.ws.rest.validations.AllowedAcctionsOrdenServicio;
import com.sytecso.ws.rest.validations.AllowedStatusOrders;

public class OrdenServicioDTORequest {
	@NotNull(message="{msg.ws.orden.servicio.idCuadrillaNull}")
	@NotEmpty(message="{msg.ws.orden.servicio.idCuadrillaEmpty}")
	private String idCuadrilla;
	@NotNull(message="{msg.ws.orden.servicio.accionNull}")
	@AllowedAcctionsOrdenServicio
	private Integer accion;
	@NotNull(message="{msg.ws.orden.servicio.descripcionNull}")
	@NotEmpty(message="{msg.ws.orden.servicio.descripcionEmpty}")
	private String descripcion;
	@NotNull(message="{msg.ws.orden.servicio.fechaFinNull}")
	@JsonDeserialize(using=CustomDateDeserializer.class)
	private Date fechaFin;
	@NotNull(message="{msg.ws.orden.servicio.statusOrdenNull}")
	@AllowedStatusOrders
	private String statusOrden;
	@NotNull(message="{msg.ws.orden.servicio.fechaHoraNull}")
	@JsonDeserialize(using=CustomDateDeserializer.class)
	private Date fechaHora;
	@NotNull(message="{msg.ws.orden.servicio.notasAdicionalesNull}")
	@NotEmpty(message="{msg.ws.orden.servicio.notasAdicionalesEmpty}")
	private String notasAdicionales;
	@NotNull(message="{msg.ws.orden.servicio.insumosOrdenNull}")
	private List<InsumosOrdenDTORequest> insumosOrden;

	public String getIdCuadrilla() {
		return idCuadrilla;
	}
	public Integer getAccion() {
		return accion;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public Date getFechaFin() {
		return fechaFin;
	}
	public String getStatusOrden() {
		return statusOrden;
	}
	public Date getFechaHora() {
		return fechaHora;
	}
	public String getNotasAdicionales() {
		return notasAdicionales;
	}
	public void setIdCuadrilla(String idCuadrilla) {
		this.idCuadrilla = idCuadrilla;
	}
	public void setAccion(Integer accion) {
		this.accion = accion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}
	public void setStatusOrden(String statusOrden) {
		this.statusOrden = statusOrden;
	}
	public void setFechaHora(Date fechaHora) {
		this.fechaHora = fechaHora;
	}
	public void setNotasAdicionales(String notasAdicionales) {
		this.notasAdicionales = notasAdicionales;
	}
	public List<InsumosOrdenDTORequest> getInsumosOrden() {
		return insumosOrden;
	}
	public void setInsumosOrden(List<InsumosOrdenDTORequest> insumosOrden) {
		this.insumosOrden = insumosOrden;
	}
	
}
