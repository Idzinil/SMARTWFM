package com.sytecso.ws.rest.validations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.sytecso.ws.rest.validations.impl.ValidateAmountImpl;

@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy=ValidateAmountImpl.class)
public @interface ValidateAmount {
	String message() default "{msg.amounts.min.amount}";
	Class<?>[] groups() default {};
	Class<? extends Payload>[] payload() default{};
}
