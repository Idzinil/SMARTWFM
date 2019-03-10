package com.sytecso.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(path="/angular")
public class MainController {
	private static final String INDEX_VIEW = "index"; 
	@GetMapping(value = "/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
		return INDEX_VIEW;
	}
	@GetMapping(value = {"/home",""})
	public String home() {
		return INDEX_VIEW;
	}
	@GetMapping(value = {"/administracion-ordenes"})
	public String administracionOrdenes() {
		return INDEX_VIEW;
	}
	@GetMapping(value = {"/scheduler"})
	public String scheduler() {
		return INDEX_VIEW;
	}
	
	@GetMapping(value = {"/administracion-ordenes/listado-ordenes"})
	public String listadoOrdenes(@RequestParam(name="cuenta") String cuenta) {
		return INDEX_VIEW;
	}
	@GetMapping(value = {"/administracion-ordenes/registro-ordenes"})
	public String registroOrdenes() {
		return INDEX_VIEW;
	}
	@GetMapping(value = {"/administracion-ordenes/resumen-ordenes"})
	public String resumenOrdenes() {
		return INDEX_VIEW;
	}	
}

