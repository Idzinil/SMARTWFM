package com.sytecso.dto;

import java.io.Serializable;
import java.math.BigDecimal;

/* Made by Sytecso
 * 04/03/2019
 *This DTO will transfer  the information of the map to be showed in screen and refered to the  
 *orders that have been schedulled
 **
 *¨
 **
 */

public class mapeoOrdenDTO implements Serializable {

	/**************
	 * This elements will form part of  the  data that will  be  used to be showed in screen
	 * 
	 */
	private static final long serialVersionUID = 7359381188751006178L;
	/**************
	 * This elements will form part of  the  data that will  be  used to be showed in screen
	 * 
	 */
	
	private String numeroOrden;
	private BigDecimal idOrden;
	private String horaInicioOrden;
	private String horaFinorden;
	
	/**************************
	 * 
	 * Getters and setter of the logic
	 */
	public String getNumeroOrden() {
		return numeroOrden;
	}
	public void setNumeroOrden(String numeroOrden) {
		this.numeroOrden = numeroOrden;
	}
	public BigDecimal getIdOrden() {
		return idOrden;
	}
	public void setIdOrden(BigDecimal idOrden) {
		this.idOrden = idOrden;
	}
	public String getHoraInicioOrden() {
		return horaInicioOrden;
	}
	public void setHoraInicioOrden(String horaInicioOrden) {
		this.horaInicioOrden = horaInicioOrden;
	}
	public String getHoraFinorden() {
		return horaFinorden;
	}
	public void setHoraFinorden(String horaFinorden) {
		this.horaFinorden = horaFinorden;
	}


}
