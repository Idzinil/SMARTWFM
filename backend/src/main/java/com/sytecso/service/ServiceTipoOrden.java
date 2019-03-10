/**
 * SmartBilling
 * Created-By: Sytecso
 * Date:       29/09/2017
 */
package com.sytecso.service;

import java.util.List;

import com.sytecso.model.TipoOrden;

public interface ServiceTipoOrden {

	public List<TipoOrden> findCuentasTipoOrdenes(TipoOrden tipoOrden);
	public TipoOrden buscarTipoOrdenByNamebyCuenta(TipoOrden tipoOrden);
	public void registrarTipoOrden(TipoOrden tipoOrden);
	public void registrarTipoOrdenBatch(List<TipoOrden> tipoOrden);

}

