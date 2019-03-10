package com.sytecso.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sytecso.captions.CuentaClienteCaption;
import com.sytecso.captions.OrdenCaption;
import com.sytecso.captions.TipoOrdenCaption;
import com.sytecso.model.DatosInstalacion;
import com.sytecso.model.DatosUsuarioFinal;
import com.sytecso.model.DireccionInstalacion;
import com.sytecso.model.Orden;
import com.sytecso.model.Telefono;
import com.sytecso.model.TipoOrden;
import com.sytecso.service.ServiceCuentaCliente;
import com.sytecso.service.ServiceOrdenes;
import com.sytecso.service.ServiceTipoOrdenes;
import com.sytecso.ws.dto.request.OrdenServicioDTORequest;
import com.sytecso.ws.dto.response.OrdenServicioDTOResponse;


@Controller
@RequestMapping(path="/ordenes/")
public class ControllerOrdenes {
	@Autowired private ServiceCuentaCliente serviceCuentaCliente;
	@Autowired private ServiceTipoOrdenes serviceTipoOrdenes;
	@Autowired private ServiceOrdenes serviceOrdenes;
	@GetMapping(value = "/clientes")
	public ResponseEntity<List<CuentaClienteCaption>> clientes(){
		List<CuentaClienteCaption> clientes = serviceCuentaCliente.getAllCuentaCliente();
		if(clientes.isEmpty())
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		return new ResponseEntity<>(clientes,HttpStatus.OK);
	}
	
	@PostMapping(value = "/tipos-ordenes")
	public ResponseEntity<List<TipoOrdenCaption>> ordenes(@RequestParam(name="cuenta") String cuenta){
		List<TipoOrdenCaption> tiposOrdenes = serviceTipoOrdenes.findTipoOrdenesByNumeroCliente(cuenta);
		if(tiposOrdenes.isEmpty())
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		return new ResponseEntity<>(tiposOrdenes,HttpStatus.OK);
	}
	
	
	@PostMapping(path="/ordenServicio")
	public ResponseEntity<OrdenServicioDTOResponse> ordenSerivicio(@Valid @RequestBody OrdenServicioDTORequest ordenServicioDTORequest) {
		OrdenServicioDTOResponse ordenServicioDTOResponse = new OrdenServicioDTOResponse();
		return new ResponseEntity<>(ordenServicioDTOResponse,HttpStatus.ACCEPTED);
		
	}
	
	@PostMapping(path="/alta-orden-servicio")
	public ResponseEntity<OrdenCaption> altaOrdenSerivicio() {
		OrdenCaption orden = serviceOrdenes.findOrdenById(new BigDecimal(1));
//		sessionFactory.createQuery("");
//		sessionFactory.
//		TipoOrden tipoOrden = new TipoOrden();
//		tipoOrden.setIdOrden(new BigDecimal(1));
//		Orden orden = new Orden();
//		orden.setDescripcion("MALO");
//		orden.setFechaFin("2019-12-12");
//		orden.setTiempoTotalOrden(2);
//		orden.setEstatus(1);
//		orden.setTipoOrden(tipoOrden);
//		
//		DatosUsuarioFinal datosUsuarioFinal = new DatosUsuarioFinal();
//		datosUsuarioFinal.setEstatus("AC");
//		datosUsuarioFinal.setNumeroCuenta("12345");
//		datosUsuarioFinal.setOrden(orden);
//		
//		Telefono telefono = new Telefono();
//		telefono.setTelefono("55-91-92-11-72");
//		telefono.setDatosUsuarioFinal(datosUsuarioFinal);
//		
//		DireccionInstalacion direccionInstalacion = new DireccionInstalacion();
//		direccionInstalacion.setEstado("MEXICO");
//		direccionInstalacion.setDatosUsuarioFinal(datosUsuarioFinal);
//		
//		DatosInstalacion datosInstalacion = new DatosInstalacion();
//		datosInstalacion.setCluster("SIN");
//		datosInstalacion.setDatosUsuarioFinal(datosUsuarioFinal);
//		
//		
//		datosUsuarioFinal.setDatosInstalacion(datosInstalacion);
//		datosUsuarioFinal.setDireccionInstalacion(direccionInstalacion);
//		datosUsuarioFinal.setTelefono(telefono);
//		orden.setDatosUsuarioFinal(datosUsuarioFinal);
//		
//		serviceOrdenes.save(orden);
//		OrdenServicioDTOResponse ordenServicioDTOResponse = new OrdenServicioDTOResponse();
		return new ResponseEntity<>(orden,HttpStatus.OK);		
	}

}
