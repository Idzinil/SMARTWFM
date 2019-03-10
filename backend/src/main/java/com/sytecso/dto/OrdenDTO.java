/* Made by Sytecso
 * 06/03/2019
 *This DTO will control how  the orders will be  created  in the application
 **
 *¨
 **
 */


package com.sytecso.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class OrdenDTO implements Serializable {
	/**************
	 * This elements will form part of  the  data that will  be  used to be showed in screen
	 * 
	 */
	private static final long serialVersionUID = -7575463498438804188L;
	private BigDecimal idOrden;
	private String fechaInicio;
	private String fechaFin;
	private String numeroOrden;
	private String ordenPadre;
	private String descripcion;
	private int tiempoOrden;
	
	/**************************
	 * 
	 * Getters and setter of the logic
	 */
	public BigDecimal getIdOrden() {
		return idOrden;
	}
	public void setIdOrden(BigDecimal idOrden) {
		this.idOrden = idOrden;
	}
	public String getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public String getFechaFin() {
		return fechaFin;
	}
	public void setFechaFin(String fechaFin) {
		this.fechaFin = fechaFin;
	}
	public String getNumeroOrden() {
		return numeroOrden;
	}
	public void setNumeroOrden(String numeroOrden) {
		this.numeroOrden = numeroOrden;
	}
	public String getOrdenPadre() {
		return ordenPadre;
	}
	public void setOrdenPadre(String ordenPadre) {
		this.ordenPadre = ordenPadre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getTiempoOrden() {
		return tiempoOrden;
	}
	public void setTiempoOrden(int tiempoOrden) {
		this.tiempoOrden = tiempoOrden;
	}
	
	

}
