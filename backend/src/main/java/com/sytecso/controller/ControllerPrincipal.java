package com.sytecso.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sytecso.exceptions.SytecsoException;
import com.sytecso.service.ServiceCuenta;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
@Controller
public class ControllerPrincipal extends SytecsoException {
	@Autowired private ServiceCuenta serviceCuenta;

	@Autowired	HttpSession sessionHttp;
	
	@RequestMapping(value = {"/",""}, method = RequestMethod.GET)
	public String defaultPage(ModelMap map,HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session!=null)
			return "redirect:/principal";
		return "redirect:/login";
	}
	
	@RequestMapping(value = { "/home" }, method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	/*@RequestMapping(value = { "/principal" }, method = RequestMethod.GET)
	public String principalFront(Model model,Authentication authentication) throws SQLException {
		int[] data = serviceCuenta.findTotalCountInDate();
		//Map<String,Float> fac = serviceFactura.findTotalCountInDate();
		model.addAttribute("ctaMonth1", data[0]);
		model.addAttribute("ctaMonth2", data[1]);
		model.addAttribute("ctaMonthDiff", data[2]);
		model.addAttribute("showGraphic", authentication.getAuthorities()!=null && authentication.getAuthorities().toString().contains("ROLE_USER"));
		return "principal";
	}*/

	@RequestMapping(value = { "/cuentasFront" }, method = RequestMethod.GET)
	public String cuentasFront() {
		return "cuentasFront";
	}

	@RequestMapping(value = { "/cuadrillasFront" }, method = RequestMethod.GET)
	public String productosFront() {
		return "cuadrillasFront";
	}
	@RequestMapping(value = { "/insumosFront"}, method = RequestMethod.GET)
	public String insumosFront() {
		return "insumosFront";
	}
	
	@RequestMapping(value = { "/tipoOrdenFront" }, method = RequestMethod.GET)
	public String tipoOrdenFront() {
		return "tipoOrdenFront";
	}
	

	@RequestMapping(value = "/accesodenegado", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
		model.addAttribute("error", "true");
		return "denegado";
	}
	
}