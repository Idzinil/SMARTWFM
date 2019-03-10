package com.sytecso.exceptions;

import java.lang.reflect.Method;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sytecso.component.SytecsoLogger;

@Controller
@ControllerAdvice(basePackages="com.sytecso.controller")
public class SytecsoException {
	
	@ExceptionHandler(HttpRequestMethodNotSupportedException.class)
	public ModelAndView handleError(HttpServletRequest httpServletRequest,Exception e) {
		logClassAndMethodWithException(e);
		ModelAndView view = new ModelAndView("principal");
		return view;
	}
	@ExceptionHandler(EmptyResultDataAccessException.class)
	public String emptyResultDataAccessException(Model model,RedirectAttributes redirectAttributes,HttpServletRequest httpServletRequest,Exception e){
		logClassAndMethodWithException(e);
		redirectAttributes.addFlashAttribute("estatus", true);
		redirectAttributes.addFlashAttribute("msg", "ocurrio un error al realizar la operacion");
		String path="redirect:"+httpServletRequest.getServletPath();
		return path;
	}
	@ResponseStatus(HttpStatus.NOT_FOUND)
	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView NoHandlerFoundException(HttpServletRequest httpServletRequest,Exception e) {
		logClassAndMethodWithException(e);
		ModelAndView view = new ModelAndView("principal");
		return view;
	}
	
	@ExceptionHandler({NumberFormatException.class, NullPointerException.class})
	public void weakExceptionsHandler(Exception e) {
		logClassAndMethodWithException(e);
	}
	
	@ExceptionHandler({RuntimeException.class, ClassNotFoundException.class, SQLException.class})
	public String severeExceptionsHandler(Exception e) {
		logClassAndMethodWithException(e);
		return "principal";
	}
	
	//ExceptionHandler general
	@ExceptionHandler
	public String exceptionsHandler(Exception e) {
		logClassAndMethodWithException(e);
		return "principal";
	}

	public static void logClassAndMethodWithException(Exception e){
		Integer indice =0;
		for (StackTraceElement ste : e.getStackTrace()){
			String basePackage =ste.getClassName();
			if(basePackage.contains("com.sytecso")) {
				break;
			}	
			indice+=1;
		}
		
		StackTraceElement ste = e.getStackTrace()[indice];
		Class<?> c = null;
		try {
			 c = Class.forName(ste.getClassName());
		} catch (Exception e2) {
			SytecsoLogger.error("An exception ocurred in SytecsoException type", e2);
		}
		
		String mname = ste.getMethodName();


		if ("<init>".equals(mname)) {
		    c.getConstructors(); 
		} else if ("<cinit>".equals(mname)) {
			SytecsoLogger.error("An exception ocurred in a satic block: ", e);	
		} else {
		    for (Method m : c.getMethods()) {
		        if (m.getName().equals(mname)) {
		        	if(m.getDeclaringClass().getName().contains("Impl")) {
						StringBuilder buffer = new StringBuilder();
						Integer index1=m.getDeclaringClass().getName().indexOf("imp");
						Integer index2 =m.getDeclaringClass().getName().indexOf("Impl");
						buffer.append(m.getDeclaringClass().getName().substring(0, index1));
						buffer.append(m.getDeclaringClass().getName().substring(index1+5,index2));
						SytecsoLogger.error("ERROR: An exception ocurred in method: "+ m.getName() +" in class: "+ buffer+ " exception type: ", e);
			            System.err.println("ERROR: An exception ocurred in method: " + m.getName() + " in class "+buffer+e);
					}else {
						SytecsoLogger.error("ERROR: An exception ocurred in method: " + m.getName() +" in class: "+ m.getDeclaringClass() +" type exception ", e);
			            System.err.println("ERROR: An exception ocurred in method: " + m.getName() + " in class: "+m.getDeclaringClass()+" type exception: "+ e);
					}
		        	break;
		        }else {
		        	SytecsoLogger.error("ERROR: An exception ocurred in method: "+ m.getName() +" And sub method: "+mname+" in class: "+ m.getDeclaringClass()+ " exception type: ", e);
		        	System.err.println("ERROR: An exception ocurred in method: "+ m.getName() +" And sub method: "+mname+" in class: "+ m.getDeclaringClass()+ " exception type: "+ e);
		        	break;
		        }
		    }
		}

	}
	
}
