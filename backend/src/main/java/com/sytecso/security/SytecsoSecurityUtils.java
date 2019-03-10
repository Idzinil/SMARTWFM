package com.sytecso.security;

class SytecsoSecurityUtils {

	private SytecsoSecurityUtils() {
		    throw new IllegalStateException("Utility class");
	}
	static final String[] ACCESS_USER={"/usuarioCuenta","/actECCuenta","/actECCuenta2","/irFormulario","/manejaCuenta","/actECUnidadFacturacion"
			,"/actECDatosFiscales","/actECDatosUnidad","/actECTelefono","/manejaActualizacionECCuenta","/manejaActualizacionECDatosFiscales","/manejaActualizacionECDatosUnidad",
			"/manejaActualizacionECTelefono","/manejaActualizacionECUnidadFacturacion","/manejaEstructuraCuenta",
			"/buscaCuentaCompra","/updateStatusCompra","/compras","/altaCompra/","/actualizarCompra","/updateStatusCompra",
			"/actualizarEstatus","/estatusCuenta","/actualizaCta","/infCta","/actCuenta","/detalleCuenta","/Registrada","/foundAcct","/irBuscarCta","/insertaDatosCta","/irFormulario"};
	static final String[] ACCESS_ADMIN= {"/altaProducto","/obtenerProductos","/upload","/cargarCompras"
			,"/actualizacionProductos","/actualizaProducto","/actualizaProducto","/updateEstatusProducto"};
	
	static final String[] ACCESS_BILLING= {"/cargaIniArchivo","/viewCSV","/invoicing","/facturar","/billPeriodoFactura","/guardarEstatusFacturar",
			"/billInicio","/billResultadoIni","/verDatosFac","/actualizaDatosFac/","/datosCuentaFacturarAgrupado","/verDatosAgrupados",
			"/buscaDatosCuentaFacturar","/actualizaDatosClienteFacturar","/billLeyendaFactura","/irNotaCredito","/pagos","/pagos/cuentas","/pagos/cuentas","/pagos/facturas",
			"/pagos/siguiente","/pagos/custom/factura","/pagos/custom/limpia","/pagos/custom/factura","/pagos/factura/simula","/pagos/factura/guardar","/pagos/custom/pagar","/pagos/pagar","/pagos/contratos/","/pagos/items/",
			"/pagos/custom/contratos/","/pagos/custom/items/","/obtenDataPeriodoFactura","/reFactura/resumen/contratos/","/reFactura/resumen/",
			"/reFactura/resumen","/reFactura/reFacturar","/reFactura/actualizaCuenta","/reFactura/contrato/","/reFactura/contratos","/refactura/actualizaCompra",
			"/reFactura/Producto","/reFactura/productos","/reFactura/facturas","/reFactura/findCuentas","/restauraCicloFactura","/actualizaCiclosFactura",
			"/resumenContratos/","/resumenFactura/","/obtenDataPeriodoFaContratoItem","/obtenDataPeriodoFaContrato","/facturar",
			"/billBusca","/billResultadoAgrupado","/resFinal","/verBalance","/irAjustes","/buscarDatosAjuste","/FacturaAjuste","/FacturaAjusteContrato","/ajustar","/realizaAjuste","/realizaAjusteItem",
			"/ajustarItem","/irNotaCredito","/registrarNotaCredito"};
	
	static final String[] ACCESS_CONFIG= {"/cargaIniArchivo","/obtenerImpuestos","/altaImpuesto","/adminstracionActualizacionCompras","/adminstracionCompraProductos","/administracionAltaProductos",
			"/administracionActualizacionProductos","/administracionAltaCuentas","/administracionActualizacionCuentas","/administracionActualizacionCuentas"};
	
}
