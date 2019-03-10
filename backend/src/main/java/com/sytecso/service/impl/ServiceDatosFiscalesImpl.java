/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2019
 */
package com.sytecso.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sytecso.beans.DatosFiscales;
import com.sytecso.beans.Cuenta;
import com.sytecso.dao.DAODatosFiscales;
import com.sytecso.exceptions.SytecsoException;
import com.sytecso.service.ServiceDatosFiscales;



@Service
public class ServiceDatosFiscalesImpl implements ServiceDatosFiscales {
	
	@Autowired private DAODatosFiscales daoDatosFiscales;
	
	@Override
	public void registrarDatosFiscales( DatosFiscales df ) throws Exception {
		try {
			daoDatosFiscales.registrarDatosFiscales(df);
		}catch(Exception e) {
			throw e;
		}
	}
	
	@Override
	public DatosFiscales findDatosFsicalesForReporteFacturacionByIdCuenta(Long idCuenta) {
		return daoDatosFiscales.findDatosFsicalesForReporteFacturacionByIdCuenta(idCuenta);
	}
	@Override
	public long regAccountUniFisData(Cuenta cta ) throws Exception {
		long keyUF=-1L;
		try {
			keyUF=daoDatosFiscales.regAccountUniFisData(cta);
		}catch(Exception e) {
			throw e;
		}
		return keyUF;
		
	}
	@Override
	public boolean actualizaDatosFiscales(Cuenta cta ) {
		try {
			return daoDatosFiscales.actualizaDatosFiscales(cta);
		}catch(Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
		return false;
	}

	@Override
	public Integer findDatosFiscalesByRfc(String rfc) {
		return daoDatosFiscales.findDatosFiscalesByRfc(rfc);
	}

	@Override
	public DatosFiscales findDatosFiscalesByIdUnidadFacturacion(Long idUnidadFacturacion) {
		return daoDatosFiscales.findDatosFiscalesByIdUnidadFacturacion(idUnidadFacturacion);
	}

	@Override
	public Boolean updateDatosFiscalesByIdDaTosFiscales(DatosFiscales datosFiscales) {
		return daoDatosFiscales.updateDatosFiscalesByIdDaTosFiscales(datosFiscales);
	}
	
	@Override
	public DatosFiscales consultarCuentaporRazonSocial(DatosFiscales dtosFisc) throws Exception {
		try {
			DatosFiscales dtosFisc1=daoDatosFiscales.findDatosFiscalesByRazonSocial(dtosFisc);
			return dtosFisc1;
		}catch(Exception e) {
			throw e;
		}
	}

		

}
