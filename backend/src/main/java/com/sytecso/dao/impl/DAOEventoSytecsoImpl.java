/**
 * Sytecso
 * Created-By: Sytecso
 * Date:       29/10/2017
 */
package com.sytecso.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sytecso.beans.EventoSytecso;
import com.sytecso.component.SytecsoLogger;
import com.sytecso.component.UtileriaSql;
import com.sytecso.dao.DAOEventoSytecso;
import com.sytecso.exceptions.SytecsoException;
@Transactional(rollbackFor=Exception.class)
@Repository
public class DAOEventoSytecsoImpl implements DAOEventoSytecso {
	@Autowired private DataSource dataSource;
	@Autowired private JdbcTemplate jdbcTemplate;
	private static final String UPDATE_EVENTO_Sytecso="UPDATE eventosytecso SET horaFin = now() , tipoEvento = ? , Cuenta_idCuenta = ? , registroBatch_idregistroBatch =? , Evento_idEvento = ? , Compra_idCompra = ? , item_iditem = ? , Ajuste_idAjuste = ? WHERE ideventoSytecso = ?";
	private static final String FIND_EVENTO_Sytecso_BY_ID_COMPRA_AND_GROUP_BY_ID_COMPRA="SELECT idEventoSytecso,tipoEvento,horaInicio,horaFin,Cuenta_idCuenta,"
			+ "registroBatch_idregistroBatch,Evento_idEvento,Compra_idCompra,item_iditem,Ajuste_idAjuste FROM eventosytecso WHERE Compra_idCompra=? group by Compra_idCompra";

	@Transactional
	public long registrarEventoSytecso(final EventoSytecso esbbatch){
		GeneratedKeyHolder holder=new GeneratedKeyHolder();
		JdbcTemplate jt=new JdbcTemplate(dataSource);
		jt.update(new PreparedStatementCreator() {
		    @Override
		    public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
		        PreparedStatement statement = con.prepareStatement(com.sytecso.component.UtileriaSql.registrarTXEventosytecso(),Statement.RETURN_GENERATED_KEYS);		        
		        statement.setString(1, (!((esbbatch.getTipoEvento()).equals(null)&&(esbbatch.getTipoEvento()).equals("")))?esbbatch.getTipoEvento():"NULO");
		        if(!(esbbatch.getCuenta_idCuenta()==null || esbbatch.getCuenta_idCuenta()<1)) statement.setLong(2, esbbatch.getCuenta_idCuenta());
		        else statement.setNull(2, Types.BIGINT);
		        if(!(esbbatch.getRegistroBatch_idregistroBatch()==null || esbbatch.getRegistroBatch_idregistroBatch()<1)) statement.setLong(3, esbbatch.getRegistroBatch_idregistroBatch());
		        else statement.setNull(3, Types.BIGINT);
		        return statement;
		    }
		}, holder);
		long pKey_IdEventoSytecso = holder.getKey().longValue();
		return pKey_IdEventoSytecso;
	}//END   public void registrarEventoSytecso(final EventoSytecso esbbatch)
	@Transactional
	public void actualizarEventoSytecso(EventoSytecso esbbatch){
		JdbcTemplate jt=new JdbcTemplate(dataSource);
		String updateSql="UPDATE eventosistema SET horaFin = now() ";
		if(!((esbbatch.getTipoEvento()).equals(null)&&(esbbatch.getTipoEvento()).equals(""))){
			updateSql+=(", tipoEvento = '"+esbbatch.getTipoEvento()+"'");
		}
		if(!(esbbatch.getCuenta_idCuenta()<1)){
			updateSql+=(", CuentaCliente_idCuenta = "+esbbatch.getCuenta_idCuenta());
		}
		if(!(esbbatch.getRegistroBatch_idregistroBatch()<0)){
			updateSql+=(", registroBatch_idregistroBatch = "+esbbatch.getRegistroBatch_idregistroBatch());
		}
		
		updateSql+=" WHERE ideventosistema ="+esbbatch.getIdEventoSytecso();
		SytecsoLogger.info("MIK-> actualizarEventoSytecso  updateSql["+updateSql+"]");
		
		jt.execute(updateSql);
	}


	@Override
	@Transactional
	public void actualizarEventoSytecsoBatch(List<EventoSytecso> eventoSytecsos) {
		ArrayList<Long> ids  = new ArrayList<>();		
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		int batchSize = 5000;
		try {
			connection = dataSource.getConnection();
			connection.getMetaData().getURL().concat("&userServerPrepStmts=false");
			connection.setAutoCommit(false);
			statement = connection.prepareStatement(UPDATE_EVENTO_Sytecso,Statement.RETURN_GENERATED_KEYS);
			int p = 0;
			for(EventoSytecso esbbatch:eventoSytecsos) {
				if(!((esbbatch.getTipoEvento()).equals(null)&&(esbbatch.getTipoEvento()).equals(""))){
					statement.setString(1, esbbatch.getTipoEvento());
				}else
					statement.setString(1, esbbatch.getTipoEvento());
				if(!(esbbatch.getCuenta_idCuenta()<1)){
					statement.setLong(2, esbbatch.getCuenta_idCuenta());
				}
				if(!(esbbatch.getRegistroBatch_idregistroBatch()<0)){
					statement.setLong(3, esbbatch.getRegistroBatch_idregistroBatch());
				}
				if(!(esbbatch.getEvento_idEvento()<1)){
					statement.setLong(4, esbbatch.getEvento_idEvento());
				}else
					statement.setNull(4, java.sql.Types.INTEGER);
				
				if(!(esbbatch.getCompra_idCompra()<1)){
					statement.setLong(5, esbbatch.getCompra_idCompra());
				}
				if(!(esbbatch.getItem_iditem()<1)){
					statement.setLong(6, esbbatch.getItem_iditem());
				}
				if(!(esbbatch.getAjuste_idAjuste()<1)){
					statement.setLong(7, esbbatch.getAjuste_idAjuste());
				}else
					statement.setNull(7, java.sql.Types.INTEGER);
//		        if(!(esbbatch.getProducto_idProducto()==null || esbbatch.getProducto_idProducto()<1)) statement.setLong(8, esbbatch.getProducto_idProducto());
//		        else statement.setNull(8, Types.BIGINT);
				
				statement.setLong(8,esbbatch.getIdEventoSytecso());
		        statement.addBatch();
		        p+=1;
		        if(p==eventoSytecsos.size() && p<batchSize || p==batchSize) {
					statement.executeBatch();
					connection.commit();
					resultSet = statement.getGeneratedKeys();
					while(resultSet.next()) {
						long x = resultSet.getLong(1);	
						ids.add(x);
					}
					statement.clearBatch();
					p=0;
					resultSet.close();
				}
			}
			if(p!=0) {
				statement.executeBatch();
				connection.commit();
				resultSet =statement.getGeneratedKeys();
				while(resultSet.next()) {
					long x = resultSet.getLong(1);	
					ids.add(x);

				}
				resultSet.close();
			}

		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}finally {
			try {
				if(resultSet!=null)resultSet.close();
				if(statement!=null)statement.close();
				if(connection!=null)connection.close();
			} catch (Exception e2) {
				SytecsoException.logClassAndMethodWithException(e2);
			}
			
		}

		
	}

	@Override
	public EventoSytecso findEventoSytecsoByIdCompraAndGroupByIdCompra(Long idCompra) {
		EventoSytecso eventoSytecso = null;
		try {
			eventoSytecso = jdbcTemplate.queryForObject(FIND_EVENTO_Sytecso_BY_ID_COMPRA_AND_GROUP_BY_ID_COMPRA, BeanPropertyRowMapper.newInstance(EventoSytecso.class),idCompra);
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
		
		return eventoSytecso;
	}
	@Override
	public List<EventoSytecso> createEventoSytecsoBatch(Connection connection,List<EventoSytecso> eventoSytecsos) {
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<EventoSytecso> eventosSytecso = new ArrayList<>();
		try {
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(com.sytecso.component.UtileriaSql.registrarTXEventosytecso(),Statement.RETURN_GENERATED_KEYS);
			int  batch = 1;
			int totEventoSytecso =1;
			for (EventoSytecso eventoSytecso : eventoSytecsos) {
				UtileriaSql.createPreparedStatementInsertEventoSytecsoBatch(preparedStatement, eventoSytecso);
				preparedStatement.addBatch();
				if(batch ==UtileriaSql.BATCH_SIZE || totEventoSytecso == eventoSytecsos.size()) {
					preparedStatement.executeBatch();
					resultSet = preparedStatement.getGeneratedKeys();
					eventosSytecso.addAll(UtileriaSql.setGeneratedKeysEventoSytecso(resultSet,eventoSytecsos));
					preparedStatement.clearBatch();
					batch = 0;
				}
				totEventoSytecso+=1;
				batch+=1;
			}
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}finally {
			UtileriaSql.closePreparedStatemetAndResultSet(preparedStatement, resultSet);
		}
		return eventosSytecso;
		
	}


}
