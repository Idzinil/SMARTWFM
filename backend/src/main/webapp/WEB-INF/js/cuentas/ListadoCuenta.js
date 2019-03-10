class ListadoCuenta extends SmartBilling{
	constructor(json,selectOptions){
		super();
		this.json=json;
		this.selectOptions=selectOptions;
	}
	set json(json){
		this._json=json;
	}
	get json(){
		return this._json;
	}
	
	dataIsNull(data){
		return (data!=null && data!="")?data:"";
	}
	set selectOptions(selectOptions){
		this._selectOptions=selectOptions;
	}
	get selectOptions(){
		return this._selectOptions;
	}
}

function listadoCuenta(list, lenguaje){
	 $('#data').DataTable( {
		"paging": true,
	    "lengthChange": true,
	    "searching": true,
	    "ordering": true,
	    "info": true,
	    "autoWidth": true,
	    "data": list.json,
		"language": {
            "url": "js/dataTablesLanguage/"+lenguaje
        },
	    "columns": [{
	        "data": function(data){
	        	var numCuenta = data.numCuenta;
	        	return list.dataIsNull(numCuenta); 
	        }
	    }, {
	        "data": function(data){
	        	var tipocuenta = data.tipocuenta;
	        	return list.dataIsNull(tipocuenta);
	        }

	    }, {
	        "data": function(data){
	        	var region=data.region;
	        	return list.dataIsNull(region);
	        }
	    }, {
	        "data":function(data){
	        	var rfc=data.unidadFacturacion.datosFiscales.rfc;
	        	return list.dataIsNull(rfc);
	        }
	    }, {
	        "data": function(data){
				var razonSocial = data.unidadFacturacion.datosFiscales.razonSocial;
				return list.dataIsNull(razonSocial);
	        }
	    }, {
	        "data": function(data){
				var pais = data.unidadFacturacion.datosFiscales.pais;
				return list.dataIsNull(pais);
	        }

	    },{
	    	"width":"120px",
	    	"data":function(data){
	    		return "<button name=accion>";
	    	}
	    }],
	    "rowCallback":function(row,data,index){
	    	$(row).on("click","td > button[name='accion']",function(){
	    			var url=$(this).attr("id");
	    			if(url!=""){
		    			var cuenta={idCuenta:data.idCuenta};
		    			var response = list.ajaxPost(url,cuenta);
		    			response.then(data=>{
		    				if(url==="compras"){
		    					list.replaceHtmlContent("#tableroSmartBilling",data,url,".contenido");
		    				}else{
		    					list.replaceHtmlContent("#tableroSmartBilling",data,url,"mainContent");
		    				}
		    				},
		    			error=>
		    			alert("Ocurrio un error inesperado"));
	    			}else{
	    				alert("La cuenta no cuenta con los permisos necesarios para accesar a esta pantalla");
	    			}

	    	});					    	
	    },
	    "fnDrawCallback":function(oSettings){
	    	var label =$("button[name='accion']"); 
	    	$.each(list.selectOptions,function(index,val){
	    		label.attr("id",index).css("cursor","pointer").text(val);
	    		label.attr("id",index).css("font-size","12px").text(val);
	    	});
	    }, "createdRow": function ( row, data, index ) {
            $('td', row).addClass('letraPrincipal');
        }
    });

}