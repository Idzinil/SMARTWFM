package com.sytecso.dao;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.sytecso.captions.TipoOrdenCaption;
import com.sytecso.model.TipoOrden;

public interface DAOTipoOrdenes extends CrudRepository<TipoOrden, String> {
	@Query("SELECT idOrden as idOrden,tipoOrden as tipoOrden,descripcionOrden as descripcionOrden,nombreOrden as nombreOrden,tiempoOrdenProm as tiempoOrdenProm,montoOrden as montoOrden,divisa as divisa FROM TipoOrden WHERE cuentaCliente_idCuenta = ?1")
	public List<TipoOrdenCaption> findTipoOrdenesByidCuentaCliente(BigDecimal idCuentaCliente);
	
	
	@Query("SELECT idOrden as idOrden,tipoOrden as tipoOrden,descripcionOrden as descripcionOrden,nombreOrden as nombreOrden,tiempoOrdenProm as tiempoOrdenProm,montoOrden as montoOrden,divisa as divisa FROM TipoOrden WHERE cuentaCliente_idCuenta = ?1")
	public List<TipoOrdenCaption> findTipoOrdenesByNumeroCliente(String numeroCuenta);
}
