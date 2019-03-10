<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>SMARTBILLING - Sytecso System</title>
<link href="<c:url value="/css/estiloSmartBilling.css" />" 	rel="stylesheet">

<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
<script	src="<c:url value="/js/facturacion/pantallaPrincipalBilling.js"/>"></script>
<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
<script src="<c:url value="/js/facturacion/reFactura.js"/>"></script>
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
	font-size: 15px !important;
	color: #1C1C1C !important;
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
		'Lucida Sans', Arial, sans-serif;
}

.letrath {
	font-size: 13px !important;
	color: white !important;
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
		'Lucida Sans', Arial, sans-serif;
}
}
</style>

</head>
<body>
	<jsp:include page="menu3.jsp" />
	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero">
			<img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px"
				style="margin-left: 10px;"> ${ nombreMenuFacturacion}
		</div>
	</div>
	<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">

			<div class="datos">
				<div class="contenido">
					<div id="datos">
						<div id="datosForm1" style="width: auto;">


							<table style="width: 80%" class="letrath">
								<tr>
									<td class="letrath" bgcolor="#2584A7">N&uacute;mero
										Cliente:</td>
									<td class="letrath" bgcolor="#2584A7"><input id="cuenta"
										class="resFac" /></td>

									<td class="letrath" bgcolor="#2584A7">Alias Cliente:</td>
									<td class="letrath" bgcolor="#2584A7"><input
										id="aliasCliente" class="resFac" /></td>

									<td class="letrath" bgcolor="#2584A7">N&uacute;mero Factura:</td>
									<td class="letrath" bgcolor="#2584A7"><input
										id="numeroFactura" class="resFac" /></td>

									<td class="letrath" bgcolor="#2584A7">Nombre Cliente:</td>
									<td class="letrath" bgcolor="#2584A7"><input
										id="nombreCliente" class="resFac" /></td>

								</tr>
								<tr>
									<td bgcolor="#2584A7">&nbsp;</td>
									<td bgcolor="#2584A7">&nbsp;</td>
									<td bgcolor="#2584A7">&nbsp;</td>
									<td bgcolor="#2584A7">&nbsp;</td>
									<td bgcolor="#2584A7">&nbsp;</td>
									<td bgcolor="#2584A7">
										<button id="btnBillginFiltroBuscarDatosFacturado" />Buscar
										</button>
									</td>
									<td bgcolor="#2584A7">&nbsp;</td>
									<td bgcolor="#2584A7">
										<button id="btnBillgLimpiarFiltro" />Limpiar
										</button>
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
				</div>
				<div class="datosForm">
				<table 	align="center" style="width: 15%;" class="letrath"> 
				<tbody>
						<tr >
							<td bgcolor="white"><button id="reFacturar" type="button" class="w3-button w3-black w3-round-large" align="rigth">Confirmar refacturacion de cuentas</button></td>						
						</tr>
				</tbody>	
				</table>
					<br/>
					<table style="width: 90%" id="test" border="0" class="letrath"
						align="center">
						<thead>
							<tr>
								<th class="letrath" >N&uacute;mero Cliente</th>
								<th class="letrath" >Alias Cliente</th>
								<th class="letrath" >Nombre Cliente</th>
								<th class="letrath" >N&uacute;mero Factura</th>
								<th class="letrath" >Monto Factura</th>
								<th class="letrath" >Deuda Factura</th>
								<th class="letrath" >Fecha Inicio</th>
								<th class="letrath" >Fecha Fin</th>
								<th class="letrath" >Moneda</th>
								<c:if test="${isReFactura}">
									<th class="letrath" >Periodo </th>
									<th class="letrath" >Actualizar datos cuenta </th>
								</c:if>

							</tr>
						</thead>
						<tbody id="fBody">
						<c:forEach var="cuenta" items="${cuentas}" >
								<c:forEach var="listVar" items="${cuenta.unidadFacturacion.factura}" varStatus="status">
									<tr class="letra">
										<td id="cuenta"><c:out value="${cuenta.numCuenta}" /></td>
										<td id="aliasCliente"><c:out
												value="${cuenta.aliasCliente}" /></td>
										<td id="nombreCliente"><c:out
												value="${cuenta.unidadFacturacion.datosFiscales.razonSocial}" /></td>
										<td id="numeroFactura"><a
											href="${pageContext.request.contextPath.concat(path).concat(cuenta.numCuenta).concat(paramFactura).concat(listVar.numeroFactura)}"><strong><c:out
														value="${listVar.numeroFactura}" /></strong></a></td>
										<td><strong> <fmt:setLocale value="en_US"
													scope="session" /> <fmt:formatNumber
													value="${listVar.montoFactura}" type="currency"
													maxFractionDigits="4" pattern="$#,##0.0###" /></strong></td>
										<td><fmt:setLocale value="en_US" scope="session" /> <fmt:formatNumber
												value="${listVar.deudaFactura}" type="currency"
												maxFractionDigits="4" pattern="$#,##0.0###" /></td>
										<td><c:out value="${fn:substring(listVar.fechaInicio,0,10)}" /></td>
										<td><c:out value="${fn:substring(listVar.fechaFin,0,10)}" /></td>
										<td><c:out value="${listVar.moneda}" /></td>
										<c:if test="${isReFactura}">
											<c:if test="${isReFactura}">
												<td><c:out value="${fn:substring(listVar.fechaFacturacion,0,7)}" /></td>
												<td><Button  onclick=window.location="${pageContext.request.contextPath.concat(pathActCuenta).concat(cuenta.numCuenta)}" class="w3-button w3-black w3-round-large" style="font-size: 11px;">Actualizar datos cuenta</Button></td>
											</c:if>
										</c:if>	
									</tr>
	
								</c:forEach>
							</c:forEach>	
						</tbody>

					</table>
					<br />
				</div>
			</div>

		</div>
	</div>
	<br />
	<br />


	<div id="datosbotonesComp">
		<div id="botonBack">
			<div class="col-sm-6">
				<a href="${pageContext.request.contextPath.concat(pathRegresar)}"><img
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
</body>
</html>