<!DOCTYPE html>
<html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<head>
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSmartBilling.css"/>">

		<title>
        SMARTBILLING - Sytecso System
    	</title>
    			<link rel="stylesheet" type="text/css" href="/SmartBilling/css/estiloSmartBilling.css">
<!-- 			  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
		<script src="js/jquery-1.12.4.js"></script>
		<script>
		$(document).ready(function() {
			function goBack() {
			    window.history.back();
			}
			
		    $( "#buscar" ).click(function() {
		    	
		    	var ciclo = $( "#ciclo" ).val();
		    	var mes = $( "#mes" ).val();
		    	var cuenta = $( "#cuenta" ).val();
		    	var grupo = $( "#grupo" ).val();
		    	var contrato = $( "#contrato" ).val();
	
			if(ciclo!=0 || mes!=0 || cuenta!='' || grupo!=''){
		        $.ajax({
		        	  url: '/SmartBilling/billBuscaAgrupado',
		        	  type: 'POST',
		        	  data: {'ciclo': ciclo, 'cuenta': cuenta, 'grupo':grupo, 'mes': mes, 'contrato': contrato},
		        	  success: function (data) {
		             	 
		        		  if(data='success'){
		        			  window.location.href = '/SmartBilling/billResultadoAgrupado';
		        		  }
		   
		              }
		        	  });
			}else{
				 $("#divUno").hide();
				 $("div#errMsg").css("background-color", "orange");
	          	$("div#errMsg").html("Debe seleccionar algun tipo de filtro.");
	 		}
			
	
		    });
		    
		});
		</script>
		<style>
			

			table {
				font-family: arial, sans-serif;
				border-collapse: collapse;
				border-color: 1px #D8D8D8 ;
				width: 100%;
			}
			
			td, th {
				border: 1px #D8D8D8 solid;
				text-align: left;
				padding: 8px;
				 
			}
			thead { 
			background: linear-gradient(to bottom, #2E2E2E 3%, #151515 84%);
				color: #D8D8D8;
			 }
			 tr:nth-child(even)
			 {
			 background-color: #E6E6E6;
			 }
			.letra {
				font-size: 13px !important;
				color:#1C1C1C !important;
				font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
				}
			.letrath {
				font-size: 16px !important;
				color:white !important;
				font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
				}
				.letrap {
				font-size: 18px !important;
				color:#1C1C1C !important;
				font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
				}
		</style>
	</head>
	<body>
	<%
		int tableIndexFac = -1;
	int ind = 0;
	%>
		<jsp:include page="menu3.jsp" /> 
		
		<div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		        <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;"> FACTURACIÓN
		    </div>
		</div>
	<div id="tableroSmartBilling">
		     <div class="contenido">
 			
			<form:form id="formBill" action="${pageContext.request.contextPath}/billBusca" method="POST">
		<div id="datos">
			<div id="datosForm1">

				<table style="width: 100%" class="letrath" style="border:none;" >
					
					<tr>
								<td class="letrath" bgcolor="#2584A7">Factura:</td>
								<td class="letrath" bgcolor="#2584A7"><input type="text" name="grupo" id="grupo" /></td>
								<td class="letrath" bgcolor="#2584A7">ID Agrupador:</td>
								<td class="letrath" bgcolor="#2584A7"><input type="text" name="contrato" id="contrato" /></td>
							</tr>
					<tr>
						<td class="letrath" bgcolor="#2584A7">&nbsp;</td>
						<td class="letrath" bgcolor="#2584A7">
							<input type="button" id="buscar" value="Buscar" />
						</td>
					</tr>
					<tr>
						<td class="letrath" bgcolor="#2584A7">
							<div id="errMsg"></div>
						</td>
						<td class="letrath" bgcolor="#2584A7">
							
						</td>
					</tr>
				</table>
				</div>
				</div>
			</form:form>
			</div>
		<p class="letrap"><n>Facturación Cuenta</n></p>
					<div id="divDos">
						<table style="width: 80%" id="test" align="center"  class="letrath">
						<thead class="letrath" >
							<tr class="letrath" >
								<th  >Número Cliente</th>
								<th >Alias Cliente</th>
								<th >Nombre Cliente</th>
								<th >Factura</th>
								<th >ID Agrupador</th>
<!-- 								<th >Descripción MKT</th> -->
<!-- 								<th >Descripción Factura</th> -->
								<th >Descripción Override</th>
								<th >Descripción Factura</th>
								<th >Leyenda</th>
								<th >Monto Suma</th>
								<th >Moneda</th>
								<th >Guardar</th>
							</tr>
							</thead>
							<c:forEach var="listVar" items="${billData}">
								<tr class="letra" >
								<form:form action="${pageContext.request.contextPath}/cambiaLeyenda?id=${listVar.actIndex}" modelAttribute="billBean">
									<td><c:out value="${listVar.numCuenta}" /></td>
									<td><c:out value="${listVar.aliasCliente}" /></td>
									<td><c:out value="${listVar.razonSocial}" /></td>
								    <td >${listVar.agrupacionDealusario}</a></td>
									<td><a href="/SmartBilling/buscaXGrupo/<%=tableIndexFac = tableIndexFac + 1%>"><c:out value="${listVar.idContrato}" /></a></td>
<%-- 									<td><c:out value="${listVar.descMarketing}" /></td> --%>
<%-- 									<td><c:out value="${listVar.descripcionSAT}" /></td> --%>
<%-- 									<td><c:out value="${listVar.descripcionOverride}" /></td> --%>
										<td><form:input type="text" path="descripcion" placeholcer="Descripcion"/></td>
<%-- 									<td><c:out value="${listVar.facturaDescSAT}" /></td> --%>
<%-- 									<td><label>Serv de Telecom de interconexión por Rta Mensual de Circuito ${listVar.idContrato}</label></td> --%>
									<td><label>Serv de Telecom de interconexión por Rta Mensual de Circuito ${listVar.idContrato}</label></td>
<%-- 									<td><c:out value="${listVar.leyenda}" /></td> --%>
									<td><form:input type="text" path="leyendaExtra" placeholcer="Leyenda"/></td> 
									<td><c:out value="${listVar.montoSumar}" /></td>
									<td><c:out value="MXN" /></td>
									<td><input type="submit" value="Guardar"></td>
									</form:form>
								</tr>
								
							</c:forEach>
						</table>
						<p></p>
						<br>
						<br>
						
						
					</div>	

			</div>
			<div id="datosbotonesComp">
							<div id="botonBack">
								<div class="col-sm-6">
									
					<a href="${pageContext.request.contextPath}/billResultadoIni"><img src ="${pageContext.request.contextPath}/img/regresar.png">Regresar</a>
								</div>
							</div>
							<div id="botonHome">
								<div class="col-sm-6">
									
					<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/home.png">Principal</a>
								</div>
							</div>
						</div>
	</body>
</html>