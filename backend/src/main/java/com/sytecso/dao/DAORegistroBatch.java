/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2019
 */
package com.sytecso.dao;

import com.sytecso.beans.RegistroBatch;

public interface DAORegistroBatch {
	public long registrarRegistroBatch(RegistroBatch rgbatch) throws Exception;
	public void actualizarRegistroBatch(RegistroBatch rgbatch) throws Exception;
}
