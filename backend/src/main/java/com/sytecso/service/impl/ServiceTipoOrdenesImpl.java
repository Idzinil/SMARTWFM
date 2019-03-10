package com.sytecso.service.impl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sytecso.captions.TipoOrdenCaption;
import com.sytecso.dao.DAOTipoOrdenes;
import com.sytecso.model.CuentaCliente;
import com.sytecso.service.ServiceCuentaCliente;
import com.sytecso.service.ServiceTipoOrdenes;
@Service
public class ServiceTipoOrdenesImpl implements ServiceTipoOrdenes{
	@Autowired private DAOTipoOrdenes daoTipoOrdenes;
	@Autowired private ServiceCuentaCliente serviceCuentaCliente;
	@Override
	public List<TipoOrdenCaption> findTipoOrdenesByidCuentaCliente(BigDecimal idCuentaCliente) {
		return daoTipoOrdenes.findTipoOrdenesByidCuentaCliente(idCuentaCliente);
	}
	@Override
	public List<TipoOrdenCaption> findTipoOrdenesByNumeroCliente(String numeroCuenta) {
		CuentaCliente cuentaCliente = serviceCuentaCliente.findCuentaClienteByNumCuenta(numeroCuenta);
		return daoTipoOrdenes.findTipoOrdenesByidCuentaCliente(cuentaCliente.getIdCuenta());

	}
	
	
}
