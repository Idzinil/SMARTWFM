package com.sytecso.ws.rest.validations.impl;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.sytecso.ws.rest.validations.AllowedAcctionsEvidenciaAdjunta;

public class AllowedAcctionsEvidenciaAdjuntaImpl implements ConstraintValidator<AllowedAcctionsEvidenciaAdjunta, String> {

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		String val = value.toLowerCase();
		return val.equals("actualizar") || val.equals("borrar");
	}
	

}
