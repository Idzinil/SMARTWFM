package com.sytecso.ws.dto.response;

import javax.validation.constraints.NotNull;

public class InsumosOrdenDTOResponse {
	@NotNull(message="idInsumo cannot be null")
	private String idInsumo;
	@NotNull(message="unidadMedida cannot be null")
	private String unidadMedida;
	@NotNull(message="nombreInsumo cannot be null")
	private String nombreInsumo;
	@NotNull(message="idCliente cannot be null")
	private String idCliente;
	@NotNull(message="idClienteAsociado cannot be null")
	private String idClienteAsociado;
	
	public String getIdInsumo() {
		return idInsumo;
	}
	public String getUnidadMedida() {
		return unidadMedida;
	}
	public String getNombreInsumo() {
		return nombreInsumo;
	}
	public String getIdCliente() {
		return idCliente;
	}
	public String getIdClienteAsociado() {
		return idClienteAsociado;
	}

	public void setIdInsumo(String idInsumo) {
		this.idInsumo = idInsumo;
	}
	public void setUnidadMedida(String unidadMedida) {
		this.unidadMedida = unidadMedida;
	}
	public void setNombreInsumo(String nombreInsumo) {
		this.nombreInsumo = nombreInsumo;
	}
	public void setIdCliente(String idCliente) {
		this.idCliente = idCliente;
	}
	public void setIdClienteAsociado(String idClienteAsociado) {
		this.idClienteAsociado = idClienteAsociado;
	}

	
}
