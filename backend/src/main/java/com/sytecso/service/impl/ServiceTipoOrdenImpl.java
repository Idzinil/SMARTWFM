/**
} * Sytecso
 * Created-By: Sytecso
 * Date:       29/09/2017
 */
package com.sytecso.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sytecso.beans.DatosFiscales;
import com.sytecso.beans.EventoSytecso;
import com.sytecso.beans.TipoOrden;
import com.sytecso.component.CondicionesBusqueda;
import com.sytecso.dao.DAOTipoOrden;
import com.sytecso.exceptions.SytecsoException;
import com.sytecso.service.ServiceEventoSytecso;
import com.sytecso.service.ServiceTipoOrden;

@Service
public class ServiceTipoOrdenImpl implements ServiceTipoOrden {

	@Autowired private DAOTipoOrden daoTipoOrden;
	@Autowired private ServiceEventoSytecso serviceEventoSytecso;
	
	@Override
	public List<TipoOrden> findCuentasTipoOrdenes(TipoOrden tipoOrden)  {
		tipoOrden.getCuenta().setDatosFiscales(new DatosFiscales());
		String condiciones = CondicionesBusqueda.generaCondiciones(tipoOrden.getCuenta());
		return daoTipoOrden.findCuentasTipoOrdenes(condiciones);

	}
	
	@Override
	public TipoOrden buscarTipoOrdenByNamebyCuenta(TipoOrden tipoOrden) {
		TipoOrden tipoOrdenNamebyCte = new TipoOrden();
		
		tipoOrdenNamebyCte= daoTipoOrden.obtenerTipoOrdenbyNameandCuenta(tipoOrden);
		
		return tipoOrdenNamebyCte;
}
	
	@Override
	public void registrarTipoOrden(TipoOrden tipoOrden) {
		daoTipoOrden.registrarTipoOrden( tipoOrden);
	}
	
	
	public void registrarTipoOrdenBatch(List<TipoOrden> lista) {
		for (TipoOrden tipoOrden : lista) {
			try {
				Long idTipoOrden = daoTipoOrden.registrarTipoOrdenBatch(tipoOrden);
				if (idTipoOrden > 0) {
					serviceEventoSytecso.registrarEventoSytecso(new EventoSytecso("ALTA_TIPO_ORDEN_BATCH", idTipoOrden));
				}
			} catch (Exception e) {
				SytecsoException.logClassAndMethodWithException(e);
			}
			
		}
	}
	
}
