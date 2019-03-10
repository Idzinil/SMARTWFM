package com.sytecso.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;

import com.sytecso.dao.DAOCuadrilla;
import com.sytecso.beans.Cuadrilla;
import com.sytecso.component.UtileriaCompruebaDatos;
import com.sytecso.component.UtileriaSql;
import com.sytecso.exceptions.SytecsoException;


@Repository
public class DAOCuadrillaImpl  implements DAOCuadrilla{
	

	@Autowired	private JdbcTemplate jdbcTemplate;
	@Autowired	private DataSource dataSource;

	
	private static final String GET_ALL_CUADRILLAS = "SELECT * FROM cuadrilla";
	private static final String FIND_CUADRILLA_BY_NUMERO="select * from cuadrilla where  NumeroCuadrilla=?";
	private static final String INSERT_INTO_CUADRILLA_BY_CUENTA = "INSERT INTO cuadrilla (numeroCuadrilla, placas, CuentaCliente_idCuenta, seleccionable ) values(?,?,?,?)";
	private static final String INSERT_INTO_CUADRILLA = "INSERT INTO cuadrilla (numeroCuadrilla, placas, seleccionable,CuentaCliente_idCuenta ) values(?,?,?,null)";
	
	public List<Cuadrilla> traerTotalCuadrillas() {

		ArrayList<Cuadrilla> cuadrillas = new ArrayList<>();

		Connection connection = null;
		ResultSet rs = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(GET_ALL_CUADRILLAS,Statement.RETURN_GENERATED_KEYS);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Cuadrilla cuadrilla = new Cuadrilla();
				
				cuadrilla.setIdCuadrilla(rs.getLong("idCuadrilla"));
				cuadrilla.setNumeroCuadrilla(rs.getString("NumeroCuadrilla"));
				cuadrilla.setPlacas(rs.getString("Placas"));
				cuadrilla.setCuenta_idcuentacliente( UtileriaCompruebaDatos.compruebaLongNulo((rs.getLong("CuentaCliente_idCuenta"))));
				cuadrilla.setSeleccionable_cuadrilla(UtileriaCompruebaDatos.getBinaryValue(rs.getString("seleccionable")).toString());
				if(cuadrilla.getSeleccionable_cuadrilla().equals("0")) {
					cuadrilla.setSeleccionable_cuadrilla("SI");
				}else {
					cuadrilla.setSeleccionable_cuadrilla("NO");
				}
				cuadrillas.add(cuadrilla);
			}
		rs.close();

	} catch (Exception e) {
		SytecsoException.logClassAndMethodWithException(e);
	} finally {
		UtileriaSql.closeConection(connection, preparedStatement, rs);
	}
		return cuadrillas;
	}
	
	@Override
	public List<Map<String, Object>> findCuadrillabyNumero(String numeroCuadrilla) {
		List<Map<String, Object>> cuadrillas = new ArrayList<>();
		try {
			Object[] params = {numeroCuadrilla};
			cuadrillas = jdbcTemplate.queryForList(FIND_CUADRILLA_BY_NUMERO,params);
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
		return cuadrillas;
	}

	public long registrarCuadrilla (final Cuadrilla cuadrilla) {

		GeneratedKeyHolder holder = new GeneratedKeyHolder();

		jdbcTemplate.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(INSERT_INTO_CUADRILLA,
						Statement.RETURN_GENERATED_KEYS);
				ps.setString(1,cuadrilla.getNumeroCuadrilla());
				ps.setString(2, cuadrilla.getPlacas());
				ps.setInt(3, UtileriaCompruebaDatos.convertToBinary(cuadrilla.getSeleccionable()));

				return ps;
			}
		}, holder);

		long primaryKey = holder.getKey().longValue();

		return primaryKey;

	}
	
	public long registrarCuadrillaCuenta (final Cuadrilla cuadrilla) {

		GeneratedKeyHolder holder = new GeneratedKeyHolder();

		jdbcTemplate.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(INSERT_INTO_CUADRILLA_BY_CUENTA,
						Statement.RETURN_GENERATED_KEYS);
				ps.setString(1,cuadrilla.getNumeroCuadrilla());
				ps.setString(2, cuadrilla.getPlacas());
				ps.setLong(3,cuadrilla.getCuenta_idcuentacliente());
				ps.setInt(4, UtileriaCompruebaDatos.convertToBinary(cuadrilla.getSeleccionable()));
				

				return ps;
			}
		}, holder);

		long primaryKey = holder.getKey().longValue();

		return primaryKey;

	}
//	
//	@Override
//	public boolean updateCambioDivisaByIdDivisa(CambioDivisa cambioDivisa) {
//		Object[] params = {cambioDivisa.getBaseMonedaA(), cambioDivisa.getCambioAValorB(),cambioDivisa.getBaseMonedaB(), cambioDivisa.getIdCambioDivisa() };
//		try {
//			return jdbcTemplate.update(UPDATE_CAMBIO_DIVISA_BY_ID_DIVISA, params) > 0;
//		} catch (Exception e) {
//			SytecsoException.logClassAndMethodWithException(e);
//			return false;
//		}
//	}
//	

//	
//	@Override
//	public CambioDivisa findCambioDivisaByname(String nombreMoneda)   {
//		CambioDivisa cambioDiv = null;;
//		Connection connection= null;
//		ResultSet rs= null;
//		PreparedStatement preparedStatement=null;
//		String query ;
//		
//		if(nombreMoneda.equals("USD")) {
//			query=FIND_DIVISA_BY_NAME_MONEDA_B;
//		}else {
//			query=FIND_DIVISA_BY_NAME_MONEDA_A;
//		}
//		
//		SytecsoLogger.info(query);
//		SytecsoLogger.debug(query);
//			try {
//				connection = comboPooledDataSource.getConnection();
//				preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
//				preparedStatement.setString(1, nombreMoneda);
//				rs = preparedStatement.executeQuery();
//				while (rs.next()) {
//					cambioDiv = new CambioDivisa();
//					cambioDiv.setIdCambioDivisa(rs.getInt(1));
//					cambioDiv.setBaseMonedaA(rs.getInt(2));
//					cambioDiv.setCambioAValorB(rs.getBigDecimal(3));
//					cambioDiv.setBaseMonedaB(rs.getBigDecimal(4));
//					cambioDiv.setNombreMonedaA(rs.getString(5));
//					cambioDiv.setNombreMonedaB(rs.getString(6));
//					
//				}
//				
//				rs.close();
//
//			} catch (Exception e) {
//				SytecsoException.logClassAndMethodWithException(e);
//			} finally {
//				UtileriaSql.closeConection(connection, preparedStatement, rs);
//			}
//		return cambioDiv;
//		
//		
//	}
//	
}
