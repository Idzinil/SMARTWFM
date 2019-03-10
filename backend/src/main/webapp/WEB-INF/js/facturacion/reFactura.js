class ReFactura extends SmartBilling{
	findRefacturaCuentas(){
		var cuentas  = reFactura.getInputCheckVal("input:checked[name=reFactura]");
		if(!cuentas==""){
			var url = UrlUtils.urlFindRefacturaCuentas();
			var request = reFactura.ajaxPost(url,{cuentas:cuentas});
			request.then(response=>{
				window.location=response;
			},error=>{
				alert("Ocurrio un error al buscar las cuentas");
			});
		}else alert("Debes seleccionar una cuenta a re facturar");
	}
	createRefactura(){
		var url = UrlUtils.urlCreateRefactura();
		var request = reFactura.ajaxPost(url);
		request.then(response=>{
			window.location=response;	
			
		},error=>{
			alert("Ocurrio un error en el proceso");
		});
	}
}
let reFactura = new ReFactura();
$(document).ready(function(){
	$("#reFactura").on("click",function(){
		reFactura.findRefacturaCuentas();
	});
	$("#reFacturar").on("click",function(){
		reFactura.createRefactura();
	});
});