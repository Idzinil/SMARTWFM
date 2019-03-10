class PantallaPrincipalBilling extends SmartBilling {
	updateAcoutnsForBilling() {
		var totFac = pantallaPrincipalBilling.getAllInputChecked("input[name='facturar']");
		pantallaPrincipalBilling.doProcesForUpdateAccountsForBilling(totFac);
	}
	getAllInputChecked(id) {
		var totFac = '';
		$(id).each(function() {
			if ($(this).is(":checked")) {
				totFac += $(this).val() + ',';
			}
		});
		return totFac;

	}
	validaform(id, idElement, message) {
		var totFac = pantallaPrincipalBilling.getAllInputChecked(idElement);
		$(id).submit(function(event) {
			if (totFac == null || totFac === "") {
				alert(message);
				event.preventDefault();
			}

		});
	}

	doProcesForUpdateAccountsForBilling(params) {
		var url = UrlUtils.urlGuardarEstatusFacturar();
		var data = {
			"id" : params
		};
		var request = pantallaPrincipalBilling.ajaxPost(url, data);
		request.then(response => {
			pantallaPrincipalBilling.changeLocationURL(UrlUtils.urlBillBusca());
		}, error => {
			alert("Ocurrio un error al realizr la actualizacion");
		});
	}
	facturar() {
		$("#btnDos").on("click", function() {
			var url = UrlUtils.urlFacturar();
			var request = smartBilling.ajaxPost(url);
			request.then(response => {
				pantallaPrincipalBilling.changeLocationURL(UrlUtils.urlBillBusca());
			}, error => {
				alert("Ocurrio un error al facturar la cuenta");
			});
		});
	}
	enableCheck(idElement, inputelement) {
		$(idElement).on("click", function() {
			if ($(this).is(':checked')) {
				$(inputelement).prop("checked", true);
			} else {
				$(inputelement).prop("checked", false);
			}
		});
	}
	

	limpiarTabla(idBtn) {
		$(idBtn).on("click", function() {
			var jo = $("#fBody").find("tr");
			jo.show();
		});
	}

	padNumber(number) {
	    var ret = new String(number);
	    if (ret.length == 1) ret = "0" + ret;
	    return ret;
	}
	
	hightLightDates(date,arrayDate){
		
		if(arrayDate.length>0){
			for(var i=0;i<arrayDate.length;i++){
				var selectedDate = new Date(date).getTime();
				var firstDate =  new Date(arrayDate[0]).getTime();
				var secondDate = new Date(arrayDate[1]).getTime();
				return selectedDate >=firstDate  && selectedDate <= secondDate
			}	
		}
		return false;
	}
	
	orderDates(datesArrays){
		if(datesArrays.length==2){
			var arr = datesArrays[0].split('-');
			 var day = arr[1];
			 var month =arr[0];
			 var year = arr[2];
			 var arr1 = datesArrays[1].split('-');
			 var day1 = arr1[1];
			 var month1 = arr1[0];
			 var year1 = arr1[2];
			 if((year>year1) ||((year==year1 && month==month1 && day>=day1) ||(year==year1 && month>month1))){
				 var res = [datesArrays[1],datesArrays[0]]
				 return res;
			 }else if((year1==year && month1==month && day1>=day) ||(year==year1 && month>month1)){
				 var res = [datesArrays[0],datesArrays[1]]
				 return res;
			 }
		}
		return datesArrays;
	}
	
	buildSimpleDatePickerTT(idElement,date1,date2 ){
		var dates = new Array();
		$(idElement).datepicker({
		    dateFormat: 'mm-dd-yy',
		    minDate: new Date(date1.substring(0,4),(date1.substring(5,7)-1),date1.substring(8,10)),
		    maxDate: new Date(date2.substring(0,4),(date2.substring(5,7)-1),date2.substring(8,10)),
			monthNames:["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre",
				"Octubre","Noviembre","Diciembre"],
			numberOfMonths: [ 1, 1 ],
			onSelect:function(date){
				if(dates.length==2){
					dates.splice(0,2);
					dates.push(date);
				}else if(dates.length==1 || dates.length==0){
					dates.push(date);
					dates = pantallaPrincipalBilling.orderDates(dates);
					sessionStorage.setItem("dates",dates);
				}
			},	
			beforeShowDay: function (date) {
		        var year = date.getFullYear();
		        var month = pantallaPrincipalBilling.padNumber(date.getMonth() + 1);
		        var day = pantallaPrincipalBilling.padNumber(date.getDate());
		        var dateString = month+ "-"+day + "-"  + year;
		        if (pantallaPrincipalBilling.hightLightDates(dateString,dates)) {
		            return [true, "ui-state-error"];
		        }
		        return [true, ""];

			},
		    beforeShow: function (input, inst) {
		      	$("#ui-datepicker-div").removeClass("hide-calendar");
		    }
		 }).on( "change", function() {
	          to.datepicker( "option", "minDate", getDate( this ) );
	        });
	}
	dialog(idCompra,date1,date2) {
		var div = $("#dialog");
		div.dialog({
			title : "Actualizar Periodo",
			draggable : false,
			resizable : false,
			minDate: -1,
			modal : true,
			width : "23%",
			open : function(event, ui) {
				$('.ui-widget-overlay').addClass('custom-overlay');
				pantallaPrincipalBilling.buildSimpleDatePickerTT(this,date1,date2);
			},
			buttons : [
				{
					text : "Aceptar",
					click : function() {
						var data = sessionStorage.getItem("dates").split(",");
						if(data.length==2){
							var data = {idCompra:idCompra,date1 : data[0],date2:data[1]};
							var url =  UrlUtils.urlActualizaCiclosFactura();
							var response = smartBilling.ajaxPost(url, data);							
							response.then(
								data =>{
									window.location=UrlUtils.contextPath()+data;
								}, error => {alert("Ocurrio un error inesperado")}
							);
						}else
							alert("Debes seleccionar otra fecha");
					}
				},
				{
					text : "Restaurar",
					click : function() {
						var data = {idCompra:idCompra};
						var url = UrlUtils.ulrRestauraCicloFactura();
						var response = smartBilling.ajaxPost(url, data);							
						response.then(
							data =>{
								window.location=UrlUtils.contextPath()+data;
							}, error => {alert("Ocurrio un error inesperado")}
						);
					}
				},
				{
					text : "Cancelar",
					click : function() {
						$(this).dialog("close");
					}
				}

			],
			close : function(event, ui) {
				$("p").remove();
				$(this).dialog("close");
			}
		});
	}

	openDialog(ref,idCompra) {
			var date1=$(ref).find("label").text().substring(0,10);
			var date2=$(ref).find("label").text().substring(10,20);
			pantallaPrincipalBilling.dialog(idCompra,date1,date2);
	}
	
	
	
	
}
let pantallaPrincipalBilling = new PantallaPrincipalBilling();
	$(document).ready(function() {
		pantallaPrincipalBilling.facturar();
		pantallaPrincipalBilling.enableCheck("#allIVA", "input[class='iva']");
		pantallaPrincipalBilling.enableCheck("#allFacturar", "input[class='facturar']");
		pantallaPrincipalBilling.enableCheck("#allProrrateo", "input[class='prorrateo']");
		pantallaPrincipalBilling.enableCheck("#allIEPS", "input[class='ieps']");
		pantallaPrincipalBilling.validaform("#doPreciclo", "input[name='facturar']", "Para generar el reporte de preciclo, es necesario seleccionar una o mas cuentas");
		pantallaPrincipalBilling.validaform("#doFactura", "input[name='facturar']", "Para realizar la facturacion, es necesario seleccionar una o mas cuentas")
		$("#actualizarCuentasFacturar").on('click', function() {
			pantallaPrincipalBilling.updateAcoutnsForBilling();
		});
		pantallaPrincipalBilling.tableFilter("#btnBillginFiltroBuscar", ".resIni","#fBody");
		pantallaPrincipalBilling.tableFilter("#btnBillingFiltroGrupos", ".grupo", "#fBody");
		pantallaPrincipalBilling.limpiarTabla("#btnBillgLimpiarFiltro");
		pantallaPrincipalBilling.tableFilter("#btnBillginFiltroBuscarDatosFacturado",".resFac","#fBody");
		pantallaPrincipalBilling.tableFilter("#btnBillginFiltroBuscarResumenContratos",".resContratos","#fBody");
		
	});

