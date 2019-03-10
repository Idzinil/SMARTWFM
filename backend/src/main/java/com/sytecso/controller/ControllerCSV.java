package com.sytecso.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.sytecso.beans.Cuenta;

@Controller
public class ControllerCSV {

//	@Autowired private ServiceFactura serviceFactura;
//	@Autowired private ServiceDocumento serviceDocumento; 

	@RequestMapping(value="/viewCSV")
	public ModelAndView viewCSV(HttpServletResponse response,HttpServletRequest request,
			@SessionAttribute(name="dataFact") List<Cuenta> cuentas) {
		//List<ReporteFacturacionMRR> reportes = dataReporteFactMRR(cuentas);
		String[] header = { "Ot", "usuarioFinal", "cantidad", "capacidad",
				"familia", "periodo", "precioUnitario","ieps",
				"iva","montoTotal","grupoFactura","razonSocial","aliasCliente","grupoServicio",
				"fechaIngreso","fechaActivacion","fechaVigenciaReal","compromiso","responsable",
				"region","vigenciaRestante","tipoServicio","instalacion","idClienteUli","leyendaFacturacion",
				"mesFacturacion","callePuntaA","numeroPuntaA","pisoPuntaA","interiorPuntaA","coloniaPuntaA","delegacionPuntaA",
				"ciudadPuntaA","estadoPuntaA","callePuntaB","numeroPuntaB","pisoPuntaB","interiorPuntaB","coloniaPuntaB",
				"delegacionPuntaB","ciudadPuntaB"};
		ModelAndView model = new ModelAndView("ViewCSV");
		//model.addObject("csvData", reportes);
		model.addObject("csvHeader", header);

		return model;
	}	
	
//	@RequestMapping("/viewExcel")
//	public ModelAndView viewExcel(DTOFacturacion dtoFacturacion,HttpServletResponse response,HttpServletRequest request,HttpSession httpSession,RedirectAttributes redirectAttributes) {
//		DTOFacturacion dtoFacturacion2= UtileriaBilling.cmpDaFacturacion(dtoFacturacion);
//		List<ExcelDTO> excel  = serviceFactura.findFacturaByFechaInicioAndFechaFinAndCiclo(dtoFacturacion2.getFecha(), Integer.parseInt(dtoFacturacion2.getCiclo()));
//		if(!excel.isEmpty()) {
//			ModelAndView model = new ModelAndView("excelView");
//			String[] header = { "idfactura", "folioFactura", "clasePedido", "orgVentas",
//					"canalDistribucion", "sector", "oficinaVentas","solicitante","noPedidoCliente",
//					"viasDePago","motivoDePedido","fechaEntradaVigor","reglaCalcularEntradaVigor",
//					"fechaExpiraContrato",
//					"condicionExpedicion","monedaDoc","fechaPrecio","utlizacion","zonaVentas",
//					"material","cantidadPedido","tipoPosicion","claseCondicion","importeCondicion",
//					"elementoPEP",
//					"CEBE","claveProdServicio","metodoPago","usoCFDI","notaCabecera1","notaAlPie",
//					"cuentaBancaria",
//					"IVA","IEPS","cliente"};
//
//			model.addObject("csvData", excel);
//			model.addObject("csvHeader", header);
//			serviceDocumento.registrarDocumento(excel);
//			return model;
//		}
//		redirectAttributes.addFlashAttribute("status", true);
//		return new ModelAndView("redirect:/invoicing");
//	}
//	
//	private List<ReporteFacturacionMRR> dataReporteFactMRR(List<Cuenta> cuentas){
//		List<Compra> compras = new ArrayList<>();
//		
//		for (Cuenta cuenta : cuentas) {
//			if(cuenta.getFacThisAccount().equals("YES")) {
//				List<Compra> cmps = cuenta.getUnidadFacturacion().getCompras();
//				for (Compra compra : cmps) {
//					if(compra.getFacturar()) {
//						compra.setCuenta(cuenta);
//						compra.setUnidadFacturacion(cuenta.getUnidadFacturacion());
//						compras.add(compra);
//					}
//				}
//			}
//		}
//		return UtileriaReporteFacturacion.buildReporteFacturacion(compras);
//	} 

	
}