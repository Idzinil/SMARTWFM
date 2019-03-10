class ProductosBatch extends SmartBilling{
}

let productosBatch = new ProductosBatch();
function main(data){
	$(document).ready(function(){
		if(data != undefined && data != null)
			productosBatch.builTableErrors(data,'#rechazados');
	});
}