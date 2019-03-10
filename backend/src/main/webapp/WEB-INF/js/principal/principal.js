class Principal extends SmartBilling{
	constructor(){
		super();
	}
}

function principal(){
	let prin = new Principal();
	$("#linkCompras").on("click",function(){
		var seccion={"seccion":UrlUtils.urlCompra()	}
		var request= prin.ajaxGet(UrlUtils.urlCuenta(),seccion);
		request.then(data=>prin.replaceAllHtml(data,UrlUtils.urlCuenta()),error=>alert("Ocurrio un error inesperado"));
	});
	$("#linkModCuentas").on("click",function(){
		var seccion={"seccion":UrlUtils.urlActCuenta()}
		var request= prin.ajaxGet(UrlUtils.urlCuenta(),seccion);
		request.then(data=>{
			prin.replaceAllHtml(data,UrlUtils.urlCuenta())}
		,error=>{alert("Ocurrio un error inesperado")});
	});
	$("#balanceCuentas").on("click",function(){
		var seccion={"seccion":UrlUtils.urlBalanceCuenta()}
		var request= prin.ajaxGet(UrlUtils.urlCuenta(),seccion);
		request.then(data=>prin.replaceAllHtml(data,UrlUtils.urlCuenta()),error=>alert("Ocurrio un error inesperado"));
	});
	$("#linkEstatusCuenta").on("click",function(){
		var seccion={"seccion":UrlUtils.urlEstatusCuenta()}
		var request= prin.ajaxGet(UrlUtils.urlCuenta(),seccion);
		request.then(data=>prin.replaceAllHtml(data,UrlUtils.urlCuenta()),error=>alert("Ocurrio un error inesperado"));
	});
		
}
$(document).ready(function(){
	principal();
});