class ActualizacionProducto extends SmartBilling{
	constructor(jsonProds){
		super();
		this._jsonProds=jsonProds;
	}
	set jsonProds(jsonProds){
		this._jsonProds=jsonProds;
	}
	get jsonProds(){
		return this._jsonProds;
	}
	createTable(obj,lenguaje){
		$("#tableActProd").DataTable({
			"paging":true,
			"pageLength":8,
			"searching":true,
			"ordering":false,
			"autoWidth":true,
			"data":obj.jsonProds,
			"language": {
	            "url": "js/dataTablesLanguage/"+lenguaje
	        },
			"columns":[{
				"className": "letra",
				"data":function(data){
						return data.fechaCreacion
					}
			},{
				"className": "letra dt-Thead",
				"width":"120px",
				"data":function(data){
		        	var estatus = data.estatus==="AC"?"CA":"AC";
		        	var attr= estatus==="AC"?"disabled="+(true):"";
		        	var select="<select name=estProducto "+attr+" style=width:100%>" +
		        			"<option>"+data.estatus+"</option>"+
		        			"<option>"+estatus+"</option>";
		        	return select;
				}
			},{
				"className": "letra",
				"data":function(data){
					return data.monedaProducto
				}	
			},{
				"className": "letra",
				"data":function(data){
					return data.descripcion
				}
			},{
				"className": "letra",
				"data":function(data){
					return data.idSalesforce
				}
			},{
				"className": "letra",
				"data":function(data){
					return data.claveProdSat
				}
			},{
				"className": "letra",
				"data":function(data){
					return data.tipoCargo;
				}
			},{
				"className": "letra",
				"data":function(data){
					var attr=data.estatus==="CA"?"disabled=true":"";
					var label="<button name=producto"+attr+">Actualizar</button>"
					return label;
				}
			}],"rowCallback":function(row,rowData,index){
				$(row).on("click","td > button[name=producto]",function(event){
					var params={"idProducto":rowData.idProducto};
					var url=UrlUtils.urlACtualizaProducto();
					var response = obj.ajaxGet(url,params);
					response.then(data=>{
						obj.replaceHtmlContentSection("#formProductos",data,url,"div");
						obj.formActProd();
					},error=>{
						
					})
				});
				
				$(row).on("change","td > select[name=estProducto]",function(event){
					var idProducto=rowData.idProducto;
					var estatus=$(this).val();
					var data={"idProducto":idProducto,"estatus":estatus};
					obj.dialog(data,obj);

		    	});
			}
		});
	}
	dialog(data,obj){
		var div = $("#dialog");
 		div.html("<p>&#191;Deseas actualizar el estatus del producto a " + data.estatus +" </p>");
		div.dialog({
			title:"Actualizar estatus del producto",
			draggable:false,
			width:400,
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
						var url=UrlUtils.ulrActualizaEstatusProducto();
						var response=obj.ajaxPost(url,data);
						response.then(data=>{alert("Estatus actualizado");
							window.location=UrlUtils.urlActualizacionProductos();
						}
						,error=>alert("Ocurrio un error al actualizar el estatus de la compra"));
					}
				}
			],
			close:function(event,ui){
				$("p").remove();
				$(this).dialog("close");
			}
		});
	}
	formActProd(){
		$("#formCuenta").submit(function(event){
			var estatus=$("#estatus").val();
			var monedaProducto=$("#monedaProducto").val();
			var descripcion= $("#descripcion").val();
			var idSalesForce=$("#idSalesforce").val();
			var claveProdSat=$("#claveProdSat").val();
			var familia=$("#familia").val();
			if((estatus==null || estatus==="") || (monedaProducto==null || monedaProducto==="") || (idSalesForce==null || idSalesForce==="") ||
					(claveProdSat==null || claveProdSat==="") || (familia==null || familia==="") || (descripcion==null || descripcion==="")){
					alert("Todos los campos deben se rellenados")
					event.preventDefault();
			}
		});
	}
}
function producto(prods, lenguaje){
	$(document).ready(function(){
		let actualizacionProducto = new ActualizacionProducto(prods);
		actualizacionProducto.createTable(actualizacionProducto,lenguaje);
	});
}
