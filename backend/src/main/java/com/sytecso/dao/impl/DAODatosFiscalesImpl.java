/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2019
 */
package com.sytecso.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sytecso.dao.DAODatosFiscales;
import com.sytecso.exceptions.SytecsoException;
import com.sytecso.service.ServiceEventoSytecso;
import com.sytecso.beans.Cuenta;
import com.sytecso.beans.DatosFiscales;
import com.sytecso.beans.EventoSytecso;
import com.sytecso.component.UtileriaSql;

@Repository
public class DAODatosFiscalesImpl implements DAODatosFiscales {

	@Autowired private DataSource dataSource;
	@Autowired private JdbcTemplate jdbcTemplate;
	@Autowired private ServiceEventoSytecso serviceEventoSytecso;
	
	private static final String FIND_DATOS_FISCALES_FOR_REPORTE_FACTURACION_BY_ID_CUENTA="SELECT iddatosFiscales,razonSocial,unidadFacturacion_idunidadFacturacion FROM DatosFiscales WHERE Cuenta_idCuenta=?";
	private static final String FIND_DATOS_FISCALES_BY_RFC="SELECT Cuenta_idCuenta FROM datosFiscales WHERE rfc=?";
	private static final String FIND_DATOS_FISCALES_BY_ID_UNIDAD_FACTURACION="SELECT iddatosFiscales,rfc,razonSocial,calle,numeroInt,numeroExt,colonia,municipio,ciudad,estado,pais,codigoPostal FROM DatosFiscales WHERE Cuenta_idCuenta=?";
	private static final String UPDATE_DATOS_FISCALES_BY_ID_DATOS_FISCALES="UPDATE datosFiscales set RFC=?, razonSocial=?, calle=?, numeroInt=?, numeroExt=?, colonia=?, municipio=?, ciudad=?, estado=?, pais=?, codigoPostal=? WHERE idDatosFiscales=?";
	
	
	@Transactional
	public void registrarDatosFiscales(DatosFiscales df) throws Exception {

		String sql = "INSERT INTO datosFiscales (RFC, razonSocial, calle, numeroInt, numeroExt, colonia, municipio, ciudad, estado, pais, codigoPostal) "
				+ " VALUES(?,?,?,?,?,?,?,?,?,?,?);";

		Connection con = null;

		try {

			con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);

			pst.setString(1, df.getRfc());
			pst.setString(2, df.getRazonSocial());
			pst.setString(3, df.getCalle());
			pst.setString(4, df.getNumeroInt());
			pst.setString(5, df.getNumeroExt());
			pst.setString(6,  df.getColonia());
			pst.setString(7, df.getMunicipio());
			pst.setString(7, df.getCiudad());
			pst.setString(7, df.getEstado());
			pst.setString(7, df.getPais());
			pst.setString(7, df.getCodigoPostal());

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

	@Override
	public DatosFiscales findDatosFsicalesForReporteFacturacionByIdCuenta(Long idCuenta) {
		DatosFiscales datosFiscales = null;
		try {
			datosFiscales = jdbcTemplate.queryForObject(FIND_DATOS_FISCALES_FOR_REPORTE_FACTURACION_BY_ID_CUENTA, BeanPropertyRowMapper.newInstance(DatosFiscales.class),idCuenta);
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
		return datosFiscales;
	}

	public long  regAccountUniFisData(Cuenta cta) throws SQLException {
		String sql = "insert into datosFiscales (RFC,razonSocial,calle,numeroInt,numeroExt,colonia,municipio,ciudad,estado,pais,codigoPostal,Cuenta_idCuenta) " +
				"values(?,?,?,?,?,?,?,?,?,?,?,?) ";
		long key = -1L;
		Connection con = null;
		try {
			con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			pst.setString (1,cta.getDatosFiscales().getRfc());
			pst.setString (2,cta.getDatosFiscales().getRazonSocial());
			pst.setString (3,cta.getDatosFiscales().getCalle());	
			pst.setString (4,cta.getDatosFiscales().getNumeroInt());	
			pst.setString (5,cta.getDatosFiscales().getNumeroExt());	
			pst.setString (6,cta.getDatosFiscales().getColonia());	
			pst.setString (7,cta.getDatosFiscales().getMunicipio());	
			pst.setString (8,cta.getDatosFiscales().getCiudad());	
			pst.setString (9,cta.getDatosFiscales().getEstado());	
			pst.setString (10,cta.getDatosFiscales().getPais());	
			pst.setString (11,cta.getDatosFiscales().getCodigoPostal());
			pst.setLong(12,cta.getDatosFiscales().getCuenta_idCuenta());
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
	@Transactional
	public boolean  actualizaDatosFiscales(Cuenta cta){
		boolean status = true;
		String sql = "update datosFiscales set RFC=?, razonSocial=?, calle=?, numeroInt=?, numeroExt=?, colonia=?, municipio=?, ciudad=?, estado=?, pais=?, codigoPostal=? "
				+ "where idDatosFiscales="+cta.getDatosFiscales().getIddatosFiscales()+" ";
		Connection con = null;
		try {
			con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString (1,cta.getDatosFiscales().getRfc());
			pst.setString (2,cta.getDatosFiscales().getRazonSocial());
			pst.setString (3,cta.getDatosFiscales().getCalle());	
			pst.setString (4,cta.getDatosFiscales().getNumeroInt());	
			pst.setString (5,cta.getDatosFiscales().getNumeroExt());	
			pst.setString (6,cta.getDatosFiscales().getColonia());	
			pst.setString (7,cta.getDatosFiscales().getMunicipio());	
			pst.setString (8,cta.getDatosFiscales().getCiudad());	
			pst.setString (9,cta.getDatosFiscales().getEstado());	
			pst.setString (10,cta.getDatosFiscales().getPais());	
			pst.setString (11,cta.getDatosFiscales().getCodigoPostal());
			pst.executeUpdate();
			pst.close();
		} catch (Exception e) {
			status=false;
			SytecsoException.logClassAndMethodWithException(e);
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					SytecsoException.logClassAndMethodWithException(e);
				}
			}
		}
		return status;
	}

	@Override
	public Integer findDatosFiscalesByRfc(String rfc) {
		Integer id=0;
		try {
			id=jdbcTemplate.queryForObject(FIND_DATOS_FISCALES_BY_RFC, Integer.class,rfc);
		} catch (EmptyResultDataAccessException e) {
			SytecsoException.logClassAndMethodWithException(e);
			return 0;
		}catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
			return 1;
		}
		return id;
	}

	@Override
	public DatosFiscales findDatosFiscalesByIdUnidadFacturacion(Long idUnidadFacturacion) {
		DatosFiscales datosFiscales = null;
		Connection connection =  null;
		ResultSet rs = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(FIND_DATOS_FISCALES_BY_ID_UNIDAD_FACTURACION, Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setLong(1, idUnidadFacturacion);
			rs = preparedStatement.executeQuery();
			while(rs.next()) {
				datosFiscales = new DatosFiscales();
				datosFiscales.setIddatosFiscales(rs.getLong(1));
				datosFiscales.setRfc(rs.getString(2));
				datosFiscales.setRazonSocial(rs.getString(3));
				datosFiscales.setCalle(rs.getString(4));
				datosFiscales.setNumeroInt(rs.getString(5));
				datosFiscales.setNumeroExt(rs.getString(6));
				datosFiscales.setColonia(rs.getString(7));
				datosFiscales.setMunicipio(rs.getString(8));
				datosFiscales.setCiudad(rs.getString(9));
				datosFiscales.setEstado(rs.getString(10));
				datosFiscales.setPais(rs.getString(11));
				datosFiscales.setCodigoPostal(rs.getString(12));
			}
			rs.close();

		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		} finally {
			UtileriaSql.closeConection(connection, preparedStatement, rs);
		}
		return datosFiscales;
	}

	@Override
	public Boolean updateDatosFiscalesByIdDaTosFiscales(DatosFiscales datosFiscales) {
		EventoSytecso evento = new EventoSytecso();
		evento.setCuenta_idCuenta(datosFiscales.getCuenta_idCuenta());
		try {
			Object[] params = {datosFiscales.getRfc(),datosFiscales.getRazonSocial(),datosFiscales.getCalle(),datosFiscales.getNumeroInt(),datosFiscales.getNumeroExt(),
					datosFiscales.getColonia(),datosFiscales.getMunicipio(),datosFiscales.getCiudad(),datosFiscales.getEstado(),datosFiscales.getPais(),
					datosFiscales.getCodigoPostal(),datosFiscales.getIddatosFiscales()};
			if(jdbcTemplate.update(UPDATE_DATOS_FISCALES_BY_ID_DATOS_FISCALES,params)>0) {
				evento.setTipoEvento("UPDATE_DATOS_FISCALES");
				serviceEventoSytecso.registrarEventoSytecso(evento);
				return true;
			}
				
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
			evento.setTipoEvento("ERROR_UPDATE_DATOS_FISCALES");
			serviceEventoSytecso.registrarEventoSytecso(evento);
		}
		return false;
	}
	
	@Override
	public DatosFiscales findDatosFiscalesByRazonSocial(DatosFiscales dtosFisc) throws Exception {
		ResultSet rs = null;
		DatosFiscales dtosFisc1 = new DatosFiscales();
		String sql = " select RFC, razonSocial,calle, numeroInt, numeroExt, colonia, municipio,ciudad, " + 
				"estado, pais, codigoPostal " + 
				" from datosfiscales where razonSocial='" + dtosFisc.getRazonSocial() + "' ";
		Connection con = null;
		try {
			con = dataSource.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				dtosFisc1.setRfc(rs.getString(1));
				dtosFisc1.setRazonSocial(rs.getString(2));
				dtosFisc1.setCalle(rs.getString(3));
				dtosFisc1.setNumeroInt(rs.getString(4));
				dtosFisc1.setNumeroExt(rs.getString(5));
				dtosFisc1.setColonia(rs.getString(6));
				dtosFisc1.setMunicipio(rs.getString(7));
				dtosFisc1.setCiudad(rs.getString(8));
				dtosFisc1.setEstado(rs.getString(9));
				dtosFisc1.setPais(rs.getString(10));
				dtosFisc1.setCodigoPostal(rs.getString(11));
				
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
		return dtosFisc1;
	}
}
