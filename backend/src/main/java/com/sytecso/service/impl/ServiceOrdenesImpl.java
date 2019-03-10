/**
 * 
 * Created-By: Sytecso
 * Date:       06/03/2019
 */


package com.sytecso.service.impl;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sytecso.captions.OrdenCaption;
import com.sytecso.dao.DAOOrdenes;
import com.sytecso.dto.OrdenDTO;
import com.sytecso.dto.TipoOrdenDTO;
import com.sytecso.model.Orden;
import com.sytecso.service.ServiceOrdenes;
import com.sytecso.dao.DAOOrden;
import com.sytecso.beans.Cuenta;

@Service
public class ServiceOrdenesImpl implements ServiceOrdenes{
	@Autowired DAOOrdenes daoOrdenes;
	@Autowired DAOOrden  daoOrden;

	@Override
	public List<Orden> findAll() {
//		return StreamSupport.stream(daoOrdenes.findAll().spliterator(), true).collect(Collectors.toList());
		return null;
	}

	@Override
	public void save(Orden orden) {
		daoOrdenes.save(orden);
	}

	@Override
	@Transactional(readOnly=true)
	public OrdenCaption findOrdenById(BigDecimal id) {
		return daoOrdenes.findOrdenByIdOrden(id).orElse(null);
	}

	/******************************
	 * This service will get  the last orden in the database
	 */
	@Override
	public OrdenDTO ObtenerUltimaOrden() throws SQLException {
		return daoOrden.ObtenerUltimaOrden();
	}
	
	/******************************
	 *  This method will get the order types for a specific client in the database
	 * @throws Exception 
	 */
	@Override
	public List<TipoOrdenDTO> ObtenerOrdenesTipo(Cuenta ctaCte) throws Exception {
		return daoOrden.ObtenerTiposOrdenCliente(ctaCte);
	}
	

	

}
