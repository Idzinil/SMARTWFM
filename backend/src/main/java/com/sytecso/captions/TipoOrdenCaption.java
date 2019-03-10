package com.sytecso.captions;

import java.math.BigDecimal;

public interface TipoOrdenCaption {
	BigDecimal getIdOrden();
	String getTipoOrden();
	String getCuentaCliente_idCuenta();
	String getDescripcionOrden();
	String getNombreOrden();
	String getMontoOrden();
	String getDivisa();
	String getTiempoOrdenProm();
}
