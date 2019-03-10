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
import com.sytecso.beans.InsumosCte;
import com.sytecso.beans.InsumosEmp;
import com.sytecso.component.SytecsoLogger;
import com.sytecso.component.UtileriaCompruebaDatos;
import com.sytecso.component.UtileriaSql;
import com.sytecso.dao.DAOInsumos;
import com.sytecso.exceptions.SytecsoException;

@Repository
public class DAOInsumosImpl implements DAOInsumos {

	@Autowired	private DataSource dataSource;
	@Autowired	private JdbcTemplate jdbcTemplate;

	private static final String GET_ALL_INSUMOS = "SELECT * FROM insumoscte";
	private static final String FIND_INSUMOS_BY_NAME = "select * from insumoscte where NombreInsumo= ?";
	private static final String REGISTRAR_INSUMO = "INSERT INTO insumoscte (identificadorSAP, NombreInsumo, DescripcionInsumo, ClaveInsumo, TotalInsumo, UnidadMedidaInsumo, CuentaCliente_idCuenta,registroBatch_idregistroBatch) VALUES (?, ?, ?, ?, ?, ?, ?,null)";
	private static final String UPDATE_INSUMOS_BY_ID_INSUMO ="UPDATE insumoscte SET TotalInsumo=? WHERE idInsumosCte=? and CuentaCliente_idCuenta=? ";
	private static final String BUSCAR_INSUMO_POR_FK_AND_CTA = "select idInsumosCte, identificadorSAP, NombreInsumo, DescripcionInsumo, ClaveInsumo, TotalInsumo, UnidadMedidaInsumo, CuentaCliente_idCuenta from insumoscte where NombreInsumo=? and CuentaCliente_idCuenta=? and identificadorSAP= ? and ClaveInsumo=?";
	private static final String GET_ALL_INSUMOS_EMP = "select * from insumosempresa";
	private static final String BUSCAR_INSUMO_EMP_POR_FK = "select idInsumosCte, identificadorSAP, NombreInsumo, DescripcionInsumo, ClaveInsumo, TotalInsumo, UnidadMedidaInsumo from insumosempresa where NombreInsumo=?  and identificadorSAP= ? and ClaveInsumo=?";
	private static final String REGISTRAR_INSUMO_EMP = "INSERT INTO insumosempresa (identificadorSAP, NombreInsumo, DescripcionInsumo, ClaveInsumo, TotalInsumo, UnidadMedidaInsumo, categoria, grupo,registroBatch_idregistroBatch) VALUES (?, ?, ?, ?, ?, ?,?,?,null)";
	private static final String UPDATE_INSUMOS_EMP_BY_ID_INSUMO = "UPDATE insumosempresa SET TotalInsumo=? WHERE idInsumosCte=? ";
	protected static final String INSERT_INTO_INSUMOSEMP_BATCH = "INSERT INTO insumosempresa (identificadorSAP, NombreInsumo, DescripcionInsumo, ClaveInsumo, TotalInsumo, UnidadMedidaInsumo, categoria, grupo,registroBatch_idregistroBatch) VALUES (?, ?, ?, ?, ?, ?,?,?,null)";
	protected static final String INSERT_INTO_INSUMOSCTE_BATCH = "INSERT INTO insumoscte (identificadorSAP, NombreInsumo, DescripcionInsumo, ClaveInsumo, TotalInsumo, UnidadMedidaInsumo, CuentaCliente_idCuenta,registroBatch_idregistroBatch) VALUES (?, ?, ?, ?, ?, ?, ?,null)";
		
	
	public List<InsumosCte> findCuentasInsumos(String condiciones)  {
		String query = "select * from cuentacliente cta, datosfiscales df  where cta.idCuenta=df.Cuenta_idCuenta"
				+ " and estatusCta='AC' "+ condiciones ;

		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<InsumosCte> lstCtasInsum = new ArrayList<>();
		try {
			con = dataSource.getConnection();
			pst = con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				InsumosCte insum = new InsumosCte();
				insum.setCuenta(new Cuenta());
				insum.getCuenta().setIdCuenta(rs.getBigDecimal("idCuenta"));
				insum.getCuenta().setNumCuenta(rs.getString("numCuenta"));
				insum.getCuenta().setAliasCliente(rs.getString("aliasCliente"));
				insum.getCuenta().setDatosFiscales(new DatosFiscales());
				insum.getCuenta().getDatosFiscales().setRfc(rs.getString("RFC"));
				insum.getCuenta().getDatosFiscales().setRazonSocial(rs.getString("razonSocial"));
				lstCtasInsum.add(insum);

			}
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		} finally {
			UtileriaSql.closeConection(con, pst, rs);
		}
		return lstCtasInsum;
	}
	
	public List<InsumosCte> traerTotalInsumos() {
		ArrayList<InsumosCte> lstInsumos = new ArrayList<>();
		Connection connection = null;
		ResultSet rs = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(GET_ALL_INSUMOS,Statement.RETURN_GENERATED_KEYS);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				InsumosCte insumoscte = new InsumosCte();
				insumoscte.setIdInsumosCte(rs.getBigDecimal("idInsumosCte"));
				insumoscte.setIdentificadorSAP(rs.getString("identificadorSAP"));
				insumoscte.setNombreInsumo(rs.getString("NombreInsumo"));
				insumoscte.setDescripcionInsumo(rs.getString("DescripciónInsumo"));
				insumoscte.setClaveInsumo(rs.getString("ClaveInsumo"));
				insumoscte.setTotalInsumo(rs.getBigDecimal("TotalInsumo"));
				insumoscte.setUnidadMedidaInsumo(rs.getString("UnidadMedidaInsumo"));
				insumoscte.setCuentaCliente_idCuenta(rs.getInt("CuentaCliente_idCuenta"));
				
				lstInsumos.add(insumoscte);
			}
		rs.close();

	} catch (Exception e) {
		SytecsoException.logClassAndMethodWithException(e);
	} finally {
		UtileriaSql.closeConection(connection, preparedStatement, rs);
	}
		return lstInsumos;

	}

	@Override
	public List<InsumosCte> findInsumosbyName(String nombreInsumo) {
		ArrayList<InsumosCte> listInsumos = new ArrayList<InsumosCte>();
		ResultSet rs = null;
		Connection connection =null;
		PreparedStatement preparedStatement = null;
		try {
			connection=dataSource.getConnection();
			 preparedStatement = connection.prepareStatement(FIND_INSUMOS_BY_NAME,
					Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, nombreInsumo);
			rs = preparedStatement.executeQuery();
			while(rs.next()) {
				InsumosCte insum = new InsumosCte();
				insum.setIdInsumosCte(rs.getBigDecimal("idInsumosCte"));
				insum.setIdentificadorSAP(rs.getString("identificadorSAP"));
				insum.setNombreInsumo(rs.getString("nombreInsumo"));
				insum.setDescripcionInsumo(rs.getString("descripcionInsumo"));
				insum.setClaveInsumo(rs.getString("claveInsumo"));
				insum.setTotalInsumo(rs.getBigDecimal("totalInsumo"));
				insum.setUnidadMedidaInsumo(rs.getString("unidadMedidaInsumo"));
				insum.setCuentaCliente_idCuenta(rs.getLong("cuentaCliente_idCuenta"));
				listInsumos.add(insum);
				
			}
			rs.close();

		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		} finally {
			UtileriaSql.closeConection(connection, preparedStatement, rs);
		}
		return listInsumos;
	}

	@Transactional
	public long registrarInsumo(InsumosCte insumo)  {
		long key = -1L;
		Connection con = null;
		Connection connection =null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			preparedStatement = con.prepareStatement(REGISTRAR_INSUMO, Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, insumo.getIdentificadorSAP());
			preparedStatement.setString(2, insumo.getNombreInsumo());
			preparedStatement.setString(3, insumo.getDescripcionInsumo());
			preparedStatement.setString(4, insumo.getClaveInsumo());
			preparedStatement.setBigDecimal(5, insumo.getTotalInsumo());
			preparedStatement.setString(6, insumo.getUnidadMedidaInsumo());
			preparedStatement.setLong(7, insumo.getCuentaCliente_idCuenta());
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
	public boolean updateInsumosByIdInsumo(InsumosCte insumosCte) {
		Object[] params = { insumosCte.getTotalInsumo(), insumosCte.getIdInsumosCte(), insumosCte.getCuentaCliente_idCuenta() };
		try {
			return jdbcTemplate.update(UPDATE_INSUMOS_BY_ID_INSUMO, params) > 0;
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
			return false;
		}
	}

	@Override
	public boolean updateInsumosEmpByIdInsumo(InsumosEmp insumosEmp) {
		Object[] params = { insumosEmp.getTotalInsumo(), insumosEmp.getIdInsumos() };
		try {
			return jdbcTemplate.update(UPDATE_INSUMOS_EMP_BY_ID_INSUMO, params) > 0;
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
			return false;
		}
	}
	@Override
	public InsumosCte obtenerInsumobNameandCuenta(InsumosCte insumos) {
		InsumosCte insum = new InsumosCte();
		Connection connection = null;
		ResultSet rs =null;
		PreparedStatement preparedStatement=null;
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(BUSCAR_INSUMO_POR_FK_AND_CTA,Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, insumos.getNombreInsumo());
			preparedStatement.setLong(2,insumos.getCuentaCliente_idCuenta());
			preparedStatement.setString(3,insumos.getIdentificadorSAP());
			preparedStatement.setString(4,insumos.getClaveInsumo());
			rs = preparedStatement.executeQuery();
			while(rs.next()) {
				insum.setIdInsumosCte(UtileriaCompruebaDatos.compruebaDataNulo(rs.getBigDecimal("idInsumosCte")) );
				insum.setIdentificadorSAP(UtileriaCompruebaDatos.compruebaDataNulo(rs.getString("identificadorSAP")));
				insum.setNombreInsumo(UtileriaCompruebaDatos.compruebaDataNulo(rs.getString("NombreInsumo")));
				insum.setDescripcionInsumo(UtileriaCompruebaDatos.compruebaDataNulo(rs.getString("DescripciónInsumo")));
				insum.setClaveInsumo(UtileriaCompruebaDatos.compruebaDataNulo(rs.getString("ClaveInsumo")));
				insum.setTotalInsumo(UtileriaCompruebaDatos.compruebaDataNulo(rs.getBigDecimal("TotalInsumo")));
				insum.setUnidadMedidaInsumo(UtileriaCompruebaDatos.compruebaDataNulo(rs.getString("UnidadMedidaInsumo")));
				insum.setCuentaCliente_idCuenta(UtileriaCompruebaDatos.compruebaDataNulo(rs.getLong("CuentaCliente_idCuenta")));
			}
		
		rs.close();

	} catch (Exception e) {
		SytecsoException.logClassAndMethodWithException(e);
	} finally {
		UtileriaSql.closeConection(connection, preparedStatement, rs);
	}
		SytecsoLogger.logInfo(this.getClass(), "obtenerProductoId");
		return insum;
	}
	
	
	public List<InsumosEmp> traerTotalInsumosEmpresa() {
		ArrayList<InsumosEmp> lstInsumos = new ArrayList<>();
		Connection connection = null;
		ResultSet rs = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(GET_ALL_INSUMOS_EMP,Statement.RETURN_GENERATED_KEYS);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				InsumosEmp insumosEmp = new InsumosEmp();
				insumosEmp.setIdInsumos(rs.getBigDecimal("idInsumosCte"));
				insumosEmp.setIdentificadorSAP(rs.getString("identificadorSAP"));
				insumosEmp.setNombreInsumo(rs.getString("NombreInsumo"));
				insumosEmp.setDescripcionInsumo(rs.getString("DescripcionInsumo"));
				insumosEmp.setClaveInsumo(rs.getString("ClaveInsumo"));
				insumosEmp.setTotalInsumo(rs.getBigDecimal("TotalInsumo"));
				insumosEmp.setUnidadMedidaInsumo(rs.getString("UnidadMedidaInsumo"));
				insumosEmp.setCategoria(rs.getString("categoria"));
				insumosEmp.setGrupo(rs.getString("grupo"));
				
				lstInsumos.add(insumosEmp);
			}
		rs.close();

	} catch (Exception e) {
		SytecsoException.logClassAndMethodWithException(e);
	} finally {
		UtileriaSql.closeConection(connection, preparedStatement, rs);
	}
		return lstInsumos;

	}
	
	@Override
	public InsumosEmp obtenerInsumoEmpbyName(InsumosEmp insumos) {
		InsumosEmp insum = new InsumosEmp();
		Connection connection = null;
		ResultSet rs =null;
		PreparedStatement preparedStatement=null;
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(BUSCAR_INSUMO_EMP_POR_FK,Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, insumos.getNombreInsumo());
			preparedStatement.setString(2,insumos.getIdentificadorSAP());
			preparedStatement.setString(3,insumos.getClaveInsumo());
			rs = preparedStatement.executeQuery();
			while(rs.next()) {
				insum.setIdInsumos(UtileriaCompruebaDatos.compruebaDataNulo(rs.getBigDecimal("idInsumosCte")) );
				insum.setIdentificadorSAP(UtileriaCompruebaDatos.compruebaDataNulo(rs.getString("identificadorSAP")));
				insum.setNombreInsumo(UtileriaCompruebaDatos.compruebaDataNulo(rs.getString("NombreInsumo")));
				insum.setDescripcionInsumo(UtileriaCompruebaDatos.compruebaDataNulo(rs.getString("DescripcionInsumo")));
				insum.setClaveInsumo(UtileriaCompruebaDatos.compruebaDataNulo(rs.getString("ClaveInsumo")));
				insum.setTotalInsumo(UtileriaCompruebaDatos.compruebaDataNulo(rs.getBigDecimal("TotalInsumo")));
				insum.setUnidadMedidaInsumo(UtileriaCompruebaDatos.compruebaDataNulo(rs.getString("UnidadMedidaInsumo")));
			}
		
		rs.close();

	} catch (Exception e) {
		SytecsoException.logClassAndMethodWithException(e);
	} finally {
		UtileriaSql.closeConection(connection, preparedStatement, rs);
	}
		SytecsoLogger.logInfo(this.getClass(), "obtenerInsumoEmpId");
		return insum;
	}

	@Transactional
	public long registrarInsumoEmp(InsumosEmp insumo)  {
		long key = -1L;
		Connection con = null;
		Connection connection =null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			preparedStatement = con.prepareStatement(REGISTRAR_INSUMO_EMP, Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1,insumo.getIdentificadorSAP());
			preparedStatement.setString(2, insumo.getNombreInsumo());
			preparedStatement.setString(3, insumo.getDescripcionInsumo());
			preparedStatement.setString(4, insumo.getClaveInsumo());
			preparedStatement.setBigDecimal(5, insumo.getTotalInsumo());
			preparedStatement.setString(6, insumo.getUnidadMedidaInsumo());
			preparedStatement.setString(7, insumo.getCategoria());
			preparedStatement.setString(8, insumo.getGrupo());
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
	public Long registrarInsumosEmpresaBatch(final InsumosEmp insumosEmp) {
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(INSERT_INTO_INSUMOSEMP_BATCH,
						Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, insumosEmp.getIdentificadorSAP());
				ps.setString(2, insumosEmp.getNombreInsumo());
				ps.setString(3, insumosEmp.getDescripcionInsumo());
				ps.setString(4, insumosEmp.getClaveInsumo());
				ps.setBigDecimal(5, insumosEmp.getTotalInsumo());
				ps.setString(6, insumosEmp.getUnidadMedidaInsumo());
				ps.setString(7, insumosEmp.getCategoria());
				ps.setString(8, insumosEmp.getGrupo());
				return ps;
			}
		}, holder);
		return holder.getKey().longValue();
	}

	@Override
	public Long registrarInsumosCteBatch(final InsumosCte insumosCte) {
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(INSERT_INTO_INSUMOSCTE_BATCH,
						Statement.RETURN_GENERATED_KEYS);
				int r = 100;
				for (int i=1; i <= r; i++) {
				ps.setString(1, insumosCte.getIdentificadorSAP());
				ps.setString(2, insumosCte.getNombreInsumo());
				ps.setString(3, insumosCte.getDescripcionInsumo());
				ps.setString(4, insumosCte.getClaveInsumo());
				ps.setBigDecimal(5, insumosCte.getTotalInsumo());
				ps.setString(6, insumosCte.getUnidadMedidaInsumo());
				ps.setLong(7, insumosCte.getCuentaCliente_idCuenta());
				//ps.setCuenta(8, insumosCte.getCuenta());
				ps.addBatch();
				}
				
				connection.close();
				return ps;
				
			}
		}, holder);
		return holder.getKey().longValue();
	}
}
