/**
 * 
 * Created-By: Sytecso
 * Date:       02/01/2019
 */
package com.sytecso.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sytecso.beans.RegistroBatch;
import com.sytecso.dao.DAORegistroBatch;
import com.sytecso.service.ServiceRegistroBatch;

@Service
public class ServiceRegistroBatchImpl implements ServiceRegistroBatch {
	@Autowired
	private DAORegistroBatch daoRegistroBatch;
	@Transactional
	public long registrarRegistroBatch(RegistroBatch rgbatch) throws Exception {
		try {
			return daoRegistroBatch.registrarRegistroBatch(rgbatch);
		} catch (Exception e) {
			throw e;
		}
	}
	@Transactional
	public void actualizarRegistroBatch(RegistroBatch rgbatch) throws Exception {
		try {
			daoRegistroBatch.actualizarRegistroBatch(rgbatch);
		} catch (Exception e) {
			throw e;
		}
	}

}
