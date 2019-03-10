class AltaCompras extends SmartBilling{
	constructor(){
		super();
	}
	buildTableAltaCompra(obj){
		$("#periodoEscalable").DataTable({
			"paging": true,
			"pageLength": 8,
			"bLengthChange": false,
		    "searching": false,
		    "ordering": false,
		    "data":obj,
		    "autoWidth": false,
		    "fixedColumns": false,
		    "columns": [
		    	{
			    	"title":"Mes",
			    	"className": "dt-center",
			    	"data":function(data){
			    		var ind=data.indice>0?data.indice:1;
			    		var input ="<label>"+(ind)+"</label";
			    		return input;
			    	}
		    	},
		    {
		    	"title":"Monto",
		    	"className": "dt-center",
		    	"data":function(data){
		    		var monto = altaCompra.dataIsNull(data.monto);
		    		var ind=data.indice>0?data.indice-1:0;
		    		var value = monto===''?"value="+0.0:"value="+monto;
		    		var inputMonto = "<input class=montoEsc "+value+" type=text name='periodoEscalable["+ind+"].montoOverridePeriodo'/>";
		    		return inputMonto;
		    	}
		    },{
		    	"className": "dt-center",
		    	"data":function(data){
		    		return "<img name="+data.name+" src="+data.img+">";
		    	}
		    }],
		    "rowCallback":function(row,rowData,index){
	    		var table = $("#periodoEscalable").DataTable();
		    	$(row).on("click","td > img[name='agregar']",function(event){
		    		var data = table.rows().data();
		    		var monto=$(row).find("input[class='montoEsc']").val();
		    		data.push(altaCompra.jsonObj(index,monto,"cancelar","img/boton_cancelar_rojo.png"));
		    		var jsonObj=altaCompra.buildJson(data);
		    		table.rows().remove().draw(true);
		    		table.rows.add(jsonObj).draw(true);

		    	});
		    	$(row).on("click","td > img[name='cancelar']",function(event){
		    		$('#periodoEscalable').dataTable().fnDeleteRow(index);
		    		var data = table.rows().data();
		    		var nJson = altaCompra.setIndexToJson(data);
		    		table.rows().remove().draw(false);
		    		table.rows.add(nJson).draw(true);
		    	});
		    	$(row).on("change","td > input[class='montoEsc']",function(event){
		    		$("#descuento").attr("readOnly",!altaCompra.sumAllInputValue("#periodoEscalable","montoEsc")>0);
		    	});
		    },
		    "fnDrawCallback":function(oSettings){
		    	$("#descuento").attr("readOnly",!altaCompra.sumAllInputValue(this,"montoEsc")>0);
		    }

		});

	}
	
	buildJson(data){
		var jsonFormat =[];
		var ped= 0;
		$.each(data,function(index,val){
			if(val.name==="cancelar"){
				jsonFormat.push(altaCompra.jsonObj(index,val.monto,val.name,val.img));
			}else if(val.name==="agregar"){
				ped=index;
			}
		});
		jsonFormat[jsonFormat.length]=data[ped];
		var nJson = altaCompra.setIndexToJson(jsonFormat);
		return nJson;
	}
	setIndexToJson(json){
		var nJson = [];
		var inde =1;
		$.each(json,function(index,val){
			nJson.push(altaCompra.jsonObj(inde,json[index].monto,json[index].name,json[index].img));
			inde+=1;
		});
		return nJson;
	}
	
	jsonObj(indice,monto,name,img){
		return {
			indice:indice,
			monto:monto,
			name:name,
			img:img
			
		}; 
	} 
	showTipoCambio(id){
		$("#tipoCambio").attr({"readonly":true,"value":0});
		$(id).on("change", function() {
			var moneda = $(this).val();
			if (moneda == "MXN"){
				$("#tipoCambio").attr("readonly",true);
				$("#tipoCambio").val(0);
			}
			else if (moneda == "USD")
				$("#tipoCambio").attr("readonly",false);
		});
	}
	

	validaForm(){
		$("#formAltaCompra").submit(function(event){
			var table = $("#periodoEscalable").DataTable();
			var data = table.rows().data();
			$.each(data,function(index,value){
				var est = false;
				if(value.monto==="" && value.inicio=="" && value.fin===""){
					est=true;
				}else if(value.monto==="" && value.inicio!="" && value.fin===""){
					est=true;
				}else if(value.monto==="" && value.inicio==="" && value.fin!=""){
					est=true;
				}else if(value.monto!="" && value.inicio!="" && value.fin===""){
					est=true;
	
				}
				if(est){
					alert("Todos los campos de balance deben contener valores");
					event.preventDefault();
				}	
			});
		});
	}
	
	validaFormAlta(){
		$("#formAltaCompra").submit(function(event){
			var est = false;
			if($("#montoOverride")=="" || $("#descuento")=="")
				est=true
			if(est){
					alert("Todos los campos de balance deben contener valores");
					event.preventDefault();
			}	
		});
	}
	addDescuento(){
		$("#descuentoCheck1").on("click",function(){
			if($("#descuentoCheck1").is(":checked")){
				$("#divDescuento").show();
			}else{
				$("#divDescuento").hide();
			}
		});
	}
	bloqueaMonto(){
		$("#sDescuento").on("change",function(){
			var val = $(this).val();
			var porcentaje = $("#porcentaje");
			var montoDescuento = $("#montoDescuento");
			if(val==0){
				$("#descuentoCheck1").prop("checked", false);
				$("#divDescuento").hide();
				porcentaje.attr("disabled",true);
				montoDescuento.attr("disabled",true);
				montoDescuento.val("");
				porcentaje.val("");
			}else if(val==1){
				porcentaje.attr("disabled",true);
				montoDescuento.attr("disabled",false);
				porcentaje.val("");
			}else if(val==2){
				porcentaje.attr("disabled",false);
				montoDescuento.attr("disabled",true);
				montoDescuento.val("");
			}
		});
	}
	
}

let altaCompra = new AltaCompras();
$(document).ready(function(){
	altaCompra.buildTableAltaCompra([altaCompra.jsonObj(0,"","agregar","img/signo_mas_verde.png")]);
	altaCompra.buildSimpleDatePicker("#fechaActivacion");
	altaCompra.buildSimpleDatePicker("#fechaFin");
	altaCompra.buildSimpleDatePicker("#fechaFinCompra");
	altaCompra.showTipoCambio("#selectMoneda");
	altaCompra.buildDatePickerYearAndMonth("#fechaPrimeraFac");
	altaCompra.entryOnlyPositiveNumbers("#montoOverride");
	altaCompra.entryOnlyPositiveNumbers("#descuento");
	altaCompra.addDescuento();
	altaCompra.bloqueaMonto();
	altaCompra.entryOnlyPositiveNumbers("#tipoCambio");
	altaCompra.entryOnlyPositiveNumbers(".montoEsc");
	if(!$("#descuentoCheck1").is(":checked")){
		$("#divDescuento").hide();
	}
	if($("#porcentaje").val()!=null && $("#porcentaje").val()!="" && $("#porcentaje").val()>0){
		$("#divDescuento").show();
		$("#porcentaje").attr("disabled",false);
	}
	if($("#montoDescuento").val()!=null && $("#montoDescuento").val()!="" &&  $("#montoDescuento").val()>0){
		$("#divDescuento").show();
		$("#montoDescuento").attr("disabled",false);
	}

});	
