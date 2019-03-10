package com.sytecso.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sytecso.exceptions.SytecsoException;
import com.sytecso.beans.Cuenta;
import com.sytecso.beans.EventoSytecso;
import com.sytecso.component.SytecsoLogger;
import com.sytecso.component.UtileriaCuentas;
import com.sytecso.service.ServiceCuenta;
import com.sytecso.service.ServiceDatosFiscales;
import com.sytecso.service.ServiceEventoSytecso;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class ControllerCuenta extends SytecsoException {
	
	@Autowired	private ServiceCuenta sc;
	@Autowired	private ServiceDatosFiscales sdf;
	@Autowired  private ServiceEventoSytecso serviceEventoSytecso; 
	
	
	@RequestMapping("/irFormulario")
	public String irFormulario(Model model) {
		if(!model.containsAttribute("cuenta")) {
			model.addAttribute("cuenta",new Cuenta());
			return "formularioCuenta";
		}	
		return "formularioCuenta";
	}
		
	
	@RequestMapping( value ="/insertaDatosCta", method= {RequestMethod.POST})
	public String regCta(Cuenta cta, ModelMap mp,RedirectAttributes redirectAttributes) {
		long ctaKey =-1L;
		try {
			boolean sCuenta =!sc.findCuentaByNumCuenta(cta.getNumCuenta());
			boolean sDatos=!(sdf.findDatosFiscalesByRfc(cta.getDatosFiscales().getRfc())>0);
			if(sCuenta && sDatos) {
				ctaKey=sc.registrarCuenta(cta);
				cta.getDatosFiscales().setCuenta_idCuenta(ctaKey);
				sdf.regAccountUniFisData(cta);
				mp.addAttribute("ModelCta",cta.getNumCuenta());
			}else {
				redirectAttributes.addFlashAttribute("estatus",true);
				redirectAttributes.addFlashAttribute("message", "La cuenta ingresada y el RFC ingresado, ya existen en otra cuenta");
				redirectAttributes.addFlashAttribute("cuenta",cta);
				return "redirect:/irFormulario";
			}
		}catch(Exception e){
			SytecsoLogger.error("ERROR en ControllerCuenta.regCta", e);
			SytecsoException.logClassAndMethodWithException(e);
		}
		
		return "Registrada";
	}
	
	@GetMapping("/irBuscarCta")
	public String irFormularioBuscarCta(Model model,@RequestParam("seccion") String seccion,HttpServletRequest request) {
			HttpSession session = request.getSession();
			String sec = request.getParameter("seccion");
			String menu = UtileriaCuentas.getMenu(sec);
			session.setAttribute("seccionLoad", sec);
			model.addAttribute("findAcct");
			model.addAttribute("cuenta", new Cuenta());
			model.addAttribute("menu", menu);	
			return "formularioBuscarCuenta";
	}
	@RequestMapping(value="/foundAcct", method= RequestMethod.GET)
	public String buscaCta(){
		return "redirect:/principal";
	}
	/*@RequestMapping ( value="/foundAcct", method=RequestMethod.POST)
	public ModelAndView buscaCta(Cuenta cta,HttpServletRequest request) throws JsonProcessingException, Exception {
		HttpSession session = request.getSession();
		String sectionLoad=session.getAttribute("seccionLoad").toString();
			if(sectionLoad!=null) {
				ObjectMapper mapper = new ObjectMapper();
				ModelAndView model = new ModelAndView("listadoCta");
				String userRole = SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString();
				String json=mapper.writeValueAsString(sc.findCta(cta));
				String seccion=mapper.writeValueAsString(UtileriaCuentas.getOptionsSelectByUserRole(userRole,sectionLoad));
				model.addObject("lists", json);
				model.addObject("selectOption", seccion);
				model.addObject("menu", UtileriaCuentas.getMenu(sectionLoad));
				return model;
			}

		return new ModelAndView("redirect:/principal");
	}*/
	

	@RequestMapping(value = { "/Registrada" }, method = RequestMethod.POST)
	public String ajustesFront() {
		return "Registrada";
	}
/*	@GetMapping("/detalleCuenta")
	public String detalleCuenta(Model model,@RequestParam(name="cuenta") String cuenta) throws Exception  {
			Cuenta cta1=sc.obtenerCuentaPorNumeroCuenta(cuenta);
			model.addAttribute("cuenta2", cta1);
			model.addAttribute("path", "/actualizaCta.html");
			model.addAttribute("pathRegresar", "/foundAcct");
			model.addAttribute("menu", "menu2.jsp");
			return "modifCta";
	}*/
	/*@RequestMapping("actCuenta")
	public String actCuenta(Model model,Cuenta cuenta) throws Exception  {
		model.addAttribute("path", "/actualizaCta.html");
		model.addAttribute("pathRegresar", "/foundAcct");
		model.addAttribute("menu", "menu2.jsp");
		model.addAttribute("menu", "menu2.jsp");
		if(!model.containsAttribute("cuenta2")) {
			Cuenta cta1=sc.getAccountById(cuenta);
			cta1.setIdCuenta(cuenta.getIdCuenta());
			model.addAttribute("cuenta2", cta1);
			return "modifCta";
		}
		return "modifCta";
	}
	@RequestMapping("infCta")
	public String infoCta(Model model,Cuenta cuenta) throws Exception  {
		if(!model.containsAttribute("cuenta2")) {
			Cuenta cta1=sc.getAccountById(cuenta);
			cta1.setIdCuenta(cuenta.getIdCuenta());
			model.addAttribute("cuenta2", cta1);
			return "infoCta";
		}
		return "infoCta";
	}
	
	@RequestMapping( value ="/actualizaCta", method= {RequestMethod.POST})
	public String actualizaCta(Cuenta cta, ModelMap mp,RedirectAttributes redirectAttributes) {
		SytecsoLogger.info("control3 "+cta.getNumCuenta());
		SytecsoLogger.info("idCta "+cta.getIdCuenta());
		try {
			Integer idCtaFisc=sdf.findDatosFiscalesByRfc(cta.getDatosFiscales().getRfc());
			if(cta.getIdCuenta()==idCtaFisc || idCtaFisc==0) {
				if(sc.actualizaCuenta(cta) && sdf.actualizaDatosFiscales(cta)) {
					EventoSytecso eventoSytecso = new EventoSytecso();
					eventoSytecso.setCuenta_idCuenta(cta.getIdCuenta());
					eventoSytecso.setTipoEvento("ACTUALIZACION DE CUENTA");
					serviceEventoSytecso.registrarEventoSytecso(eventoSytecso);
				}
			}else {
				redirectAttributes.addFlashAttribute("status", true);
				redirectAttributes.addFlashAttribute("msg", "El RFC ingresado ya existe en otra cuenta, favor de ingresar otro distinto");
				redirectAttributes.addFlashAttribute("cuenta2",cta);
				return "redirect:/actCuenta";
			}
			mp.addAttribute("ModelCta",cta.getNumCuenta());
		}catch(Exception e){
			SytecsoLogger.error("ERROR en ControllerCuenta.regCta", e);
			SytecsoException.logClassAndMethodWithException(e);
		}
		return "actualizada";
	}
	@GetMapping(value="estatusCuenta")
	public String estatusCuenta (Model model,HttpServletRequest request) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		HttpSession session = request.getSession();
		Cuenta cuenta=(Cuenta)session.getAttribute("estCuenta");
		Cuenta cta = sc.findEstatusCuentaByIdCuenta(cuenta.getIdCuenta());
		model.addAttribute("cuenta", mapper.writeValueAsString(cta));
		return "actualizaEstatuscuenta";
		
	}*/
	@PostMapping(value="/estatusCuenta")
	public String estatusCuenta(Cuenta cuenta,HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("estCuenta", cuenta);
		return "redirect:/estatusCuenta";

	}
	
	/*
	@PostMapping("/actualizarEstatus")
	public ResponseEntity<String> actualizarEsatus(@RequestParam Long id,@RequestParam String estatus){
		if(sc.updateStatusByIdCuenta(id, estatus))
			return new ResponseEntity<>("",HttpStatus.OK);
		return new ResponseEntity<>("",HttpStatus.BAD_REQUEST);
	}*/
}
