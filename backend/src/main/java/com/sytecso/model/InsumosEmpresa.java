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
@Table(name = "InsumosEmpresa")
public class InsumosEmpresa implements Serializable {


	private static final long serialVersionUID = -4103735356132521028L;

	@Id
	@Column(name = "idInsumosCte")
	@GeneratedValue(generator = "pkIdInsumosCte")
	@GenericGenerator(name = "pkIdInsumosCte", strategy = "increment")
	private BigDecimal idInsumosCte;
	@Column(name = "identificadorSAP")
	private String identificadorSAP;
	@Column(name = "NombreInsumo")
	private String nombreInsumo;
	@Column(name = "DescripcionInsumo")
	private String descripcionInsumo;
	@Column(name = "ClaveInsumo")
	private String claveInsumo;
	@Column(name = "TotalInsumo")
	private Integer totalInsumo;
	@Column(name = "UnidadMedidaInsumo")
	private String unidadMedidaInsumo;
	@Column(name = "Categoria")
	private String categoria;
	@Column(name = "Grupo")
	private String grupo;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "registroBatch_idregistroBatch", nullable = false, updatable = true, insertable = true)
	private RegistroBatch registroBatch;

	
	
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

	public String getDescripcionInsumo() {
		return descripcionInsumo;
	}

	public void setDescripcionInsumo(String descripcionInsumo) {
		this.descripcionInsumo = descripcionInsumo;
	}

	public String getClaveInsumo() {
		return claveInsumo;
	}

	public void setClaveInsumo(String claveInsumo) {
		this.claveInsumo = claveInsumo;
	}

	public Integer getTotalInsumo() {
		return totalInsumo;
	}

	public void setTotalInsumo(Integer totalInsumo) {
		this.totalInsumo = totalInsumo;
	}

	public String getUnidadMedidaInsumo() {
		return unidadMedidaInsumo;
	}

	public void setUnidadMedidaInsumo(String unidadMedidaInsumo) {
		this.unidadMedidaInsumo = unidadMedidaInsumo;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getGrupo() {
		return grupo;
	}

	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}

	public RegistroBatch getRegistroBatch() {
		return registroBatch;
	}

	public void setRegistroBatch(RegistroBatch registroBatch) {
		this.registroBatch = registroBatch;
	}

}
