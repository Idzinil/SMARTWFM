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
import com.sytecso.beans.InsumosCte;
import com.sytecso.beans.InsumosEmp;
import com.sytecso.component.CondicionesBusqueda;
import com.sytecso.component.SytecsoLogger;
import com.sytecso.dao.DAOInsumos;
import com.sytecso.exceptions.SytecsoException;
import com.sytecso.service.ServiceEventoSytecso;
import com.sytecso.service.ServiceInsumos;

@Service
public class ServiceInsumosImpl implements ServiceInsumos {

	@Autowired private DAOInsumos daoInsumos;
	@Autowired private ServiceEventoSytecso serviceEventoSytecso;
	
	@Override
	public List<InsumosCte> findCuentasInsumos(InsumosCte insumosCta)  {
		insumosCta.getCuenta().setDatosFiscales(new DatosFiscales());
		String condiciones = CondicionesBusqueda.generaCondiciones(insumosCta.getCuenta());
		return daoInsumos.findCuentasInsumos(condiciones);

	}
	
	public List<InsumosCte> traerTotalInsumos() {

		List<InsumosCte> lstInsumos = daoInsumos.traerTotalInsumos();
		SytecsoLogger.logInfo(this.getClass(), "traerTotalInsumos");

		return lstInsumos;
	}
	
	
	@Override
	public List<InsumosCte> buscarInsumoByName(InsumosCte insumosCte) {
		List<InsumosCte> lstInsumos = null;
		
		lstInsumos= daoInsumos.findInsumosbyName(insumosCte.getNombreInsumo());
		
		return lstInsumos;
}
	@Override
	public InsumosCte buscarInsumoByNamebyCuenta(InsumosCte insumosCte) {
		InsumosCte insumoNamebyCte = new InsumosCte();
		
		insumoNamebyCte= daoInsumos.obtenerInsumobNameandCuenta(insumosCte);
		
		return insumoNamebyCte;
}
	@Override
	public InsumosEmp buscarInsumoEmpByName(InsumosEmp insumosEmp) {
		InsumosEmp insumoEmpName = new InsumosEmp();
		
		insumoEmpName= daoInsumos.obtenerInsumoEmpbyName(insumosEmp);
		
		return insumoEmpName;
}

	@Override
	public void registrarInsumo(InsumosCte insumosCte) {
		daoInsumos.registrarInsumo( insumosCte);
	}
	
	@Override
	public void registrarInsumoEmp(InsumosEmp insumoEmp) {
		daoInsumos.registrarInsumoEmp( insumoEmp);
	}
	
	@Override
	public boolean updateInsumosByIdInsumo(InsumosCte insumosCte) {
		try {
			if(daoInsumos.updateInsumosByIdInsumo(insumosCte)) {
				return true;
			}	
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
		return false;
	}
	public List<InsumosEmp> traerTotalInsumosEmpresa() {

		List<InsumosEmp> lstInsumos = daoInsumos.traerTotalInsumosEmpresa();
		SytecsoLogger.logInfo(this.getClass(), "traerTotalInsumos");

		return lstInsumos;
	}

	@Override
	public boolean updateInsumoEmpByIdInsumo(InsumosEmp insumosEmp) {
		try {
			if(daoInsumos.updateInsumosEmpByIdInsumo(insumosEmp)) {
				return true;
			}	
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
		return false;
	}
	
	public void registrarInsumosEmpresaBatch(List<InsumosEmp> lista) {
		for (InsumosEmp insumo : lista) {
			try {
				Long idInsumos = daoInsumos.registrarInsumosEmpresaBatch(insumo);
				if (idInsumos > 0) {
					serviceEventoSytecso.registrarEventoSytecso(new EventoSytecso("ALTA_INSUMOEMPRESA_BATCH", idInsumos));
				}
			} catch (Exception e) {
				SytecsoException.logClassAndMethodWithException(e);
			}
			
		}
	}
	
	@Override
	public void registrarInsumosCteBatch(List<InsumosCte> lista) {
		for (InsumosCte insumo : lista) {
			try {
				Long idInsumos = daoInsumos.registrarInsumosCteBatch(insumo);
				if (idInsumos > 0) {
					serviceEventoSytecso.registrarEventoSytecso(new EventoSytecso("ALTA_INSUMOCLIENTE_BATCH", idInsumos));
				}
			} catch (Exception e) {
				SytecsoException.logClassAndMethodWithException(e);
			}
			
		}
	}
	
}
