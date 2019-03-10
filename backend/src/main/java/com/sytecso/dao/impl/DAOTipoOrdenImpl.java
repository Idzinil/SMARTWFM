/**
 * Sytecso
 * Created-By: Sytecso
 * Date:       29/09/2017
 */
package com.sytecso.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sytecso.beans.Cuenta;
import com.sytecso.beans.DatosFiscales;
import com.sytecso.component.SytecsoLogger;
import com.sytecso.component.UtileriaSql;
import com.sytecso.dao.DAOTipoOrden;
import com.sytecso.exceptions.SytecsoException;
import com.sytecso.model.TipoOrden;

@Repository
public class DAOTipoOrdenImpl implements DAOTipoOrden {

	@Autowired	private DataSource dataSource;
	@Autowired	private JdbcTemplate jdbcTemplate;
	
	private static final String BUSCAR_TIPO_ORDEN_POR_FK_AND_CTA = "select * from tipoorden where NombreOrden=? and CuentaCliente_idCuenta = ?";
	private static final String REGISTRAR_TIPO_ORDEN = "INSERT INTO tipoorden ( TipoOrden, CuentaCliente_idCuenta, DescipcionOrden, NombreOrden, TiempoOrdenProm, montoOrden, Divisa) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private static final String INSERT_INTO_TIPO_ORDEN_BATCH = "INSERT INTO tipoorden ( TipoOrden, CuentaCliente_idCuenta, DescipcionOrden, NombreOrden, TiempoOrdenProm, montoOrden, Divisa) VALUES (?, ?, ?, ?, ?, ?, ?)";
	
	public List<TipoOrden> findCuentasTipoOrdenes(String condiciones)  {
		String query = "select * from cuentacliente cta, datosfiscales df  where cta.idCuenta=df.Cuenta_idCuenta"
				+ " and estatusCta='AC' "+ condiciones ;

		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<TipoOrden> lstCtasTipoOrden = new ArrayList<>();
		try {
			con = dataSource.getConnection();
			pst = con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				TipoOrden tipoOrden = new TipoOrden();
				tipoOrden.setCuenta(new Cuenta());
				tipoOrden.getCuenta().setIdCuenta(rs.getBigDecimal("idCuenta"));
				tipoOrden.getCuenta().setNumCuenta(rs.getString("numCuenta"));
				tipoOrden.getCuenta().setAliasCliente(rs.getString("aliasCliente"));
				tipoOrden.getCuenta().setDatosFiscales(new DatosFiscales());
				tipoOrden.getCuenta().getDatosFiscales().setRfc(rs.getString("RFC"));
				tipoOrden.getCuenta().getDatosFiscales().setRazonSocial(rs.getString("razonSocial"));
				lstCtasTipoOrden.add(tipoOrden);

			}
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		} finally {
			UtileriaSql.closeConection(con, pst, rs);
		}
		return lstCtasTipoOrden;
	}
	


@Override
public TipoOrden obtenerTipoOrdenbyNameandCuenta(TipoOrden tipoOrden) {
	TipoOrden tipOrd = new TipoOrden();
	Connection connection = null;
	ResultSet rs =null;
	PreparedStatement preparedStatement=null;
	try {
		connection = dataSource.getConnection();
		preparedStatement = connection.prepareStatement(BUSCAR_TIPO_ORDEN_POR_FK_AND_CTA,Statement.RETURN_GENERATED_KEYS);
		preparedStatement.setString(1, tipoOrden.getNombreOrden());
//		preparedStatement.setBigDecimal(2,tipoOrden.getCuentaCliente_idCuenta());
		rs = preparedStatement.executeQuery();
		while(rs.next()) {
			tipOrd.setIdOrden(rs.getBigDecimal("idOrden"));
			tipOrd.setTipoOrden(rs.getString("TipoOrden"));
//			tipOrd.setCuentaCliente_idCuenta(rs.getBigDecimal("CuentaCliente_idCuenta"));
			tipOrd.setDescipcionOrden(rs.getString("DescipcionOrden"));
			tipOrd.setNombreOrden(rs.getString("NombreOrden"));
			tipOrd.setTiempoOrdenProm(rs.getString("TiempoOrdenProm"));
			tipOrd.setMontoOrden(rs.getBigDecimal("montoOrden"));
			tipOrd.setDivisa(rs.getString("Divisa"));
		}
	
	rs.close();

} catch (Exception e) {
	SytecsoException.logClassAndMethodWithException(e);
} finally {
	UtileriaSql.closeConection(connection, preparedStatement, rs);
}
	SytecsoLogger.logInfo(this.getClass(), "obtenerTipoOrden");
	return tipOrd;
}

@Transactional
public long registrarTipoOrden(TipoOrden tipoOrden)  {
	long key = -1L;
	Connection con = null;
	Connection connection =null;
	PreparedStatement preparedStatement = null;
	ResultSet rs = null;
	try {
		con = dataSource.getConnection();
		preparedStatement = con.prepareStatement(REGISTRAR_TIPO_ORDEN, Statement.RETURN_GENERATED_KEYS);
		preparedStatement.setString(1,tipoOrden.getTipoOrden());
//		preparedStatement.setBigDecimal(2, tipoOrden.getCuentaCliente_idCuenta());
		preparedStatement.setString(3,tipoOrden.getDescripcionOrden() );
		preparedStatement.setString(4, tipoOrden.getNombreOrden() );
		preparedStatement.setString(5, tipoOrden.getTiempoOrdenProm());
		preparedStatement.setBigDecimal(6, tipoOrden.getMontoOrden());
		preparedStatement.setString(7, tipoOrden.getDivisa());
		preparedStatement.executeUpdate();
		rs = preparedStatement.getGeneratedKeys();
		if (rs != null && rs.next()) {
			key = rs.getLong(1);
		}

		preparedStatement.close();
	} catch (Exception e) {
		SytecsoException.logClassAndMethodWithException(e);
	} finally {
		UtileriaSql.closeConection(connection, preparedStatement, rs);
	}

	return key;

}

@Override
public Long registrarTipoOrdenBatch(final TipoOrden tipoOrden) {
	GeneratedKeyHolder holder = new GeneratedKeyHolder();
	jdbcTemplate.update(new PreparedStatementCreator() {
		@Override
		public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
			PreparedStatement ps = connection.prepareStatement(INSERT_INTO_TIPO_ORDEN_BATCH,
					Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, tipoOrden.getTipoOrden());
			ps.setLong(2, tipoOrden.getCuentaCliente_idCuenta());
			ps.setString(3, tipoOrden.getDescripcionOrden());
			ps.setString(4, tipoOrden.getNombreOrden());
			ps.setString(5, tipoOrden.getTiempoOrdenProm());
			ps.setBigDecimal(6, tipoOrden.getMontoOrden());
			ps.setString(7, tipoOrden.getDivisa());
		    
			return ps;
		}
	}, holder);
	return holder.getKey().longValue();
}

	
}
