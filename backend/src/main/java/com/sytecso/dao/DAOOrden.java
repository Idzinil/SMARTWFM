/**
 * 
 * Created-By: Sytecso
 * Date:       06/03/2019
 */

package com.sytecso.dao;
import java.sql.SQLException;
import java.util.List;

import com.sytecso.beans.Cuenta;
import com.sytecso.dto.OrdenDTO;
import com.sytecso.dto.TipoOrdenDTO;
public interface DAOOrden {
	
	public OrdenDTO ObtenerUltimaOrden() throws SQLException;
	public List<TipoOrdenDTO> ObtenerTiposOrdenCliente(Cuenta ctaCte)throws Exception;
	
}
