/**
 * 
 * Created-By: Sytecso
 * Date:       06/03/2019
 */

package com.sytecso.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.sytecso.dao.DAOOrden;
import com.sytecso.dto.OrdenDTO;
import com.sytecso.dto.TipoOrdenDTO;
import com.sytecso.beans.Cuenta;


@Repository
@Transactional
public class DAOOrdenImpl implements DAOOrden {

	@Autowired	private DataSource dataSource;
	
	
	/********************************************
	 * This method  will  get  the max order from the database, this allows calculate the next id in the screen
	 *
	 */
	@Override
	public OrdenDTO ObtenerUltimaOrden() throws SQLException {
		String sql = " select max(idOrden) from orden";
		Connection con = null;
		ResultSet rs = null;
		OrdenDTO orden = new OrdenDTO();
		PreparedStatement pst=null;
		try {
			
			con = dataSource.getConnection();
			 pst = con.prepareStatement(sql);
			rs= pst.executeQuery();
			while(rs.next()) {
				orden.setNumeroOrden(rs.getString(1));
			}
			if(orden.getNumeroOrden()==null ||orden.getNumeroOrden().isEmpty()) {
				orden.setNumeroOrden("");
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (con != null) {
				con.close();
			}
		}

		return orden;

	}
	

	/********************************************
	 * This method  will  get  the max order from the database, this allows calculate the next id in the screen
	 *
	 */
	@Override
	public List<TipoOrdenDTO> ObtenerTiposOrdenCliente(Cuenta ctaCte) throws Exception {
		String sql = " select idOrden," + 
				"TipoOrden," + 
				"DescipcionOrden," + 
				"NombreOrden, " + 
				"TiempoOrdenProm," + 
				"montoOrden," + 
				"Divisa " + 
				" from  tipoOrden where CuentaCliente_idCuenta ='"+ctaCte.getIdCuenta()+"'";
		Connection con = null;
		ResultSet rs = null;
		List<TipoOrdenDTO> ordenes = new ArrayList<TipoOrdenDTO>();
		PreparedStatement pst=null;
		try {
			con = dataSource.getConnection();
			pst = con.prepareStatement(sql);
			rs= pst.executeQuery();
			while(rs.next()) {
				TipoOrdenDTO tipoOrden =new TipoOrdenDTO();
				tipoOrden.setIdTipoOrden(rs.getBigDecimal(1));
				tipoOrden.setTipoOrden(rs.getString(2));
				tipoOrden.setDescripcionOrden(rs.getString(3));
				tipoOrden.setNombreOrden(rs.getString(4));
				tipoOrden.setTiempoOrden(rs.getInt(5));
				tipoOrden.setPrecioOrden(rs.getFloat(6));
				tipoOrden.setDivisa(rs.getString(7));
				ordenes.add(tipoOrden);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (con != null) {
				con.close();
			}
		}

		return ordenes;
	}

}
