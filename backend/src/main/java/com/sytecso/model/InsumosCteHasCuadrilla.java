package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="InsumosCte_has_Cuadrilla")
public class InsumosCteHasCuadrilla implements Serializable {

	private static final long serialVersionUID = -2352625090232338917L;

	@Id
	@Column(name = "InsumosCte_idInsumosCte")
	@GeneratedValue(generator = "pkInsumosCte_idInsumosCte")
	private BigDecimal InsumosCte_idInsumosCte;
	@Id
	@Column(name = "Cuadrilla_idCuadrilla")
	@GeneratedValue(generator = "pkCuadrilla_idCuadrilla")
	private String Cuadrilla_idCuadrilla;
	@Column(name = "total")
	private String total;
	@Column(name = "unidadMedida")
	private String unidadMedida;

	//se tiene una relacionde de muchos a uno mapeada por la propiedad
	//idCuadrilla que es encuentra en la clase Cuaadrilla(clase padre)
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "Cuadrilla_idCuadrilla", nullable = false, updatable = true, insertable = true)
	private Cuadrilla cuadrilla;
	
	
	public BigDecimal getInsumosCte_idInsumosCte() {
		return InsumosCte_idInsumosCte;
	}

	public void setInsumosCte_idInsumosCte(BigDecimal insumosCte_idInsumosCte) {
		InsumosCte_idInsumosCte = insumosCte_idInsumosCte;
	}

	public String getCuadrilla_idCuadrilla() {
		return Cuadrilla_idCuadrilla;
	}

	public void setCuadrilla_idCuadrilla(String cuadrilla_idCuadrilla) {
		Cuadrilla_idCuadrilla = cuadrilla_idCuadrilla;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
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
