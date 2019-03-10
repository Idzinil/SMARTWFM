package com.sytecso.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.sytecso.captions.CuentaClienteCaption;
import com.sytecso.model.CuentaCliente;

public interface DAOCuentaCliente extends CrudRepository<CuentaCliente, String>{
	
	@Query("SELECT idCuenta as idCuenta,numCuenta as numCuenta, SUBSTRING(fecCreacion,1,10) as fecCreacion,estatusCta as estatusCta,segmentoCliente as segmentoCliente,aliasCliente as aliasCliente,region as region,gerencia as gerencia,departamento as departamento,empresa as empresa,ejecutivo as ejecutivo,idSAP as idSAP FROM CuentaCliente")
	public List<CuentaClienteCaption> findAllCuentasClientes();
	public CuentaCliente findCuentaClienteByNumCuenta(String numCuenta);
}
