/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2019
 *///
package com.sytecso.service;

import com.sytecso.beans.Cuenta;
import com.sytecso.beans.DatosFiscales;

public interface ServiceDatosFiscales {
	public void registrarDatosFiscales( DatosFiscales df ) throws Exception;
	public DatosFiscales findDatosFsicalesForReporteFacturacionByIdCuenta(Long idCuenta);
	public long regAccountUniFisData(Cuenta cta ) throws Exception ;
	public boolean actualizaDatosFiscales(Cuenta cta );
	public Integer findDatosFiscalesByRfc(String rfc);
	public DatosFiscales findDatosFiscalesByIdUnidadFacturacion(Long idUnidadFacturacion);
	public Boolean updateDatosFiscalesByIdDaTosFiscales(DatosFiscales datosFiscales);
	public DatosFiscales consultarCuentaporRazonSocial(DatosFiscales dtosFisc) throws Exception;
}
