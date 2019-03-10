class PagosCuentasFacturas extends SmartBilling{
	validaFormAltaPago(saldoFavor){
		$("#formPago").submit(function(event){
			if($("#montoPago").val()==0 && saldoFavor==0){
				alert("El monto a pagar debe ser mayor a cero");
				event.preventDefault();
			}
		});
	}
	popSiguientePago(cuenta,monto,moneda,url){
		var pago ={
				restantePago:monto,
				moneda:moneda
		}
			var request = smartBilling.ajaxJSONPost(url,pago);
			request.then(response=>{
				var div = $("<div>");
		 		div.html(response);
				div.dialog({
					title:"Monto y tipo de cambio",
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
								$("#formPago").submit();
							}
						}
					],
					close:function(event,ui){
						$("p").remove();
						$(this).dialog("close");
					}
				});			},error=>{alert("Algo salio mal al procear el pago")});

	}
	selectAllFactura(id,inputClass){
		$(id).on("click",function(){
			if($(this).prop("checked")){
				$(inputClass).prop("checked",true);
			}else{
				$(inputClass).prop("checked",false);
			}
				
		});
	}
	simula(btn,param){		
		$(btn).on("click",function(){
			var url = UrlUtils.urlPagosCustom(param+"&index="+$(this).attr("id"));
			var form =$("#simPago"); 
			form.attr("action",url);
			form.submit();
		});	
	}
	simulaItems(btn,param){		
		$(btn).on("click",function(){
			var url = param+"&index="+$(this).attr("id");
			var form =$("#simPago"); 
			form.attr("action",url);
			form.submit();
		});	
	}
	action(btn,url,formId){		
		$(btn).on("click",function(){
			pagosCuentasFacturas.formAction(formId,url);
		});	
	}
	formAction(formId,url){
		var form =$(formId); 
		form.attr("action",url);
		form.submit();
	}
	pagar(btn,url,formId){		
		$(btn).on("click",function(){
			var form =$(formId); 
			form.attr("action",url);
			form.submit();
		});	
	}
	 cambioDivisa(monto,monedaDivisa,cambioDivisa){
		 if(moneda==cambioDivisa.nombreMonedaA)
			 return monto;
		 else if(!moneda==cambioDivisa.nombreMonedaA && monedaDivisa=="MXN" )
			 return monto*cambioDivisa.cambioValorAValorB;
		 return monto / cambioDivisa.cambioAValorB;
	 }
		sumAllInputValueByMoneda(table,inputClass,moneda,labelClass,lblRestanteClass,montoMoneda){
	    	var inputVal =parseFloat("0");
	    	var json = {monto:0,inputVal:0,montoMoneda:montoMoneda};
			$(table).find("tr").filter(function(i,v){
				var val =$(v).find("input[class="+inputClass+"]").val();
				var lblMoneda=$(v).find("label[class="+labelClass+"]").text();
				var montoString = $(v).find("label[class=lblMontoPagar]").text();
				var monto = parseFloat(montoString.replace(/[^0-9.]/g,''));
				if(moneda == lblMoneda){
					var lblRestante = $(v).find("label[class="+lblRestanteClass+"]").text();
					var isGoodVal = val!=undefined && val >0 && val!=isNaN;
					$(v).find("input[id="+i+"]").prop("checked",isGoodVal);
					if(isGoodVal){
		    			inputVal +=  parseFloat(val);
		    			$(v).find("input[id="+i+"]").prop("checked",!(parseFloat(inputVal) > montoMoneda));
					}
					json ={monto:monto,inputVal:inputVal,montoMoneda:montoMoneda};
				}
	    	});
			return json;
		}
	isTotalMontosByDivisaMayor(table,inputMontoPagoClass,moneda,montoMoneda,lblRestanteClass,lblMonedaClass){
		return pagosCuentasFacturas.sumAllInputValueByMoneda(table,inputMontoPagoClass,moneda,lblMonedaClass,lblRestanteClass,montoMoneda);
		
	}
	disableButtons(buttons,json){
		$.each(buttons,function(k,v){
			if($(v).attr("id")=="btnPagar"){
				$(v).attr("disabled",!(json.monto>0));
			}else{
				$(v).attr("disabled",!(json.inputVal>=0 && json.inputVal<=json.montoMoneda));
			}
		});
	}
	compareMontos(table,inputId,buttons,montos,restante){
		var json = {};
		$(inputId).on("change",function(){ 
				$.each(montos,function(k,v){
					json =  pagosCuentasFacturas.isTotalMontosByDivisaMayor(table,"montoPago",k,v,restante,"moneda");
					if(json.inputVal>json.montoMoneda){
						return false;
					}
			});
				pagosCuentasFacturas.disableButtons(buttons,json)
		});
	}
	limpiaPrincipal(){
		$("#test tbody").on("click","button[class='btnLimpiarF']",function(e){
			var tr = $(this).closest("tr");
			var factura = tr.find("label[class='factura']").text();
			pagosCuentasFacturas.formAction("#simPago",UrlUtils.urlPagosCustomLimpiar("A&")+"factura="+factura);
			e.stopPropagation();
		});
	}
	limpiaContrato(factura,lblText,option){
		$("#test tbody").on("click","button[class='btnLimpiar']",function(e){
			var tr = $(this).closest("tr");
			var contrato = tr.find("label[class="+lblText+"]").text();
			pagosCuentasFacturas.formAction("#simPago",UrlUtils.urlPagosCustomLimpiar(option+"&")+"factura="+factura+"&contrato="+contrato+"&index="+$(this).attr("id"));
			e.stopPropagation();
		});
	}
}
let pagosCuentasFacturas = new PagosCuentasFacturas();
$(document).ready(function(){
	pagosCuentasFacturas.entryOnlyPositiveNumbers(".montoPago");
	pagosCuentasFacturas.entryOnlyPositiveNumbers("#montoPago");
	pagosCuentasFacturas.selectAllFactura("#factura",".1");
	pagosCuentasFacturas.simula(".btnSimularF","FT");
	pagosCuentasFacturas.pagar("#btnPagar",UrlUtils.urlPagosCustomPagar(),"#simPago");
	pagosCuentasFacturas.action("#btnLimpiarTodoPrincipal",UrlUtils.urlPagosCustomLimpiar("A"),"#simPago");
	pagosCuentasFacturas.limpiaPrincipal();
	pagosCuentasFacturas.entryOnlyPositiveNumbers(".montoPago");
	
});