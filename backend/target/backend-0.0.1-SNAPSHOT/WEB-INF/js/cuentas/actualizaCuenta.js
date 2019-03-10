$(document).ready(function(){
	$("#formCuenta").submit(function(event){
		var ejecutivoJs = $("#ejecutivoJs").val();
		var rfc= $("#rfc").val();
		var calle = $("#calle").val();
		var colonia = $("#colonia").val();
		var ciudad = $("#ciudad").val();
		var pais = $("#pais").val();
		var estado = $("#estado").val();
		var codigoPostal =$("#codigoPostal").val();
		if((ejecutivoJs==null || ejecutivoJs==="") || (calle==null || calle==="") || 
				(calle==null || calle==="") || (colonia==null || colonia==="") || (ciudad==null || ciudad==="")
				|| (pais==null || pais==="") || (codigoPostal==null || codigoPostal==="")){
			alert("Los campos requeridos deben ser llenados");
			event.preventDefault();
		}
		
	});
});