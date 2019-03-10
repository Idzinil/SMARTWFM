package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="direccionInstalacion")
public class DireccionInstalacion implements Serializable {
	private static final long serialVersionUID = 2854454135004132918L;
	@Id
	@Column(name="idDireccionPuntas")
	@GeneratedValue(generator="pkIdDireccionPuntas")
	@GenericGenerator(name="pkIdDireccionPuntas",strategy="increment")
	private BigDecimal idDireccionPuntas;
	@Column(name="numeroExterior")
	private String numeroExterior;
	@Column(name="piso")
	private String piso;
	@Column(name="numeroInterior")
	private String numeroInterior;
	@Column(name="colonia")
	private String colonia;
	@Column(name="delegacion")
	private String delegacion;
	@Column(name="ciudad")
	private String ciudad;
	@Column(name="Estado")
	private String estado;
	@Column(name="codigoPostal")
	private String codigoPostal;
	@Column(name="longitud")
	private String longitud;
	@Column(name="latitud")
	private String latitud;
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="datosUsuarioFinal_idDatosUsuarioFinal",updatable=true,insertable=true)
	private DatosUsuarioFinal datosUsuarioFinal;
	public BigDecimal getIdDireccionPuntas() {
		return idDireccionPuntas;
	}
	public void setIdDireccionPuntas(BigDecimal idDireccionPuntas) {
		this.idDireccionPuntas = idDireccionPuntas;
	}
	public String getNumeroExterior() {
		return numeroExterior;
	}
	public void setNumeroExterior(String numeroExterior) {
		this.numeroExterior = numeroExterior;
	}
	public String getPiso() {
		return piso;
	}
	public void setPiso(String piso) {
		this.piso = piso;
	}
	public String getNumeroInterior() {
		return numeroInterior;
	}
	public void setNumeroInterior(String numeroInterior) {
		this.numeroInterior = numeroInterior;
	}
	public String getColonia() {
		return colonia;
	}
	public void setColonia(String colonia) {
		this.colonia = colonia;
	}
	public String getDelegacion() {
		return delegacion;
	}
	public void setDelegacion(String delegacion) {
		this.delegacion = delegacion;
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
	public String getCodigoPostal() {
		return codigoPostal;
	}
	public void setCodigoPostal(String codigoPostal) {
		this.codigoPostal = codigoPostal;
	}
	public String getLongitud() {
		return longitud;
	}
	public void setLongitud(String longitud) {
		this.longitud = longitud;
	}
	public String getLatitud() {
		return latitud;
	}
	public void setLatitud(String latitud) {
		this.latitud = latitud;
	}
	public DatosUsuarioFinal getDatosUsuarioFinal() {
		return datosUsuarioFinal;
	}
	public void setDatosUsuarioFinal(DatosUsuarioFinal datosUsuarioFinal) {
		this.datosUsuarioFinal = datosUsuarioFinal;
	}
	

}
