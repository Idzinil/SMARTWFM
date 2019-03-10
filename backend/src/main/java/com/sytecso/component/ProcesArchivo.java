/**
 * 
 * Created-By: Sytecso
 * Date:       07/01/2019
 */
package com.sytecso.component;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.SortedSet;
import java.util.StringTokenizer;
import java.util.TreeSet;
import com.sytecso.beans.Cuenta;
import com.sytecso.beans.DatosFiscales;
import com.sytecso.beans.EventoSytecso;
import com.sytecso.beans.RegistroBatch;

public class ProcesArchivo {
	private ProcesArchivo() {
		throw new IllegalStateException("Utility class");
	}
	private static final String ENCABEZADO="*NUMCUENTA|REGION|*RFC|RAZONSOCIAL|ALIASCLIENTE|*CALLE|NUMEROEXT|NUMEROINT|*COLONIA|*CODIGOPOSTAL|MUNICIPIO|*CIUDAD|*ESTADO|*PAIS|*EJECUTIVO|IDSAP|SEGMENTO";
	public static ResultadObtenido<?> procesar(String rutArchivo, long idRegBatch, SortedSet<String> miKEYSctarfc) throws FileNotFoundException {
		Scanner scanner=null,dataScanner=null;
		Map<String, List<DTOFileError>> mapData = new HashMap<>();
		List<DTOFileError> errors = new ArrayList<>();
		int rechazados=0,procesados=0;
		SortedSet<String> miKEYSCta=new TreeSet<>();
		SortedSet<String> miKEYSrfc=new TreeSet<>();
		List<VOCuentasConstraint> cuentasconstraintLista=new ArrayList<>();
		boolean encabezado = true;
	    Iterator<String> it=miKEYSctarfc.iterator();StringTokenizer tokenizer;
	    while(it.hasNext()) {
	      tokenizer=new StringTokenizer(it.next(),"|");
	      String cta=tokenizer.nextToken();
	      String rfc=tokenizer.nextToken();
	      if(!miKEYSCta.contains(cta))
	    	  miKEYSCta.add(cta);
	      if(!miKEYSrfc.contains(rfc))
	    	  miKEYSrfc.add(rfc);
	    }
		try {
			scanner = new Scanner(new File(rutArchivo));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw e;
		}
		int fila=0;
		while (scanner.hasNextLine()) {
			fila+=1;
			if (encabezado) {
				String cadena = scanner.nextLine();
				encabezado = false;
				if (!ENCABEZADO.equals(cadena.toUpperCase()) || ENCABEZADO.length() != cadena.length()) {
					errors.add(new DTOFileError(0,"El encabezado es incorrecto"));
					break;
				}
			}
			dataScanner = new Scanner(scanner.nextLine().trim());
			if(!dataScanner.hasNextLine()) {
				errors.add(new DTOFileError(fila,"El archivo no puede tener saltos de linea en blanco"));
				break;
			}
			dataScanner.useDelimiter("[|]");
			Cuenta cuenta = new Cuenta();
			DatosFiscales datosfis = new DatosFiscales();
			EventoSytecso esb = new EventoSytecso();
			VOCuentasConstraint vocuentasconstraintBean = new VOCuentasConstraint();
			int index = 0; 
			boolean valida = true, dataNulo = true;
			String error = "";
			while (dataScanner.hasNext() && valida) {
				String data = dataScanner.next();
				switch (index) {
				case 0:
					if (!miKEYSCta.contains(data.toUpperCase())&&UtileriaValidaPatrones.tamanio(data,20,dataNulo)) {
						cuenta.setNumCuenta(data);
						miKEYSCta.add(data);
					} else {
						error = miKEYSCta.contains(data.toUpperCase())?"La CUENTA: ["+data+"] ya existe":"Dato no valido para CUENTA["+data+"]";
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				
				
				case 1:
					if (UtileriaValidaPatrones.tamanio(data,60)) {
						cuenta.setRegion(data);
					} else {
						error = "Dato no valido para Region["+data+"] en la CUENTA: ["+cuenta.getNumCuenta()+"]";
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				case 2:
					if (!miKEYSrfc.contains(data)&&UtileriaValidaPatrones.tamanio(data,45,dataNulo)) {					
						datosfis.setRfc(data);
						miKEYSrfc.add(data);
					} else {
						error = miKEYSrfc.contains(data.toUpperCase())?"EL RFC: ["+data+"] ya esta asigando a una cuenta":"Dato no valido para RFC["+data+"] en la cuenta["+cuenta.getNumCuenta()+"]";
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				case 3:
					if (UtileriaValidaPatrones.tamanio(data,1024)) {
						datosfis.setRazonSocial(data);
					} else {
						error = "Dato no valido para RazonSocial["+data+"] en la CUENTA: ["+cuenta.getNumCuenta()+"]";
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				case 4:
					if (UtileriaValidaPatrones.tamanio(data,60)) {
						cuenta.setAliasCliente(data);
					} else {
						error = "Dato no valido para AliasCliente["+data+"] en la CUENTA: ["+cuenta.getNumCuenta()+"]"; 
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				case 5:
					if (UtileriaValidaPatrones.tamanio(data,80,dataNulo)) {
						datosfis.setCalle(data);
					} else {
						error = "Dato no valido para Calle["+data+"] en la CUENTA: ["+cuenta.getNumCuenta()+"]";
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				case 6:
					if (UtileriaValidaPatrones.tamanio(data,10)) {
						datosfis.setNumeroExt(data);
					} else {
						error = "Dato no valido para NumeroExt["+data+"] en la CUENTA: ["+cuenta.getNumCuenta()+"]";
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				case 7:
					if (UtileriaValidaPatrones.tamanio(data,10)) {
						datosfis.setNumeroInt(data);
					} else {
						error="Dato no valido para NumeroInt["+data+"] en la CUENTA: ["+cuenta.getNumCuenta()+"]";
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				case 8:
					if (UtileriaValidaPatrones.tamanio(data,128,dataNulo)) {
						datosfis.setColonia(data);
					} else {
						error= "Dato no valido para Colonia["+data+"] en la CUENTA: ["+cuenta.getNumCuenta()+"]";
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				case 9:
					if (UtileriaValidaPatrones.tamanio(data,10,dataNulo)) {
						datosfis.setCodigoPostal(data);
					} else {
						error = "Dato no valido para CodigoPostal["+data+"] en la CUENTA: ["+cuenta.getNumCuenta()+"]";
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				case 10:
					if (UtileriaValidaPatrones.tamanio(data,80)) {
						datosfis.setMunicipio(data);
					} else {
						error="Dato no valido para Municipio["+data+"] en la CUENTA: ["+cuenta.getNumCuenta()+"]";
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				case 11:
					if (UtileriaValidaPatrones.tamanio(data,80,dataNulo)) {
						datosfis.setCiudad(data);
					} else {
						error = "Dato no valido para Ciudad["+data+"] en la CUENTA: ["+cuenta.getNumCuenta()+"]";
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				case 12:
					if (UtileriaValidaPatrones.tamanio(data,45,dataNulo)) {
						datosfis.setEstado(data);
					} else {
						error = "Dato no valido para Estado["+data+"] en la CUENTA: ["+cuenta.getNumCuenta()+"]";
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				case 13:
					if (UtileriaValidaPatrones.tamanio(data,45,dataNulo)) {
						datosfis.setPais(data);
					} else {
						error = "Dato no valido para Pais["+data+"] en la CUENTA: ["+cuenta.getNumCuenta()+"]";
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				case 14:
					if (UtileriaValidaPatrones.tamanio(data,128,dataNulo)) {
						cuenta.setEjecutivo(data);
					} else {
						error = "Dato no valido para Ejecutivo["+data+"] en la CUENTA: ["+cuenta.getNumCuenta()+"]";
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				
				case 15:
					if (UtileriaValidaPatrones.tamanio(data,20)) {
						cuenta.setIdSAP(data);
					} else {
						error = "Dato no valido para IdSAP["+data+"] en la CUENTA: ["+cuenta.getNumCuenta()+"]";
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				case 16:
					if (UtileriaValidaPatrones.isNumeric(data)&&UtileriaValidaPatrones.isSegmentoCliente(data)) {
						if (Integer.parseInt(data)==10) {
							cuenta.setSegmentoCliente(2);
						}
						if (Integer.parseInt(data)==11) {
							cuenta.setSegmentoCliente(3);
						}
						
					} else {
						error = "Dato no valido para Segmento["+data+"] en la CUENTA: ["+cuenta.getNumCuenta()+"]";
						SytecsoLogger.info(error);
						valida = false;
					}
					break;
				default:
					SytecsoLogger.info("Este es un campo INVALIDO no se ingresara el registro: [" + data + "]    de la cuenta["+cuenta.getNumCuenta()+"]");
					valida = false;
					break;
				}
				index++;
			}
			if (valida&&!miKEYSctarfc.contains(cuenta.getNumCuenta().toUpperCase()+"|"+datosfis.getRfc().toUpperCase())) {
				esb.setRegistroBatch_idregistroBatch(idRegBatch);
				esb.setTipoEvento("EVENTO_Carga_Inicial_Cuentas por Archivo.");
				esb.setEvento_idEvento(0L);
				cuenta.setDatosFiscales(datosfis);
				vocuentasconstraintBean.setCuenta(cuenta);
				vocuentasconstraintBean.setEventosytecso(esb);
				cuentasconstraintLista.add(vocuentasconstraintBean);
				miKEYSctarfc.add(""+cuenta.getNumCuenta().toUpperCase()+"|"+datosfis.getRfc().toUpperCase());
				++procesados;
			} else {
				errors.add(new DTOFileError(fila,error));
				++rechazados;
			}
		}
		RegistroBatch rgb = new RegistroBatch();
		rgb.setRegistrosInsertados(procesados);
		rgb.setRegistrosRechazados(rechazados);
		ResultadObtenido<Object> ro = new ResultadObtenido<>();
		ro.add(rgb);
		ro.add(cuentasconstraintLista);
		mapData.put("errors", errors);
		ro.add(mapData);
		scanner.close();
		return ro;
	}
}
