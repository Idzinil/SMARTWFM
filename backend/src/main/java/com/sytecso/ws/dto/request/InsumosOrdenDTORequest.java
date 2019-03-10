package com.sytecso.ws.dto.request;


import javax.validation.constraints.NotNull;



public class InsumosOrdenDTORequest {
	@NotNull(message="{msg.ws.insumo.orden.idInsumoNull}")
	private String idInsumo;
	@NotNull(message="{msg.ws.insumo.orden.idUnidadMedidaNull}")
	private String unidadMedida;
	@NotNull(message="{msg.ws.insumo.orden.nombreInsumoNull}")
	private String nombreInsumo;
	@NotNull(message="{msg.ws.insumo.orden.idClienteNull}")
	private String idCliente;
	@NotNull(message="{msg.ws.insumo.orden.idClienteAsociadoNull}")
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
