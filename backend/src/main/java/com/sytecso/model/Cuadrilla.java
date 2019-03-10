package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name = "Cuadrilla")
public class Cuadrilla implements Serializable {

	private static final long serialVersionUID = 103614388836598816L;
	@Id
	@Column(name = "IdCuadrilla")
	@GeneratedValue(generator = "pkIdCuadrilla")
	@GenericGenerator(name = "pkIdCuadrilla", strategy = "increment")
	private BigDecimal idCuadrilla;
	@Column(name = "NumeroCuadrilla")
	private String numeroCuadrilla;
	@Column(name = "Placas")
	private String placas;
	@Column(name = "idCuadrilla")
	private String seleccionable;
	@Column(name = "estatusActividad")
	private String estatusActividad;
	@Column(name = "sesion")
	private Integer sesion;

	// Se tiene una relacion de muchos a uno mapeada por la propiedad
	// CuentaCliente_idCuenta que esta en la clase CuentaCliente(clase padre)
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "CuentaCliente_idCuenta", nullable = false, updatable = true, insertable = true)
	private CuentaCliente cuentaCliente;

	// se tiene una relcion de uno a muchos mapeada por la propiedad
	// Cuarilla_idCuadrilla que se encuantra en la CuadrillaCargaInsumos(clase hija)
	@OneToMany(mappedBy = "cuadrilla", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<CuadrillaCargaInsumos> cuadrillaCargaInsumo;
	
	//se tiene una relacion de uno a muchos mapeada por la propiedad
	//Cuadrilla_idCueadrilla que se encuentra la clase CuadrillaTipoOrden(clase hija)
	@OneToMany(mappedBy = "cuadrilla", cascade =  CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<CuadrillaTipoOrden> cuadrillaTipoOrden;
	
	//Se tiene una relacion de muchos mapeada por la propiedad
	//cuadrila_idCuadrilla que se encuentra en la clase InsumosCteHasCuadrilla(clase hija)
	@OneToMany(mappedBy = "cuadrilla", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<InsumosCteHasCuadrilla> insumosCteHasCuadrilla;
	
	//se tiene una relacion de uno a muchos mapeada por la propiedad
	//Cuadrilla_idCuadrilla que se encuentra en la clase CuadrillaHasOrden(clase hija) 
	@OneToMany(mappedBy = "cuadrilla", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<CuadrillaHasOrden> cuadrillaHasOrden;
	
	//se tiene una rrelacion de uno a muchos mapeada por la propiedad
	//Cuadrilla_idCuadrilla que se encuentra en la clase instalador
	@OneToMany(mappedBy =  "cuadrilla", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Instalador> instalador;
	
	//se tiene una relacion de uno a muchos mapeada por la propiedad
	//cuadrilla_idCuadrilla que se encuentra en la clase UsuariosAccesoHasCuadrilla(clase hija)
	@OneToMany(mappedBy = "cuadrilla", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<UsuariosAccesoHasCuadrilla> usuariosAccesoHasCuadrilla;
	
	//se tiene una relacion de uno a muchos mapeada por la propiedad
	//cuadrilla_idCuadrilla que se encuentra en la clase RecesoCuadrilla(clase hija)
	@OneToMany(mappedBy = "cuadrilla", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<RecesoCuadrilla> recesoCuadrilla;
	
	
	public BigDecimal getIdCuadrilla() {
		return idCuadrilla;
	}

	public void setIdCuadrilla(BigDecimal idCuadrilla) {
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

	public String getSeleccionable() {
		return seleccionable;
	}

	public void setSeleccionable(String seleccionable) {
		this.seleccionable = seleccionable;
	}

	public String getEstatusActividad() {
		return estatusActividad;
	}

	public void setEstatusActividad(String estatusActividad) {
		this.estatusActividad = estatusActividad;
	}

	public Integer getSesion() {
		return sesion;
	}

	public void setSesion(Integer sesion) {
		this.sesion = sesion;
	}

	public CuentaCliente getCuentaCliente() {
		return cuentaCliente;
	}

	public void setCuentaCliente(CuentaCliente cuentaCliente) {
		this.cuentaCliente = cuentaCliente;
	}

	public List<CuadrillaCargaInsumos> getCuadrillaCargaInsumo() {
		return cuadrillaCargaInsumo;
	}

	public void setCuadrillaCargaInsumo(List<CuadrillaCargaInsumos> cuadrillaCargaInsumo) {
		this.cuadrillaCargaInsumo = cuadrillaCargaInsumo;
	}

	public List<CuadrillaTipoOrden> getCuadrillaTipoOrden() {
		return cuadrillaTipoOrden;
	}

	public void setCuadrillaTipoOrden(List<CuadrillaTipoOrden> cuadrillaTipoOrden) {
		this.cuadrillaTipoOrden = cuadrillaTipoOrden;
	}

	public List<InsumosCteHasCuadrilla> getInsumosCteHasCuadrilla() {
		return insumosCteHasCuadrilla;
	}

	public void setInsumosCteHasCuadrilla(List<InsumosCteHasCuadrilla> insumosCteHasCuadrilla) {
		this.insumosCteHasCuadrilla = insumosCteHasCuadrilla;
	}

	public List<CuadrillaHasOrden> getCuadrillaHasOrden() {
		return cuadrillaHasOrden;
	}

	public void setCuadrillaHasOrden(List<CuadrillaHasOrden> cuadrillaHasOrden) {
		this.cuadrillaHasOrden = cuadrillaHasOrden;
	}

	public List<Instalador> getInstalador() {
		return instalador;
	}

	public void setInstalador(List<Instalador> instalador) {
		this.instalador = instalador;
	}

	public List<UsuariosAccesoHasCuadrilla> getUsuariosAccesoHasCuadrilla() {
		return usuariosAccesoHasCuadrilla;
	}

	public void setUsuariosAccesoHasCuadrilla(List<UsuariosAccesoHasCuadrilla> usuariosAccesoHasCuadrilla) {
		this.usuariosAccesoHasCuadrilla = usuariosAccesoHasCuadrilla;
	}

	public List<RecesoCuadrilla> getRecesoCuadrilla() {
		return recesoCuadrilla;
	}

	public void setRecesoCuadrilla(List<RecesoCuadrilla> recesoCuadrilla) {
		this.recesoCuadrilla = recesoCuadrilla;
	}

}
