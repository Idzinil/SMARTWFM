package com.sytecso.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sytecso.beans.Cuenta;
import com.sytecso.beans.InsumosCte;
import com.sytecso.beans.TipoOrden;
import com.sytecso.component.DTOFileError;
import com.sytecso.service.ServiceCargasBatch;
import com.sytecso.service.ServiceCuenta;

@Service
public class ServiceCargasBatchImpl implements ServiceCargasBatch{
	@Autowired private ServiceCuenta serviceCuenta;
	@Override
	public Map<String, List<?>> builDataForTipoOrdenBatch(InputStream is) throws IOException {
		List<TipoOrden> result = new ArrayList<>();     //Revisar beans
        Map<String, List<?>> datas = new HashMap<>();
        List<DTOFileError> errors = new ArrayList<>();
		String line;
		BufferedReader br = new BufferedReader(new InputStreamReader(is));
        int fila =1;
        	while ((line = br.readLine()) != null) {
                String[] data = line.split("\\|");
                try {
         
                	result.add(procesaTipoOrden(data, fila));
    			} catch (Exception e) {
    				errors.add(new DTOFileError(fila, e.getMessage()));
    			}
                 fila+=1;
            }
        datas.put("aceptado", result);
        datas.put("rechazado", errors);
        return datas;
	}

	@Override
	public TipoOrden procesaTipoOrden(String[] data, int index) {
		TipoOrden orden = new TipoOrden();
		orden.setTipoOrden(data[0]);
		
		Cuenta cta = new Cuenta();
      	cta= serviceCuenta.obtenerCuentaPorNumeroCuenta(data[6]);
      	if(!cta.getNumCuenta().isEmpty()) {
      		orden.setCuentaCliente_idCuenta(cta.getIdCuenta());
      	}else {
      		throw new IllegalArgumentException("La Cuenta "+ index+" es invalida" ); 
      	} 
		
		orden.setDescipcionOrden(data[2]);
		orden.setNombreOrden(data[3]);
		orden.setTiempoOrdenProm(data[4]);
     	orden.setMontoOrden(new BigDecimal(data[5]));
     	orden.setDivisa(data[6]);
     	orden.setCuenta(new Cuenta(data[7]));     	
     	return orden;
	}

	@Override
	public InsumosCte procesaInsumosCte(String[] data, int index) {
		InsumosCte insumo = new InsumosCte();
		insumo.setIdentificadorSAP(data[0]);
     	insumo.setNombreInsumo(data[1]); 
     	insumo.setDescripcionInsumo(data[2]);
     	insumo.setClaveInsumo(data[3]);
     	insumo.setTotalInsumo(new BigDecimal(data[4]));
     	
     	if(data[5].equalsIgnoreCase("MTO")||data[5].equalsIgnoreCase("PZA")) 
     		{
     		insumo.setUnidadMedidaInsumo(data[5]);
     		}
     	else 
     	{
         	throw new IllegalArgumentException("La unidad de medida "+ index+" es invalida, valores admitidos metro, pieza" );     	
     	}
     	
     	Cuenta cta = new Cuenta();
      	cta= serviceCuenta.obtenerCuentaPorNumeroCuenta(data[6]);
      	if(!cta.getNumCuenta().isEmpty()) {
      		insumo.setCuentaCliente_idCuenta(cta.getIdCuenta());
      	}else {
      		throw new IllegalArgumentException("La Cuenta "+ index+" es invalida" ); 
      	} 
      	
      	insumo.setCuenta(new Cuenta(data[7]));
     	return insumo;
	}

	@Override
	public Map<String, List<?>> builDataForInsertInsumosCteBatch(InputStream is) throws IOException {
		List<InsumosCte> result = new ArrayList<>();     //Revisar beans
        Map<String, List<?>> datas = new HashMap<>();
        List<DTOFileError> errors = new ArrayList<>();
		String line;
		BufferedReader br = new BufferedReader(new InputStreamReader(is));
        int fila =1;
        	while ((line = br.readLine()) != null) {
                String[] data = line.split("\\|");
                try {
         
                	result.add(procesaInsumosCte(data, fila));
    			} catch (Exception e) {
    				errors.add(new DTOFileError(fila, e.getMessage()));
    			}
                 fila+=1;
            }
        datas.put("aceptado", result);
        datas.put("rechazado", errors);
        return datas;
	}

}
