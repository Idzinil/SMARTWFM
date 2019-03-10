/**
 * SmartBilling
 * Created-By: Sytecso
 * Date:       29/09/2017
 */
package com.sytecso.dao;


import java.util.List;

import com.sytecso.beans.InsumosCte;
import com.sytecso.beans.InsumosEmp;

public interface DAOInsumos {
	public List<InsumosCte> traerTotalInsumos() ;
	public List<InsumosCte> findInsumosbyName(String nombreInsumo);
	public long registrarInsumo(InsumosCte insumo);
	public List<InsumosCte> findCuentasInsumos(String condiciones);
	public boolean updateInsumosByIdInsumo(InsumosCte insumosCte);
	public InsumosCte obtenerInsumobNameandCuenta(InsumosCte insumos);
	public List<InsumosEmp> traerTotalInsumosEmpresa();
	public InsumosEmp obtenerInsumoEmpbyName(InsumosEmp insumosEmp);
	public long registrarInsumoEmp(InsumosEmp insumoEmp);
	public boolean updateInsumosEmpByIdInsumo(InsumosEmp insumosEmp);
	public Long registrarInsumosEmpresaBatch(InsumosEmp insumosEmp);
	public Long registrarInsumosCteBatch(InsumosCte insumosCte);
}
