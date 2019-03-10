class ActualizarEstatusCuenta extends SmartBilling{
	constructor(){
		super();
	}
	set estatusCta(estatusCta){
		this._estatusCta=estatusCta;
	}
	get estatusCta(){
		return this._estatusCta; 
	}
	disableElement(status,resp){
		if(status=="CA" && resp){
			$("#selectEstatus").attr("disabled",true)
			$("#updateStatus").attr("disabled",true)
		}
	}
	optionsCta(estatus){
		var estatusArr=[];
		estatusArr[0]=estatus;
		if(estatus==="AC"){			
			estatusArr[1]="SU";
			estatusArr[2]="CA"
		}else if(estatus==="CA"){
			estatusArr[1]="AC";
			estatusArr[2]="SU";
		}else if(estatus==="SU"){
			estatusArr[1]="AC";
			estatusArr[2]="CA";
		}
		return estatusArr;
	}
	dialog(id,estatus){
		var div = $("#dialog");
 		div.html("<p>&#191;Deseas " + actualizarEstatusCuenta.setSelectOption(estatus) +" la cuenta?</p>");
		div.dialog({
			title:"Cambiar estatus de la cuenta",
			draggable:false,
			resizable:false,
			modal:true,
			open: function( event, ui ) {
		        $('.ui-widget-overlay').addClass('custom-overlay');
			},
			buttons:[
				{
					text:"Cancelar",
					click:function(){
						$(this).dialog("close");
					}
				},
				{
					text:"Aceptar",
					click:function(){
						$("p").remove();
						$(this).dialog("close");
						var response =smartBilling.ajaxPost(UrlUtils.urlActualizarEstatus(),{id,estatus});
						response.then(data=>actualizarEstatusCuenta.successOperations(estatus,true,data),
								error=>actualizarEstatusCuenta.errorOperations());
					}
				}
			],
			close:function(event,ui){
				$("p").remove();
				$(this).dialog("close");
			}
		});
	}
	setSelectOption(option){
		return option==="AC"?"Activar":option==="SU"?"Suspender":"Desconectar";
	}
	
	successOperations(estatus,resp,data){
		actualizarEstatusCuenta.disableElement(estatus,true);
		alert("EL estatus de la cuenta ha cambiado")
	}
	errorOperations(error){
		alert("Ocurrio un error al actualizar el estatus de la cuenta");
	}
}
let actualizarEstatusCuenta = new ActualizarEstatusCuenta();
function actCuenta(cuenta){
	var estatus = actualizarEstatusCuenta.optionsCta(cuenta.estatusCta);
	$(document).ready(function(){
		var select = $("#selectEstatus");
 		actualizarEstatusCuenta.disableElement(cuenta.estatusCta,true);
 		var id=cuenta.idCuenta;
 		var textVal;
 		$.each(estatus,function(index,value){
 			select.append($("<option>",{
 				value:value,
 				text:actualizarEstatusCuenta.setSelectOption(value)
 			}));			
 		});
 		$("#updateStatus").on("click",function(){
 			actualizarEstatusCuenta.dialog(id,select.val());
 		});
	});
}
