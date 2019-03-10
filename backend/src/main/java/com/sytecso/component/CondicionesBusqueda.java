package com.sytecso.component;

import com.sytecso.beans.Cuenta;

public class CondicionesBusqueda {
	public static  String generaCondiciones(Cuenta cta) {
		String condiciones="";
		
		if (!(cta.getNumCuenta()==null ||cta.getNumCuenta().equals(""))) {
			condiciones+="and  cta.numCuenta like '%"+cta.getNumCuenta()+"%' "; 
		}
		if (!(cta.getAliasCliente()==null ||cta.getAliasCliente().equals(""))) {
			condiciones+="and  cta.aliasCliente like '%"+cta.getAliasCliente()+"%' "; 
		}
		if (!(cta.getRegion()==null ||cta.getRegion().equals(""))) {
			condiciones+="and  cta.region like '%"+cta.getRegion()+"%' "; 
		}
		if (!(cta.getGerencia()==null ||cta.getGerencia().equals(""))) {
			condiciones+="and  cta.gerencia like '%"+cta.getGerencia()+"%' "; 
		}
		if (!(cta.getDepartamento()==null ||cta.getDepartamento().equals(""))) {
			condiciones+="and  cta.departamento like '%"+cta.getDepartamento()+"%' "; 
		}
		if (!(cta.getDatosFiscales().getRfc()==null||cta.getDatosFiscales().getRfc().equals(""))) {
			condiciones+="and  df.RFC like '%"+cta.getDatosFiscales().getRfc()+"%' "; 
		}
		if (!(cta.getDatosFiscales().getRazonSocial()==null ||cta.getDatosFiscales().getRazonSocial().equals(""))) {
			condiciones+="and  df.razonSocial like '%"+cta.getNumCuenta()+"%' "; 
		}
		if (!(cta.getDatosFiscales().getPais()==null ||cta.getDatosFiscales().getPais().equals(""))) {
			condiciones+="and  df.pais like '%"+cta.getDatosFiscales().getPais()+"%' "; 
		}
		if (!(cta.getDatosFiscales().getCodigoPostal()==null ||cta.getDatosFiscales().getCodigoPostal().equals(""))) {
			condiciones+="and  df.codigoPostal like '%"+cta.getDatosFiscales().getCodigoPostal()+"%' "; 
		}
		
		return condiciones;
	}

}
