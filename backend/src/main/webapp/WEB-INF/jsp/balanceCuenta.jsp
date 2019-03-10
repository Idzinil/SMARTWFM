<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>		 
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSmartBilling.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/secciones.css"/>">
		
		<title>
        SMARTBILLING - Sytecso System
    	</title>
		<script>
			function goBack() {
			    window.history.back();
			}
		</script>
		<style>
			table {
				font-family: arial, sans-serif;
				border-collapse: collapse;
				border: 1px #D8D8D8 solid;
				width: 100%;
			}
			
			td, th {
				 
				text-align: left;
				padding: 8px;
				 
			}
			thead { 
				background: linear-gradient(to bottom, #0066cc 3%, #ccffff 84%);
				color: #424242;
			 }
			 tr:nth-child(even)
			 {
			 	background-color: #E6E6E6;
			 }
			.letra {
				font-size: 15px;
				}
			.letrath {
				font-size: 13px;
				}
				
			
			
		</style>
	</head>
	<jsp:include page="menu3.jsp" /> 
		
		<div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		        <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;"> BALANCE DE CUENTAS
		    </div>
		</div>
<body>
<div id="tableroSmartBilling">
			<div id="mainContent">
				<div class="contenido" style="display: inline-block; text-align: center;">
 	<div id="datos">
 	<div id="datosCuenta">
	<table style="width: 100%"  class="letrath"  >
			<thead>
					<tr>
						<th colspan="2" >Resumen de Saldo</th>
						
					</tr>
			</thead>
					<tr>
						<td  >Cantidad adeudada por todas las facturas:</td>
						<td  >${tot1 }</td>
					</tr>
					<tr>
						<td  >Ajustes/Pagos no aplicados:</td>
						<td  >$0.00</td>
					</tr>
					
					<tr>
						<td  ><a href="${pageContext.request.contextPath }/balanceDetalleSinFac">Facturacion en progreso(estimado)</a></td>
						<td  >${totalNoFacturado} </td>
					</tr>
					<tr>
						<td >Total</td>
						<td  >${bills }</td>
					</tr>
					
				</table>
</div>
<div id="datosBal">
	<table style="width: 100%"  class="letrath"  >
	<thead>
		<tr>
			<th >Numero</th>
			<th >Ciclo Billing</th>
			<th >Cargos totales Item</th>
			<th >Pagos y Ajustes</th>
			<th >Balance</th>
		</tr>
	</thead>
		<c:forEach var="fac" items="${facturas}">
		<tr>
			<td bgcolor="#FFFFFF"><a href="${pageContext.request.contextPath }/balanceDos?factura=<c:out value="${fac.idFactura}" />"><c:out value="${fac.numeroFactura}" /></a></td>
			<td bgcolor="#FFFFFF"><c:out value="${fac.fechaInicio}-${fac.fechaFin}" /></td>
			<td bgcolor="#FFFFFF"><c:out value="${fac.cargosTotales}" /></td>
			<td bgcolor="#FFFFFF">$0.00</td>
			<td bgcolor="#FFFFFF"><c:out value="${fac.balance}" /></td>
		</tr>
		</c:forEach>
	</table>
	</div>	
	<div id="datosbotones">

		<div id="botonBack">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/regresar.png">Regresar</a>
				</div>
			</div>
		<div id="botonHome">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/home.png">Principal</a>
				</div>
			</div>
		</div>
</div>
			</div>
			</div>
		</div>
</body>
</html>