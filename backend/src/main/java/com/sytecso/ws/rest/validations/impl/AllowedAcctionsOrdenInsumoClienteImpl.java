package com.sytecso.ws.rest.validations.impl;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.sytecso.ws.rest.validations.AllowedAcctionsOrdenInsumoCliente;

public class AllowedAcctionsOrdenInsumoClienteImpl implements ConstraintValidator<AllowedAcctionsOrdenInsumoCliente, Integer> {
	@Override
	public void initialize(AllowedAcctionsOrdenInsumoCliente constraintAnnotation) {
	}
	
	@Override
	public boolean isValid(Integer value, ConstraintValidatorContext context) {		
		return value==1 || value == 10 || value == 11;
	}

}
