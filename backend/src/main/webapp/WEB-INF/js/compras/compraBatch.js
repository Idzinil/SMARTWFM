class CompraBatch extends SmartBilling{
}

let compraBatch = new CompraBatch();
function main(data){
	$(document).ready(function(){
		if(data != undefined && data != null)
			compraBatch.builTableErrors(data,'#rechazados');
	});
}