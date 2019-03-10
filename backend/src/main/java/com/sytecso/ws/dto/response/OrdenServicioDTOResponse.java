package com.sytecso.ws.dto.response;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;





public class OrdenServicioDTOResponse {
	private String idCuadrilla;
	private String folio;
	private String idOrden;
	private String numeroCuentaCliente;
	private String turnoAgendado;
	private Date fechaAgendamiento;
	private String canalVenta;
	private String oportunidad;
	private String cotizacion;
	private String nombreCuenta;
	private String tipoCuenta;
	private String telefonoMovil;
	private String telefonoFijo;
	private String tipoOrden;
	private Date fechaInicioOrden;
	private String calle;
	private String numeroInterior;
	private String numeroExterior;
	private String colonia;
	private String delegacionMunicipio;
	private String codigoPostal;
	private String referencias;
	private String estado;
	private String ciudad;
	private String latitud;
	private String longitud;
	private String plaza;
	private String cluster;
	private Integer estatus;
	private List<InsumosOrdenDTOResponse> insumosOrden;
	private BigDecimal cantidadAsociada;
	public String getIdCuadrilla() {
		return idCuadrilla;
	}
	public String getFolio() {
		return folio;
	}
	public String getIdOrden() {
		return idOrden;
	}
	public String getNumeroCuentaCliente() {
		return numeroCuentaCliente;
	}
	public String getTurnoAgendado() {
		return turnoAgendado;
	}
	public Date getFechaAgendamiento() {
		return fechaAgendamiento;
	}
	public String getCanalVenta() {
		return canalVenta;
	}
	public String getOportunidad() {
		return oportunidad;
	}
	public String getCotizacion() {
		return cotizacion;
	}
	public String getNombreCuenta() {
		return nombreCuenta;
	}
	public String getTipoCuenta() {
		return tipoCuenta;
	}
	public String getTelefonoMovil() {
		return telefonoMovil;
	}
	public String getTelefonoFijo() {
		return telefonoFijo;
	}
	public String getTipoOrden() {
		return tipoOrden;
	}
	public Date getFechaInicioOrden() {
		return fechaInicioOrden;
	}
	public String getCalle() {
		return calle;
	}
	public String getNumeroInterior() {
		return numeroInterior;
	}
	public String getNumeroExterior() {
		return numeroExterior;
	}
	public String getColonia() {
		return colonia;
	}
	public String getDelegacionMunicipio() {
		return delegacionMunicipio;
	}
	public String getCodigoPostal() {
		return codigoPostal;
	}
	public String getReferencias() {
		return referencias;
	}
	public String getEstado() {
		return estado;
	}
	public String getCiudad() {
		return ciudad;
	}
	public String getLatitud() {
		return latitud;
	}
	public String getLongitud() {
		return longitud;
	}
	public String getPlaza() {
		return plaza;
	}
	public String getCluster() {
		return cluster;
	}
	public Integer getEstatus() {
		return estatus;
	}
	public List<InsumosOrdenDTOResponse> getInsumosOrden() {
		return insumosOrden;
	}
	public BigDecimal getCantidadAsociada() {
		return cantidadAsociada;
	}
	public void setIdCuadrilla(String idCuadrilla) {
		this.idCuadrilla = idCuadrilla;
	}
	public void setFolio(String folio) {
		this.folio = folio;
	}
	public void setIdOrden(String idOrden) {
		this.idOrden = idOrden;
	}
	public void setNumeroCuentaCliente(String numeroCuentaCliente) {
		this.numeroCuentaCliente = numeroCuentaCliente;
	}
	public void setTurnoAgendado(String turnoAgendado) {
		this.turnoAgendado = turnoAgendado;
	}
	public void setFechaAgendamiento(Date fechaAgendamiento) {
		this.fechaAgendamiento = fechaAgendamiento;
	}
	public void setCanalVenta(String canalVenta) {
		this.canalVenta = canalVenta;
	}
	public void setOportunidad(String oportunidad) {
		this.oportunidad = oportunidad;
	}
	public void setCotizacion(String cotizacion) {
		this.cotizacion = cotizacion;
	}
	public void setNombreCuenta(String nombreCuenta) {
		this.nombreCuenta = nombreCuenta;
	}
	public void setTipoCuenta(String tipoCuenta) {
		this.tipoCuenta = tipoCuenta;
	}
	public void setTelefonoMovil(String telefonoMovil) {
		this.telefonoMovil = telefonoMovil;
	}
	public void setTelefonoFijo(String telefonoFijo) {
		this.telefonoFijo = telefonoFijo;
	}
	public void setTipoOrden(String tipoOrden) {
		this.tipoOrden = tipoOrden;
	}
	public void setFechaInicioOrden(Date fechaInicioOrden) {
		this.fechaInicioOrden = fechaInicioOrden;
	}
	public void setCalle(String calle) {
		this.calle = calle;
	}
	public void setNumeroInterior(String numeroInterior) {
		this.numeroInterior = numeroInterior;
	}
	public void setNumeroExterior(String numeroExterior) {
		this.numeroExterior = numeroExterior;
	}
	public void setColonia(String colonia) {
		this.colonia = colonia;
	}
	public void setDelegacionMunicipio(String delegacionMunicipio) {
		this.delegacionMunicipio = delegacionMunicipio;
	}
	public void setCodigoPostal(String codigoPostal) {
		this.codigoPostal = codigoPostal;
	}
	public void setReferencias(String referencias) {
		this.referencias = referencias;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	public void setLatitud(String latitud) {
		this.latitud = latitud;
	}
	public void setLongitud(String longitud) {
		this.longitud = longitud;
	}
	public void setPlaza(String plaza) {
		this.plaza = plaza;
	}
	public void setCluster(String cluster) {
		this.cluster = cluster;
	}
	public void setEstatus(Integer estatus) {
		this.estatus = estatus;
	}
	public void setInsumosOrden(List<InsumosOrdenDTOResponse> insumosOrden) {
		this.insumosOrden = insumosOrden;
	}
	public void setCantidadAsociada(BigDecimal cantidadAsociada) {
		this.cantidadAsociada = cantidadAsociada;
	}
	
	
	
	
}
