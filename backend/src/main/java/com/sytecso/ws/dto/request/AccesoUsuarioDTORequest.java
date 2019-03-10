package com.sytecso.ws.dto.request;


import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;


public class AccesoUsuarioDTORequest {
	
	@NotNull(message="{msg.ws.acceso.usuario.userNull}")
	@NotEmpty(message="{msg.ws.acceso.usuario.userEmpty}")
	private String usuario;
	@NotNull(message="{msg.ws.acceso.usuario.passwordNull}")
	@NotEmpty(message="{msg.ws.acceso.usuario.passwordEmpty}")
	private String password;
	
	public String getUsuario() {
		return usuario;
	}
	public String getPassword() {
		return password;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	
	
}
