class MainCompras extends SmartBilling{
	constructor(){
		super();
	}

	buildTableCompras(obj,lenguaje,jsonCmp){
		 var groupColumn = 8; 
		$('#data').removeAttr('width').DataTable( {
			"paging": true,
			 "columnDefs": [
			 { "visible": false, "targets": groupColumn }
			 ],
			 "order": [[ groupColumn, 'asc' ]],
			"pageLength": 8,
		    "searching": true,
		    "ordering": true,
		    "autoWidth": false,
		    "fixedColumns": false,
		    "fixedHeader": true,
		    "language": {
	            "url": "js/dataTablesLanguage/"+lenguaje
	        },
		    "data": obj,
		    "columns": [{
		        "width": "55px", 
		        "data": function(data){
		        	return data.orderId 
		        }
		    },{
		        "width": "55px", 
		        "data": function(data){
		        	return data.producto.descripcion 
		        }
		    }, {
		        "width": "55px", 
		        "data": function(data){
		        	return data.producto.capacidad; 
		        }
		    }, {
		        "width": "55px", 
		        "data": function(data){
		        	return 1; 
		        }
		    }, {
		        "width": "70px",
		        "data": function(data){
		        	var monto = mainCompras.dataIsNull(data.monto);
		        	if(monto==0){
		        		return 0;
		        	}
		        		
		        	var descuento = mainCompras.dataIsNull(data.descuento);
		        	var totCeros = monto.length==0?1:3;
		        	return mainCompras.formatoDinero("$ ",(monto-descuento),totCeros);
		        }

		    }, {
		        "width": "55px", 
		        "data": function(data){
		        	var moneda = data.moneda;
		        	return mainCompras.dataIsNull(moneda); 
		        }
		    }, {
		        "width": "55px",
		        "data":function(data){
		        	var estatus = data.estatus==="AC"?"CA":"AC";
		        	var attr= estatus==="AC"?"disabled="+(true):"";
		        	var select="<select name=compras "+attr+" style=width:60%>" +
		        			"<option>"+data.estatus+"</option>"+
		        			"<option>"+estatus+"</option>";
		        	return select;
		        }
		    },{
		    	"width": "140px",
		    	"data":function(data){
		    		var attr= data.estatus==="CA"?"disabled="+(true):"";
		    		var boton="<button name=btnActualizarComprar "+attr+" style=font-size:12px;"+">"+jsonCmp.btnName+"</button>";
		    		return boton;
		    	}
		    },{
		        "width": "55px",
		        "data":function(data){
		        	return data.idContrato;
		        }
		    }
		    ],
		    "rowCallback":function(row,rowData,index){
		    	$(row).on("change","td > select[name='compras']",function(event){
		    		event.preventDefault();
					var idCompra=rowData.idCompra;
					var estatus=$(this).val();
					var data={"idCompra":idCompra,"estatus":estatus};
					var response=compra.ajaxPost(UrlUtils.updateStatusCompra(),data);
					response.then(data=>{alert("Estatus actualizado");
					window.location="compras";}
					,error=>alert("Ocurrio un error al actualizar el estatus de la compra"));

		    	});
		    	
		    	$(row).on("click","td > button[name='btnActualizarComprar']",function(event){
						var url=UrlUtils.urlActCompra(rowData.idCompra);
						window.location=url;
		    	});
		    	
		    },"createdRow": function ( row, data, index ) {
	                $('td', row).addClass('letraPrincipal');
	        },"drawCallback": function ( settings ) {
			  var api = this.api();
			  var rows = api.rows( {page:'current'} ).nodes();
			  var last=null;
			 		 
			  api.column(groupColumn, {page:'current'} ).data().each( function ( group, i ) {
				  var concat  = i>0?'<tr class=" trBackGround letrathPrincipal "><td>'+jsonCmp.Id+'</td><td>'+jsonCmp.descripcion+'</td><td>'+jsonCmp.capacidad+'</td><td>'+jsonCmp.cantidad+'</td><td>'+jsonCmp.pSinImp+'</td><td>'+jsonCmp.moneda+'</td><td>'+jsonCmp.estatusCompra+'</td><td>'+jsonCmp.actualizarCompra+'</td></tr>':'';
				  if ( last !== group ) {
					  $(rows).eq( i ).before(
							  '<tr><td colspan="8" style="text-align: left;">'+group+'</td></tr>'+concat
					  );
					  last = group;
				  }
			  	} );
			 },
	        dom: 'l<"toolbar">frtip',
	        initComplete: function(){
	            $("div.toolbar")
	               .html('<button id="orderTable" class="w3-button w3-black w3-round-large" value="desc" onclick="mainCompras.orderTable(this,8)" style="margin-left: 430px;" type="button" >Ordenar por contrato</button>');           
	         }  
	    });

	}

	builTableProductos(obj,lenguaje,json){
			$('#productos').DataTable( {
				"paging": true,
				"pageLength": 8,
			    "searching": true,
			    "ordering": true,
			    "autoWidth": false,
			    "data": obj,
			    "language": {
		            "url": "js/dataTablesLanguage/"+lenguaje
		        },
			    "columns": [
			    	 {
					   "width":"90px",
					    "data": function(data){
					     	var idSalesforce=data.idSalesforce;
					        return mainCompras.dataIsNull(idSalesforce);
					      }
					},{
			        "width":"90px",
			        "data": function(data){
			        	var descripcion = data.descripcion;
			        	return mainCompras.dataIsNull(descripcion);
			        }

			    }, 
			    {
			        "width":"110px",
			        "data":function(data){
			        	var precioProducto = mainCompras.dataIsNull(data.precioProducto);
			        	return precioProducto==""?"-":precioProducto;
			        }
			    },{
			    	"width":"110px",
			    	"data":function(data){
			    		var moneda = mainCompras.dataIsNull(data.monedaProducto);
			    		return moneda;
			    	}
			    },{
			    	"width":"110px",
			    	"data":function(data){
			    		return data.tipoCargo;
			    	}
			    },{
			    	"width":"90px",
			    	"data":function(data){
			    		return "<button name=btnComprar>"+json.btnName+"</button>";
			    	}
			    }
			    ],
			    "rowCallback":function(row,rowData,index){
			    	$(row).on("click","td > button[name='btnComprar']",function(event){
							var url=UrlUtils.urlAltaCompra()+"?producto="+rowData.idProducto+"&cargo="+rowData.tipoCargo;
							try{
								window.location=url;
							}catch(err){
								alert("A ocurrido un error desconocido");
							}

			    	});
			    	
			    },"fnDrawCallback":function(oSettings){
		    }, "createdRow": function ( row, data, index ) {
	                $('td', row).addClass('letraPrincipal altoTablaCompras');
	        }
		    });
	}
	jsonCompras(id,descripcion,capacidad,cantidad,pSinImp,moneda,estatusCompra,actualizarCompra,btnName){
		return {
			Id:id,
			descripcion:descripcion,
			capacidad:capacidad,
			cantidad:cantidad,
			pSinImp:pSinImp,
			moneda:moneda,
			estatusCompra:estatusCompra,
			actualizarCompra:actualizarCompra,
			btnName:btnName
		}
	}
	jsonProductos(btnName){
		return {
			btnName:btnName
		}
	}
	orderTable(btn,column){
		var val = $(btn).val();
		var oTable = $('#data').dataTable();
		oTable.fnSort( [  [column,val] ] );
		$(btn).val(val=="desc"?"asc":"desc");
	}
	
}

var mainCompras = new MainCompras();
function compras(compras,productos, lenguaje,jsonCompra,jsonProducto){
	$(document).ready(function() {
		mainCompras.buildTableCompras(compras, lenguaje,jsonCompra);
		mainCompras.builTableProductos(productos, lenguaje,jsonProducto);
	});

}
