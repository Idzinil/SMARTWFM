package com.sytecso.ws.rest.validations.impl;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.sytecso.ws.rest.validations.AllowedStatusOrders;

public class AllowedStatusOrdersImpl implements ConstraintValidator<AllowedStatusOrders, String> {

	@Override
	public void initialize(AllowedStatusOrders constraintAnnotation) {
	}
		
	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		String val = value.toLowerCase();
		return val.equals("recibida")||val.equals("encurso")||val.equals("instalado")||val.equals("porcerrar")||val.equals("reprogramacion")||
				val.equals("cancelada") || val.equals("retraso") || val.equals("suspendida");
	}

}
