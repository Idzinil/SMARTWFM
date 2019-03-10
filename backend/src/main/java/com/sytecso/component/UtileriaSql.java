package com.sytecso.component;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.sytecso.beans.EventoSytecso;
import com.sytecso.exceptions.SytecsoException;

public class UtileriaSql {
	private UtileriaSql() {
		throw new IllegalStateException("UtileriaSql");
	}

	public static final int BATCH_SIZE = 15000;

	public static String obtenerCtaxID() {
		final String sql = "SELECT * FROM cuentacliente WHERE idCuenta=?";
		return sql;
	}

	public static String obtenerCtaxNumCta() {
		final String sql = "SELECT * FROM cuentacliente WHERE numCuenta=?";
		return sql;
	}

	public static String registrarTXCtasConstraint() {
		SytecsoLogger.info("En llamado a QueryUtils.registrarTXCtasConstraint...");
		return "INSERT INTO cuentacliente(numcuenta,feccreacion,estatuscta,aliascliente,region,ejecutivo,idsap,gerencia,departamento,empresa,SegmentoCliente) VALUES(?,NOW(),'AC',?,?,?,?,null,null,'INTEGRA',?)";
	}// END registrarTXCtasConstraint

	public static String registrarTXUnifacturacionConstraint() {
		return "INSERT INTO unidadfacturacion(ciclo,estatus,saldounidadfacturacion,diasvencimiento,moneda,tipocambio,cuenta_idcuenta,conceptoleyendadefacturacion,saldopendientefacturar,ultimafactura,fechaultimafacturacionrecurrente,fechaultimafacturacionnorecurrente) VALUES(null,?,0,null,null,null,?,null,0,null,null,null)";
	}// END registrarTXUnifacturacionConstraint

	public static String registrarTXDatosfiscalesConstraint() {
		return "insert into datosFiscales (RFC,razonSocial,calle,numeroInt,numeroExt,colonia,municipio,ciudad,estado,pais,codigoPostal,Cuenta_idCuenta) values(?,?,?,?,?,?,?,?,?,?,?,?)";
	}// END registrarTXDatosfiscalesConstraint

	public static String registrarTXDatosunidadConstraint() {
		return "INSERT INTO datosunidad (nombre,segundonombre,tercernombre,apellidopat,apellidomat,ultimafactura,fechaultimafactura,fechavencimiento,datosfiscales_iddatosfiscales) VALUES(?,?,?,?,?,?,NOW(),NOW(),?)";
	}// END registrarTXDatosunidadConstraint

	public static String registrarTXTelefonoConstraint() {
		return "INSERT INTO telefono (telefono,datosunidad_iddatosunidad) VALUES(?,?)";
	}// END registrarTXTelefonoConstraint

	public static String registrarTXEventosytecso() {
		SytecsoLogger.info("En llamado a QueryUtils.registrarTXEventosytecso...");
		return "INSERT INTO eventosistema (tipoevento,horainicio,horafin,CuentaCliente_idCuenta,registrobatch_idregistrobatch,fechaCreacionEvento) VALUES(?,NOW(),NOW(),?,?,NOW())";
	}// END registrarTXEventosytecso

	public static String registrarTXRegistrobatch() {
		SytecsoLogger.info("En llamado a QueryUtils.registrarTXRegistrobatch...");
		return "INSERT INTO registrobatch (nombreArchivo,tipoCarga,registrosInsertados,registrosRechazados) VALUES(?,CONCAT(?,' [',NOW(),']'),?,?)";
	}// END registrarTXRegistrobatch

	public static String registrarTXCtasWSConstraint() {
		SytecsoLogger.info("En llamado a QueryUtils.registrarTXCtasWSConstraint...");
		return "INSERT INTO cuenta(numcuenta,feccreacion,estatuscta,tipocuenta,saldocuenta,aliascliente,region,gerencia,departamento,paisctanacional,empresa,nivelcuentaadm,ejecutivo,cuentapadre) VALUES(?,NOW(),'AC',?,0,?,?,?,?,?,'MTRNT','1',?,?)";
	}// END registrarTXCtasWSConstraint

	public static String registrarTXUnifacturacionWSConstraint() {
		return "INSERT INTO unidadfacturacion(ciclo,estatus,saldounidadfacturacion,diasvencimiento,moneda,tipocambio,cuenta_idcuenta,conceptoleyendadefacturacion,saldopendientefacturar,ultimafactura,fechaultimafacturacionrecurrente,fechaultimafacturacionnorecurrente) VALUES(?,'AC',0,?,?,?,?,?,0,?,?,?)";
	}// END registrarTXUnifacturacionConstraint

	public static String deleteProductoHasImpuesto(Long[] impuestos) {
		StringBuilder query = new StringBuilder("DELETE FROM producto_has_impuesto WHERE Producto_idProducto=?");
		if (impuestos != null) {
			for (Long impuesto : impuestos) {
				query.append(" AND Impuesto_idImpuesto!=").append(impuesto);
			}
		}
		return query.toString();
	}

	public static void closeConection(Connection connection, PreparedStatement preparedStatement) {
		try {
			if (connection != null)
				connection.close();
			if (preparedStatement != null)
				preparedStatement.close();
		} catch (Exception e) {
			SytecsoLogger.info("OCURRIO UN ERRRO AL CERRAR LAS CONEXIONES A LA BD");
			SytecsoException.logClassAndMethodWithException(e);
		}
	}

	public static void closeConection(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) {
		try {
			if (connection != null)
				connection.close();
			if (preparedStatement != null)
				preparedStatement.close();
			if (resultSet != null)
				resultSet.close();
		} catch (Exception e) {
			SytecsoLogger.info("OCURRIO UN ERRRO AL CERRAR LAS CONEXIONES A LA BD");
			SytecsoException.logClassAndMethodWithException(e);
		}
	}



	public static void closePreparedStatement(PreparedStatement preparedStatement) {
		try {
			if (preparedStatement != null)
				preparedStatement.close();
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
	}

	public static void closeResultSet(ResultSet resultSet) {
		try {
			if (resultSet != null)
				resultSet.close();
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
	}

	public static void createPreparedStatementInsertEventoSytecsoBatch(PreparedStatement preparedStatement,
			EventoSytecso eventoSytecso) {
		try {
			preparedStatement.setString(1,
					eventoSytecso.getTipoEvento() != null && !eventoSytecso.getTipoEvento().equals("")
							? eventoSytecso.getTipoEvento()
							: "NULO");
			if (!(eventoSytecso.getCuenta_idCuenta() == null || eventoSytecso.getCuenta_idCuenta() < 1))
				preparedStatement.setLong(2, eventoSytecso.getCuenta_idCuenta());
			else
				preparedStatement.setNull(2, Types.BIGINT);
			if (!(eventoSytecso.getRegistroBatch_idregistroBatch() == null
					|| eventoSytecso.getRegistroBatch_idregistroBatch() < 1))
				preparedStatement.setLong(3, eventoSytecso.getRegistroBatch_idregistroBatch());
			else
				preparedStatement.setNull(3, Types.BIGINT);
			if (!(eventoSytecso.getEvento_idEvento() == null || eventoSytecso.getEvento_idEvento() < 1))
				preparedStatement.setLong(4, eventoSytecso.getEvento_idEvento());
			else
				preparedStatement.setNull(4, Types.BIGINT);
			if (!(eventoSytecso.getCompra_idCompra() == null || eventoSytecso.getCompra_idCompra() < 1))
				preparedStatement.setLong(5, eventoSytecso.getCompra_idCompra());
			else
				preparedStatement.setNull(5, Types.BIGINT);
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
	}

	public static List<EventoSytecso> setGeneratedKeysEventoSytecso(ResultSet resultSet,
			List<EventoSytecso> eventosSytecso) {
		try {
			int i = 0;
			while (resultSet.next()) {
				eventosSytecso.get(i).setIdEventoSytecso(resultSet.getLong(1));
				i += 1;
			}
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		} finally {
			closeResultSet(resultSet);
		}
		return eventosSytecso;
	}

	public static List<BigDecimal> getGeneratedKeys(ResultSet resultSet) {
		List<BigDecimal> ids = new ArrayList<>();
		try {
			while (resultSet.next()) {
				ids.add(resultSet.getBigDecimal(1));
			}
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		} finally {
			closeResultSet(resultSet);
		}
		return ids;
	}

	public static void conectionRollBack(Connection connection) {
		try {
			connection.rollback();
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
	}

	public static void connectionCommit(boolean status, Connection connection) {
		try {
			if (status) {
				SytecsoLogger.info("Iniciando commit transaccional");
				connection.commit();
				SytecsoLogger.info("Terminando commit transaccional");
			}
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}

	}

	public static void closePreparedStatemetAndResultSet(PreparedStatement preparedStatement, ResultSet resultSet) {
		try {
			if (preparedStatement != null)
				preparedStatement.close();
			if (resultSet != null)
				resultSet.close();
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
	}




	public static void sqlException() throws SQLException {
		throw new SQLException();
	}



	public static void closeConnection(Connection connection) {
		try {
			if (connection != null)
				connection.close();
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
	}

	public static int validafindColumnResultSet(ResultSet resultSet, String nameColumn) {
		try {
			return resultSet.findColumn(nameColumn);

		} catch (SQLException e) {
			SytecsoLogger.error("La columna " + nameColumn + " no existe ", e);
		}

		return -1;

	}



}
