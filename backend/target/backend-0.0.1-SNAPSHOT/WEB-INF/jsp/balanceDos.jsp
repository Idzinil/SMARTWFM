<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
		<link rel="stylesheet" type="text/css" href="css/estiloSmartBilling.css">
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
	<jsp:include page="menu3.jsp" /> 
		
		<div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		        <img src="/SmartBilling/img/das.png" width="16px" height="16px" style="margin-left:10px;"> BALANCE DE CUENTAS
		    </div>
		</div>
<body>
 	<div id="datos">

<div id="datosBal">
<table style="width: 80%"  class="letrath"  >
		<tr>
			<th bgcolor="#A9BCF5">Periodo</th>
			<th bgcolor="#A9BCF5">Total Items</th>
			<th bgcolor="#A9BCF5">Monto adeudado</th>

		</tr>
		<c:forEach var="it" items="${lstItem}">
		<tr>
			<td bgcolor="#FFFFFF"><a href="/SmartBilling/balanceDetalle?factura=<c:out value="${it.factura_idFactura}/${it.fechaInicio}/${it.fechaFin}" />" ><c:out value="${it.fechaInicio} / ${it.fechaFin } " /></a></td>
			<td bgcolor="#FFFFFF"><c:out value="${it.totalItems}" /></td>
			<td bgcolor="#FFFFFF"><c:out value="${it.montoItemTotalStr}" /></td>

		</tr>
		</c:forEach>
	</table>
	</div>	
</div>
</body>
</html>