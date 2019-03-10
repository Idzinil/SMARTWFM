/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2017
 */
package com.sytecso.beans;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;


public class Cuenta implements Serializable{

	private static final long serialVersionUID = -3454896148722539126L;
	private BigDecimal idCuenta;
    private String numCuenta;
    private String aliasCliente;
    private String fecCreacion;
    private String estatusCta;
    private String region;
    private String gerencia;
    private String departamento;
    private String empresa;
    private String ejecutivo;
    private String idSAP;
    private int segmentoCliente;
    private DatosFiscales datosFiscales;
    private Collection<? extends GrantedAuthority> authorities;
    
	public Cuenta() {
	}
	public Cuenta(String numCuenta) {
		this.numCuenta=numCuenta;
	}
 	/*public Cuenta(BigDecimal idCuenta,String numCuenta,String aliasCliente,String region,BigDecimal saldoCuenta,UnidadFacturacion unidadFacturacion) {
		super();
		this.idCuenta=idCuenta;
		this.numCuenta = numCuenta;
		this.region = region;
	}*/
 	public Cuenta(String numCuenta,String aliasCliente) {
		super();
		this.numCuenta = numCuenta;
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


	public String getAliasCliente() {
		return aliasCliente;
	}
	public void setAliasCliente(String aliasCliente) {
		this.aliasCliente = aliasCliente;
	}
	public DatosFiscales getDatosFiscales() {
		return datosFiscales;
	}
	public void setDatosFiscales(DatosFiscales datosFiscales) {
		this.datosFiscales = datosFiscales;
	}
	public int getSegmentoCliente() {
		return segmentoCliente;
	}
	public void setSegmentoCliente(int segmentoCliente) {
		this.segmentoCliente = segmentoCliente;
	}
	public String getIdSAP() {
		return idSAP;
	}
	public void setIdSAP(String idSAP) {
		this.idSAP = idSAP;
	}
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}
	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

}