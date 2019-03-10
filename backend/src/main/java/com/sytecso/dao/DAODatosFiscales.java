/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2019
 */
package com.sytecso.dao;

import com.sytecso.beans.DatosFiscales;

import java.sql.SQLException;

import com.sytecso.beans.Cuenta;

public interface DAODatosFiscales {
	public void registrarDatosFiscales(DatosFiscales df) throws Exception;
	public DatosFiscales findDatosFsicalesForReporteFacturacionByIdCuenta(Long idCuenta);
	public long  regAccountUniFisData(Cuenta cta) throws SQLException;
	public boolean  actualizaDatosFiscales(Cuenta cta) ;
	public Integer findDatosFiscalesByRfc(String rfc);
	public DatosFiscales findDatosFiscalesByIdUnidadFacturacion(Long idUnidadFacturacion);
	public Boolean updateDatosFiscalesByIdDaTosFiscales(DatosFiscales datosFiscales);
	public DatosFiscales findDatosFiscalesByRazonSocial(DatosFiscales dtosFisc) throws Exception;
}
