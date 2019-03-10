/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2019
 */
package com.sytecso.dao;



import java.sql.Connection;
import java.util.List;

import com.sytecso.beans.EventoSytecso;

public interface DAOEventoSytecso {
	public long registrarEventoSytecso(EventoSytecso esbbatch);
	public void actualizarEventoSytecso(EventoSytecso esbbatch);
	public void actualizarEventoSytecsoBatch(List<EventoSytecso> esbbatch);
	public EventoSytecso findEventoSytecsoByIdCompraAndGroupByIdCompra(Long idCompra);
	public List<EventoSytecso> createEventoSytecsoBatch(Connection connection,List<EventoSytecso> EventoSytecsos);
}
