/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2017
 */
package com.sytecso.beans;

import java.io.Serializable;
import java.math.BigDecimal;



public class InsumosCte implements Serializable{

private static final long serialVersionUID = -3454896148722539126L;

private BigDecimal idInsumosCte;
private String identificadorSAP;
private String nombreInsumo;
private String descripcionInsumo;
private String claveInsumo;
private BigDecimal totalInsumo;
private String unidadMedidaInsumo;
private long cuentaCliente_idCuenta;
private int registroBatch_idregistroBatch;
private Cuenta cuenta;


	public BigDecimal getIdInsumosCte() {
		return idInsumosCte;
	}
	public void setIdInsumosCte(BigDecimal idInsumosCte) {
		this.idInsumosCte = idInsumosCte;
	}

	public String getIdentificadorSAP() {
		return identificadorSAP;
	}
	public void setIdentificadorSAP(String identificadorSAP) {
		this.identificadorSAP = identificadorSAP;
	}
	public String getNombreInsumo() {
		return nombreInsumo;
	}
	public void setNombreInsumo(String nombreInsumo) {
		this.nombreInsumo = nombreInsumo;
	}
	public String getClaveInsumo() {
		return claveInsumo;
	}
	public void setClaveInsumo(String claveInsumo) {
		this.claveInsumo = claveInsumo;
	}
	public long getCuentaCliente_idCuenta() {
		return cuentaCliente_idCuenta;
	}
	public void setCuentaCliente_idCuenta(long cuentaCliente_idCuenta) {
		this.cuentaCliente_idCuenta = cuentaCliente_idCuenta;
	}
	public int getRegistroBatch_idregistroBatch() {
		return registroBatch_idregistroBatch;
	}
	public void setRegistroBatch_idregistroBatch(int registroBatch_idregistroBatch) {
		this.registroBatch_idregistroBatch = registroBatch_idregistroBatch;
	}
	public String getDescripcionInsumo() {
		return descripcionInsumo;
	}
	public void setDescripcionInsumo(String descripcionInsumo) {
		this.descripcionInsumo = descripcionInsumo;
	}
	public String getUnidadMedidaInsumo() {
		return unidadMedidaInsumo;
	}
	public void setUnidadMedidaInsumo(String unidadMedidaInsumo) {
		this.unidadMedidaInsumo = unidadMedidaInsumo;
	}
	public Cuenta getCuenta() {
		return cuenta;
	}
	public void setCuenta(Cuenta cuenta) {
		this.cuenta = cuenta;
	}
	public BigDecimal getTotalInsumo() {
		return totalInsumo;
	}
	public void setTotalInsumo(BigDecimal totalInsumo) {
		this.totalInsumo = totalInsumo;
	}
	

    

}