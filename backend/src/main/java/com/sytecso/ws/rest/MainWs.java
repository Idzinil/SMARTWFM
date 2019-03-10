package com.sytecso.ws.rest;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sytecso.component.SytecsoLogger;
import com.sytecso.service.ServiceUploadImage;
import com.sytecso.ws.dto.request.EvidenciaAdjuntaDTORequest;
import com.sytecso.ws.dto.request.AccesoUsuarioDTORequest;
import com.sytecso.ws.dto.request.OrdenEstatusDTORequest;
import com.sytecso.ws.dto.request.OrdenInsumoClienteDTORequest;
import com.sytecso.ws.dto.request.OrdenServicioDTORequest;
import com.sytecso.ws.dto.request.UsuarioRecesoDTORequest;
import com.sytecso.ws.dto.response.EvidenciaAdjuntaDTOResponse;
import com.sytecso.ws.dto.response.InsumosOrdenDTOResponse;
import com.sytecso.ws.dto.response.AccesoUsuarioDTOResponse;
import com.sytecso.ws.dto.response.OrdenEstatusDTOResponse;
import com.sytecso.ws.dto.response.OrdenInsumoClienteDTOResponse;
import com.sytecso.ws.dto.response.OrdenServicioDTOResponse;
import com.sytecso.ws.dto.response.UsuarioRecesoDTOResponse;
import com.sytecso.ws.utils.RestWsUtils;

@RestController
@RequestMapping(path="/ws/",produces="application/json")
public class MainWs {
	@Autowired private ServiceUploadImage serviceUploadImage;
	
	@PostMapping(path="usuarioAcceso")
	public ResponseEntity<AccesoUsuarioDTOResponse> usuarioAcceso(@Valid @RequestBody AccesoUsuarioDTORequest loginDTO){
		AccesoUsuarioDTOResponse loginDtoResponse = new AccesoUsuarioDTOResponse();
		loginDtoResponse.setIdEmpleado(UUID.randomUUID().toString());
		loginDtoResponse.setNombreCompletoLider("Juan Manuel Alvarez");
		loginDtoResponse.setNombreCompletoAuxiliar("Manuel Roldan Martinez");
		loginDtoResponse.setPlacas(UUID.randomUUID().toString());
		loginDtoResponse.setIdCuadrilla(UUID.randomUUID().toString());
		SytecsoLogger.info("CONSULTADO WS LOGIN");
		return new ResponseEntity<>(loginDtoResponse,HttpStatus.FOUND);
	}
	
	@PostMapping(path="usuarioReceso")
	public ResponseEntity<UsuarioRecesoDTOResponse> usuarioReceso(@Valid @RequestBody UsuarioRecesoDTORequest usuarioRecesoDTORequest) {
		UsuarioRecesoDTOResponse usuarioRecesoDTOResponse = new UsuarioRecesoDTOResponse();
		usuarioRecesoDTOResponse.setIdCuadrilla(UUID.randomUUID().toString());
		usuarioRecesoDTOResponse.setEstatus(RestWsUtils.validaUsuarioReceso(usuarioRecesoDTORequest));
		if(usuarioRecesoDTOResponse.getEstatus().equals("Error"))
			return new ResponseEntity<>(usuarioRecesoDTOResponse,HttpStatus.BAD_REQUEST);
		return new ResponseEntity<>(usuarioRecesoDTOResponse,HttpStatus.OK);
		
	}
	
	/**
	 * TODO agregar validacion para el campo accion del bean EvidenciaAdjuntaDTORequest, posibles valores Insertar,Actualizar
	 * Borrar
	 * */
	@PostMapping(path="evidenciaAdjunta")
	public ResponseEntity<EvidenciaAdjuntaDTOResponse> evidenciaAjdunta(@Valid @RequestBody EvidenciaAdjuntaDTORequest evidenciaAdjuntaDTORequest) {
		EvidenciaAdjuntaDTOResponse evidenciaAdjuntaDTOResponse = new EvidenciaAdjuntaDTOResponse();
		evidenciaAdjuntaDTOResponse.setIdOrden(UUID.randomUUID().toString());
		evidenciaAdjuntaDTOResponse.setStatus(evidenciaAdjuntaDTORequest.getAccion().equals("Insertar")?"Success":"Fail");
		return new ResponseEntity<>(evidenciaAdjuntaDTOResponse,HttpStatus.OK);
	}
	@PostMapping(path="ordenServicio")
	public ResponseEntity<OrdenServicioDTOResponse> ordenSerivicio(@Valid @RequestBody OrdenServicioDTORequest ordenServicioDTORequest) {
		OrdenServicioDTOResponse ordenServicioDTOResponse = new OrdenServicioDTOResponse();
		ordenServicioDTOResponse.setIdCuadrilla(UUID.randomUUID().toString());
		ordenServicioDTOResponse.setFolio(UUID.randomUUID().toString());
		ordenServicioDTOResponse.setIdOrden(UUID.randomUUID().toString());
		ordenServicioDTOResponse.setNumeroCuentaCliente("PEDRO");
		ordenServicioDTOResponse.setTurnoAgendado("Vespertino");
		ordenServicioDTOResponse.setFechaAgendamiento(new Date());
		ordenServicioDTOResponse.setCanalVenta("1");
		ordenServicioDTOResponse.setOportunidad("5 S");
		ordenServicioDTOResponse.setCotizacion("Juan Perez");
		ordenServicioDTOResponse.setNombreCuenta("TACX");
		ordenServicioDTOResponse.setTipoCuenta("PREMIUM");
		ordenServicioDTOResponse.setTelefonoMovil("55-12-56-78-35");
		ordenServicioDTOResponse.setTelefonoFijo("55-12-56-78-99");
		ordenServicioDTOResponse.setFechaInicioOrden(new Date());
		ordenServicioDTOResponse.setCalle("GAM");
		ordenServicioDTOResponse.setTipoOrden("ML");
		ordenServicioDTOResponse.setNumeroInterior("123");
		ordenServicioDTOResponse.setNumeroExterior("S/N");
		ordenServicioDTOResponse.setColonia("GAM");
		ordenServicioDTOResponse.setDelegacionMunicipio("GAM");
		ordenServicioDTOResponse.setCodigoPostal("90345");
		ordenServicioDTOResponse.setReferencias("Sin Referencia");
		ordenServicioDTOResponse.setEstado("MEXICO");
		ordenServicioDTOResponse.setCiudad("CDMX");
		ordenServicioDTOResponse.setLatitud(UUID.randomUUID().toString());
		ordenServicioDTOResponse.setLongitud(UUID.randomUUID().toString());
		ordenServicioDTOResponse.setPlaza("Plaza 2");
		ordenServicioDTOResponse.setCluster("SMEP");
		ordenServicioDTOResponse.setEstatus(1);
		InsumosOrdenDTOResponse insumosOrdenDTOResponse = new InsumosOrdenDTOResponse();
		insumosOrdenDTOResponse.setIdInsumo(UUID.randomUUID().toString());
		insumosOrdenDTOResponse.setUnidadMedida(UUID.randomUUID().toString());
		insumosOrdenDTOResponse.setNombreInsumo("Cable");
		insumosOrdenDTOResponse.setIdCliente("1983");
		insumosOrdenDTOResponse.setIdClienteAsociado("108jus");
		List<InsumosOrdenDTOResponse> insumos = new ArrayList<>();
		insumos.add(insumosOrdenDTOResponse);
		ordenServicioDTOResponse.setInsumosOrden(insumos);
		ordenServicioDTOResponse.setCantidadAsociada(new BigDecimal(123));
		return new ResponseEntity<>(ordenServicioDTOResponse,HttpStatus.ACCEPTED);
		
	}

	/*TODO TERMINAR ESTE SERVICE PAGINA 15**/
	@PostMapping(path="ordenEstatus")
	public ResponseEntity<OrdenEstatusDTOResponse> ordenEstatus(@Valid @RequestBody OrdenEstatusDTORequest ordenEstatusDTORequest){
		OrdenEstatusDTOResponse ordenEstatusDTOResponse = new OrdenEstatusDTOResponse();
		ordenEstatusDTOResponse.setIdOrden(UUID.randomUUID().toString());
		ordenEstatusDTOResponse.setStatus("SUCCESS");
		return new ResponseEntity<>(ordenEstatusDTOResponse,HttpStatus.ACCEPTED);
	}
	
	@PutMapping(path="ordenInsumoCliente")
	public ResponseEntity<OrdenInsumoClienteDTOResponse> ordenInsumoCliente(@Valid @RequestBody OrdenInsumoClienteDTORequest ordenInsumoClienteDTORequest){
		OrdenInsumoClienteDTOResponse ordenInsumoClienteDTOResponse = new OrdenInsumoClienteDTOResponse();
		ordenInsumoClienteDTOResponse.setCantidadAsociada(new BigDecimal(12));
		ordenInsumoClienteDTOResponse.setIdClienteAsociado(UUID.randomUUID().toString());
		ordenInsumoClienteDTOResponse.setIdInsumo(UUID.randomUUID().toString());
		ordenInsumoClienteDTOResponse.setNombreInsumo("Cable");
		ordenInsumoClienteDTOResponse.setUnidadMedida("mts");
		return new ResponseEntity<>(ordenInsumoClienteDTOResponse, HttpStatus.ACCEPTED);
	}
	
	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
	public String formulario(@RequestParam("file") MultipartFile file) {
		serviceUploadImage.uploadImage(file);
		return "upload";
	}
}
