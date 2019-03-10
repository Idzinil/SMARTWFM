package com.sytecso.model;

import java.io.Serializable;

import javax.persistence.Column;

public class UsuariosAcceso implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2328142311084818382L;

	@Column(name="usuario")
	private String usuario;
	@Column(name="pwd")
	private String pwd;
	
	
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	
}
