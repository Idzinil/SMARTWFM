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


@Entity
@Table(name = "TipoOrdenOcupaInsumos")
public class TipoOrdenOcupaInsumos implements Serializable {


	private static final long serialVersionUID = -7043994237387964243L;

	@Id
	@Column(name = "InsumosCte_idInsumosCte")
	@GeneratedValue(generator = "pkInsumosCte_idInsumosCte")
	private BigDecimal InsumosCte_idInsumosCte;
	@Id
	@Column(name = "TipoOrden_idOrden")
	@GeneratedValue(generator = "pkTipoOrden_idOrden")
	private BigDecimal TipoOrden_idOrden;
	@Column(name = "totalPromedio")
	private Integer totalPromedio;
	@Column(name = "UnidadMedida")
	private String UnidadMedida;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="InsumosCte_idInsumosCte", nullable = false, updatable = true, insertable = true)
	private InsumosCte insumosCte;
	

	public BigDecimal getTipoOrden_idOrden() {
		return TipoOrden_idOrden;
	}

	public void setTipoOrden_idOrden(BigDecimal tipoOrden_idOrden) {
		TipoOrden_idOrden = tipoOrden_idOrden;
	}

	public Integer getTotalPromedio() {
		return totalPromedio;
	}

	public void setTotalPromedio(Integer totalPromedio) {
		this.totalPromedio = totalPromedio;
	}

	public String getUnidadMedida() {
		return UnidadMedida;
	}

	public void setUnidadMedida(String unidadMedida) {
		UnidadMedida = unidadMedida;
	}

	public BigDecimal getInsumosCte_idInsumosCte() {
		return InsumosCte_idInsumosCte;
	}

	public void setInsumosCte_idInsumosCte(BigDecimal insumosCte_idInsumosCte) {
		InsumosCte_idInsumosCte = insumosCte_idInsumosCte;
	}

	public InsumosCte getInsumosCte() {
		return insumosCte;
	}

	public void setInsumosCte(InsumosCte insumosCte) {
		this.insumosCte = insumosCte;
	}



}
