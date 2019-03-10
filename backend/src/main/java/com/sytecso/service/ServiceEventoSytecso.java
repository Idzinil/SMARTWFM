/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2019
 */
package com.sytecso.service;


import java.util.List;

import com.sytecso.beans.EventoSytecso;

public interface ServiceEventoSytecso {
	public long registrarEventoSytecso(EventoSytecso esbbatch);
	public void actualizarEventoSytecso(EventoSytecso esbbatch) throws Exception;
	public void actualizarEventoSytecsoBatch(List<EventoSytecso> esbbatch);
	public EventoSytecso findEventoSytecsoByIdCompraAndGroupByIdCompra(Long idCompra);

}
