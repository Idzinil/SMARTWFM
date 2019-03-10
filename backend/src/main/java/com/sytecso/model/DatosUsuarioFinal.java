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
@Table(name="datosUsuarioFinal")
public class DatosUsuarioFinal implements Serializable{

	private static final long serialVersionUID = -6100691209421897750L;
	@Id
	@Column(name="idDatosUsuarioFinal")
	@GeneratedValue(generator="pkIdDatosUsuarioFinal")
	@GenericGenerator(name="pkIdDatosUsuarioFinal",strategy="increment")
	private BigDecimal idDatosUsuarioFinal;
	@Column(name="numeroCuenta")
	private String numeroCuenta;
	@Column(name="nombreCuenta")
	private String nombreCuenta;
	@Column(name="tipoCuenta")
	private String tipoCuenta;
	@Column(name="estatus")
	private String estatus;	
	@OneToOne(cascade=CascadeType.ALL)
	//esta es la relaacion con la PK de orden (llave FK)
	@JoinColumn(name="orden_IdOrden",updatable=true,insertable=true)	
	private Orden orden;
	
	@OneToOne(mappedBy="datosUsuarioFinal",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	private DatosInstalacion datosInstalacion;
	@OneToOne(mappedBy="datosUsuarioFinal",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	private Telefono telefono;
	@OneToOne(mappedBy="datosUsuarioFinal",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	private DireccionInstalacion direccionInstalacion;
	
	public BigDecimal getIdDatosUsuarioFinal() {
		return idDatosUsuarioFinal;
	}
	public void setIdDatosUsuarioFinal(BigDecimal idDatosUsuarioFinal) {
		this.idDatosUsuarioFinal = idDatosUsuarioFinal;
	}
	public String getNumeroCuenta() {
		return numeroCuenta;
	}
	public void setNumeroCuenta(String numeroCuenta) {
		this.numeroCuenta = numeroCuenta;
	}
	public String getTipoCuenta() {
		return tipoCuenta;
	}
	public void setTipoCuenta(String tipoCuenta) {
		this.tipoCuenta = tipoCuenta;
	}
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}

	public DatosInstalacion getDatosInstalacion() {
		return datosInstalacion;
	}
	public void setDatosInstalacion(DatosInstalacion datosInstalacion) {
		this.datosInstalacion = datosInstalacion;
	}
	public Telefono getTelefono() {
		return telefono;
	}
	public void setTelefono(Telefono telefono) {
		this.telefono = telefono;
	}
	public DireccionInstalacion getDireccionInstalacion() {
		return direccionInstalacion;
	}
	public void setDireccionInstalacion(DireccionInstalacion direccionInstalacion) {
		this.direccionInstalacion = direccionInstalacion;
	}
	public Orden getOrden() {
		return orden;
	}
	public void setOrden(Orden orden) {
		this.orden = orden;
	}
	public String getNombreCuenta() {
		return nombreCuenta;
	}
	public void setNombreCuenta(String nombreCuenta) {
		this.nombreCuenta = nombreCuenta;
	}

	
}
