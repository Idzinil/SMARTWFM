package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;


@Entity
@Table(name="CuentaCliente")
public class CuentaCliente implements Serializable{
	private static final long serialVersionUID = 5483174886794852831L;
	@Id
	@Column(name="idCuenta")
	@GeneratedValue(generator="pkIdCuenta")
	@GenericGenerator(name="pkIdCuenta",strategy="increment")
	private BigDecimal idCuenta;
	@Column(name="numCuenta")
    private String numCuenta;
	@Column(name="aliasCliente")
    private String aliasCliente;
	@Column(name="fecCreacion")
    private String fecCreacion;
	@Column(name="estatusCta")
    private String estatusCta;
	@Column(name="region")
    private String region;
	@Column(name="gerencia")
    private String gerencia;
	@Column(name="departamento")
    private String departamento;
	@Column(name="empresa")
    private String empresa;
	@Column(name="ejecutivo")
    private String ejecutivo;
	@Column(name="idSAP")
    private String idSAP;
	@Column(name="segmentoCliente")
    private Integer segmentoCliente;
	
	@OneToMany(mappedBy="cuentaCliente",cascade=CascadeType.ALL)
	private List<TipoOrden> tipoOrden;
	
	@OneToOne(mappedBy="cuentaCliente",cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	private DatosFiscales datosFiscales;
	
	@OneToMany(mappedBy="cuentaCliente", cascade=CascadeType.ALL)
	private List<EventoSistema> eventoSistema;
	
	//se tiene una relacion de uno a muchos mapeada por la propiedad
	//CuentaCliente_idCuenta que esta en la clase InsumosCte(clase hija)
	@OneToMany(mappedBy="cuentaCliente", cascade = CascadeType.ALL)
	private List<InsumosCte> insumosCte;
	
	@OneToMany(mappedBy =  "cuentaCliente", cascade =  CascadeType.ALL)
	@NotFound(action = NotFoundAction.IGNORE)
	private List<Cuadrilla> cuadrilla;
	
	
	public List<InsumosCte> getInsumosCte() {
		return insumosCte;
	}
	public void setInsumosCte(List<InsumosCte> insumosCte) {
		this.insumosCte = insumosCte;
	}
	public BigDecimal getIdCuenta() {
		return idCuenta;
	}
	public void setIdCuenta(BigDecimal idCuenta) {
		this.idCuenta = idCuenta;
	}
	public String getNumCuenta() {
		return numCuenta;
	}
	public void setNumCuenta(String numCuenta) {
		this.numCuenta = numCuenta;
	}
	public String getAliasCliente() {
		return aliasCliente;
	}
	public void setAliasCliente(String aliasCliente) {
		this.aliasCliente = aliasCliente;
	}
	public String getFecCreacion() {
		return fecCreacion;
	}
	public void setFecCreacion(String fecCreacion) {
		this.fecCreacion = fecCreacion;
	}
	public String getEstatusCta() {
		return estatusCta;
	}
	public void setEstatusCta(String estatusCta) {
		this.estatusCta = estatusCta;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getGerencia() {
		return gerencia;
	}
	public void setGerencia(String gerencia) {
		this.gerencia = gerencia;
	}
	public String getDepartamento() {
		return departamento;
	}
	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}
	public String getEmpresa() {
		return empresa;
	}
	public void setEmpresa(String empresa) {
		this.empresa = empresa;
	}
	public String getEjecutivo() {
		return ejecutivo;
	}
	public void setEjecutivo(String ejecutivo) {
		this.ejecutivo = ejecutivo;
	}
	public String getIdSAP() {
		return idSAP;
	}
	public void setIdSAP(String idSAP) {
		this.idSAP = idSAP;
	}
	public Integer getSegmentoCliente() {
		return segmentoCliente;
	}
	public void setSegmentoCliente(Integer segmentoCliente) {
		this.segmentoCliente = segmentoCliente;
	}
	public List<TipoOrden> getTipoOrden() {
		return tipoOrden;
	}
	public void setTipoOrden(List<TipoOrden> tipoOrden) {
		this.tipoOrden = tipoOrden;
	}
	public DatosFiscales getDatosFiscales() {
		return datosFiscales;
	}
	public List<Cuadrilla> getCuadrilla() {
		return cuadrilla;
	}
	public void setCuadrilla(List<Cuadrilla> cuadrilla) {
		this.cuadrilla = cuadrilla;
	}
	public void setDatosFiscales(DatosFiscales datosFiscales) {
		this.datosFiscales = datosFiscales;
	}
	public List<EventoSistema> getEventoSistema() {
		return eventoSistema;
	}
	public void setEventoSistema(List<EventoSistema> eventoSistema) {
		this.eventoSistema = eventoSistema;
	}

	
	
	
}
