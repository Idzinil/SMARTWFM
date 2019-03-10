package com.sytecso.service;

import java.util.List;

import com.sytecso.beans.Cuadrilla;


public interface ServiceCuadrilla {
	
	public List<Cuadrilla> traerTotalCuadrillas();
	public List<Cuadrilla> buscarCuadrillaByNumero(Cuadrilla cuadrilla);
	public void registrarCuadrilla(Cuadrilla cuadrilla);
	public void registrarCuadrillaCuenta(Cuadrilla cuadrilla);
//	public boolean updateCambioDivisaByIdDivisa(CambioDivisa cambioDivisa);
//	public CambioDivisa findCambioDivisaBynameDivisa(String nombreMoneda) ;
	

	

}
