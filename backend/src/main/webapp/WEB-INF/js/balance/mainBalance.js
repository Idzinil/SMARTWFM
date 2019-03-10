class MainBalance{
	flecha(imgId,monto,isChurn){
		var contextPath = UrlUtils.contextPath();
		var flechaVerdePath=contextPath+"img/flecha-arriba-verde.png";
		var flechaNegraPath=contextPath+"img/flecha-derecha-negro.png";
		var fechaAbajoNaranja=contextPath+"img/flecha-abajo-naranja.png";
		if(monto>0 && !isChurn)
			$(imgId).attr("src",flechaVerdePath);
		else if(monto==0 && !isChurn)
			$(imgId).attr("src",flechaNegraPath);
		else if(monto<0 && !isChurn)
			$(imgId).attr("src",fechaAbajoNaranja);
		else if(monto>0 && isChurn)
			$(imgId).attr("src",flechaNegraPath);
		else if(monto<0 && isChurn)
			$(imgId).attr("src",flechaVerdePath);
		else if(monto==0 && isChurn)
			$(imgId).attr("src",flechaNegraPath);
	}
	
	setFlecha(montos){
		var ctaDiff=montos[0];
		var factMxnDiff=montos[1];
		var factUsdDiff=montos[2];
		var churnMxnLastMonth = montos[3];
		var churnUsdLastMonth = montos[4];
		mainBalance.flecha("#imgFlechaCuenta",ctaDiff,false);
		mainBalance.flecha("#imgCuandroFacturacionMXN",factMxnDiff,false);
		mainBalance.flecha("#imgCuandroFacturacionUSD",factUsdDiff,false);
		mainBalance.flecha("#churnMxnDiff",churnMxnLastMonth,true)
		mainBalance.flecha("#churnUsdDiff",churnUsdLastMonth,true)
	}
	buildDatePickerYearAndMonthAndSetDateInForm(idElement,idForm){
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
				     var indexRequest = $(idForm).attr("action").indexOf("?");
				     var strDate = $(this).val();
				     if(indexRequest>=0){
					     var action = $(idForm).attr("action").substring(0,indexRequest).concat("?date="+strDate);
					     $(idForm).attr("action",action);
				     }else{
				    	 var act =$(idForm).attr("action").concat("?date="+strDate) 
				    	 $(idForm).attr("action",act);
				     }
				     
				}
		});
	}

	
}
var mainBalance = new MainBalance();
function startMainBalance(params){
	$(document).ready(function(){		
		mainBalance.setFlecha(params);
		mainBalance.buildDatePickerYearAndMonthAndSetDateInForm("#fecha","#formBalance");
	});
}