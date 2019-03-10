package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name = "orden")
public class Orden implements Serializable {

	private static final long serialVersionUID = 944344323046899904L;
	@Id
	@Column(name = "idOrden")
	@GeneratedValue(generator = "pkIdOrden")
	@GenericGenerator(name = "pkIdOrden", strategy = "increment")
	private BigDecimal idOrden;
	@Column(name = "fechaInicio")
	private String fechaInicio;
	@Column(name = "tiempoTotalOrden")
	private Integer tiempoTotalOrden;
	@Column(name = "fechaFin")
	private String fechaFin;

	@Column(name = "estatus")
	@Lob
	@Basic(fetch = FetchType.LAZY)
	private byte[] estatus;

	@Column(name = "descripcion")
	private String descripcion;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "tipoOrden_IdOrden", updatable = true, insertable = true)
	private TipoOrden tipoOrden;

	@OneToOne(mappedBy = "orden", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private DatosUsuarioFinal datosUsuarioFinal;

	// se tienes una relacion de uno a muchos mapeada por la propiedad
	// Orden_idOrden que se encuentra en la clase EventosOrden(clase hija)
	@OneToMany(mappedBy = "orden", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<EventosOrden> eventosOrden;

	// se tiene una relacion de uno a muchos mapeada por la propiedad
	// Orden_idOrden que se encuentra en la clase evidenciaOrden(clase hija)
	@OneToMany(mappedBy = "orden", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<EvidenciaOrden> evidenciaOrden;

	public BigDecimal getIdOrden() {
		return idOrden;
	}

	public void setIdOrden(BigDecimal idOrden) {
		this.idOrden = idOrden;
	}

	public String getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public String getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(String fechaFin) {
		this.fechaFin = fechaFin;
	}

	public Integer getTiempoTotalOrden() {
		return tiempoTotalOrden;
	}

	public void setTiempoTotalOrden(Integer tiempoTotalOrden) {
		this.tiempoTotalOrden = tiempoTotalOrden;
	}

	public byte[] getEstatus() {
		return estatus;
	}

	public void setEstatus(byte[] estatus) {
		this.estatus = estatus;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public DatosUsuarioFinal getDatosUsuarioFinal() {
		return datosUsuarioFinal;
	}

	public void setDatosUsuarioFinal(DatosUsuarioFinal datosUsuarioFinal) {
		this.datosUsuarioFinal = datosUsuarioFinal;
	}

	public TipoOrden getTipoOrden() {
		return tipoOrden;
	}

	public void setTipoOrden(TipoOrden tipoOrden) {
		this.tipoOrden = tipoOrden;
	}

	public List<EventosOrden> getEventosOrden() {
		return eventosOrden;
	}

	public void setEventosOrden(List<EventosOrden> eventosOrden) {
		this.eventosOrden = eventosOrden;
	}

	public List<EvidenciaOrden> getEvidenciaOrden() {
		return evidenciaOrden;
	}

	public void setEvidenciaOrden(List<EvidenciaOrden> evidenciaOrden) {
		this.evidenciaOrden = evidenciaOrden;
	}


}
