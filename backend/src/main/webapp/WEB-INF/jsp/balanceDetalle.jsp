<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/estiloSmartBilling.css">
<title>SMARTBILLING - Sytecso System</title>
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

tr:nth-child(even) {
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
		<img src="/SmartBilling/img/das.png" width="16px" height="16px"
			style="margin-left: 10px;"> BALANCE DE CUENTAS
	</div>
</div>
<body>
	<div id="tableroSmartBilling">
		<div id="mainContent">
			<div class="contenido"
				style="display: inline-block; text-align: center;">
				<div id="datos">
					<div id="datosCuenta">
						<table style="width: 80%" class="letrath">

							<tr>
								<th colspan="2" bgcolor="#A9BCF5">Resumen de Saldo</th>

							</tr>
							<tr>
								<td bgcolor="#FFFFFF">Cantidad adeudada por todas las
									facturas:</td>
								<td bgcolor="#FFFFFF">${total }</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF">Ajustes/Pagos no aplicados:</td>
								<td bgcolor="#FFFFFF">$0.00</td>
							</tr>

							<tr>
								<td bgcolor="#FFFFFF">Facturacion en progreso(estimado)</td>
								<td bgcolor="#FFFFFF">$0.00</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF">Total</td>
								<td bgcolor="#FFFFFF">${total }</td>
							</tr>

						</table>
					</div>
					<div id="datosBal">
						<table style="width: 80%" class="letrath">
							<tr>
								<th bgcolor="#A9BCF5">Descripcion</th>
								<th bgcolor="#A9BCF5">Cargo</th>
								<th bgcolor="#A9BCF5">Descuento</th>
								<th bgcolor="#A9BCF5">Cantidad Adeudada</th>
								<th bgcolor="#A9BCF5">Monto Total</th>
							</tr>
							<c:forEach var="it" items="${items}">
								<tr>
									<td bgcolor="#FFFFFF"><c:out value="${it.numeroItem}" /></td>
									<td bgcolor="#FFFFFF"><c:out
											value="${it.montoItemProrrateoStr}" /></td>
									<td bgcolor="#FFFFFF"><c:out value="${it.deudaItem}" /></td>
									<td bgcolor="#FFFFFF"><c:out
											value="${it.montoItemProrrateoStr}" /></td>
									<td bgcolor="#FFFFFF"><c:out value="${it.totalItemStr}" /></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div id="tableroSmartBilling">
					<div id="mainContent">
						<div class="contenido"
							style="display: inline-block; text-align: center;">
</body>
</html>