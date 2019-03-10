package com.sytecso.dao;

import java.util.List;
import java.util.Map;

import com.sytecso.beans.Cuadrilla;

public interface  DAOCuadrilla {
	
	public List<Cuadrilla> traerTotalCuadrillas();
	List<Map<String, Object>> findCuadrillabyNumero(String numeroCuadrilla);
	public long registrarCuadrilla(Cuadrilla cuadrilla);
	public long registrarCuadrillaCuenta(Cuadrilla cuadrilla);
//	public boolean updateCambioDivisaByIdDivisa(CambioDivisa cambioDivisa);
//	public CambioDivisa findCambioDivisaByname(String NombreMoneda) ;
	

	

}
