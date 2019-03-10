/**
 * 
 * Created-By: Sytecso
 * Date:       06/03/2019
 *  */
package com.sytecso.service;

import com.sytecso.component.VOCuentasConstraint;
import java.util.List;
import java.util.SortedSet;

import com.sytecso.beans.Cuenta;
import com.sytecso.dto.CuentaDTO;

public interface ServiceCuenta {
	public long registrarCuenta(Cuenta cta) throws Exception;
	public Boolean findCuentaByNumCuenta(String numCuenta);
	public SortedSet obtenerCuentas() throws Exception;
	public String registrarCargaInicialCuentas(VOCuentasConstraint cta) throws Exception;	
	public List<CuentaDTO> TraerClientesEmpresas()throws Exception;
}

