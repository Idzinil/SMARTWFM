/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2017
 */
package com.sytecso.beans;

import java.io.Serializable;




public class Cuadrilla implements Serializable {

	private static final long serialVersionUID = -3028819703782901148L;
	
	private long idCuadrilla;
	private String numeroCuadrilla;
	private String placas;
	private long cuenta_idcuentacliente;
	private int seleccionable;
	private String seleccionable_cuadrilla;
	private Cuenta cuenta;
	
	public long getIdCuadrilla() {
		return idCuadrilla;
	}

	public void setIdCuadrilla(long idCuadrilla) {
		this.idCuadrilla = idCuadrilla;
	}

	public String getNumeroCuadrilla() {
		return numeroCuadrilla;
	}

	public void setNumeroCuadrilla(String numeroCuadrilla) {
		this.numeroCuadrilla = numeroCuadrilla;
	}

	public String getPlacas() {
		return placas;
	}

	public void setPlacas(String placas) {
		this.placas = placas;
	}

	public long getCuenta_idcuentacliente() {
		return cuenta_idcuentacliente;
	}

	public void setCuenta_idcuentacliente(long cuenta_idcuentacliente) {
		this.cuenta_idcuentacliente = cuenta_idcuentacliente;
	}

	public int getSeleccionable() {
		return seleccionable;
	}

	public void setSeleccionable(int seleccionable) {
		this.seleccionable = seleccionable;
	}

	public String getSeleccionable_cuadrilla() {
		return seleccionable_cuadrilla;
	}

	public void setSeleccionable_cuadrilla(String seleccionable_cuadrilla) {
		this.seleccionable_cuadrilla = seleccionable_cuadrilla;
	}

	public Cuenta getCuenta() {
		return cuenta;
	}

	public void setCuenta(Cuenta cuenta) {
		this.cuenta = cuenta;
	}



}


