package com.sytecso.ws.dto.response;

public class AccesoUsuarioDTOResponse {
	private String idEmpleado;
	private String nombreCompletoLider;
	private String nombreCompletoAuxiliar;
	private String placas;
	private String idCuadrilla;
	
	public String getIdEmpleado() {
		return idEmpleado;
	}

	public String getNombreCompletoAuxiliar() {
		return nombreCompletoAuxiliar;
	}
	public String getPlacas() {
		return placas;
	}
	public String getIdCuadrilla() {
		return idCuadrilla;
	}
	public void setIdEmpleado(String idEmpleado) {
		this.idEmpleado = idEmpleado;
	}

	public void setNombreCompletoAuxiliar(String nombreCompletoAuxiliar) {
		this.nombreCompletoAuxiliar = nombreCompletoAuxiliar;
	}
	public void setPlacas(String placas) {
		this.placas = placas;
	}
	public void setIdCuadrilla(String idCuadrilla) {
		this.idCuadrilla = idCuadrilla;
	}

	public String getNombreCompletoLider() {
		return nombreCompletoLider;
	}

	public void setNombreCompletoLider(String nombreCompletoLider) {
		this.nombreCompletoLider = nombreCompletoLider;
	}
	
}
