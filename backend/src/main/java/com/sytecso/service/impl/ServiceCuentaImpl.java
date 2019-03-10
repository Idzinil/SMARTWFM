/**
 * 
 * Created-By: Sytecso
 * Date:       06/03/2019
 */
package com.sytecso.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.SortedSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sytecso.beans.Cuenta;
import com.sytecso.beans.EventoSytecso;
import com.sytecso.component.VOCuentasConstraint;
import com.sytecso.dao.DAOCuenta;
import com.sytecso.dto.CuentaDTO;
import com.sytecso.service.ServiceCuenta;
import com.sytecso.service.ServiceEventoSytecso;


@Service
public class ServiceCuentaImpl implements ServiceCuenta {
	@Autowired private DAOCuenta daoCuenta;
	@Autowired private ServiceEventoSytecso serviceEventoSytecso;
	
	@Override
	public long  registrarCuenta(Cuenta cta) throws Exception {
		long ctaKey= -1L;
		try {
			ctaKey =daoCuenta.registrarCuenta(cta);
			if(ctaKey>0) {
				EventoSytecso eventoSytecso = new EventoSytecso();
				eventoSytecso.setTipoEvento("ALTA CUENTA");
				eventoSytecso.setCuenta_idCuenta(ctaKey);
				serviceEventoSytecso.registrarEventoSytecso(eventoSytecso);
			}
		}catch(Exception e) {
			throw e;
		}
		return ctaKey;
	}
	
			
	@Override
	public Boolean findCuentaByNumCuenta(String numCuenta) {
		return daoCuenta.findCuentaByNumCuenta(numCuenta);
	}

	/**Este metodo obtiene el total de cuentas creadas en un mes y hace dos meses
	 * @return arreglo con los resultados de las cuenta
	 * 	indice 0: Cuentas creadas hace un mes
	 * 	indice 1: Cuentas creadas hace dos meses
	 * 	indice 2: La diferencia de cuentas creadas entre un mes y hace dos
	 * */
	
	
	@Override
	@SuppressWarnings("rawtypes")
	public SortedSet obtenerCuentas() throws Exception {
		try {
			return daoCuenta.obtenerCuentas();
		}catch(Exception e) {
			throw e;
		}
	}

	
	
	@Override
	@Transactional
	public String registrarCargaInicialCuentas(VOCuentasConstraint cta) throws Exception {
		try {
			return daoCuenta.registrarCargaInicialCuentas(cta);
		}catch(Exception e) {
			throw e;
		}
	}
	
	@Override
	public List<CuentaDTO> TraerClientesEmpresas() throws Exception {
		List<CuentaDTO> cuentasClientes =new ArrayList<CuentaDTO>();
		cuentasClientes=daoCuenta.buscaCuentasClientesEmpresas();
		return cuentasClientes;
	}
	
	



}
