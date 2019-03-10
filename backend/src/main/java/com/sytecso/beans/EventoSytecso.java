/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/201
 */
package com.sytecso.beans;

import java.io.Serializable;

public class EventoSytecso implements Serializable{

	public EventoSytecso() {
		
	}
	public EventoSytecso(String tipoEvento, Long producto_idProducto) {
		super();
		this.tipoEvento = tipoEvento;
		Producto_idProducto = producto_idProducto;
	}
	
	public EventoSytecso(String tipoEvento, Long cuenta_idCuenta, Long compra_idCompra, Long producto_idProducto) {
		super();
		this.tipoEvento = tipoEvento;
		Cuenta_idCuenta = cuenta_idCuenta;
		Compra_idCompra = compra_idCompra;
		Producto_idProducto = producto_idProducto;
	}

	

	private static final long serialVersionUID = -5603446029804404286L;
	private long idEventoSytecso;
	private String tipoEvento;
	private String horaInicio;
	private String horaFin;
	private Long Cuenta_idCuenta;
	private Long RegistroBatch_idregistroBatch;
	private Long Evento_idEvento;
	private Long Compra_idCompra;
	private Long Item_iditem;
	private Long Ajuste_idAjuste;
	private Long Producto_idProducto;

	public long getIdEventoSytecso() {
		return idEventoSytecso;
	}
	public void setIdEventoSytecso(long idEventoSytecso) {
		this.idEventoSytecso = idEventoSytecso;
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
	public Long getCuenta_idCuenta() {
		return Cuenta_idCuenta;
	}
	public void setCuenta_idCuenta(Long cuenta_idCuenta) {
		Cuenta_idCuenta = cuenta_idCuenta;
	}
	public Long getRegistroBatch_idregistroBatch() {
		return RegistroBatch_idregistroBatch;
	}
	public void setRegistroBatch_idregistroBatch(Long registroBatch_idregistroBatch) {
		RegistroBatch_idregistroBatch = registroBatch_idregistroBatch;
	}
	public Long getEvento_idEvento() {
		return Evento_idEvento;
	}
	public void setEvento_idEvento(Long evento_idEvento) {
		Evento_idEvento = evento_idEvento;
	}
	public Long getCompra_idCompra() {
		return Compra_idCompra;
	}
	public void setCompra_idCompra(Long compra_idCompra) {
		Compra_idCompra = compra_idCompra;
	}
	public Long getItem_iditem() {
		return Item_iditem;
	}
	public void setItem_iditem(Long item_iditem) {
		Item_iditem = item_iditem;
	}
	public Long getAjuste_idAjuste() {
		return Ajuste_idAjuste;
	}
	public void setAjuste_idAjuste(Long ajuste_idAjuste) {
		Ajuste_idAjuste = ajuste_idAjuste;
	}
	
	public Long getProducto_idProducto() {
		return Producto_idProducto;
	}
	public void setProducto_idProducto(Long producto_idProducto) {
		Producto_idProducto = producto_idProducto;
	}
	

}
