package com.sytecso.controller;

import java.util.List;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sytecso.exceptions.SytecsoException;
import com.sytecso.service.ServiceCuadrilla;
import com.sytecso.service.ServiceCuenta;
import com.sytecso.beans.Cuadrilla;

@Controller
@MultipartConfig
public class ControllerCuadrilla extends SytecsoException {
	
	@Autowired ServiceCuadrilla serviceCuadrilla;
	@Autowired ServiceCuenta serviceCuenta;
	
	@RequestMapping(value = { "/obtenerCuadrillas" }, method = RequestMethod.GET)
	public String obtenerCuadrillas(Model model,SessionStatus status) {
		status.setComplete();

		List<Cuadrilla> lstCuadrilla = serviceCuadrilla.traerTotalCuadrillas();

		model.addAttribute("mensaje", "Aqui se muestran los productos.");
		model.addAttribute("cuadrillas", lstCuadrilla);
		model.addAttribute("cuadrilla", new Cuadrilla());

		return "cuadrillasForm";
	}

	
	/*@RequestMapping(value = { "/altaCuadrilla" }, method = RequestMethod.POST)
	public String altaDivisas(Model model, Cuadrilla cuadrilla,SessionStatus status,RedirectAttributes redirectAttributes) {
		
		if(!cuadrilla.getNumeroCuadrilla().isEmpty()||cuadrilla.getNumeroCuadrilla().equals(""))
		{ 
			if(cuadrilla.getCuenta().getNumCuenta().equals("")||cuadrilla.getCuenta().getNumCuenta().isEmpty()) {
				serviceCuadrilla.registrarCuadrilla(cuadrilla);
			}
			
			if(serviceCuenta.findCuentaByNumCuenta(cuadrilla.getCuenta().getNumCuenta())) {
				cuadrilla.setCuenta(serviceCuenta.obtenerCuentaPorNumeroCuenta(cuadrilla.getCuenta().getNumCuenta()));
				
				List<Cuadrilla> lstCuadillas = serviceCuadrilla.buscarCuadrillaByNumero(cuadrilla);
				 if (lstCuadillas.isEmpty()) {
						 serviceCuadrilla.registrarCuadrillaCuenta(cuadrilla);
						 }
			      }else {
			    	redirectAttributes.addFlashAttribute("statusnullCta", true);
			          }
		}else {
			redirectAttributes.addFlashAttribute("status", true);
		}
		
		return "redirect:/obtenerCuadrillas";
	}*/
}
