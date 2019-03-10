package com.sytecso.component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sytecso.beans.InsumosCte;
import com.sytecso.beans.InsumosEmp;

public class UtileriaInsumos {

	public static boolean camposValidos(InsumosCte insumosCte) {
		boolean status = false;
		if (!insumosCte.getNombreInsumo().equals("") || insumosCte.getNombreInsumo().isEmpty()) {
			return status = true;
		}

		return status;
	}

	/* --------------------------------- */
	public static InsumosEmp procesaInsumosEmpr(String[] data, int index) {
		InsumosEmp insumo = new InsumosEmp();
		insumo.setIdentificadorSAP(data[0]);
		insumo.setNombreInsumo(data[1]);
		insumo.setDescripcionInsumo(data[2]);
		insumo.setClaveInsumo(data[3]);
		insumo.setTotalInsumo(new BigDecimal(data[4]));

		if (data[5].equalsIgnoreCase("MTO") || data[5].equalsIgnoreCase("PZA")) {
			insumo.setUnidadMedidaInsumo(data[5]);
		} else {
			throw new IllegalArgumentException(
					"La unidad de medida " + index + " es invalida, valores admitidos metro, pieza");
		}

		if (data[6].equalsIgnoreCase("Planta Externa Mantenimiento") || data[6].equalsIgnoreCase("Planta Interna")
				|| data[6].equalsIgnoreCase("Planta Externa") || data[6].equalsIgnoreCase("Planta Externa Construcción")
				|| data[6].equalsIgnoreCase("Planta Externa Fusión")
				|| data[6].equalsIgnoreCase("Planta Externa Radio Frecuencia")) {
			insumo.setCategoria(data[6]);
		} else {
			throw new IllegalArgumentException("La categoría del insumo " + index + " es invalida");
		}

		if (data[7].equalsIgnoreCase("Herramienta Especializada") || data[7].equalsIgnoreCase("Herramienta Básica")
				|| data[7].equalsIgnoreCase("Equipo de Proteccion Personal")
				|| data[7].equalsIgnoreCase("Equipo de Demarcación de Trabajos en la Calle")) {
			insumo.setGrupo(data[7]);
		} else {
			throw new IllegalArgumentException("El grupo " + index + " es invalido");
		}

		return insumo;
	}

	public static Map<String, List<?>> builDataForInsertInsumosEmpresaBatch(InputStream is) throws IOException {
		List<InsumosEmp> result = new ArrayList<>(); // Revisar beans
		Map<String, List<?>> datas = new HashMap<>();
		List<DTOFileError> errors = new ArrayList<>();
		String line;
		BufferedReader br = new BufferedReader(new InputStreamReader(is));
		int fila = 1;
		while ((line = br.readLine()) != null) {
			String[] data = line.split("\\|");
			try {

				result.add(procesaInsumosEmpr(data, fila));
			} catch (Exception e) {
				errors.add(new DTOFileError(fila, e.getMessage()));
			}
			fila += 1;
		}
		datas.put("aceptado", result);
		datas.put("rechazado", errors);
		return datas;
	}
	/* ------------------------------------- */

}
