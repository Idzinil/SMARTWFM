package com.sytecso.ws.rest.validations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.sytecso.ws.rest.validations.impl.AllowedAcctionsOrdenInsumoClienteImpl;


@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = AllowedAcctionsOrdenInsumoClienteImpl.class )
public @interface AllowedAcctionsOrdenInsumoCliente {
	
	String message() default "{msg.ws.orden.insumo.cliente.allowedActions}";
	
	Class<?>[] groups() default {};
	
	Class<? extends Payload>[] payload() default{};

}
