package com.sytecso.ws.rest.validations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.sytecso.ws.rest.validations.impl.AllowedStatusOrdersImpl;

@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy=AllowedStatusOrdersImpl.class)
public @interface AllowedStatusOrders {
	String message() default "{msg.ws.orden.servicio.allowedOrders}";
	Class<?>[] groups() default {};
	Class<? extends Payload>[] payload() default {};
}
