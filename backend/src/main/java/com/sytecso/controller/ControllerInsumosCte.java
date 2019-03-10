package com.sytecso.controller;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sytecso.beans.Cuenta;
import com.sytecso.beans.InsumosCte;
import com.sytecso.beans.InsumosEmp;
import com.sytecso.component.DTOFileError;
import com.sytecso.component.UtileriaCompruebaDatos;
import com.sytecso.component.UtileriaInsumos;
import com.sytecso.service.ServiceCargasBatch;
import com.sytecso.service.ServiceCuenta;
import com.sytecso.service.ServiceInsumos;
import com.sytecso.service.ServiceUpload;


//@Controller
public class ControllerInsumosCte {
	
	@Autowired ServiceInsumos serviceInsumos;
	@Autowired ServiceCuenta serviceCuenta;
	@Autowired ServiceCargasBatch serviceCargasBatch;
	@Autowired ServiceUpload serviceUpload;
	
	@RequestMapping(value = { "/irCtasInsumos" }, method = RequestMethod.GET)
	public String irCtasInsumo(Model model, SessionStatus status) {
		model.addAttribute("ctaInsum", new InsumosCte());
		status.setComplete();
		return "busquedaCtaInsum";
	}
	
	@RequestMapping(value = { "/buscarCtaInsumo" }, method = { RequestMethod.POST })
	public String buscarCtaInsumo(InsumosCte ctaInsum, ModelMap mp, SessionStatus status,
			RedirectAttributes redirectAttributes, HttpServletRequest httpServletRequest) throws Exception {

		List<InsumosCte> lstInsumosCte = serviceInsumos.findCuentasInsumos(ctaInsum);
		if (lstInsumosCte.isEmpty()) {
			redirectAttributes.addFlashAttribute("status", true);
			return "redirect:/irCtasInsumos";
		}
		mp.addAttribute("ctasInsumos", lstInsumosCte);

		return "cuentasInsumos";

	}
	
	/*@RequestMapping(value = { "/cuentaInsumoForm" }, method = RequestMethod.GET)
	public ModelAndView obtenerInsumos(Model model,@RequestParam("cuenta") String numCuenta) {
		ModelAndView mv = new ModelAndView("insumosForm");
		InsumosCte insumo  = new InsumosCte();
		insumo.setCuenta(new Cuenta());
		
		List<InsumosCte> lstInsumos = serviceInsumos.traerTotalInsumos();
		insumo.setCuenta(serviceCuenta.obtenerCuentaPorNumeroCuenta(numCuenta));
		model.addAttribute("insumos", lstInsumos);
		model.addAttribute("insumo", insumo);
		mv.addObject("cuenta", numCuenta);
		mv.addObject("idCuenta", insumo.getCuenta().getIdCuenta());
		
		return mv;
	}*/
	
	@RequestMapping(value = { "/altaInsumo" }, method = RequestMethod.POST)
	public String altaInsumoCte(Model model, InsumosCte insumosCte,SessionStatus status,RedirectAttributes redirectAttributes,@RequestParam("cuenta") String numCuenta ) {
		
		InsumosCte insumobyNameCte = new InsumosCte();
		BigDecimal totalFinalInsumos =new BigDecimal(0);

		if(!insumosCte.getNombreInsumo().equals("")||insumosCte.getNombreInsumo().isEmpty())
		{
			insumobyNameCte = serviceInsumos.buscarInsumoByNamebyCuenta(insumosCte);
			insumobyNameCte.setNombreInsumo(UtileriaCompruebaDatos.compruebaDataNulo(insumobyNameCte.getNombreInsumo()));
			insumobyNameCte.setTotalInsumo(UtileriaCompruebaDatos.compruebaBigDecimalNull(insumobyNameCte.getTotalInsumo()));
			if (!insumobyNameCte.getNombreInsumo().equals("")) {
				 	
					totalFinalInsumos = insumosCte.getTotalInsumo().add(insumobyNameCte.getTotalInsumo());
					insumobyNameCte.setTotalInsumo(totalFinalInsumos);
					serviceInsumos.updateInsumosByIdInsumo(insumobyNameCte);
			}else {
				serviceInsumos.registrarInsumo(insumosCte);
			}
		}else {
			redirectAttributes.addFlashAttribute("status", true);
		}
		
		return "redirect:/cuentaInsumoForm?cuenta="+numCuenta+"&idCuenta="+insumosCte.getCuentaCliente_idCuenta();
	}

	@RequestMapping(value = { "/insumoEmpForm" }, method = RequestMethod.GET)
	public ModelAndView obtenerInsumosEmpresa(Model model) {
		ModelAndView mv = new ModelAndView("insumosEmpForm");
		
		List<InsumosEmp> lstInsumos = serviceInsumos.traerTotalInsumosEmpresa();
		model.addAttribute("insumos", lstInsumos);
		model.addAttribute("insumo", new InsumosEmp());
		
		return mv;
	}
	
	@RequestMapping(value = { "/altaInsumoEmp" }, method = RequestMethod.POST)
	public String altaInsumoEmp(Model model, InsumosEmp insumoEmp,SessionStatus status,RedirectAttributes redirectAttributes ) {
		
		InsumosEmp insumobyNameEmp = new InsumosEmp();
		BigDecimal totalFinalInsumos =new BigDecimal(0);

		if(!insumoEmp.getNombreInsumo().equals("")||insumoEmp.getNombreInsumo().isEmpty())
		{
			insumobyNameEmp = serviceInsumos.buscarInsumoEmpByName(insumoEmp);
			insumobyNameEmp.setNombreInsumo(UtileriaCompruebaDatos.compruebaDataNulo(insumobyNameEmp.getNombreInsumo()));
			insumobyNameEmp.setTotalInsumo(UtileriaCompruebaDatos.compruebaBigDecimalNull(insumobyNameEmp.getTotalInsumo()));
			if (!insumobyNameEmp.getNombreInsumo().equals("")) {
				 	
					totalFinalInsumos = insumoEmp.getTotalInsumo().add(insumobyNameEmp.getTotalInsumo());
					insumobyNameEmp.setTotalInsumo(totalFinalInsumos);
					serviceInsumos.updateInsumoEmpByIdInsumo(insumobyNameEmp);
			}else {
				serviceInsumos.registrarInsumoEmp(insumoEmp);
			}
		}else {
			redirectAttributes.addFlashAttribute("status", true);
		}
		
		return "redirect:/insumoEmpForm";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/upload", method=RequestMethod.POST)
    public String CargaInsumosEmp(@RequestParam("file") MultipartFile file,
    		HttpServletRequest req,RedirectAttributes redirectAttributes) throws IOException {
        InputStream is = file.getInputStream();
        Map<String, List<?>> datas = UtileriaInsumos.builDataForInsertInsumosEmpresaBatch(is);
        List<InsumosEmp> InsumosEmpresa = (List<InsumosEmp>)datas.get("aceptados");
        List<DTOFileError> errors = (List<DTOFileError>)datas.get("rechazados");
        String url = errors.isEmpty()?"obtenerInsumosEmpresa":"cargaInsumosEmpresa";
        serviceInsumos.registrarInsumosEmpresaBatch(InsumosEmpresa);
        redirectAttributes.addFlashAttribute("msg","La carga de insumos fue realizada");
        redirectAttributes.addFlashAttribute("rechazados", new ObjectMapper().writeValueAsString(errors));
        redirectAttributes.addFlashAttribute("status", !errors.isEmpty());
        return "redirect:/"+url;
    }
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/upload", method=RequestMethod.POST)
    public String CargaInsumosCte(@RequestParam("file") MultipartFile file,
    		HttpServletRequest req,RedirectAttributes redirectAttributes) throws IOException {
        InputStream is = file.getInputStream();
        Map<String, List<?>> datas = serviceCargasBatch.builDataForInsertInsumosCteBatch(is);
        List<InsumosCte> InsumosCte = (List<InsumosCte>)datas.get("aceptados");
        List<DTOFileError> errors = (List<DTOFileError>)datas.get("rechazados");
        String url = errors.isEmpty()?"obtenerInsumosCliente":"cargaInsumosCliente";
        serviceInsumos.registrarInsumosCteBatch(InsumosCte);
        redirectAttributes.addFlashAttribute("msg","La carga de insumos fue realizada");
        redirectAttributes.addFlashAttribute("rechazados", new ObjectMapper().writeValueAsString(errors));
        redirectAttributes.addFlashAttribute("status", !errors.isEmpty());
        return "redirect:/"+url;
    }
	
}
