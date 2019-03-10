<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SMARTBILLING - Sytecso System</title>
<link href="<c:url value="/css/estiloSmartBilling.css" />"
	rel="stylesheet">
<link href="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.css" />"
	rel="stylesheet">
<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
<script src="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.js" />"></script>
<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
<script
	src="<c:url value="/js/facturacion/pantallaPrincipalBilling.js"/>"></script>
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	text-align: left;
	padding: 8px;
}

thead {
	background: linear-gradient(to bottom, #2E2E2E 3%, #151515 84%);
	color: #D8D8D8;
}

tr:nth-child(even) {
	background-color: #E6E6E6;
}

.letra {
	font-size: 15px;
	color: #1C1C1C;
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
		'Lucida Sans', Arial, sans-serif;
}

.letrath {
	font-size: 14px;
	color: white !important;
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
		'Lucida Sans', Arial, sans-serif;
}
</style>
</head>
<body>
	<%
		int index = 0;
	%>
	<jsp:include page="menu3.jsp" />
	<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">
			<div class="contenido">
				<form:form method="POST"
					action="${pageContext.request.contextPath.concat(billDataCuenta.dtoRequest.postPath)}"
					modelAttribute="billDataCuenta">
					<table style="width: 75%" id="test" align="center"
						style="border: 1px #D8D8D8 solid;">
						<thead class="letrath">
							<tr class="letrath">
								<th class="letrath">Número Cliente</th>
								<th class="letrath">Alias Cliente</th>
								<th class="letrath">Nombre Cliente</th>
								<th class="letrath">ID Agrupador</th>
								<th class="letrath">Factura</th>
								<th class="letrath">Order Id</th>
								<th class="letrath">Capacidad</th>
								<th class="letrath">Nombre producto</th>
								<th class="letrath">Monto a Facturar</th>
								<th class="letrath">Moneda</th>
								<th class="letrath">Tipo Cargo</th>
								<th class="letrath">Periodo de facturacion</th>
								<th class="letrath">Fecha Activación</th>
								<th class="letrath">Fecha Primera Factura</th>
								<th class="letrath">Aplica IEPS <input id="allIEPS"
									type="checkbox" /></th>
								<th class="letrath">Aplica IVA <input id="allIVA"
									type="checkbox" /></th>
								<c:if test="${billDataCuenta.ciclo==1}">
									<th class="letrath">Prorrateo <input id="allProrrateo"
										type="checkbox" /></th>
								</c:if>
								<c:if test="${billDataCuenta.ciclo==21}">
									<th class="letrath">Prorrateo <input id="allProrrateo"
										type="checkbox" disabled /></th>
								</c:if>

								<th class="letrath">Facturar <input id="allFacturar"
									type="checkbox" /></th>
								<th class="letrath">Fecha Ultima Facturación</th>
								<th class="letrath">Editar</th>

							</tr>
						</thead>
						<c:forEach var="listVar"
							items="${billDataCuenta.unidadFacturacion.compras}"
							varStatus="status">	
							<tr class="letratd">
								<td><c:out value="${billDataCuenta.numCuenta}" /> <form:hidden
										tye="text"
										path="unidadFacturacion.compras[${status.index}].idCompra"
										value="${listVar.idCompra}" /></td>
								<td><c:out value="${billDataCuenta.aliasCliente}" /></td>
								<td><c:out
										value="${billDataCuenta.unidadFacturacion.datosFiscales.razonSocial}" /></td>
								<td><c:out value="${listVar.idContrato}" /></td>
								<td><c:out value="${listVar.agrupacionDeal.grupo}" /></td>
								<td><c:out value="${listVar.orderId}" /></td>
								<td><c:out value="${listVar.producto.capacidad}" /></td>
								<td><c:out value="${listVar.descripcionOverride==''?listVar.producto.descripcion:listVar.descripcionOverride}" /></td>
								<td><strong> <fmt:setLocale value="en_US"
											scope="session" /> <fmt:formatNumber value="${listVar.monto}"
											type="currency" maxFractionDigits="4" pattern="$#,##0.0###" /></strong>
								</td>
								<td><c:out value="${listVar.moneda}" /></td>
								<td><c:out value="${listVar.producto.tipoCargo}" /></td>
								<td><c:if test="${listVar.producto.tipoCargo=='NRC' }">
										<label id="${status.index}" class="periodo1">${fn:substring(listVar.item[0].fechaInicio, 0, 10)}</label> 
											A 
										<label class="periodo2">${fn:substring(listVar.item[fn:length(listVar.item)-1].fechaFin, 0, 10)}</label>
									</c:if> <c:if
										test="${(listVar.producto.tipoCargo=='MRC' || listVar.producto.tipoCargo=='CME'|| listVar.producto.tipoCargo=='PE') && listVar.facturar}">
										<div class="periodo"
											style="cursor: pointer; text-decoration: underline;"
											onclick="pantallaPrincipalBilling.openDialog(this,${status.index})">
											<label id="${status.index}" class="periodo1">${fn:substring(listVar.item[0].fechaInicio, 0, 10)}</label>
											A <label class="periodo2">${fn:substring(listVar.item[fn:length(listVar.item)-1].fechaFin, 0, 10)}</label>
										</div>
									</c:if> <c:if
										test="${listVar.producto.tipoCargo=='NRC' || !listVar.facturar}">
										<div class="periodo">
											<label id="${status.index}" class="periodo1">${fn:substring(listVar.item[0].fechaInicio, 0, 10)}</label>
											A <label class="periodo2">${fn:substring(listVar.item[fn:length(listVar.item)-1].fechaFin, 0, 10)}</label>
										</div>
									</c:if>
									
									</td>

								<td><c:out value="${fn:substring(listVar.fechaActivacion,0,10)}" /></td>
								<td><c:out value="${fn:substring(listVar.fechaPrimeraFac,0,10)}" /></td>
								<td align="center"><form:checkbox class="ieps"
										path="unidadFacturacion.compras[${status.index}].iepsCheck"
										value="unidadFacturacion.compras[${status.index}].iepsCheck" />
								</td>
								<td align="center"><form:checkbox class="iva"
										path="unidadFacturacion.compras[${status.index}].ivaCheck"
										value="unidadFacturacion.compras[${status.index}].ivaCheck" />
								</td>
								<td align="center"><form:checkbox class="prorrateo"
										path="unidadFacturacion.compras[${status.index}].prorrateoCheck"
										value="unidadFacturacion.compras[${status.index}].prorrateoCheck"
										disabled="${listVar.producto.tipoCargo=='NRC'}" /></td>
								<td><form:checkbox class="facturar"
										path="unidadFacturacion.compras[${status.index}].facturar"
										value="unidadFacturacion.compras[${status.index}].facturar" />
								</td>
								<td><c:out value="${fn:substring(listVar.fechaUltimaFac,0,10)}" /></td>
								<td><b> <a
										href="/SmartBilling/verDatosFac/${listVar.indexCompra}">Editar</a></b> <img
									src="/SmartBilling/img/edit_icn.png"></td>
							</tr>
						</c:forEach>
					</table>
					<div id="dialog"></div>
					<input type="submit" value="Guardar"
						class="w3-button w3-black w3-round-large" />
				</form:form>

				<p align="left">
					<form:form method="GET"
						action="${pageContext.request.contextPath}/datosCuentaFacturarAgrupado">
						<button class="w3-button w3-black w3-round-large">Resumen</button>
					</form:form>
				</p>
			</div>
			<div id="datosbotonesComp">
				<div id="botonBack">
					<div class="col-sm-6">

						<a href="${pageContext.request.contextPath.concat(billDataCuenta.dtoRequest.pathRegresar)}"><img
							src="${pageContext.request.contextPath}/img/regresar.png">Regresar</a>
					</div>
				</div>
				<div id="botonHome">
					<div class="col-sm-6">

						<a href="${pageContext.request.contextPath}/principal"><img
							src="${pageContext.request.contextPath}/img/home.png">Principal</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>