package com.sytecso.dto;

import java.io.Serializable;
import java.math.BigDecimal;


public class ReporteFacturacionMRR implements Serializable{

	private static final long serialVersionUID = -457511546654312273L;
	/**
	 *orderId
	 * */
	private String Ot;
	private String usuarioFinal;
	private Integer cantidad;
	private String capacidad;
	private String familia;
	private String periodo;
	private BigDecimal precioUnitario;
	private BigDecimal ieps;
	private BigDecimal montoIeps;
	private BigDecimal iva;
	private BigDecimal ivaTotal;
	private BigDecimal montoTotal;
	private Integer grupoFactura;
	private String razonSocial;
	private String moneda;
	private String grupoServicio;
	private String aliasCliente;
	private String fechaIngreso;
	private String fechaActivacion;
	private String fechaVigenciaReal;
	private Integer compromiso;
	private String responsable;
	private String region;
	private Integer vigenciaRestante;
	private String tipoServicio;
	private BigDecimal instalacion;
	private String idClienteUli;
	private String leyendaFacturacion;
	private String mesFacturacion;
	
	private String puntaOrigenA;
	private String callePuntaA;
	private String numeroPuntaA;
	private String pisoPuntaA;
	private String interiorPuntaA;
	private String coloniaPuntaA;
	private String delegacionPuntaA;
	private String ciudadPuntaA;
	private String estadoPuntaA;
	
	private String callePuntaB;
	private String numeroPuntaB;
	private String pisoPuntaB;
	private String interiorPuntaB;
	private String coloniaPuntaB;
	private String delegacionPuntaB;
	private String ciudadPuntaB;
	private String puntaDestinoB;
	public String getOt() {
		return Ot;
	}
	public void setOt(String ot) {
		Ot = ot;
	}
	public String getUsuarioFinal() {
		return usuarioFinal;
	}
	public void setUsuarioFinal(String usuarioFinal) {
		this.usuarioFinal = usuarioFinal;
	}
	public Integer getCantidad() {
		return cantidad;
	}
	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
	public String getCapacidad() {
		return capacidad;
	}
	public void setCapacidad(String capacidad) {
		this.capacidad = capacidad;
	}
	public String getFamilia() {
		return familia;
	}
	public void setFamilia(String familia) {
		this.familia = familia;
	}
	public String getPeriodo() {
		return periodo;
	}
	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}
	public BigDecimal getPrecioUnitario() {
		return precioUnitario;
	}
	public void setPrecioUnitario(BigDecimal precioUnitario) {
		this.precioUnitario = precioUnitario;
	}
	public BigDecimal getIeps() {
		return ieps;
	}
	public void setIeps(BigDecimal ieps) {
		this.ieps = ieps;
	}
	public BigDecimal getMontoIeps() {
		return montoIeps;
	}
	public void setMontoIeps(BigDecimal montoIeps) {
		this.montoIeps = montoIeps;
	}
	public BigDecimal getIva() {
		return iva;
	}
	public void setIva(BigDecimal iva) {
		this.iva = iva;
	}
	public BigDecimal getIvaTotal() {
		return ivaTotal;
	}
	public void setIvaTotal(BigDecimal ivaTotal) {
		this.ivaTotal = ivaTotal;
	}
	public BigDecimal getMontoTotal() {
		return montoTotal;
	}
	public void setMontoTotal(BigDecimal montoTotal) {
		this.montoTotal = montoTotal;
	}
	public Integer getGrupoFactura() {
		return grupoFactura;
	}
	public void setGrupoFactura(Integer grupoFactura) {
		this.grupoFactura = grupoFactura;
	}
	public String getRazonSocial() {
		return razonSocial;
	}
	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}
	public String getMoneda() {
		return moneda;
	}
	public void setMoneda(String moneda) {
		this.moneda = moneda;
	}
	public String getGrupoServicio() {
		return grupoServicio;
	}
	public void setGrupoServicio(String grupoServicio) {
		this.grupoServicio = grupoServicio;
	}
	public String getAliasCliente() {
		return aliasCliente;
	}
	public void setAliasCliente(String aliasCliente) {
		this.aliasCliente = aliasCliente;
	}
	public String getFechaIngreso() {
		return fechaIngreso;
	}
	public void setFechaIngreso(String fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}
	public String getFechaActivacion() {
		return fechaActivacion;
	}
	public void setFechaActivacion(String fechaActivacion) {
		this.fechaActivacion = fechaActivacion;
	}
	public String getFechaVigenciaReal() {
		return fechaVigenciaReal;
	}
	public void setFechaVigenciaReal(String fechaVigenciaReal) {
		this.fechaVigenciaReal = fechaVigenciaReal;
	}
	public Integer getCompromiso() {
		return compromiso;
	}
	public void setCompromiso(Integer compromiso) {
		this.compromiso = compromiso;
	}
	public String getResponsable() {
		return responsable;
	}
	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public Integer getVigenciaRestante() {
		return vigenciaRestante;
	}
	public void setVigenciaRestante(Integer vigenciaRestante) {
		this.vigenciaRestante = vigenciaRestante;
	}
	public String getTipoServicio() {
		return tipoServicio;
	}
	public void setTipoServicio(String tipoServicio) {
		this.tipoServicio = tipoServicio;
	}
	public BigDecimal getInstalacion() {
		return instalacion;
	}
	public void setInstalacion(BigDecimal instalacion) {
		this.instalacion = instalacion;
	}
	public String getIdClienteUli() {
		return idClienteUli;
	}
	public void setIdClienteUli(String idClienteUli) {
		this.idClienteUli = idClienteUli;
	}
	public String getLeyendaFacturacion() {
		return leyendaFacturacion;
	}
	public void setLeyendaFacturacion(String leyendaFacturacion) {
		this.leyendaFacturacion = leyendaFacturacion;
	}
	public String getMesFacturacion() {
		return mesFacturacion;
	}
	public void setMesFacturacion(String mesFacturacion) {
		this.mesFacturacion = mesFacturacion;
	}
	public String getNumeroPuntaA() {
		return numeroPuntaA;
	}
	public void setNumeroPuntaA(String numeroPuntaA) {
		this.numeroPuntaA = numeroPuntaA;
	}
	public String getPisoPuntaA() {
		return pisoPuntaA;
	}
	public void setPisoPuntaA(String pisoPuntaA) {
		this.pisoPuntaA = pisoPuntaA;
	}
	public String getInteriorPuntaA() {
		return interiorPuntaA;
	}
	public void setInteriorPuntaA(String interiorPuntaA) {
		this.interiorPuntaA = interiorPuntaA;
	}
	public String getColoniaPuntaA() {
		return coloniaPuntaA;
	}
	public void setColoniaPuntaA(String coloniaPuntaA) {
		this.coloniaPuntaA = coloniaPuntaA;
	}
	public String getDelegacionPuntaA() {
		return delegacionPuntaA;
	}
	public void setDelegacionPuntaA(String delegacionPuntaA) {
		this.delegacionPuntaA = delegacionPuntaA;
	}
	public String getCiudadPuntaA() {
		return ciudadPuntaA;
	}
	public void setCiudadPuntaA(String ciudadPuntaA) {
		this.ciudadPuntaA = ciudadPuntaA;
	}
	public String getEstadoPuntaA() {
		return estadoPuntaA;
	}
	public void setEstadoPuntaA(String estadoPuntaA) {
		this.estadoPuntaA = estadoPuntaA;
	}

	public String getNumeroPuntaB() {
		return numeroPuntaB;
	}
	public void setNumeroPuntaB(String numeroPuntaB) {
		this.numeroPuntaB = numeroPuntaB;
	}
	public String getPisoPuntaB() {
		return pisoPuntaB;
	}
	public void setPisoPuntaB(String pisoPuntaB) {
		this.pisoPuntaB = pisoPuntaB;
	}
	public String getInteriorPuntaB() {
		return interiorPuntaB;
	}
	public void setInteriorPuntaB(String interiorPuntaB) {
		this.interiorPuntaB = interiorPuntaB;
	}
	public String getColoniaPuntaB() {
		return coloniaPuntaB;
	}
	public void setColoniaPuntaB(String coloniaPuntaB) {
		this.coloniaPuntaB = coloniaPuntaB;
	}
	public String getDelegacionPuntaB() {
		return delegacionPuntaB;
	}
	public void setDelegacionPuntaB(String delegacionPuntaB) {
		this.delegacionPuntaB = delegacionPuntaB;
	}
	public String getCiudadPuntaB() {
		return ciudadPuntaB;
	}
	public void setCiudadPuntaB(String ciudadPuntaB) {
		this.ciudadPuntaB = ciudadPuntaB;
	}

	public String getPuntaDestinoB() {
		return puntaDestinoB;
	}
	public void setPuntaDestinoB(String puntaDestinoB) {
		this.puntaDestinoB = puntaDestinoB;
	}
	public String getCallePuntaA() {
		return callePuntaA;
	}
	public String getCallePuntaB() {
		return callePuntaB;
	}
	public void setCallePuntaA(String callePuntaA) {
		this.callePuntaA = callePuntaA;
	}
	public void setCallePuntaB(String callePuntaB) {
		this.callePuntaB = callePuntaB;
	}
	public String getPuntaOrigenA() {
		return puntaOrigenA;
	}
	public void setPuntaOrigenA(String puntaOrigenA) {
		this.puntaOrigenA = puntaOrigenA;
	}

}
