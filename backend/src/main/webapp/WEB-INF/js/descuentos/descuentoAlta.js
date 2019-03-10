class DescuentoAlta extends SmartBilling{
	
}
let descuentoAlta = new DescuentoAlta();
$(document).ready(function(){
	descuentoAlta.buildSimpleDatePicker("#fechaFin");
	descuentoAlta.entryOnlyPositiveNumbers("#montoDescuento");
	descuentoAlta.entryOnlyPositiveNumbers("#porcentaje");
});