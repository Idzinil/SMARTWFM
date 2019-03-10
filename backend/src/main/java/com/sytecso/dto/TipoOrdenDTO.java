package com.sytecso.dto;
import java.io.Serializable;
import java.math.BigDecimal;
/* Made by Sytecso
 * 04/03/2019
 * This DTO will serve  to  transfer the information of and order type  betwen layers
 * with the objetive of show in the screen for each tipe of  order wich  
 * sublevels it has.
 * 
 * 
 */
public class TipoOrdenDTO implements Serializable {
	
	/**************
	 * This elements will form part of  the  data that will  be  used to be showed in screen
	 * 
	 */
	private BigDecimal idTipoOrden;
	private BigDecimal idCaracterística;
	private BigDecimal idActividad;
	private float precioOrden;
	private int tiempoOrden;
	private int tiempoCatacteristica;
	private int tiempoActividad;
	private String divisa;
	private String nombreCaracteristica;
	private String descripcionOrden;
	private String descripcionCaracteristica;
	private String descripcionActividad;
	private String tipoOrden;
	private String nombreOrden;
	
	/**************************
	 * 
	 * Getters and setter of the logic
	 */
	
	private static final long serialVersionUID = 7078111735714082634L;
	public BigDecimal getIdTipoOrden() {
		return idTipoOrden;
	}
	public void setIdTipoOrden(BigDecimal idTipoOrden) {
		this.idTipoOrden = idTipoOrden;
	}
	public BigDecimal getIdCaracterística() {
		return idCaracterística;
	}
	public void setIdCaracterística(BigDecimal idCaracterística) {
		this.idCaracterística = idCaracterística;
	}
	public BigDecimal getIdActividad() {
		return idActividad;
	}
	public void setIdActividad(BigDecimal idActividad) {
		this.idActividad = idActividad;
	}
	public float getPrecioOrden() {
		return precioOrden;
	}
	public void setPrecioOrden(float precioOrden) {
		this.precioOrden = precioOrden;
	}
	public int getTiempoOrden() {
		return tiempoOrden;
	}
	public void setTiempoOrden(int tiempoOrden) {
		this.tiempoOrden = tiempoOrden;
	}
	public int getTiempoCatacteristica() {
		return tiempoCatacteristica;
	}
	public void setTiempoCatacteristica(int tiempoCatacteristica) {
		this.tiempoCatacteristica = tiempoCatacteristica;
	}
	public int getTiempoActividad() {
		return tiempoActividad;
	}
	public void setTiempoActividad(int tiempoActividad) {
		this.tiempoActividad = tiempoActividad;
	}
	public String getDivisa() {
		return divisa;
	}
	public void setDivisa(String divisa) {
		this.divisa = divisa;
	}
	public String getNombreCaracteristica() {
		return nombreCaracteristica;
	}
	public void setNombreCaracteristica(String nombreCaracteristica) {
		this.nombreCaracteristica = nombreCaracteristica;
	}
	public String getDescripcionOrden() {
		return descripcionOrden;
	}
	public void setDescripcionOrden(String descripcionOrden) {
		this.descripcionOrden = descripcionOrden;
	}
	public String getDescripcionCaracteristica() {
		return descripcionCaracteristica;
	}
	public void setDescripcionCaracteristica(String descripcionCaracteristica) {
		this.descripcionCaracteristica = descripcionCaracteristica;
	}
	public String getDescripcionActividad() {
		return descripcionActividad;
	}
	public void setDescripcionActividad(String descripcionActividad) {
		this.descripcionActividad = descripcionActividad;
	}
	public String getTipoOrden() {
		return tipoOrden;
	}
	public void setTipoOrden(String tipoOrden) {
		this.tipoOrden = tipoOrden;
	}
	public String getNombreOrden() {
		return nombreOrden;
	}
	public void setNombreOrden(String nombreOrden) {
		this.nombreOrden = nombreOrden;
	}


}
