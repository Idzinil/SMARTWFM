package com.sytecso.ws.utils;

import com.sytecso.ws.dto.request.UsuarioRecesoDTORequest;

public class RestWsUtils {
	
	public static String validaUsuarioReceso(UsuarioRecesoDTORequest usuarioRecesoDTORequest) {
		if(usuarioRecesoDTORequest==null || (usuarioRecesoDTORequest!=null && (usuarioRecesoDTORequest.getHoraFin()==null || usuarioRecesoDTORequest.getHoraInicio()==null || usuarioRecesoDTORequest.getIdCuadrilla()==null || usuarioRecesoDTORequest.getNotasAdicionales()==null))) {
			return "Error";
		}
		return "Success";
	}
}
