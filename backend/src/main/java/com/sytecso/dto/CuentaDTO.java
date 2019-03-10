package com.sytecso.dto;

import java.io.Serializable;
import java.math.BigDecimal;


/*Made by Sytecso
 * 04/03/2019
 * This  DTO will be  used  to show  a previe view of the order that will be created
 * 
 * 
 */

public class CuentaDTO implements Serializable {

	
	/**************
	 * This elements will form part of  the  data that will  be  used to be showed in screen
	 * 
	 */
	private static final long serialVersionUID = 3302606542539526303L;
	private String cuentaCte;
	private String encabezadoOrden;
	private String segmentoCta;
	private BigDecimal idCtaCliente;
	private String aliasCuenta;
	
	

	/**************************
	 * 
	 * Getters and setter of the logic
	 */
	public BigDecimal getIdCtaCliente() {
		return idCtaCliente;
	}
	public void setIdCtaCliente(BigDecimal idCtaCliente) {
		this.idCtaCliente = idCtaCliente;
	}
	
	public String getCuentaCte() {
		return cuentaCte;
	}
	public void setCuentaCte(String cuentaCte) {
		this.cuentaCte = cuentaCte;
	}
	public String getEncabezadoOrden() {
		return encabezadoOrden;
	}
	public void setEncabezadoOrden(String encabezadoOrden) {
		this.encabezadoOrden = encabezadoOrden;
	}
	public String getSegmentoCta() {
		return segmentoCta;
	}
	public void setSegmentoCta(String segmentoCta) {
		this.segmentoCta = segmentoCta;
	}
	public String getAliasCuenta() {
		return aliasCuenta;
	}
	public void setAliasCuenta(String aliasCuenta) {
		this.aliasCuenta = aliasCuenta;
	}
	

}
