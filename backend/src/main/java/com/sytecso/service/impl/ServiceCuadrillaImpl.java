package com.sytecso.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sytecso.beans.Cuadrilla;
import com.sytecso.dao.DAOCuadrilla;
import com.sytecso.service.ServiceCuadrilla;

@Service
public class ServiceCuadrillaImpl implements ServiceCuadrilla{
	
	@Autowired private DAOCuadrilla daoCuadrilla;
	

	public List<Cuadrilla> traerTotalCuadrillas() {
			return daoCuadrilla.traerTotalCuadrillas();
	}


	@Override
	public List<Cuadrilla> buscarCuadrillaByNumero(Cuadrilla cuadrilla) {
		List<Map<String, Object>> data = daoCuadrilla.findCuadrillabyNumero(cuadrilla.getNumeroCuadrilla());
		List<Cuadrilla> lstCuadrillas = new ArrayList<>();
		Cuadrilla cuadri = null;
		for (Map<String, Object> map : data) {
			cuadri = new Cuadrilla();
			cuadrilla.setNumeroCuadrilla(String.valueOf(map.get("numeroCuadrilla")));
			cuadrilla.setPlacas(String.valueOf(map.get("placas")));
			
			lstCuadrillas.add(cuadri);
		}
		return lstCuadrillas;
}

	@Override
	public void registrarCuadrilla(Cuadrilla cuadrilla) {
		daoCuadrilla.registrarCuadrilla( cuadrilla);
		
	}

	@Override
	public void registrarCuadrillaCuenta(Cuadrilla cuadrilla) {
		daoCuadrilla.registrarCuadrillaCuenta( cuadrilla);
		
	}
	
	
	
//	@Override
//	public boolean updateCambioDivisaByIdDivisa(CambioDivisa cambioDivisa) {
//		try {
//			daoCambioDivisa.updateCambioDivisaByIdDivisa(cambioDivisa);
//				return true;
//				
//		} catch (Exception e) {
//			SmartBillingException.logClassAndMethodWithException(e);
//		}
//		return false;
//	}
//	
//	@Override
//	public CambioDivisa findCambioDivisaBynameDivisa(String nombreMoneda)  {
//		CambioDivisa cambioDiv = daoCambioDivisa.findCambioDivisaByname(nombreMoneda);
//		if(cambioDiv==null) {
//			throw new EmptyResultDataAccessException("La moneda: "+nombreMoneda+" no existe en el sistema",0);
//		}
//		return cambioDiv;
//	}
//	
}
