package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "CuadrillaCargaInsumos")
public class CuadrillaCargaInsumos implements Serializable {

	private static final long serialVersionUID = -7532523364010830775L;
	@Id
	@Column(name = "InsumosEmpresa_idInsumosCte")
	private BigDecimal insumosEmpresaIdInsumosCte;
	@Id
	@Column(name = "Cuadrilla_idCuadrilla")
	private BigDecimal cuadrillaIdCuadrilla;
	@Column(name = "total")
	private Integer total;
	@Column(name = "unidadMedida")
	private String unidadMedida;
	
	//se tiene una relacion de muchos a uno mapeada con la propiedad 
	//idCuadrilla que se encuentra en la clase Cuadrilla(clase hija)
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "Cuadrilla_idCuadrilla", nullable = false, updatable = true, insertable = true)
	private Cuadrilla cuadrilla;
	
	
	public BigDecimal getInsumosEmpresaIdInsumosCte() {
		return insumosEmpresaIdInsumosCte;
	}

	public void setInsumosEmpresaIdInsumosCte(BigDecimal insumosEmpresaIdInsumosCte) {
		this.insumosEmpresaIdInsumosCte = insumosEmpresaIdInsumosCte;
	}

	public BigDecimal getCuadrillaIdCuadrilla() {
		return cuadrillaIdCuadrilla;
	}

	public void setCuadrillaIdCuadrilla(BigDecimal cuadrillaIdCuadrilla) {
		this.cuadrillaIdCuadrilla = cuadrillaIdCuadrilla;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public String getUnidadMedida() {
		return unidadMedida;
	}

	public void setUnidadMedida(String unidadMedida) {
		this.unidadMedida = unidadMedida;
	}

	public Cuadrilla getCuadrilla() {
		return cuadrilla;
	}

	public void setCuadrilla(Cuadrilla cuadrilla) {
		this.cuadrilla = cuadrilla;
	}

}
