package com.sytecso.ws.rest.validations.impl;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.sytecso.ws.rest.validations.AllowedAcctionsOrdenServicio;

public class AllowedAcctionsOrdenServicioImpl implements ConstraintValidator<AllowedAcctionsOrdenServicio, Integer>{

	@Override
	public boolean isValid(Integer value, ConstraintValidatorContext context) {
		return value==1 || value==10||value==11||value==100;
	}

}
