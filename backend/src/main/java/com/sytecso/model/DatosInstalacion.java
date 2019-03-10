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
@Table(name="datosInstalacion")
public class DatosInstalacion implements Serializable{

	private static final long serialVersionUID = -1824836244564871868L;
	@Id
	@Column(name="idDatosInstalacion")
	@GeneratedValue(generator="pkIdDatosInstalacion")
	@GenericGenerator(name="pkIdDatosInstalacion",strategy="increment")
	private BigDecimal idDatosInstalacion;
	@Column(name="folio")
	private String folio;
	@Column(name="idOTFFM")
	private String idOTFFM;
	@Column(name="idCompania")
	private String idCompania;
	@Column(name="turno")
	private String turno;
	@Column(name="fechaAgendamiento")
	private String fechaAgendamiento;
	@Column(name="DatosInstalacioncol")
	private String datosInstalacionCol;
	@Column(name="canalVenta")
	private String canalVenta;
	@Column(name="cotizacion")
	private String cotizacion;
	@Column(name="oportunidad")
	private String oportunidad;
	@Column(name="plaza")
	private String plaza;
	@Column(name="cluster")
	private String cluster;
	@OneToOne(cascade=CascadeType.ALL)
    @JoinColumn(name = "datosUsuarioFinal_iddatosUsuarioFinal",nullable = false,insertable=true,updatable=true)
	private DatosUsuarioFinal datosUsuarioFinal;	
	public BigDecimal getIdDatosInstalacion() {
		return idDatosInstalacion;
	}
	public void setIdDatosInstalacion(BigDecimal idDatosInstalacion) {
		this.idDatosInstalacion = idDatosInstalacion;
	}
	public String getFolio() {
		return folio;
	}
	public void setFolio(String folio) {
		this.folio = folio;
	}
	public String getIdOTFFM() {
		return idOTFFM;
	}
	public void setIdOTFFM(String idOTFFM) {
		this.idOTFFM = idOTFFM;
	}
	public String getIdCompania() {
		return idCompania;
	}
	public void setIdCompania(String idCompania) {
		this.idCompania = idCompania;
	}

	public String getFechaAgendamiento() {
		return fechaAgendamiento;
	}
	public void setFechaAgendamiento(String fechaAgendamiento) {
		this.fechaAgendamiento = fechaAgendamiento;
	}
	public String getDatosInstalacionCol() {
		return datosInstalacionCol;
	}
	public void setDatosInstalacionCol(String datosInstalacionCol) {
		this.datosInstalacionCol = datosInstalacionCol;
	}
	public String getCanalVenta() {
		return canalVenta;
	}
	public void setCanalVenta(String canalVenta) {
		this.canalVenta = canalVenta;
	}
	public String getCotizacion() {
		return cotizacion;
	}
	public void setCotizacion(String cotizacion) {
		this.cotizacion = cotizacion;
	}
	public String getOportunidad() {
		return oportunidad;
	}
	public void setOportunidad(String oportunidad) {
		this.oportunidad = oportunidad;
	}
	public String getPlaza() {
		return plaza;
	}
	public void setPlaza(String plaza) {
		this.plaza = plaza;
	}
	public String getCluster() {
		return cluster;
	}
	public void setCluster(String cluster) {
		this.cluster = cluster;
	}
	public DatosUsuarioFinal getDatosUsuarioFinal() {
		return datosUsuarioFinal;
	}
	public String getTurno() {
		return turno;
	}
	public void setTurno(String turno) {
		this.turno = turno;
	}
	public void setDatosUsuarioFinal(DatosUsuarioFinal datosUsuarioFinal) {
		this.datosUsuarioFinal = datosUsuarioFinal;
	}
	

	
	
}
