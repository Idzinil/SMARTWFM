package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="datosFiscales")
public class DatosFiscales implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8676897512494515670L;

	@Id
	@Column(name = "iddatosFiscales")
	@GeneratedValue(generator = "pkIddatosFiscales")
	@GenericGenerator(name = "pkIddatosFiscales", strategy = "increment")
	private BigDecimal iddatosFiscales;
	@Column(name = "RFC")
	private String RFC;
	@Column(name = "razonSocial")
	private String razonSocial;
	@Column(name = "calle")
	private String calle;
	@Column(name = "numeroInt")
	private String numeroInt;
	@Column(name = "numeroExt")
	private String numeroExt;
	@Column(name = "colonia")
	private String colonia;
	@Column(name = "municipio")
	private String municipio;
	@Column(name = "ciudad")
	private String ciudad;
	@Column(name = "estado")
	private String estado;
	@Column(name = "pais")
	private String pais;
	@Column(name = "codigoPostal")
	private String codigoPostal;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="Cuenta_idCuenta",updatable=true,nullable=false,insertable=true)
	private CuentaCliente cuentaCliente;

	
	
	
	public BigDecimal getIddatosFiscales() {
		return iddatosFiscales;
	}

	public void setIddatosFiscales(BigDecimal iddatosFiscales) {
		this.iddatosFiscales = iddatosFiscales;
	}

	public String getRFC() {
		return RFC;
	}

	public void setRFC(String rFC) {
		RFC = rFC;
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



}
