package com.sytecso.ws.dto.request;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;


import com.sytecso.ws.rest.validations.AllowedAcctionsEvidenciaAdjunta;

public class EvidenciaAdjuntaDTORequest {
	@NotNull(message="{msg.ws.evidencia.adjunta.idOrdenNull}")
	@NotEmpty(message="{msg.ws.evidencia.adjunta.idOrdenEmpty}")
	private String idOrden;
	@NotNull(message="{msg.ws.evidencia.adjunta.idCuadrillaNull}")
	@NotEmpty(message="{msg.ws.evidencia.adjunta.idCuadrillaEmpty}")
	private String idCuadrilla;
	@NotNull(message="{msg.ws.evidencia.adjunta.tipoEvidenciaNull}")
	@NotEmpty(message="{msg.ws.evidencia.adjunta.tipoEvidenciaEmpty}")
	private String tipoEvidencia;
	@NotNull(message="{msg.ws.evidencia.adjunta.idEvidenciaNull}")
	@NotEmpty(message="{msg.ws.evidencia.adjunta.idEvidenciaEmpty}")
	private String idEvidencia;
	/*
	 * TODO ESTE CAMPO ESTA AR EVISION PARA DECIDIR EL TIPO DE DATO
	 * **/
//	@NotNull(message="idCuadrilla cannot be null")
//	@NotBlank(message="idCuadrilla cannot be blank")
//	@NotEmpty(message="idCuadrilla cannot be empty")
//	private byte[] fotografia;
	@NotNull(message="{msg.ws.evidencia.adjunta.accionNull}")
	@NotEmpty(message="{msg.ws.evidencia.adjunta.accionEmpty}")
	@AllowedAcctionsEvidenciaAdjunta
	private String accion;
	
	public String getIdOrden() {
		return idOrden;
	}
	public String getIdCuadrilla() {
		return idCuadrilla;
	}
	public String getTipoEvidencia() {
		return tipoEvidencia;
	}
	public String getIdEvidencia() {
		return idEvidencia;
	}
//	public byte[] getFotografia() {
//		return fotografia;
//	}
	public String getAccion() {
		return accion;
	}
	public void setIdOrden(String idOrden) {
		this.idOrden = idOrden;
	}
	public void setIdCuadrilla(String idCuadrilla) {
		this.idCuadrilla = idCuadrilla;
	}
	public void setTipoEvidencia(String tipoEvidencia) {
		this.tipoEvidencia = tipoEvidencia;
	}
	public void setIdEvidencia(String idEvidencia) {
		this.idEvidencia = idEvidencia;
	}
//	public void setFotografia(byte[] fotografia) {
//		this.fotografia = fotografia;
//	}
	public void setAccion(String accion) {
		this.accion = accion;
	}
	
}
