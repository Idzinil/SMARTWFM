package com.sytecso.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sytecso.beans.Cuenta;
import com.sytecso.component.DTOFileError;
import com.sytecso.component.UtileriaCompruebaDatos;
import com.sytecso.exceptions.SytecsoException;
import com.sytecso.service.ServiceCargasBatch;
import com.sytecso.service.ServiceCuenta;
import com.sytecso.service.ServiceTipoOrden;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@MultipartConfig
public class ControllerTipoOrden<TipoOrden> extends SytecsoException {

	@Autowired ServiceTipoOrden serviceTipoOrden;
	@Autowired ServiceCuenta serviceCuenta;
	@Autowired ServiceCargasBatch serviceCargasBatch;

	@RequestMapping(value = { "/irbusqCtaOrden" }, method = RequestMethod.GET)
	public String irCtaOrden(Model model, SessionStatus status) {
		model.addAttribute("tipoOrden", new TipoOrden());
		status.setComplete();
		return "busquedaCtaOrden";
	}
	
	@RequestMapping(value = { "/buscarCtaTipoOrden" }, method = { RequestMethod.POST })
	public String buscarCtaTipoOrden(TipoOrden tipoOrden, ModelMap mp, SessionStatus status,
			RedirectAttributes redirectAttributes, HttpServletRequest httpServletRequest) throws Exception {

		List<TipoOrden> lstTipoOrden = serviceTipoOrden.findCuentasTipoOrdenes(tipoOrden);
		if (lstTipoOrden.isEmpty()) {
			redirectAttributes.addFlashAttribute("status", true);
			return "redirect:/irbusqCtaOrden";
		}
		mp.addAttribute("ctasTipoOrden", lstTipoOrden);

		return "cuentasTipoOrden";

	}
	
	/*@RequestMapping(value = { "/cuentaTipoForm" }, method = RequestMethod.GET)
	public ModelAndView formularioTipoForm(Model model,@RequestParam("cuenta") String numCuenta) {
		ModelAndView mv = new ModelAndView("tipoOrdenForm");
		TipoOrden tipoOrden  = new TipoOrden();
		tipoOrden.setCuenta(new Cuenta());
		
		tipoOrden.setCuenta(serviceCuenta.obtenerCuentaPorNumeroCuenta(numCuenta));
		model.addAttribute("tipoOrden", tipoOrden);
		mv.addObject("cuenta", numCuenta);
		mv.addObject("idCuenta", tipoOrden.getCuenta().getIdCuenta());
		
		return mv;
	}*/
	
	@RequestMapping(value = { "/altaTipoOrden" }, method = RequestMethod.POST)
	public String altaTipoOrden(Model model, TipoOrden tipoOrden,SessionStatus status,RedirectAttributes redirectAttributes,@RequestParam("cuenta") String numCuenta ) {
		
		TipoOrden tipoOrdenName = new TipoOrden();

		if(!tipoOrden.getNombreOrden().equals("")||tipoOrden.getNombreOrden().isEmpty()){
			
			tipoOrdenName = serviceTipoOrden.buscarTipoOrdenByNamebyCuenta(tipoOrden);
			tipoOrdenName.setNombreOrden(UtileriaCompruebaDatos.compruebaDataNulo(tipoOrdenName.getNombreOrden()));
			if (!tipoOrdenName.getNombreOrden().equals("")) {
				 	
				redirectAttributes.addFlashAttribute("statusExiste", true);
			}else {
				serviceTipoOrden.registrarTipoOrden(tipoOrden);
			}
		}else {
			redirectAttributes.addFlashAttribute("status", true);
		}
		
		return "redirect:/cuentaInsumoForm?cuenta="+numCuenta+"&idCuenta="+tipoOrden.getCuentaCliente_idCuenta();
	}
	
	
	/*---------------------------------------*/
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/upload", method=RequestMethod.POST)
    public String CargaTipoOrden(@RequestParam("file") MultipartFile file,
    		HttpServletRequest req,RedirectAttributes redirectAttributes) throws IOException {
        InputStream is = file.getInputStream();
        Map<String, List<?>> datas = serviceCargasBatch.builDataForTipoOrdenBatch(is);
        List<TipoOrden> TipoOrden = (List<TipoOrden>)datas.get("aceptados");
        List<DTOFileError> errors = (List<DTOFileError>)datas.get("rechazados");
        String url = errors.isEmpty()?"obtenerTipoOrden":"cargaTipoOrden";
        serviceTipoOrden.registrarTipoOrdenBatch((List<com.sytecso.model.TipoOrden>) TipoOrden);
        redirectAttributes.addFlashAttribute("msg","La carga de Tipo de Orden fue realizada");
        redirectAttributes.addFlashAttribute("rechazados", new ObjectMapper().writeValueAsString(errors));
        redirectAttributes.addFlashAttribute("status", !errors.isEmpty());
        return "redirect:/"+url;
    }
	/*--------------------------------------*/
	

}
