package com.sytecso.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sytecso.beans.UsuarioCuenta;
import com.sytecso.exceptions.SytecsoException;
import com.sytecso.service.ServiceUsuarioCuenta;

@Controller
@RequestMapping("/usuarioCuenta")
public class ControllerUsuarioCuenta  extends SytecsoException{
    @Autowired
    private ServiceUsuarioCuenta serviceUsuarioCuenta;
    @RequestMapping("/formularioUsuarioCuenta")
    public String formularioUsuarioCuenta() {
        return "viewCrearUsuarioCuenta";
    }
    @RequestMapping(value = "/creaUsuarioCuenta", method = RequestMethod.POST)
    public String creaUsuarioCuenta(UsuarioCuenta usuarioCuenta) throws Exception {
        serviceUsuarioCuenta.registrarUsuarioCuenta(usuarioCuenta);
        return "redirect:/usuarioCuenta/obtenerUsersAdm";
    }
    @RequestMapping(value = "/modificaUsuarioCuenta", method = RequestMethod.POST)
    public String modificaUsuarioCuenta(UsuarioCuenta usuarioCuenta) throws Exception {
    	if(!usuarioCuenta.isCmbpwd())
           serviceUsuarioCuenta.actualizarUsuarioCuenta(usuarioCuenta);
    	else
    	   serviceUsuarioCuenta.actualizarUsuarioCuentaPwd(usuarioCuenta);	
        return "redirect:/usuarioCuenta/obtenerUsersAdm";
    }
	@RequestMapping(value= {"/obtenerUsersAdm"}, method = RequestMethod.GET)
	public String obtenerUsersAdm(Model model) {
		List<UsuarioCuenta> lstUsuarios = serviceUsuarioCuenta.traerTodosUsuarios();
		model.addAttribute("userlts", lstUsuarios);
		return "usuarioAdministracion";
	}
	@RequestMapping(value= {"/modUsersAdm"}, method = RequestMethod.GET)
	public String modUsersAdum(Model model, @RequestParam("usr") String idUsuarioCuenta) {
		UsuarioCuenta elUsuario=serviceUsuarioCuenta.traerUsuario(idUsuarioCuenta);
		model.addAttribute("elusuario", elUsuario);
		return "viewModificarUsuarioCuenta";
	}
	@RequestMapping(value= {"/canUsersAdm"}, method = RequestMethod.GET)
	public String canUsersAdm(Model model, @RequestParam("usr") String idUsuarioCuenta) throws Exception {
        serviceUsuarioCuenta.cancelarUsuarioCuenta(idUsuarioCuenta);
        return "redirect:/usuarioCuenta/obtenerUsersAdm";
	}
	@RequestMapping(value= {"/suspdUsersAdm"}, method = RequestMethod.GET)
	public String suspdUsersAdm(Model model, @RequestParam("usr") String idUsuarioCuenta) throws Exception {
        serviceUsuarioCuenta.suspenderUsuarioCuenta(idUsuarioCuenta);
        return "redirect:/usuarioCuenta/obtenerUsersAdm";
	}
}
