/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2017
 */
package com.sytecso.beans;

import java.io.Serializable;
import java.math.BigDecimal;



public class InsumosEmp implements Serializable{

private static final long serialVersionUID = -3454896148722539126L;
public InsumosEmp() {
	
}
private BigDecimal idInsumos;
private String identificadorSAP;
private String nombreInsumo;
private String descripcionInsumo;
private String claveInsumo;
private BigDecimal totalInsumo;
private String unidadMedidaInsumo;
private int registroBatch_idregistroBatch;
private String categoria;
private String Grupo;


	public BigDecimal getIdInsumos() {
		return idInsumos;
	}
	public void setIdInsumos(BigDecimal idInsumos) {
		this.idInsumos = idInsumos;
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
	public BigDecimal getTotalInsumo() {
		return totalInsumo;
	}
	public void setTotalInsumo(BigDecimal totalInsumo) {
		this.totalInsumo = totalInsumo;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public String getGrupo() {
		return Grupo;
	}
	public void setGrupo(String grupo) {
		Grupo = grupo;
	}
	

    

}