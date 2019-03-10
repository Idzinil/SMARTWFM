package com.sytecso.service;

import java.math.BigDecimal;
import java.util.List;

import com.sytecso.captions.TipoOrdenCaption;

public interface ServiceTipoOrdenes {
	public List<TipoOrdenCaption> findTipoOrdenesByidCuentaCliente(BigDecimal idCuentaCliente);
	public List<TipoOrdenCaption> findTipoOrdenesByNumeroCliente(String numeroCuenta);
}
