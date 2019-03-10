package com.sytecso.ws.dto.response;

import java.math.BigDecimal;

public class OrdenInsumoClienteDTOResponse {
	
	private String idInsumo;
	private String unidadMedida;
	private String nombreInsumo;
	private String idClienteAsociado;
	private BigDecimal cantidadAsociada;
	public String getIdInsumo() {
		return idInsumo;
	}
	public String getUnidadMedida() {
		return unidadMedida;
	}
	public String getNombreInsumo() {
		return nombreInsumo;
	}
	public String getIdClienteAsociado() {
		return idClienteAsociado;
	}
	public BigDecimal getCantidadAsociada() {
		return cantidadAsociada;
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
	public void setIdClienteAsociado(String idClienteAsociado) {
		this.idClienteAsociado = idClienteAsociado;
	}
	public void setCantidadAsociada(BigDecimal cantidadAsociada) {
		this.cantidadAsociada = cantidadAsociada;
	}
	
	
	
}
