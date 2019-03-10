/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2019
 */
package com.sytecso.component;

import java.io.Serializable;
import org.springframework.beans.factory.annotation.Autowired;
import com.sytecso.beans.Cuenta;
import com.sytecso.beans.EventoSytecso;

public class VOCuentasConstraint implements Serializable{
	private static final long serialVersionUID = 3537910095406085034L;
	@Autowired
	private Cuenta cuenta;
	@Autowired
	private EventoSytecso eventosytecso;
	
	public Cuenta getCuenta() {
		return cuenta;
	}
	public void setCuenta(Cuenta cuenta) {
		this.cuenta = cuenta;
	}
	public EventoSytecso getEventosytecso() {
		return eventosytecso;
	}
	public void setEventosytecso(EventoSytecso eventosytecso) {
		this.eventosytecso = eventosytecso;
	}
}
