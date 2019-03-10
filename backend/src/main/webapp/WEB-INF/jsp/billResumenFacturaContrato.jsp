<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SMARTBILLING - Sytecso System</title>
<link href="<c:url value="/css/estiloSmartBilling.css" />"
	rel="stylesheet">
<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
<script src="<c:url value="/js/facturacion/pantallaPrincipalBilling.js"/>"></script>
<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
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
				color:white !important;
				font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
				}
</style>
</head>
<body>
	<%int index = 0;%>
	<jsp:include page="menu3.jsp" />
	<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">
			<div class="contenido">
			<div id="datos">
       <div id="datosForm1" style="width: auto;">

							<table style="width: 80%" class="letrath">
								<tr>
									<td class="letrath" bgcolor="#2584A7">Order Id:</td>
									<td class="letrath" bgcolor="#2584A7">
									<input id="orderID" class="resContratos"/></td>
									<td class="letrath" bgcolor="#2584A7">Numero Item:</td>
									<td class="letrath" bgcolor="#2584A7">
									<input id="numeroItem" class="resContratos"/></td>
									<td class="letrath" bgcolor="#2584A7">Fecha Inicio:</td>
									<td class="letrath" bgcolor="#2584A7">
									<input id="fechaInicio" class="resContratos"/></td>
									<td class="letrath" bgcolor="#2584A7">Fecha Fin:</td>
									<td class="letrath" bgcolor="#2584A7">
									<input id="fechaFin" class="resContratos"/></td>
									
								</tr>
								<tr>
									<td bgcolor="#2584A7">&nbsp;</td>
									<td bgcolor="#2584A7">&nbsp;</td>
									<td bgcolor="#2584A7">&nbsp;</td>
									<td bgcolor="#2584A7">&nbsp;</td>
									<td bgcolor="#2584A7">&nbsp;</td>
									<td bgcolor="#2584A7">
										<button id="btnBillginFiltroBuscarResumenContratos"/>Buscar</button>
									</td>
									<td bgcolor="#2584A7">&nbsp;</td>
									<td bgcolor="#2584A7">
										<button id="btnBillgLimpiarFiltro"/>Limpiar</button>
									</td>									
								</tr>
								<tr>
									<td bgcolor="#2584A7">
										<div id="errMsg"></div>
									</td>
									<td bgcolor="#2584A7"></td>
									<td bgcolor="#2584A7"></td>
									<td bgcolor="#2584A7"></td>
									<td bgcolor="#2584A7"></td>
									<td bgcolor="#2584A7"></td>
									<td bgcolor="#2584A7"></td>
									<td bgcolor="#2584A7"></td>
								</tr>
							</table>
						</div>
					</div>		
	<form:form method="POST" action="${pageContext.request.contextPath}/actualizaDatosClienteFacturar/${contrato}" modelAttribute="billDataCuenta">
				<table style="width: 80%" id="test" align="center"
					style="border: 1px #D8D8D8 solid;">
					<thead  class="letrath">
						<tr class="letrath">
							<th class="letrath">Número Cliente</th>
							<th class="letrath">Alias Cliente</th>
							<th class="letrath">Nombre Cliente</th>
							<th class="letrath">ID Agrupador</th>
							<th class="letrath">Factura</th>
							<th class="letrath" id="orderId">Order Id</th>
							<th class="letrath">Capacidad</th>
							<th class="letrath">Nombre producto</th>
							<th class="letrath">Monto Facturado</th>
							<th class="letrath">Moneda</th>
							<th class="letrath">Tipo Cargo</th>
							<th class="letrath">Numero Item</th>
							<th class="letrath">Fecha Inicio</th>
							<th class="letrath">Fecha Fin</th>

						</tr>
					</thead>
					<tbody id="fBody">
						<c:forEach var="listVar" items="${billDataCuenta.unidadFacturacion.compras}" varStatus="status">
						<c:forEach var="listVar2" items="${listVar.item}" varStatus="status">
							<tr class="letratd">
								<td>
									<strong><c:out value="${billDataCuenta.numCuenta}" /></strong>
								</td>
								<td><c:out value="${billDataCuenta.aliasCliente}" /></td>
								<td><c:out
										value="${billDataCuenta.unidadFacturacion.datosFiscales.razonSocial}" /></td>
								<td><strong><c:out value="${listVar.idContrato}" /></strong></td>
								<td><c:out
										value="${listVar.agrupacionDeal.grupo}" /></td>
								<td id="orderID"><c:out value="${listVar.orderId}" /></td>
								<td><c:out value="${listVar.producto.capacidad}" /></td>
								<td><c:out value="${listVar.descripcionOverride==''?listVar.producto.descripcion:listVar.descripcionOverride}" /></td>
								<c:if test="${listVar2.montoItemImpuestos>0}">
								<td>
									<strong>
										<fmt:setLocale value="en_US"  scope="session"/>
		       							<fmt:formatNumber value="${listVar2.montoItemImpuestos}" type="currency" maxFractionDigits="4" pattern="$#,##0.0###"/>
       								</strong>
								</td>
								</c:if>
								<c:if test="${listVar2.montoItemProrrateo>0}">
								<td>
									<strong>
										<fmt:setLocale value="en_US"  scope="session"/>
	       								<fmt:formatNumber value="${listVar2.montoItemProrrateo}" type="currency" maxFractionDigits="4" pattern="$#,##0.0###"/>
	       							</strong>									
								</td>
								</c:if>
								<td><c:out value="${listVar.moneda}" /></td>
								<td><c:out value="${listVar.producto.tipoCargo}" /></td>
								<td id="numeroItem"><strong><c:out value="${listVar2.numeroItem}" /></strong></td>
								<td id="fechaInicio"><c:out value="${listVar2.fechaInicio}" /></td>
								<td id="fechaFin"><c:out value="${listVar2.fechaFin}" /></td>
							</tr>
							</c:forEach>
						</c:forEach>
						</tbody>
				</table>
		</form:form>		


			</div>
			<div id="datosbotonesComp">
							<div id="botonBack">
								<div class="col-sm-6">
									
									
					<a href="${pageContext.request.contextPath.concat(pathRegresar)}"><img src ="${pageContext.request.contextPath}/img/regresar.png">Regresar</a>
								</div>
							</div>
							<div id="botonHome">
								<div class="col-sm-6">
									
					<a href="/SmartBilling/principal"><img src ="${pageContext.request.contextPath}/img/home.png">Principal</a>
								</div>
							</div>
						</div>
		</div>
	</div>

</body>
</html>