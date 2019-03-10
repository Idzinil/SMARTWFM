package com.sytecso.ws.dto.request;

import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;


import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.sytecso.component.CustomDateDeserializer;

public class UsuarioRecesoDTORequest {
	@NotNull(message="{msg.ws.usuario.receso.idCuadrillaNull}")
	@NotEmpty(message="{msg.ws.usuario.receso.idCuadrillaEmpty}")
	private String idCuadrilla;
	@NotNull(message="{msg.ws.usuario.receso.horaInicioNull}")
	@JsonDeserialize(using=CustomDateDeserializer.class)
	private Date horaInicio;
	@NotNull(message="{msg.ws.usuario.receso.horaFinNull}")
	@JsonDeserialize(using=CustomDateDeserializer.class)
	private Date horaFin;
	@NotNull(message="{msg.ws.usuario.receso.notasAdicionalesNull}")
	@NotEmpty(message="{msg.ws.usuario.receso.notasAdicionalesEmpty}")
	private String notasAdicionales;
	
	public String getIdCuadrilla() {
		return idCuadrilla;
	}
	public Date getHoraInicio() {
		return horaInicio;
	}
	public Date getHoraFin() {
		return horaFin;
	}
	public String getNotasAdicionales() {
		return notasAdicionales;
	}
	public void setIdCuadrilla(String idCuadrilla) {
		this.idCuadrilla = idCuadrilla;
	}
	public void setHoraInicio(Date horaInicio) {
		this.horaInicio = horaInicio;
	}
	public void setHoraFin(Date horaFin) {
		this.horaFin = horaFin;
	}
	public void setNotasAdicionales(String notasAdicionales) {
		this.notasAdicionales = notasAdicionales;
	}

}
