package com.sytecso.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import com.sytecso.beans.InsumosCte;
import com.sytecso.beans.TipoOrden;

public interface ServiceCargasBatch {
	public Map<String, List<?>> builDataForTipoOrdenBatch(InputStream is) throws IOException;
	public TipoOrden procesaTipoOrden(String[] data,int index);
	public InsumosCte procesaInsumosCte(String[] data,int index);
	public Map<String, List<?>> builDataForInsertInsumosCteBatch(InputStream is) throws IOException;

}
