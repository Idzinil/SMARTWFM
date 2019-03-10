class CuentasBatch extends SmartBilling{
}

let cuentasBatch = new CuentasBatch();
function main(data){
	$(document).ready(function(){
		if(data != undefined && data != null)
			cuentasBatch.builTableErrors(data,'#rechazados');
	});
}