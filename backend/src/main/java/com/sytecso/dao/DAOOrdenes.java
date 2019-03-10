package com.sytecso.dao;


import java.math.BigDecimal;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sytecso.captions.OrdenCaption;
import com.sytecso.model.Orden;


public interface DAOOrdenes extends JpaRepository<Orden, BigDecimal>{
	@Query(
			"SELECT o as orden"
			+ " FROM Orden o "
			+ "INNER JOIN o.datosUsuarioFinal as d INNER JOIN d.telefono as t INNER JOIN d.datosInstalacion as da "
			+ "INNER JOIN d.direccionInstalacion as dir "
			+ " WHERE o.idOrden = ?1"		
			)
	public Optional<OrdenCaption> findOrdenByIdOrden(BigDecimal id);
}
