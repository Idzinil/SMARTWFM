package com.sytecso.service.impl;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sytecso.captions.CuentaClienteCaption;
import com.sytecso.dao.DAOCuentaCliente;
import com.sytecso.model.CuentaCliente;
import com.sytecso.service.ServiceCuentaCliente;
import com.sytecso.service.ServiceTipoOrdenes;

@Service
public class ServiceCuentaClienteImpl implements ServiceCuentaCliente{

	@Autowired private DAOCuentaCliente daoCuentaCliente;
	@Autowired private ServiceTipoOrdenes serviceTipoOrdenes;
	
	@Override
	public List<CuentaClienteCaption> getAllCuentaCliente() {
		return daoCuentaCliente.findAllCuentasClientes();
	}

	@Override
	public CuentaCliente findCuentaClienteByNumCuenta(String numCuenta) {
		return daoCuentaCliente.findCuentaClienteByNumCuenta(numCuenta);
	}

}
