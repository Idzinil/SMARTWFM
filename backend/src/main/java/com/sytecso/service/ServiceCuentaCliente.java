package com.sytecso.service;

import java.util.List;

import com.sytecso.captions.CuentaClienteCaption;
import com.sytecso.model.CuentaCliente;

public interface ServiceCuentaCliente {
	public List<CuentaClienteCaption> getAllCuentaCliente();
	public CuentaCliente findCuentaClienteByNumCuenta(String numCuenta);
}
