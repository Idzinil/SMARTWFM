/**
 * 
 * Created-By: Sytecso
 * Date:       06/03/2019
 */
package com.sytecso.dao.impl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sytecso.beans.Cuenta;
import com.sytecso.component.SytecsoLogger;
import com.sytecso.component.UtileriaSql;
import com.sytecso.component.VOCuentasConstraint;
import com.sytecso.dao.DAOCuenta;
import com.sytecso.dto.CuentaDTO;
import com.sytecso.exceptions.SytecsoException;
import com.sytecso.component.UtileriaCompruebaDatos;
import java.util.SortedSet;
import java.util.TreeSet;

@Repository
@Transactional
public class DAOCuentaImpl implements DAOCuenta {
	@Autowired	private DataSource dataSource;
	@Autowired	private DAOEventoSytecsoImpl daocesb;
	@Autowired	private JdbcTemplate jdbcTemplate;
	private static final String FIND_CUENTA_BY_NUMCUENTA = "SELECT idCuenta FROM cuentacliente WHERE numCuenta=?";
		
	@Transactional
	public long registrarCuenta(Cuenta cta) throws Exception {
		String sql = "INSERT INTO cuentacliente (numCuenta,fecCreacion,estatusCta,segmentoCliente, aliasCliente,region,gerencia, departamento, empresa,ejecutivo,idSAP)" + 
				"values(?, NOW(),'AC',?,?,?,?,?,?,?,?)";
		long key = -1L;
		Connection con = null;
		try {
			con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pst.setString(1, cta.getNumCuenta());
			pst.setInt(2, UtileriaCompruebaDatos.convertToBinary(cta.getSegmentoCliente()));
			pst.setString(3, cta.getAliasCliente());
			pst.setString(4, cta.getRegion());
			pst.setString(5, cta.getGerencia());
			pst.setString(6, cta.getDepartamento());
			pst.setString(7, cta.getEmpresa());
			pst.setString(8, cta.getEjecutivo());
			pst.setString(9, cta.getIdSAP());
			pst.executeUpdate();
			ResultSet rs = pst.getGeneratedKeys();
			if (rs != null && rs.next()) {
				key = rs.getLong(1);
			}

			pst.close();
		} catch (Exception e) {
			throw e;
		} finally {
			if (con != null) {
				con.close();
			}
		}

		return key;

	}

	public boolean existeCuenta(Cuenta cta) {
		JdbcTemplate jt = new JdbcTemplate(dataSource);
		String qry = "SELECT count(*) FROM cuentacliente CTA, datosFiscales DF, unidadFacturacion UF WHERE "
				+ "CTA.idCuenta=UF.Cuenta_idCuenta AND CTA.idCuenta=DF.Cuenta_idCuenta AND "
				+ "UF.idunidadFacturacion=DF.unidadFacturacion_idunidadFacturacion AND UPPER(CTA.estatusCta)!='CA' "
				+ "AND TRIM(UPPER(CTA.numCuenta))=TRIM(UPPER('"
				+ cta.getNumCuenta() + "')) ";
		Integer cnt = jt.queryForObject(qry, Integer.class);
		return cnt != null && cnt > 0;
	}

	public void actualizarCuenta() throws Exception {
		String sql = "";
		Connection con = null;
		try {
			con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, "");
			pst.executeUpdate();
			pst.close();

		} catch (Exception e) {
			throw e;
		} finally {
			if (con != null) {
				con.close();
			}

		}

	}

	
	public Cuenta obtenerCuentaPorId(Long idCuenta) {
		Cuenta cuenta = null;
		Connection connection= null;
		ResultSet rs= null;
		PreparedStatement preparedStatement=null;
		
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(com.sytecso.component.UtileriaSql.obtenerCtaxID(), Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setLong(1,idCuenta);	
			rs= preparedStatement.executeQuery();
			while(rs.next()) {
				cuenta= new Cuenta();
				cuenta.setIdCuenta(rs.getBigDecimal(1));
				cuenta.setNumCuenta(rs.getString(2));
				cuenta.setFecCreacion(rs.getString(3));
				cuenta.setEstatusCta(rs.getString(4));
				cuenta.setAliasCliente(rs.getString(7));
				cuenta.setRegion(rs.getString(8));
				cuenta.setGerencia(rs.getString(9));
				cuenta.setDepartamento(rs.getString(10));
				cuenta.setEmpresa(rs.getString(12));
				cuenta.setEjecutivo(rs.getString(14));
				cuenta.setIdSAP(rs.getString(19));
				
			}
			//cuenta = jdbcTemplate.queryForObject(com.sytecso.component.UtileriaSql.obtenerCtaxID(),	BeanPropertyRowMapper.newInstance(Cuenta.class), idCuenta);
			rs.close();

		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		} finally {
			UtileriaSql.closeConection(connection, preparedStatement, rs);
		}
		return cuenta;

	}

	
	public String registrarCargaInicialCuentas(final VOCuentasConstraint cta) {
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		JdbcTemplate jt = new JdbcTemplate(dataSource);
		SytecsoLogger.info("INICIA TRANSACCION en DAOCuentaImpl.registrarCargaInicialCuentas...");
		jt.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement statement = con.prepareStatement(com.sytecso.component.
						UtileriaSql.registrarTXCtasConstraint(),Statement.RETURN_GENERATED_KEYS);
				statement.setString(1, cta.getCuenta().getNumCuenta());
				statement.setString(2, cta.getCuenta().getAliasCliente());
				statement.setString(3, cta.getCuenta().getRegion());
				statement.setString(4, cta.getCuenta().getEjecutivo());
				statement.setString(5, cta.getCuenta().getIdSAP());
				statement.setInt(6, UtileriaCompruebaDatos.convertToBinary(cta.getCuenta().getSegmentoCliente()));
				return statement;
				}
			}, holder);
		final long pKey_IdCuenta = holder.getKey().longValue();
		cta.getEventosytecso().setCuenta_idCuenta(pKey_IdCuenta);
		long IdEventoSytecso = daocesb.registrarEventoSytecso(cta.getEventosytecso());
	
		jt.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement statement = con.prepareStatement(
						com.sytecso.component.UtileriaSql.registrarTXDatosfiscalesConstraint(),
						Statement.RETURN_GENERATED_KEYS);
				statement.setString(1, cta.getCuenta().getDatosFiscales().getRfc());
				statement.setString(2, cta.getCuenta().getDatosFiscales().getRazonSocial());
				statement.setString(3, cta.getCuenta().getDatosFiscales().getCalle());
				statement.setString(4, cta.getCuenta().getDatosFiscales().getNumeroInt());
				statement.setString(5, cta.getCuenta().getDatosFiscales().getNumeroExt());
				statement.setString(6, cta.getCuenta().getDatosFiscales().getColonia());
				statement.setString(7, cta.getCuenta().getDatosFiscales().getMunicipio());
				statement.setString(8, cta.getCuenta().getDatosFiscales().getCiudad());
				statement.setString(9, cta.getCuenta().getDatosFiscales().getEstado());
				statement.setString(10, cta.getCuenta().getDatosFiscales().getPais());
				statement.setString(11, cta.getCuenta().getDatosFiscales().getCodigoPostal());
				statement.setLong(12, pKey_IdCuenta);
				return statement;
			}
		}, holder);
		cta.getEventosytecso().setIdEventoSytecso(IdEventoSytecso);
		daocesb.actualizarEventoSytecso(cta.getEventosytecso());
		return "" + pKey_IdCuenta;
	}// END public String registrarCargaInicialCuentas(final VOCuentasConstraint
		// cta){

	
	/**********************************************************
	 * This method will get the  data of the clients to bee shown in the screen
	 */
	@Override
	public List<CuentaDTO> buscaCuentasClientesEmpresas() throws Exception {
		String sql = "select idCuenta, numCuenta,  aliasCliente,SegmentoCliente " + 
				"from CuentaCliente";
		Connection con = null;
		ResultSet rs = null;
		List<CuentaDTO> cuentasClientes =new ArrayList<CuentaDTO>();
		PreparedStatement pst=null;
		try {
			
			con = dataSource.getConnection();
			 pst = con.prepareStatement(sql);
			rs= pst.executeQuery();
			while(rs.next()) {
				CuentaDTO cta =new CuentaDTO();
				cta.setIdCtaCliente(rs.getBigDecimal(1));
				cta.setCuentaCte(rs.getString(2));
				cta.setAliasCuenta(rs.getString(3));
				cta.setSegmentoCta(rs.getString(4));
				cuentasClientes.add(cta);
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

		return cuentasClientes;

	}
	
	@Override
	public SortedSet<String> obtenerCuentas() throws Exception {
		SortedSet<String> miKEYS = new TreeSet<>();
		ResultSet rs = null;
		String sql = "SELECT CONCAT(UPPER(CTA.numCuenta),'|',UPPER(DF.rfc)) as DATOS FROM cuentacliente CTA, datosFiscales DF WHERE CTA.idCuenta=DF.Cuenta_idCuenta AND UPPER(CTA.estatusCta)='AC' ORDER BY CTA.idCuenta desc";
//		System.out.println(sql);
		Connection con = null;
		try {
			con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				miKEYS.add(rs.getString(1));
			}
			rs.close();
			if (pst != null) {
				pst.close();
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return miKEYS;
	}// END public SortedSet<String> obtenerCuentas() throws Exception {
	
	@Override
	public Boolean findCuentaByNumCuenta(String numCuenta) {
		BigDecimal idCuenta = null;
		try {
			idCuenta= jdbcTemplate.queryForObject(FIND_CUENTA_BY_NUMCUENTA, BigDecimal.class, numCuenta) ;
		} catch (EmptyResultDataAccessException e) {
			SytecsoException.logClassAndMethodWithException(e);
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
		return idCuenta!=null&&idCuenta.compareTo(BigDecimal.ZERO)>0;
	}

	


}
