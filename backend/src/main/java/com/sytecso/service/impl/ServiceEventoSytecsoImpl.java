/**
 * 
 * Created-By: Sytecso
 * Date:       29/10/2017
 */
package com.sytecso.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sytecso.service.ServiceEventoSytecso;
import com.sytecso.beans.EventoSytecso;
import com.sytecso.dao.DAOEventoSytecso;
import com.sytecso.exceptions.SytecsoException;

@Service
public class ServiceEventoSytecsoImpl implements ServiceEventoSytecso {
	@Autowired
	private DAOEventoSytecso daoEventoSytecso;

	@Transactional
	public long registrarEventoSytecso(EventoSytecso esbbatch) {
		long id =0;
		try {
			 id= daoEventoSytecso.registrarEventoSytecso(esbbatch);
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
		return id;
	}
	
	@Transactional
	public void actualizarEventoSytecso(EventoSytecso esbbatch) throws Exception {
		try {
			 daoEventoSytecso.actualizarEventoSytecso(esbbatch);
		} catch (Exception e) {
			throw e;
		}
	}//END   public void actualizarEventoSytecso(EventoSytecso esbbatch)


	@Override
	@Transactional
	public void actualizarEventoSytecsoBatch(List<EventoSytecso> esbbatch) {
		try {
			daoEventoSytecso.actualizarEventoSytecsoBatch(esbbatch);
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}

			
	}

	@Override
	public EventoSytecso findEventoSytecsoByIdCompraAndGroupByIdCompra(Long idCompra) {
		return daoEventoSytecso.findEventoSytecsoByIdCompraAndGroupByIdCompra(idCompra);
	}
}
