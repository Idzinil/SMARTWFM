package com.sytecso.component;

import java.util.HashMap;
import java.util.Map;

import com.sytecso.beans.Cuenta;
import com.sytecso.beans.DatosFiscales;

public class UtileriaCuentas {
	private static final String USER_PROFILE="[ROLE_USER]";
	private static final String BILLING_PROFILE="[ROLE_BILLING]";
	private static final String SECCION_CUENTA="actCuenta";
	private static final String SECCION_BALANCE_CUENTA="balanceCuenta";
	private static final String SECCION_ESTATUS_CUENTA="estatusCuenta";
	private static final String SECCION_COMPRAS="compras";
	private UtileriaCuentas() {
		throw new IllegalArgumentException("Utility class");
	}
	public static Map<String,String> getOptionsSelectByUserRole(String userRole,String seccion){
		Map<String,String> roles = new HashMap<>();
		if(userRole.equals(USER_PROFILE)) {
			switch (seccion) {
			case SECCION_CUENTA:
				roles.put(SECCION_CUENTA, "Actualizar Cuenta");
				break;
			case SECCION_COMPRAS:
				roles.put(SECCION_COMPRAS, "Compras");
				break;
			case SECCION_BALANCE_CUENTA:
				roles.put(SECCION_BALANCE_CUENTA, "Balance de Cuentas");
				break;
			case SECCION_ESTATUS_CUENTA:
				roles.put(SECCION_ESTATUS_CUENTA, "Cambiar Estatus de la Cuenta");
				break;
			default:
				break;
			}
		}else if(userRole.equals(BILLING_PROFILE)){
			roles.put("mainBilling", "Billing");
		}
		return roles;
	}
	public static String getMenu(String menu) {
		switch (menu) {
			case SECCION_COMPRAS:
				return "menu4.jsp";
			case SECCION_CUENTA:
				return "menu2.jsp";
			case SECCION_BALANCE_CUENTA:
				return "menu3.jsp";
			case SECCION_ESTATUS_CUENTA:
				return "menu2.jsp";
			default:
				return "";
		}
	}
	public static Cuenta updateDatosCuenta(Cuenta cuenta,Cuenta dataAct) {
		cuenta.setAliasCliente(dataAct.getAliasCliente());
		cuenta.setRegion(dataAct.getRegion());
		cuenta.setDepartamento(dataAct.getDepartamento());
		cuenta.setEjecutivo(dataAct.getEjecutivo());
		return cuenta;
	}
	public static DatosFiscales updateDatosFiscales(DatosFiscales datosFiscales,DatosFiscales dataAct) {
		datosFiscales.setRfc(dataAct.getRfc());
		datosFiscales.setRazonSocial(dataAct.getRazonSocial());
		datosFiscales.setCalle(dataAct.getCalle());
		datosFiscales.setNumeroInt(dataAct.getNumeroInt());
		datosFiscales.setNumeroExt(dataAct.getNumeroExt());
		datosFiscales.setColonia(dataAct.getColonia());
		datosFiscales.setMunicipio(dataAct.getMunicipio());
		datosFiscales.setCiudad(dataAct.getCiudad());
		datosFiscales.setEstado(dataAct.getEstado());
		datosFiscales.setPais(dataAct.getPais());
		datosFiscales.setCodigoPostal(dataAct.getCodigoPostal());
		return datosFiscales;
	}
}
