/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2018
 */
package com.sytecso.beans;

import java.io.Serializable;

public class DatosFiscales implements Serializable{
	private static final long serialVersionUID = -7028050705103427351L;
	private long iddatosFiscales;
	private String rfc;
	private String razonSocial;
	private String calle;
	private String numeroInt;
	private String numeroExt;
	private String colonia;
	private String municipio;
	private String ciudad;
	private String estado;
	private String pais;
	private String codigoPostal;
	private long Cuenta_idCuenta;

	public DatosFiscales() {
		
	}
	public DatosFiscales(String razonSocial) {
		super();
		this.razonSocial = razonSocial;
	}
	public long getIddatosFiscales() {
		return iddatosFiscales;
	}
	public void setIddatosFiscales(long iddatosFiscales) {
		this.iddatosFiscales = iddatosFiscales;
	}
	public String getRfc() {
		return rfc;
	}
	public void setRfc(String rfc) {
		this.rfc = rfc;
	}
	public String getRazonSocial() {
		return razonSocial;
	}
	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}
	public String getCalle() {
		return calle;
	}
	public void setCalle(String calle) {
		this.calle = calle;
	}
	public String getNumeroInt() {
		return numeroInt;
	}
	public void setNumeroInt(String numeroInt) {
		this.numeroInt = numeroInt;
	}
	public String getNumeroExt() {
		return numeroExt;
	}
	public void setNumeroExt(String numeroExt) {
		this.numeroExt = numeroExt;
	}
	public String getColonia() {
		return colonia;
	}
	public void setColonia(String colonia) {
		this.colonia = colonia;
	}
	public String getMunicipio() {
		return municipio;
	}
	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}
	public String getCiudad() {
		return ciudad;
	}
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public String getCodigoPostal() {
		return codigoPostal;
	}
	public void setCodigoPostal(String codigoPostal) {
		this.codigoPostal = codigoPostal;
	}
	public long getCuenta_idCuenta() {
		return Cuenta_idCuenta;
	}
	public void setCuenta_idCuenta(long cuenta_idCuenta) {
		Cuenta_idCuenta = cuenta_idCuenta;
	}
	
}