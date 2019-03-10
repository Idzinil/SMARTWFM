/**
 * SmartBilling
 * Created-By: Sytecso
 * Date:       29/09/2017
 */
package com.sytecso.service;

import java.util.List;

import com.sytecso.beans.InsumosCte;
import com.sytecso.beans.InsumosEmp;

public interface ServiceInsumos {
	public List<InsumosCte> traerTotalInsumos();
	public List<InsumosCte> buscarInsumoByName(InsumosCte insumoCte);
	void registrarInsumo(InsumosCte insumosCte);
	public List<InsumosCte> findCuentasInsumos(InsumosCte ctaInsum);
	public boolean updateInsumosByIdInsumo(InsumosCte insumosCte);
	public InsumosCte buscarInsumoByNamebyCuenta(InsumosCte insumosCte);
	public List<InsumosEmp> traerTotalInsumosEmpresa();
	public InsumosEmp buscarInsumoEmpByName(InsumosEmp insumoEmp);
	public boolean updateInsumoEmpByIdInsumo(InsumosEmp insumobyNameEmp);
	public void registrarInsumoEmp(InsumosEmp insumoEmp);
	public void registrarInsumosEmpresaBatch(List<InsumosEmp> insumosEmpresa);
	public void registrarInsumosCteBatch(List<InsumosCte> insumosCliente);

}

