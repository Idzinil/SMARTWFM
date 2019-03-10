class AltaProductos extends SmartBilling{
	calendario(){
	    $("#calendarDisponible").datepicker({
			   changeMonth: true,
			   changeYear: true,
			   dateFormat: 'dd-mm-yy',
	    });
	}
	estatusFacturaCada(){
		$("#facturaCada").attr("disabled","disabled");
	}
	tipoCargo(){
		$("#tipoCargo").on("change",function(){
			var tipo = $(this).val();
			if(tipo==="PE"){
				$("#prorrateoRadio1").removeAttr("disabled",false);
				$("#prorrateoRadio2").removeAttr("disabled",false);
				$("#facturaCada").removeAttr('disabled');
			}
			else if(tipo==="NRC"){
				$("#prorrateoRadio1").attr("disabled",true);
				$("#prorrateoRadio1").attr("checked",false);
				$("#prorrateoRadio2").attr("checked",true);
				$("#prorrateoRadio2").attr("disabled",true);
			}
			else 
				$("#facturaCada").attr("disabled","disabled");
		});
	}
	validaForm(){
		$("#formProducto").submit(function(event){
			var calendario = $("#calendarDisponible").val();
			var descripcion = $("#descripcion").val();
			var codigo = $("#idSalesforce").val();
			var clave = $("#claveProdSat").val();
			var capacidad = $("#capacidad").val();
			var familia = $("#familia").val();
			if((calendario || calendario=="") && (descripcion || descripcion==="") && (codigo && codigo==="") && 
					(clave || clave==="") && (capacidad || capacidad==="") && (familia || familia==="")){
				alert("Los campos requeridos deben ser llenados");
				event.preventDefault();
			} 
		});
	}
	
}
let altaProductos = new AltaProductos();
$(document).ready(function() {
	altaProductos.calendario();
	altaProductos.estatusFacturaCada();
	altaProductos.tipoCargo();
	altaProductos.validaForm();
});
