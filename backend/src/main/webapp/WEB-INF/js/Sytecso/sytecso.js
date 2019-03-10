class SmartBilling{
	constructor(){	
	}
	setPageState(urlName){
		history.pushState(null, null, urlName);
	}
	ajaxGet(url,data){
		return $.ajax({
				type:"GET",
				url:url,
				data:data
			});
	}
	ajaxPost(url,data){
		return $.ajax({
			  type: "POST",
			  url: url,
			  data:data
			});
	}
	ajaxJSONPost(url,data){
		return $.ajax({
			  type: "POST",
			  url: url,
			  contentType: "application/json; charset=utf-8",
			  data:JSON.stringify(data)
			});
	}
	replaceHtmlContentSection(content,data,URL,sectionLoad){
		var res =	$(data).find(sectionLoad);
		$( content ).empty().html( res );
	}
	replaceAllHtml(data,URL){
		smartBilling.reloadAllScriptsAndStyles(data);
		$( "body" ).empty().html( data );
	}
	replaceHtmlContent(content,data,URL,sectionLoad){
		smartBilling.updateURL(URL); 
		var res;
		if(sectionLoad.indexOf(".")>=0)
			res = $(data).find(sectionLoad);
		else {
			 res =	$(data).find("div[id="+sectionLoad+"]");
		}
		smartBilling.reloadAllScriptsAndStyles(data);
		var barraBusqueda=$(data).find("div[id=tituloTablero]");
		$( "#tituloyBarraBusqueda" ).empty().html( barraBusqueda );
		$( content ).empty().html( res );
	}
	updateURL(URL){
		window.history.replaceState(null, null, URL);
	}
	changeLocationURL(URL){
		window.location.href =URL;
	}
	dataIsNull(data){
		return (data!=null && data!="")?data:"";
	}
	montoArray(monto){
        var nextChar=0;
        var montoArray=[];
        if(monto.length==0){
        	montoArray[0]=0;
        }
        else{
        	for(let i=monto.length;i>0;i--){
    	        if(montoArray.length==0 ){
    	            montoArray[nextChar]=monto.charAt(nextChar);
    	        }else if(i%3==0 && nextChar!=0){
    	            montoArray[montoArray.length]=",";
    	            montoArray[montoArray.length]=monto.charAt(nextChar);
    	        }else{
    	           montoArray[montoArray.length]=monto.charAt(nextChar);
    	        }
    	        nextChar+=1;
    	    }
        }
	    return montoArray
    }
	montoSinDecimal(monto){
		var inDec = smartBilling.indexDecimal(monto);
		var index =inDec?monto.indexOf("."):monto.length;
	    	return monto.substring(0,index);
	}
	indexDecimal(monto){
	    return monto.indexOf(".")>0;
	}
	montoFormat(montoArray,montoDecimal){
	    var montoComas="";
	    $.each(montoArray,function(i,v){
	        montoComas+=v;
	    });
	    if(montoDecimal==null)
	        return montoComas;
	    return montoComas.concat(montoDecimal)
	}
	
	formatoDinero(monto,totZero){
		var montoString=monto.toString();
		var montoSinDec=smartBilling.montoSinDecimal(montoString);
		var montoDec=smartBilling.rightPadWithZeroes(smartBilling.montoDecimal(montoString),totZero);
		var mntArray=smartBilling.montoArray(montoSinDec);
		var mntFormat=smartBilling.montoFormat(mntArray,montoDec);
	    return mntFormat;
	}
	formatoDinero(tipoMoneda,monto,totZero){
		var montoString=monto.toString();
		var montoSinDec=smartBilling.montoSinDecimal(montoString);
		var montoDec=smartBilling.rightPadWithZeroes(smartBilling.montoDecimal(montoString),totZero);
		var mntArray=smartBilling.montoArray(montoSinDec);
		var mntFormat=smartBilling.montoFormat(mntArray,montoDec);
	    return tipoMoneda.concat(mntFormat);
	}
	rightPadWithZeroes(number,totZero){ 
		while(number.length<=totZero){
			number+="0";
		}	
		return number;
	}
	montoDecimal(monto){
	    var inDec = smartBilling.indexDecimal(monto);
		var index =inDec?monto.indexOf("."):-1;
	    if(index<0)
	        return ".";
	    return monto.substring(index,monto.length);
	}
	addZeroesToNumber(number,totZero){
		var montoString=number.toString();
		var montoSinDec=smartBilling.montoSinDecimal(montoString);
		var montoDec=smartBilling.rightPadWithZeroes(smartBilling.montoDecimal(montoString),totZero);
		return montoSinDec.concat(montoDec);
	}
	reload_css(src) {
        $('link[href="' + src + '"]').remove();
        $('<link>').attr({'rel':'stylesheet','href': src}).appendTo('head');
    }
	reload_js(src) {
        $('script[src="' + src + '"]').remove();
        $('<script>').attr('src', src).appendTo('head');
    }
	reloadAllScriptsAndStyles(data){
		smartBilling.removeUneccesaryScripts();
		$.each($(data),function(i,v){
			var source;
			var context = UrlUtils.contextPath();
			if(v.src!=undefined && v.src.indexOf(context)>0){
				source = v.src.substring(v.src.indexOf("js"),v.src.length);
				smartBilling.reload_js(source);
			}else if(v.src=="" && v.src.indexOf("/js/")<0){
				$("head").append(v);
			}
			else if(v.href!=null && v.href.indexOf(context)>0 && v.href.indexOf("/css/")>0){
				source = v.href.substring(v.href.indexOf("css"),v.href.length);
				smartBilling.reload_css(source);
			}else if (v.href!=null && v.href.indexOf(context)>0 && v.href.indexOf("/js/")>0){
				source = v.href.substring(v.href.indexOf("js"),v.href.length);
				smartBilling.reload_css(source);
			}	
		});
	}
	removeUneccesaryScripts(){
		var head = $("head")[0].childNodes;
		for(var i=0;i<head.length;i++){
			var v = head[i];
			var source;
			if(v.src!=undefined){
				source = v.src.substring(v.src.indexOf("js"),v.src.length);
				if(source!="js/jquery-1.12.4.js" && source!="js/smartBilling.js")
					$('script[src="' + source + '"]').remove();
			}else if(v.href!=undefined){
				source = v.href.substring(v.href.indexOf("css"),v.href.length);
				if(source!="css/estiloSmartBilling.css")
					$('link[href="' + source + '"]').remove();
			}else if(v.style!=undefined){
				$(v.style).remove();
			}
		}
	}
	/**
	 * Este metodo construye un calendario, el cual muestra dia,mes y año
	 * */
	buildSimpleDatePicker(idElement){
		$(idElement).datepicker({
		    dateFormat: 'dd-mm-yy',
			monthNames:["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre",
				"Octubre","Noviembre","Diciembre"],
		    beforeShow: function (input, inst) {
		      	$("#ui-datepicker-div").removeClass("hide-calendar");
		    }
		 });
	}
	/**
	 * Este metodo contruye un calendario, el cual solo muestra mes y año
	 * @Param elemento el que se mostrara el calendario 
	 * **/
	buildDatePickerYearAndMonth(idElement){
		$(idElement).datepicker({
			   changeMonth: true,
			   changeYear: true,
			   buttonText: "Aceptar",
		        showButtonPanel: true,
		        dateFormat: 'mm-yy',
		        beforeShow: function (e, inst) {
		            $("#ui-datepicker-div").addClass("hide-calendar");
		            $("#ui-datepicker-div").addClass('HideTodayButton');
		        },
				onClose: function(dateText, inst){
					 var iMonth = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
				     var iYear = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
				     $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
				}
		});
	}
	
	cmpValInTable(ref,value){
		var keys = Object.keys(value);
		var row=$(ref).find("#"+keys);
		return row.is(":contains('" + value[keys] + "')")
	}
	tableFilter(idBtn,inputClass,tableBodyId) {
		$(idBtn).on("click", function() {
			var values = [];
			$(inputClass).each(function(){
				if( this.value!= undefined && this.value!=""){
					var id = this.id;
					var data = {};
					data[id] = this.value;
					values.push(data);
				} 
			});
			var jo = $(tableBodyId).find("tr");
			if (values.length==0) {
				jo.show();
				return;
			}
			jo.hide();
			jo.filter(function(i, v) {
				var $t = $(this);
				for (var d = 0; d < values.length; ++d) {
					var res = smartBilling.cmpValInTable($t,values[d]); 
		            if (res && d==values.length-1) {
		                return true;
		            }else if(!res)
		            	return false;
				}
				return false;
			}).show();
		});
	}

	
	builTableErrors(obj,idTable){
		$(idTable).DataTable( {
			"paging": true,
			"pageLength": 8,
		    "searching": false,
		    "ordering": true,
		    "autoWidth": false,
		    "bFilter": false,
		    "bLengthChange": false,
		    "language": {
	            "url": "js/dataTablesLanguage/es_ES.json"
	        },
		    "data": obj,
		    "columns": [{
		        "title": "Fila",
		        "className": "letra",
		        "width":"90px",
		        "data": function(data){
		        	var fila = data.fila;
		        	return fila;
		        }

		    }, {
		        "title": "Descripcion",
		        "className": "letra",
		        "width":"90px",
		        "data": function(data){
		        	var error=data.errorMessage;
		        	return error;
		        }
		    }]
	    });
}
	findDataOnElement(index,table,inputElement){
    	var data ="";
    	var ind=index+1;
    	$(table).find("tr").filter(function(i,v){
    		if(i==ind){
    			data = $(v).find(inputElement).val();
    			return false;
    		}
    			
    	});
    	return data;
    }
	getInputCheckVal(inputElement){
		var inputs = $(inputElement);
		var result = "";
		if(inputs.length>0)
			$.each(inputs,function(i,v){result+=$(v).val()+","});
		return result;
	}
	
	tituloMenuInicio(titulo){
		$(".selected").html(titulo);
	}
	
	entryOnlyPositiveNumbers(id){
		$(id).on("keypress",function(e){
		    var charCode = (e.which) ? e.which : e.keyCode;
		    var point = (charCode  ==46 || charCode  ==110 || charCode==8);
			if ((!isNaN(String.fromCharCode(charCode)) || point) && ((charCode  >= 48 && charCode  <= 57) ||(charCode   >= 96 && charCode <= 105) || charCode  ==8 || ((charCode  ==46 || charCode  ==110 || charCode ==100) && $(this).val().indexOf('.')==-1)) && smartBilling.totDecimal(this,2)){
				return true;
			}
			return false;
		});
	}
	entryOnlyPositiveAndNegativeNumbers(id){
		$(id).on("keypress keyup",function(e){
			if ((e.which >= 48 && e.which <= 57) ||(e.which >= 96 && e.which <= 105) || e.which ==8 || ((e.which ==46 || e.which==110 || e.which==100) && $(this).val().indexOf('.')==-1) || (e.which ==45 && $(this).val().length==0) && smartBilling.totDecimal(this,2)){
				return true;
			}
			return false;
		});
	}
	sumAllInputValue(table,inputClass){
    	var inputVal =BigInt("0");
		$(table).find("tr").filter(function(i,v){
			var val =$(v).find("input[class="+inputClass+"]").val();
			if(val!=undefined && val >0 && val!=isNaN ){
    			inputVal +=  BigInt(val);
			}
    	});
		return BigInt(inputVal);
	}
/*  Esta funcion es para obtener el valor de un input en una tabla basada en indice de la fila, id de la tabla y clase del input
 * */
 
	 trInputVal(index,table, inputclass){
    	var inputVal =0;
    	var ind=index+1;
    	var tab=$(table).find("tr").filter(function(i,v){
    		if(i==ind){
    			inputVal = $(v).find("input[class="+inputclass+"]").val();
    			return false;
    		}
    			
    	});
    	return inputVal;
    }
	formAction(formId,url){
		var form =$(formId); 
		form.attr("action",url);
		form.submit();
	}
	formAction(formId,url,method){
		var form =$(formId); 
		form.attr("action",url);
		form.attr("method",method);
		form.submit();
	}
	totDecimal(inputId,numberDecimal){
		var val = $(inputId).val()
		var size = val.indexOf(".");
		var lg = val.length;
		return size==-1 || val.substring(size,lg).length<=numberDecimal;
	}


	
}
let smartBilling = new SmartBilling();
$(document).ready(function(){
	$("input").attr("autocomplete","off");
});