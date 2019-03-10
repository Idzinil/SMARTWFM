package com.sytecso.ws.dto.request;

import java.math.BigDecimal;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;


import com.sytecso.ws.rest.validations.AllowedAcctionsOrdenInsumoCliente;

public class OrdenInsumoClienteDTORequest {
	@NotNull(message="{msg.ws.orden.insumo.cliente.idCuadrillaNull}")
	@NotEmpty(message="{msg.ws.orden.insumo.cliente.idCuadrillaEmpty}")
	private String idCuadrilla;
	@NotNull(message="{msg.ws.orden.insumo.cliente.idInsumoNull}")
	@NotEmpty(message="{msg.ws.orden.insumo.cliente.idInsumoEmpty}")
	private String idInsumo;
	@NotNull(message="{msg.ws.orden.insumo.cliente.unidadMedidaNull}")
	@NotEmpty(message="{msg.ws.orden.insumo.cliente.unidadMedidaEmpty}")
	private String unidadMedida;
	@NotNull(message="{msg.ws.orden.insumo.cliente.nombreInsumoNull}")
	@NotEmpty(message="{msg.ws.orden.insumo.cliente.nombreInsumoEmpty}")
	private String nombreInsumo;
	@NotNull(message="{msg.ws.orden.insumo.cliente.idClienteAsociadoNull}")
	@NotEmpty(message="{msg.ws.orden.insumo.cliente.idClienteAsociadoEmpty}")
	private String idClienteAsociado;
	@NotNull(message="{msg.ws.orden.insumo.cliente.cantidadAsociadaNull}")
	@DecimalMin(value="1",message="{msg.amounts.min.amount}")
	private BigDecimal cantidadAsociada;
	@NotNull(message="{msg.ws.orden.insumo.cliente.accionNull}")
	@AllowedAcctionsOrdenInsumoCliente
	private Integer accion;
	@NotNull(message="{msg.ws.orden.insumo.cliente.ordenAsociadaNull}")
	@NotEmpty(message="{msg.ws.orden.insumo.cliente.ordenAsociadaEmpty}")
	private String ordenAsociada;
	
	public String getIdCuadrilla() {
		return idCuadrilla;
	}
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
	public Integer getAccion() {
		return accion;
	}
	public String getOrdenAsociada() {
		return ordenAsociada;
	}
	public void setIdCuadrilla(String idCuadrilla) {
		this.idCuadrilla = idCuadrilla;
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
	public void setAccion(Integer accion) {
		this.accion = accion;
	}
	public void setOrdenAsociada(String ordenAsociada) {
		this.ordenAsociada = ordenAsociada;
	}
	
	
	
}
