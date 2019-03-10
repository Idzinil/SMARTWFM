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
@Table(name="eventoSistema")
public class EventoSistema implements Serializable {


	private static final long serialVersionUID = 1717631908779357919L;

	@Id
	@Column(name = "ideventoSistema")
	@GeneratedValue(generator = "pkIdeventoSistema")
	@GenericGenerator(name = "pkIdeventoSistema", strategy = "increment")
	private BigDecimal ideventoSistema;
	@Column(name = "tipoEvento")
	private String tipoEvento;
	@Column(name = "horaInicio")
	private String horaInicio;
	@Column(name = "horaFin")
	private String horaFin;
	@Column(name = "fechaCreacionEvento")
	private String fechaCreacionEvento;

	@ManyToOne(cascade =  CascadeType.ALL)
	@JoinColumn(name = "CuentaCliente_idCuenta", nullable = false, updatable=true, insertable=true)
	private CuentaCliente cuentaCliente;
	
	
	@ManyToOne(cascade=CascadeType.ALL)
	//join hacia la llave foranea de EventoSistema(Clase padre)
	@JoinColumn(name="registroBatch_idregistroBatch")
	private RegistroBatch registroBatch;
	
	//se tiene una relacion de uno a muchos mapeada por la propiedad
	//eventoSistema_ideventoSistema que esta en la clase manejoEjecucionesSistema(clase hija)
	@OneToMany(mappedBy="eventoSistema", cascade = CascadeType.ALL)
	private List<ManejoEjecucionesSistema> manejoEjecucionesSistema;
	
	
	
	public BigDecimal getIdeventoSistema() {
		return ideventoSistema;
	}

	public void setIdeventoSistema(BigDecimal ideventoSistema) {
		this.ideventoSistema = ideventoSistema;
	}

	public String getTipoEvento() {
		return tipoEvento;
	}

	public void setTipoEvento(String tipoEvento) {
		this.tipoEvento = tipoEvento;
	}

	public String getHoraInicio() {
		return horaInicio;
	}

	public void setHoraInicio(String horaInicio) {
		this.horaInicio = horaInicio;
	}

	public String getHoraFin() {
		return horaFin;
	}

	public void setHoraFin(String horaFin) {
		this.horaFin = horaFin;
	}

	public String getFechaCreacionEvento() {
		return fechaCreacionEvento;
	}

	public void setFechaCreacionEvento(String fechaCreacionEvento) {
		this.fechaCreacionEvento = fechaCreacionEvento;
	}

	public CuentaCliente getCuentaCliente() {
		return cuentaCliente;
	}

	public void setCuentaCliente(CuentaCliente cuentaCliente) {
		this.cuentaCliente = cuentaCliente;
	}

	public RegistroBatch getRegistroBatch() {
		return registroBatch;
	}

	public void setRegistroBatch(RegistroBatch registroBatch) {
		this.registroBatch = registroBatch;
	}

	public List<ManejoEjecucionesSistema> getManejoEjecucionesSistema() {
		return manejoEjecucionesSistema;
	}

	public void setManejoEjecucionesSistema(List<ManejoEjecucionesSistema> manejoEjecucionesSistema) {
		this.manejoEjecucionesSistema = manejoEjecucionesSistema;
	}


	

}
