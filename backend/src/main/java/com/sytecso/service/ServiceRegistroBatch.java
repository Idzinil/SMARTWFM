/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2019
 */
package com.sytecso.service;

import com.sytecso.beans.RegistroBatch;

public interface ServiceRegistroBatch {
	public long registrarRegistroBatch(RegistroBatch rgbatch) throws Exception;
	public void actualizarRegistroBatch(RegistroBatch rgbatch) throws Exception;
}
