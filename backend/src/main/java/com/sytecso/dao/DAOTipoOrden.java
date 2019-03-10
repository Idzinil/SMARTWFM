/**
 * SmartBilling
 * Created-By: Sytecso
 * Date:       29/09/2017
 */
package com.sytecso.dao;

import java.util.List;

import com.sytecso.model.TipoOrden;

public interface DAOTipoOrden {

	public List<TipoOrden> findCuentasTipoOrdenes(String condiciones);
	public TipoOrden obtenerTipoOrdenbyNameandCuenta(TipoOrden tipoOrden);
	public long registrarTipoOrden(TipoOrden tipoOrden);
	public Long registrarTipoOrdenBatch(TipoOrden tipoOrden);

}
