package com.sytecso.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="telefono")
public class Telefono implements Serializable {
	
	private static final long serialVersionUID = 2531605088107797384L;
	@Id
	@Column(name="idTelefono")
	@GeneratedValue(generator="pkIdTelefono")
	@GenericGenerator(name="pkIdTelefono",strategy="increment")
	private BigDecimal idTelefono;
	@Column(name="telefono")
	private String telefono;
	@Column(name="tipoTelefono")
	private String tipoTelefono;
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="datosUsuarioFinal_idDatosUsuarioFinal",nullable = false,insertable=true,updatable=true)
	private DatosUsuarioFinal datosUsuarioFinal;
	
	public BigDecimal getIdTelefono() {
		return idTelefono;
	}
	public void setIdTelefono(BigDecimal idTelefono) {
		this.idTelefono = idTelefono;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getTipoTelefono() {
		return tipoTelefono;
	}
	public void setTipoTelefono(String tipoTelefono) {
		this.tipoTelefono = tipoTelefono;
	}
	public DatosUsuarioFinal getDatosUsuarioFinal() {
		return datosUsuarioFinal;
	}
	public void setDatosUsuarioFinal(DatosUsuarioFinal datosUsuarioFinal) {
		this.datosUsuarioFinal = datosUsuarioFinal;
	}
	
}
