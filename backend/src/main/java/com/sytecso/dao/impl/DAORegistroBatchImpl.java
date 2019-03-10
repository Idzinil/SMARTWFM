/**
 * SmartBilling
 * Created-By: Sytecso
 * Date:       29/10/2017
 */
package com.sytecso.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;

import com.sytecso.beans.RegistroBatch;
import com.sytecso.dao.DAORegistroBatch;

@Repository
public class DAORegistroBatchImpl implements DAORegistroBatch {
	@Autowired
	private DataSource dataSource;

	public long registrarRegistroBatch(final RegistroBatch rgbatch) throws Exception {
		GeneratedKeyHolder holder=new GeneratedKeyHolder();
		JdbcTemplate jt=new JdbcTemplate(dataSource);
		jt.update(new PreparedStatementCreator() {
		    @Override
		    public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
		        PreparedStatement statement = con.prepareStatement(com.sytecso.component.UtileriaSql.registrarTXRegistrobatch(),Statement.RETURN_GENERATED_KEYS);
		        statement.setString(1, (!((rgbatch.getNombreArchivo()).equals(null)&&(rgbatch.getNombreArchivo()).equals("")))?rgbatch.getNombreArchivo():"NULO");
		        statement.setString(2, (!((rgbatch.getTipoCarga()).equals(null)&&(rgbatch.getTipoCarga()).equals("")))?rgbatch.getTipoCarga():"NULO");
		        statement.setLong(3, (!(rgbatch.getRegistrosInsertados()<0))?rgbatch.getRegistrosInsertados():0);
		        statement.setLong(4, (!(rgbatch.getRegistrosRechazados()<0))?rgbatch.getRegistrosRechazados():0);
		        return statement;
		    }
		}, holder);
		long pKey_IdCuenta = holder.getKey().longValue();
		return pKey_IdCuenta;
	}

	public void actualizarRegistroBatch(RegistroBatch rgbatch) throws Exception {
		JdbcTemplate jt=new JdbcTemplate(dataSource);
		String updateSql="UPDATE registrobatch SET";
		if(!((rgbatch.getNombreArchivo()).equals(null)&&(rgbatch.getNombreArchivo()).equals(""))){
			updateSql+=(" nombreArchivo = '"+rgbatch.getNombreArchivo()+"'");
		}
		if(!((rgbatch.getTipoCarga()).equals(null)&&(rgbatch.getTipoCarga()).equals(""))){
			updateSql+=(", tipoCarga = '"+rgbatch.getTipoCarga()+"'");
		}
		if(!(rgbatch.getRegistrosInsertados()<0)){
			updateSql+=(", registrosInsertados = "+rgbatch.getRegistrosInsertados());
		}
		if(!(rgbatch.getRegistrosRechazados()<0)){
			updateSql+=(", registrosRechazados = "+rgbatch.getRegistrosRechazados());
		}
		updateSql+=" WHERE idregistroBatch ="+rgbatch.getIdregistroBatch();
		jt.execute(updateSql);
	}

}
