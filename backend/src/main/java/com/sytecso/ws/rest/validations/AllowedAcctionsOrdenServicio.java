package com.sytecso.ws.rest.validations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.sytecso.ws.rest.validations.impl.AllowedAcctionsOrdenServicioImpl;

@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy=AllowedAcctionsOrdenServicioImpl.class)
public @interface AllowedAcctionsOrdenServicio {
	String message() default "{msg.ws.orden.servicio.allowedActions}";
	Class<?>[] groups() default {};
	Class<? extends Payload>[] payload() default {};
}
