package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="ActividadOrdenProgreso")
public class ActividadOrdenProgreso implements Serializable {

	private static final long serialVersionUID = 1412621122543049984L;
	@Id
	@Column(name="idActividadOrden")
	@GeneratedValue(generator="pkIdActividadOrden")
	@GenericGenerator(name="pkIdDatosUsuarioFinal",strategy="increment")
	private BigDecimal idActividadOrden;
	@Column(name="estatus")
	private Integer estatus;
	@Column(name="NombreActividad")
	private String nombreActividad;
	@Column(name="Orden_idOrden")
	@Id
	private BigDecimal ordenIdOrden;
	@Column(name="HoraInicio")
	private String horaInicio;
	@Column(name="HoraFin")
	private String horaFin;
	@Column(name="ComentariosAdicionales")
	private String comentariosAdicionales;
	public BigDecimal getIdActividadOrden() {
		return idActividadOrden;
	}
	public void setIdActividadOrden(BigDecimal idActividadOrden) {
		this.idActividadOrden = idActividadOrden;
	}
	public Integer getEstatus() {
		return estatus;
	}
	public void setEstatus(Integer estatus) {
		this.estatus = estatus;
	}
	public String getNombreActividad() {
		return nombreActividad;
	}
	public void setNombreActividad(String nombreActividad) {
		this.nombreActividad = nombreActividad;
	}
	public BigDecimal getOrdenIdOrden() {
		return ordenIdOrden;
	}
	public void setOrdenIdOrden(BigDecimal ordenIdOrden) {
		this.ordenIdOrden = ordenIdOrden;
	}
	public String getHoraInicio() {
		return horaInicio;
	}
	public void setHoraInicio(String horaInicio) {
		this.horaInicio = horaInicio;
	}
	public String getHoraFin() {
		return horaFin;
	}
	public void setHoraFin(String horaFin) {
		this.horaFin = horaFin;
	}
	public String getComentariosAdicionales() {
		return comentariosAdicionales;
	}
	public void setComentariosAdicionales(String comentariosAdicionales) {
		this.comentariosAdicionales = comentariosAdicionales;
	}
	

}
