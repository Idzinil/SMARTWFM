<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>SMARTBILLING - Sytecso System</title>
<link rel="stylesheet" type="text/css"	href="/SmartBilling/css/estiloSmartBilling.css">
<link rel="stylesheet" href="/SmartBilling/js/jquery-ui-1.12.1/jquery-ui.css">
<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
<script src="/SmartBilling/js/jquery-ui-1.12.1/jquery-ui.js"></script>

<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
<script
	src="<c:url value="/js/facturacion/pantallaPrincipalBilling.js"/>"></script>
<script src="<c:url value="/js/pagos/pagosCuentasFacturas.js"/>"></script>
<script type="text/javascript">
	function favor() {
		return "<c:out value="${saldoFavor}" />";
	}
	$(document).ready(function(){
		pagosCuentasFacturas.entryOnlyPositiveNumbers("#montoPago");

		$(".monto").on("change",function(){
			var tot = smartBilling.sumAllInputValue("#test","monto");
			 if(tot<=${montoPagar}){
				 $("#btnPagar").attr("disabled",false);
			 }else{
				 $("#btnPagar").attr("disabled",true);
			 }
				 
				 
		});
	});
	
</script>
</head>
<body>
	<jsp:include page="menu5.jsp" />
	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero">
			<img src="/SmartBilling/img/das.png" width="16px" height="16px"
				style="margin-left: 10px;"> ${ nombreMenuFacturacion}
		</div>
	</div>
	<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">

			<div class="datos">
				<div class="contenido">
					<div id="datos">
						<div id="datosForm1" style="width: auto;">
							<table style="width: 80%" class="tableFiltroColor">
								<tr class="letrathPrincipal">
									<td>N&uacute;mero Cliente:</td>
									<td><input id="cuenta" class="resFac" /></td>
									<td>Alias Cliente:</td>
									<td><input id="aliasCliente" class="resFac" /></td>
									<td>N&uacute;mero Factura:</td>
									<td><input id="numeroFactura" class="resFac" /></td>
									<td>Nombre Cliente:</td>
									<td><input id="nombreCliente" class="resFac" /></td>

								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td><button id="btnBillginFiltroBuscarDatosFacturado">Buscar</button>
									</td>
									<td></td>
									<td><button id="btnBillgLimpiarFiltro">Limpiar</button></td>
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
				<div id="datosForm" align="center">
				
					<table class="tablePrincipal" width="90%">
						<tbody>
						<tr>
						<td><label>Monto a pagar: ${mPeso } MXN</label></td>
						<td><label>Monto a pagar: ${mDolar } USD</label></td>
								<td>Saldo a Favor: <strong> <fmt:setLocale
											value="en_US" scope="session" /> <fmt:formatNumber
											value="${saldoFavor}" type="currency" maxFractionDigits="3"
											pattern="$#,##0.0##" /></strong>
								</td>
								<td><form:form method="POST"
										action="${pageContext.request.contextPath.concat(pathSaldoFavor)}">
										<input type="submit"
											<c:if test="${(enableSaldoFavor && saldoFavor.unscaledValue() == 0) || (!enableSaldoFavor && !(saldoFavor.unscaledValue() == 0))}">disabled="true"</c:if>
											class="w3-button w3-black w3-round-large"
											style="font-size: 11px;" value="Usar saldo a favor" />
									</form:form></td>
							</tr>
						</tbody>
					</table>
					<form:form action="${pageContext.request.contextPath.concat(path)}" modelAttribute="cuenta">
					<table style="width: 90%" id="test" class="tablePrincipal">
						<thead class="theadPrincipal">
							<tr class="letrathPrincipal">
								<th>Pagar Factura</th>
								<th>N&uacute;mero Cliente</th>
								<th>Alias Cliente</th>
								<th>Nombre Cliente</th>
								<th>N&uacute;mero Factura</th>
								<th>Monto Factura</th>
								<th>Deuda Factura</th>
								<th>Monto Pagado</th>
								<th>Monto Pagar</th>
								<th>Periodo</th>
								<th>Moneda</th>
							</tr>
						</thead>
						<tbody id="fBody">
							<c:forEach var="listVar"
								items="${cuenta.unidadFacturacion.factura}" varStatus="status">
								<tr class="letraPrincipal">
									<td><form:checkbox  path="unidadFacturacion.factura[${status.index}].facturaSelected"></form:checkbox></td>
									<td id="cuenta"><c:out value="${cuenta.numCuenta}" /></td>
									<td id="aliasCliente"><c:out
											value="${cuenta.aliasCliente}" /></td>
									<td id="nombreCliente"><c:out
											value="${cuenta.unidadFacturacion.datosFiscales.razonSocial}" /></td>
									<td id="numeroFactura"><a
										href="/SmartBilling/test/pagos/contratos/${(cuenta.numCuenta).concat('/').concat(listVar.numeroFactura)}"><strong><c:out
													value="${listVar.numeroFactura}" /></strong></a></td>
									<td><strong> <fmt:setLocale value="en_US"
												scope="session" /> <fmt:formatNumber
												value="${listVar.montoFactura}" type="currency"
												maxFractionDigits="3" pattern="$#,##0.0##" /></strong></td>
									<td><fmt:setLocale value="en_US" scope="session" /> <fmt:formatNumber
											value="${listVar.deudaFactura}" type="currency"
											maxFractionDigits="3" pattern="$#,##0.0##" /></td>
									<td><fmt:setLocale value="en_US" scope="session" /> <fmt:formatNumber
											value="${listVar.pagosRecibidos}" type="currency"
											maxFractionDigits="3" pattern="$#,##0.0##" /></td>
									<td><form:input path="unidadFacturacion.factura[${status.index }].montoPagar" type="text" id="montoPago"></form:input></td>
									<td><c:out
											value="${fn:substring(listVar.fechaInicio,0,10).concat(' A ').concat(fn:substring(listVar.fechaFin,0,10))}" /></td>
									<td><c:out value="${listVar.moneda}" /></td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
						<br/>
						<input id="btnPagar" type="submit" value="Pagar"/>
					</form:form>
					<br />
				</div>
			</div>

		</div>

	</div>
	<br />
	<br />
	<jsp:include page="divRegresarPrincipal.jsp" />
</body>
<script type="text/javascript">
	function msg() {
		if ("${status}") {
			alert("${msg}");
		}
	}
	window.onload = setTimeout(msg, 100);
</script>
</html>