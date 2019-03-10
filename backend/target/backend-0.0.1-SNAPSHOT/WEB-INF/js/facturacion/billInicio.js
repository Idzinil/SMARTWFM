class BillInicio extends SmartBilling{
	validaform(id){
		$(id).submit(function(event){
			var ciclo = $("#ciclo").val();
			var fecha = $("#fecha").val();
			if((ciclo==null || fecha==="") || (ciclo==0)){
				alert("Debes de seleccionar el ciclo y el periodo a facturar");
				event.preventDefault();
			}
			
		});
	}
}
function main(){
	$(document).ready(function(){
		let billInicio = new BillInicio();
		billInicio.buildDatePickerYearAndMonth("#fecha");
		billInicio.buildDatePickerYearAndMonth("#periodo");
		billInicio.validaform("#formBill");
	});
}
main();