/**
 * 
 * Created-By: Sytecso
 * Date:       07/01/2019
 */
package com.sytecso.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sytecso.beans.RegistroBatch;
import com.sytecso.component.DTOFileError;
import com.sytecso.component.ProcesArchivo;
import com.sytecso.component.ResultadObtenido;
import com.sytecso.component.SytecsoLogger;
import com.sytecso.component.VOCuentasConstraint;
import com.sytecso.exceptions.SytecsoException;
import com.sytecso.service.ServiceCuenta;
import com.sytecso.service.ServiceRegistroBatch;

@Controller
@RequestMapping("/cargaIniArchivo")
public class ControllerCargArchivoCuenta extends SytecsoException{
	@Autowired private ServiceCuenta sc;
	@Autowired private ServiceRegistroBatch srb;

	@GetMapping("/cargainicialcta")
	public String uploadForm(Model model) {
		SytecsoLogger.info("LOG_MIK-> INICIO");
		return "cargainicialcta";
	}

	@SuppressWarnings({ "unchecked" })
	@PostMapping("/guardarchivo") 
	public String singleFileUpload(@RequestParam("file") MultipartFile file,Model modelView, HttpSession session) throws JsonProcessingException {
		SortedSet<String> miKEYSctarfc = new TreeSet<>();
		VOCuentasConstraint vocuentasconstraintBean = new VOCuentasConstraint();
		SytecsoLogger.info("LOG_MIK-> INICIO_CONTROLLER /guardarchivo");
		Map<String, List<DTOFileError>> erro = new HashMap<>();
		RegistroBatch rgb=new RegistroBatch();
		ObjectMapper mapper = new ObjectMapper();
		long idRegBatch=0;
		String nombreArchivo=file.getOriginalFilename();
		String ruta= System.getProperty("java.io.tmpdir");
		String tmpDirStr = ruta.endsWith("/tmp")?ruta.concat("/"):ruta;
		String rutArchivo = tmpDirStr+ nombreArchivo;
		SytecsoLogger.info("RUTA ARCHIVO "+ rutArchivo);
		
		Path path = null;
		if (file.isEmpty()) {
			modelView.addAttribute("respsatisfecha","Archivo Vac&iacute;o, &nbsp;Selecciona un archivo con Cuentas...");
			return "cargainicialcta";
		}
		try {
			rgb.setNombreArchivo(nombreArchivo);
			rgb.setTipoCarga("ARCHIVO_ERRONEO.");
			byte[] bytes = file.getBytes();
			path = Paths.get(rutArchivo);
			Files.write(path, bytes);
			idRegBatch=srb.registrarRegistroBatch(rgb);
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<?> ListaCuentaas = null;
		try {
			miKEYSctarfc=null;
			miKEYSctarfc=sc.obtenerCuentas();
			miKEYSctarfc.add("_CTA_|_RFC_");
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		SytecsoLogger.info("CUENTAS VALIDAS EN BD     ----->             "+miKEYSctarfc);
		try {
			ResultadObtenido<?> ro=ProcesArchivo.procesar(rutArchivo,idRegBatch,miKEYSctarfc);
			for(Object o: ro){
				if (o instanceof RegistroBatch) {
				    rgb=(RegistroBatch) o;
				    rgb.setNombreArchivo(nombreArchivo);
				    rgb.setTipoCarga("REG_Carga_Inicial_Cuentas_x_Archivo.");
				    rgb.setIdregistroBatch(idRegBatch);
				}else if(o instanceof List){
					ListaCuentaas=((List<?>) o);
				}else if(o instanceof HashMap<?, ?>)
					erro = (Map<String,List<DTOFileError>>)o;
			}
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		Iterator<?> iter = ListaCuentaas.iterator();
		List<DTOFileError> er = erro.get("errors");
		if (ListaCuentaas.size()<1 || !er.isEmpty()) {
			modelView.addAttribute("estatus", !er.isEmpty());
			modelView.addAttribute("errors", mapper.writeValueAsString(er));
			modelView.addAttribute("respsatisfecha",
					"ARCHIVO INV&Aacute;LIDO!!!&nbsp;&nbsp;Selecciona un archivo con Cuentas v&aacute;lidas y correcto LAYOUT...");
			return "cargainicialcta"; 
		}
		while (iter.hasNext()) {
			try {
				vocuentasconstraintBean=(VOCuentasConstraint) iter.next();
				sc.registrarCargaInicialCuentas(vocuentasconstraintBean);
			} catch (Exception e) {
				SytecsoLogger.error(e.getMessage(), e);
			}
		}
		try{
			srb.actualizarRegistroBatch(rgb);
		}catch (Exception e) {
			SytecsoLogger.error(e.getMessage(),e);
		}
		SytecsoLogger.info("LOG_MIK-> FIN Proceso  ControllerCargArchivoCuenta.");
		modelView.addAttribute( "respsatisfecha",
				"El Archivo [ " + rgb.getNombreArchivo()
				+ " ] se guardado satisfactoriamente!!! <BR>Tama&ntilde;o del archivo procesado [ " + file.getSize() + " bytes ] <BR>Cuentas Procesadas["+rgb.getRegistrosInsertados()+"] Rechazadas["+rgb.getRegistrosRechazados()+"]");
		return "cargainicialcta";
	}

}
