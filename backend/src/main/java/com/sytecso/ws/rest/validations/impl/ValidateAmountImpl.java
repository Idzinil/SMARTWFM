package com.sytecso.ws.rest.validations.impl;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.ibm.icu.math.BigDecimal;
import com.sytecso.ws.rest.validations.ValidateAmount;

public class ValidateAmountImpl implements ConstraintValidator<ValidateAmount, BigDecimal> {

	@Override
	public void initialize(ValidateAmount constraintAnnotation) {

	}
	@Override
	public boolean isValid(BigDecimal value, ConstraintValidatorContext context) {
		return value.compareTo(BigDecimal.ZERO)>0;
	}
	

}
