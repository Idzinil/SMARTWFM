package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "InsumosCte")
public class InsumosCte implements Serializable{

	private static final long serialVersionUID = -5764509627533978805L;
	@Id
	@Column(name="idInsumosCte")
	@GeneratedValue(generator="pkIdInsumosCte")
	@GenericGenerator(name="pkIdInsumosCte",strategy="increment")
	private BigDecimal idInsumosCte;
	@Column(name="identificadorSAP")
	private String identificadorSAP;
	@Column(name="NombreInsumo")
	private String nombreInsumo;
	@Column(name="DescripcionInsumo")
	private String descripcionInsumo;
	@Column(name="TotalInsumo")
	private Integer totalInsumo;
	@Column(name="ClaveInsumo")
	private String claveInsumo;
	@Column(name="UnidadMedidaInsumo")
	private String unidadMedidaInsumo;
	private BigDecimal fkCuentaClienteIdCuenta;
	
	//se tiene una relacion de muchos a uno mapeada por la propiedad
	//idCuenta(PK) que esta en la clase cuentaCliente(clase padre)
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="CuentaCliente_idCuenta", nullable = false, updatable = true, insertable = true)
	private CuentaCliente cuentaCliente;
	
	@OneToMany(mappedBy = "insumosCte", cascade = CascadeType.ALL)
	private List<TipoOrdenOcupaInsumos> tipoOrdenOcupaInsumos;
	
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
	public Integer getTotalInsumo() {
		return totalInsumo;
	}
	public void setTotalInsumo(Integer totalInsumo) {
		this.totalInsumo = totalInsumo;
	}
	public String getClaveInsumo() {
		return claveInsumo;
	}
	public void setClaveInsumo(String claveInsumo) {
		this.claveInsumo = claveInsumo;
	}
	public String getUnidadMedidaInsumo() {
		return unidadMedidaInsumo;
	}
	public void setUnidadMedidaInsumo(String unidadMedidaInsumo) {
		this.unidadMedidaInsumo = unidadMedidaInsumo;
	}
	public BigDecimal getFkCuentaClienteIdCuenta() {
		return fkCuentaClienteIdCuenta;
	}
	public void setFkCuentaClienteIdCuenta(BigDecimal fkCuentaClienteIdCuenta) {
		this.fkCuentaClienteIdCuenta = fkCuentaClienteIdCuenta;
	}

	public CuentaCliente getCuentaCliente() {
		return cuentaCliente;
	}
	public void setCuentaCliente(CuentaCliente cuentaCliente) {
		this.cuentaCliente = cuentaCliente;
	}
	public List<TipoOrdenOcupaInsumos> getTipoOrdenOcupaInsumos() {
		return tipoOrdenOcupaInsumos;
	}
	public void setTipoOrdenOcupaInsumos(List<TipoOrdenOcupaInsumos> tipoOrdenOcupaInsumos) {
		this.tipoOrdenOcupaInsumos = tipoOrdenOcupaInsumos;
	}
	public RegistroBatch getRegistroBatch() {
		return registroBatch;
	}
	public void setRegistroBatch(RegistroBatch registroBatch) {
		this.registroBatch = registroBatch;
	}


}
