/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2017
 */
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

import com.sytecso.beans.Cuenta;




@Entity
@Table(name="TipoOrden")
public class TipoOrden implements Serializable {

	private static final long serialVersionUID = -3028819703782901148L;
	@Id
	@Column(name="idOrden")
	@GeneratedValue(generator="pkIdOrden")
	@GenericGenerator(name="pkIdOrden",strategy="increment")
	private BigDecimal idOrden;
	@Column(name="tipoOrden")
	private String tipoOrden;
	@Column(name="descripcionOrden")
	private String descripcionOrden;
	@Column(name="nombreOrden")
	private String nombreOrden;
	@Column(name="tiempoOrdenProm")
	private String tiempoOrdenProm;
	@Column(name="montoOrden")
	private BigDecimal montoOrden;
	@Column(name="divisa")
	private String divisa;
	@OneToMany(mappedBy="tipoOrden")
	private List<Orden> orden;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="cuentaCliente_idCuenta",nullable = false,updatable=true,insertable=true)
	private CuentaCliente cuentaCliente;
	
	private Cuenta cuenta;
	
	public BigDecimal getIdOrden() {
		return idOrden;
	}
	public void setIdOrden(BigDecimal idOrden) {
		this.idOrden = idOrden;
	}
	public String getTipoOrden() {
		return tipoOrden;
	}
	public void setTipoOrden(String tipoOrden) {
		this.tipoOrden = tipoOrden;
	}

	public String getDescripcionOrden() {
		return descripcionOrden;
	}
	public void setDescipcionOrden(String descripcionOrden) {
		this.descripcionOrden = descripcionOrden;
	}
	public String getNombreOrden() {
		return nombreOrden;
	}
	public void setNombreOrden(String nombreOrden) {
		this.nombreOrden = nombreOrden;
	}
	public BigDecimal getMontoOrden() {
		return montoOrden;
	}
	public void setMontoOrden(BigDecimal montoOrden) {
		this.montoOrden = montoOrden;
	}
	public String getDivisa() {
		return divisa;
	}
	public void setDivisa(String divisa) {
		this.divisa = divisa;
	}
	public String getTiempoOrdenProm() {
		return tiempoOrdenProm;
	}
	public void setTiempoOrdenProm(String tiempoOrdenProm) {
		this.tiempoOrdenProm = tiempoOrdenProm;
	}
	public Cuenta getCuenta() {
		return cuenta;
	}
	public void setCuenta(Cuenta cuenta) {
		this.cuenta = cuenta;
	}
	public List<Orden> getOrden() {
		return orden;
	}
	public void setOrden(List<Orden> orden) {
		this.orden = orden;
	}
	public CuentaCliente getCuentaCliente() {
		return cuentaCliente;
	}
	public void setCuentaCliente(CuentaCliente cuentaCliente) {
		this.cuentaCliente = cuentaCliente;
	}
	

}


