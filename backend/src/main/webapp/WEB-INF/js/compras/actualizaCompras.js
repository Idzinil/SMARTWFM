class ActualizaCompras extends SmartBilling{
	constructor(){
		super();
	}
	 buildPeriodos(obj){
		$("#actPeriodoEscalable").DataTable({
			"paging": true,
			"bLengthChange": false,
			"pageLength": 8,
		    "searching": false,
		    "ordering": false,
		    "data":obj,
		    "autoWidth": false,
		    "fixedColumns": false,
		    "columns": [{
		    	"title":"IdPeriodo",
	            "visible": false,
		    	"data":function(data){
		    		var periodoEscalableId = actualizaCompras.dataIsNull(data.periodoEscalableId);
		    		var value = periodoEscalableId===''?'':"value="+periodoEscalableId;
		    		var input ="<input  "+value+" type=text name='periodoEscalable["+data.indice+"].periodoEscalableId'/>";
		    		return input;
		    	}	
		    },{
		    	"title":"Mes Inicio",
		    	"className": "dt-center",
		    	"data":function(data){
		    		var inicio = actualizaCompras.dataIsNull(data.inicio);
		    		var value = inicio===''?'':"value="+inicio;
		    		var input ="<input class=fecInicio "+value+" type=text name='periodoEscalable["+data.indice+"].inicio' disabled=true/>";
		    		return input;
		    	}
		    },{
		    	"title":"Mes Fin",
		    	"className": "dt-center",
		    	"data":function(data){
		    		var fin = actualizaCompras.dataIsNull(data.fin);
		    		var value = fin===''?'':"value="+fin;
		    		var inputFin = "<input class=fecFin "+value+" type=text name='periodoEscalable["+data.indice+"].fin' disabled=true/>"
		    		return inputFin;
		    	}
		    },{
		    	"title":"Monto",
		    	"className": "dt-center",
		    	"data":function(data){
		    		var monto = actualizaCompras.dataIsNull(data.montoOverridePeriodo);
		    		var value = monto===''?"value="+0.0:"value="+monto;
		    		var inputMonto = "<input "+value+" type=text name='periodoEscalable["+data.indice+"].montoOverridePeriodo'/>";
		    		return inputMonto;
		    	}
		    },{
		    	"className": "dt-center",
		    	"data":function(data){
		    		var src="img/boton_cancelar_rojo.png"
		    		var name="cancelar";	
		    		if(data.montoOverridePeriodo===""){
		    			src="img/signo_mas_verde.png";
		    			name="agregar";
		    		}
		    			
		    		return "<img name="+name+" src="+src+">";
		    	}
		    }],
		    "rowCallback":function(row,rowData,index){
	    		var table = $("#actPeriodoEscalable").DataTable();
		    	$(row).on("click","td > img[name='agregar']",function(event){
		    		var inicio = $(row).find("input[name='periodoEscalable["+index+"].inicio']").val();
		    		var fin=$(row).find("input[name='periodoEscalable["+index+"].fin']").val();
		    		var monto = $(row).find("input[name='periodoEscalable["+index+"].montoOverridePeriodo']").val();
		    		var data = table.rows().data();
		    		data.push(actualizaCompras.jsonFomatAct(index,inicio,fin,monto,"cancelar","img/boton_cancelar_rojo.png"));
		    		var jsonObj=actualizaCompras.buildJson(data);
		    		table.rows().remove().draw(true);
		    		table.rows.add(jsonObj).draw(true);
		    	});
		    	$(row).on("click","td > img[name='cancelar']",function(event){
		    		$('#actPeriodoEscalable').dataTable().fnDeleteRow(index);
		    		var data = table.rows().data();
		    		var nJson = actualizaCompras.setIndexToJson(data);
		    		table.rows().remove().draw(false);
		    		table.rows.add(nJson).draw(true);
		    	});
		    },
		    "fnDrawCallback":function(oSettings){
		    }
		});
	}
	jsonFomatAct(index,inicio,fin,monto,elementName,imgName){
		return {
    			indice:index,
    			inicio:inicio,
    			fin:fin,
    			montoOverridePeriodo:monto,
    			name:elementName,
    			img:imgName
    		};
	}
	
	buildJson(data){
		var jsonFormat =[];
		var ped= 0;
		$.each(data,function(index,val){
			if(val.montoOverridePeriodo!=""){
				jsonFormat.push(actualizaCompras.jsonFomatAct(index,val.inicio,val.fin,val.montoOverridePeriodo,val.elementName,val.imgName));
			}else {
				ped=index;
			}
		});
		jsonFormat[jsonFormat.length]=data[ped];
		var nJson = actualizaCompras.setIndexToJson(jsonFormat);
		return nJson;
	}
	setIndexToJson(json){
		var nJson = [];
		var inde =1;
		$.each(json,function(index,val){
			nJson.push(actualizaCompras.jsonFomatAct(index,val.inicio,val.fin,val.montoOverridePeriodo,val.elementName,val.imgName));
			inde+=1;
		});
		return nJson;
	}
	btnCancelar(id){
		$(id).on("click",function(){
			window.location=UrlUtils.urlCompras();
		});
	}
	btnActualizar(id,formId){
		$(id).on("click",function(){
			$(formId).submit();
		});
	}
	validaFormActualiza(){
		$("#actualizarCompra").submit(function(event){
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
	 
}


let actualizaCompras = new ActualizaCompras();
function actuaCmp(obj){
	var montoOverride =$("#montoOverride").val();
	if(montoOverride!=undefined && montoOverride!=null){
		$("#montoOverride").val(compra.addZeroesToNumber(montoOverride,3));
	}
	
	var descuento =$("#descuento").val();
	if(descuento!=undefined && descuento!=null){
		$("#descuento").val(actualizaCompras.addZeroesToNumber(descuento,3));
	}
	if(obj!=undefined && obj!=null){
		obj.push(actualizaCompras.jsonFomatAct(obj.length,"","","","agregar","img/signo_mas_verde.png"));
		actualizaCompras.buildPeriodos(obj);
	}
	altaCompra.addDescuento();
	actualizaCompras.buildDatePickerYearAndMonth("#fechaPrimeraFac")
	actualizaCompras.buildSimpleDatePicker(".fecFin");
	actualizaCompras.buildSimpleDatePicker(".fecInicio");
	actualizaCompras.buildSimpleDatePicker("#fechaActivacion");
	actualizaCompras.buildSimpleDatePicker("#fechaFinCompra");
	actualizaCompras.entryOnlyPositiveNumbers("#montoOverride");
	actualizaCompras.entryOnlyPositiveAndNegativeNumbers("#descuento");
	actualizaCompras.btnCancelar("#btnCancelCompra");
	actualizaCompras.btnActualizar("#btnActCompra","#actualizarCompra");
	if(!$("#descuentoCheck1").is(":checked")){
		$("#divDescuento").hide();
	}
	if($("#porcentaje").val()!=null && $("#porcentaje").val()!="" && $("#porcentaje").val()>0){
		$("#divDescuento").show();
		$("#porcentaje").attr("disabled",false);
	} 
	if($("#montoDescuento").val()!=null && $("#montoDescuento").val()!="" && $("#montoDescuento").val()>0){
		$("#divDescuento").show();
		$("#montoDescuento").attr("disabled",false);
	}
}
		
	




