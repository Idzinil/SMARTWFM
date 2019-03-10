/**
 * 
 * Created-By: Sytecso
 * Date:       06/03/2019
 */


package com.sytecso.service;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

import com.sytecso.beans.Cuenta;
import com.sytecso.captions.OrdenCaption;
import com.sytecso.model.Orden;
import com.sytecso.dto.OrdenDTO;
import com.sytecso.dto.TipoOrdenDTO;

public interface ServiceOrdenes {
	public List<Orden> findAll();
	public void save(Orden orden);
	public OrdenCaption findOrdenById(BigDecimal id);
	public OrdenDTO ObtenerUltimaOrden() throws SQLException;
	public List<TipoOrdenDTO> ObtenerOrdenesTipo(Cuenta ctaCte) throws SQLException, Exception;
}
