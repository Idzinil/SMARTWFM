package com.sytecso.ws.dto.request;

import java.util.Date;


import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;


import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.sytecso.component.CustomDateDeserializer;

public class OrdenEstatusDTORequest {
	@NotNull(message="{msg.ws.orden.estatus.idOrdenNull}")
	@NotEmpty(message="{msg.ws.orden.estatus.idOrdenEmpty}")
	private String idOrden;
	@NotNull(message="{msg.ws.orden.estatus.idCuadrillaNull}")
	@NotEmpty(message="{msg.ws.orden.estatus.idCuadrillaEmpty}")
	private String idCuadrilla;
	@NotNull(message="{msg.ws.orden.estatus.estatusOrdenNull}")
	@NotEmpty(message="msg.ws.orden.estatus.estatusOrdenEmpty")
	private String statusOrden;
	@NotNull(message="{msg.ws.orden.estatus.fechaOrdenNull}")
	@JsonDeserialize(using=CustomDateDeserializer.class)
	private Date fechaOrden;
	@NotNull(message="{msg.ws.orden.estatus.alertaNull}")
	private String alerta;
	
	public String getIdOrden() {
		return idOrden;
	}
	public String getIdCuadrilla() {
		return idCuadrilla;
	}
	public String getStatusOrden() {
		return statusOrden;
	}
	public Date getFechaOrden() {
		return fechaOrden;
	}
	public String getAlerta() {
		return alerta;
	}
	public void setIdOrden(String idOrden) {
		this.idOrden = idOrden;
	}
	public void setIdCuadrilla(String idCuadrilla) {
		this.idCuadrilla = idCuadrilla;
	}
	public void setStatusOrden(String statusOrden) {
		this.statusOrden = statusOrden;
	}
	public void setFechaOrden(Date fechaOrden) {
		this.fechaOrden = fechaOrden;
	}
	public void setAlerta(String alerta) {
		this.alerta = alerta;
	}
	
}
