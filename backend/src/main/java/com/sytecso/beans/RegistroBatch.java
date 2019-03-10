/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2019
 */
package com.sytecso.beans;

import java.io.Serializable;

public class RegistroBatch implements Serializable{

	private static final long serialVersionUID = -7564613722898140667L;
	private long idregistroBatch;
	private String nombreArchivo;
	private String tipoCarga;
	private long registrosInsertados;
	private long registrosRechazados;
	
	public long getIdregistroBatch() {
		return idregistroBatch;
	}
	public void setIdregistroBatch(long idregistroBatch) {
		this.idregistroBatch = idregistroBatch;
	}
	public String getNombreArchivo() {
		return nombreArchivo;
	}
	public void setNombreArchivo(String nombreArchivo) {
		this.nombreArchivo = nombreArchivo;
	}
	public String getTipoCarga() {
		return tipoCarga;
	}
	public void setTipoCarga(String tipoCarga) {
		this.tipoCarga = tipoCarga;
	}
	public long getRegistrosInsertados() {
		return registrosInsertados;
	}
	public void setRegistrosInsertados(long registrosInsertados) {
		this.registrosInsertados = registrosInsertados;
	}
	public long getRegistrosRechazados() {
		return registrosRechazados;
	}
	public void setRegistrosRechazados(long registrosRechazados) {
		this.registrosRechazados = registrosRechazados;
	}
}
