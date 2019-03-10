package com.sytecso.component;

import com.sytecso.model.TipoOrden;

public class UtileriaTipoOrden {
	
	public static boolean camposValidos(TipoOrden tipoOrden) {
		boolean status = false;
		if(!tipoOrden.getNombreOrden().equals("")||tipoOrden.getNombreOrden().isEmpty()) {
			return status=true;
		}
			
		return status;
	}
}
