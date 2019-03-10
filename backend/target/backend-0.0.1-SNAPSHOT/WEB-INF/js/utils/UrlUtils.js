class UrlUtils{
	
	static contextPath(){
		return localStorage.getItem("contextPath")+"/";
	}
	static loginURL(){
		return "/login";
	}
	static logoutURL(){
		return "?logout";
	}
	static errorURL(){
		return "?error";
	}
	static urlCuenta(){
		return UrlUtils.contextPath()+"irBuscarCta";
	}
	//Esta url es para mostar las secciones de manera dinamica
	static urlCompra(){
		return "compras";
	}
	//Esta url es para mostar las secciones de manera dinamica
	static urlActCuenta(){
		return "actCuenta";
	}
	//Esta url es para mostar las secciones de manera dinamica
	static urlBalanceCuenta(){
		return "balanceCuenta";
	}
	//Esta url es para mostar las secciones de manera dinamica
	static urlEstatusCuenta(){
		return "estatusCuenta";
	}
	static urlCompras(){
		return UrlUtils.contextPath()+UrlUtils.urlCompra(); 
	}
	static urlActualizarEstatus(){
		return UrlUtils.contextPath()+"actualizarEstatus";
	}
	static urlActualizacionProductos(){
		return UrlUtils.contextPath()+"actualizacionProductos";
	}
	static urlACtualizaProducto(){
		return UrlUtils.contextPath()+"actualizaProducto";
	}
	static ulrActualizaEstatusProducto(){
		return UrlUtils.contextPath()+"updateEstatusProducto";
	}
	static urlAltaCompra(){
		return UrlUtils.contextPath()+"altaCompra";
	}
	static urlActCompra(param){
		return UrlUtils.contextPath()+"actualizarCompra?compra="+param;
	}
	static urlGuardarEstatusFacturar(){
		return UrlUtils.contextPath()+"guardarEstatusFacturar";
	}
	static updateStatusCompra(){
		return UrlUtils.contextPath()+"updateStatusCompra";
	}
	static urlbillResultadoIni(){
		return "billResultadoIni";
	}
	static urlBillBusca(){
		return UrlUtils.contextPath()+"billBusca";
	}
	static urlFacturar(){
		return UrlUtils.contextPath()+"facturar";
	}
	static urlActualizaCiclosFactura(){
		return UrlUtils.contextPath()+"actualizaCiclosFactura";
	}
	static ulrRestauraCicloFactura(){
		return UrlUtils.contextPath()+"restauraCicloFactura";
	}
	static urlRealizaAjuste(){
		return UrlUtils.contextPath()+"realizaAjuste";
	}
	static urlFindRefacturaCuentas(){
		return UrlUtils.contextPath()+"reFactura/findCuentas";
	}
	static urlCreateRefactura(){
		return UrlUtils.contextPath()+"reFactura/reFacturar";
	}
	static urlPagosCustom(param){
		return UrlUtils.contextPath()+"pagos/factura/simula?option="+param;
	}
	static urlPagosCustomPagar(){
		return UrlUtils.contextPath()+"pagos/custom/pagar";
	}
	static urlPagosCustomLimpiar(option,params){
		var url  = UrlUtils.contextPath()+"pagos/custom/limpia?option="+option;
		if(params!=undefined){
			return url+params;
		}
		return url;
		
	}
}

let utils = new UrlUtils();
