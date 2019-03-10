/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2019
 */
package com.sytecso.dao;

import com.sytecso.beans.Cuenta;
import com.sytecso.component.VOCuentasConstraint;
import java.util.SortedSet;
import com.sytecso.dto.CuentaDTO;
import java.util.List;

public interface DAOCuenta {
	
	public Boolean findCuentaByNumCuenta(String numCuenta);
	public long registrarCuenta(Cuenta cta) throws Exception;
	public boolean existeCuenta(Cuenta cta) throws Exception;
	public void actualizarCuenta() throws Exception;
	public String registrarCargaInicialCuentas(VOCuentasConstraint cta);
	public SortedSet<String> obtenerCuentas() throws Exception;
	public List<CuentaDTO> buscaCuentasClientesEmpresas() throws Exception;
}
