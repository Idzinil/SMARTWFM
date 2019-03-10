<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<jsp:include page="headPagos.jsp"></jsp:include>
<script type="text/javascript">

	$(document).ready(function(){
		var buttons = {
				btn1 : "#btnPagar",
				btn2 : ".btnSimularF"
		};
		var montos = {
				"${nombreMonedaA}":${sessionMontoMonedaA},
				"${nombreMonedaB}":${sessionMontoMonedaB}
		};
		pagosCuentasFacturas.compareMontos("#test",".montoPago",buttons,montos,"restante");
	});
	
	 function mostrar() {
         div = document.getElementById('flotante');
         div.style.display = '';
     }
	
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
					<table class="tablePrincipal"  width="90%">
						<tbody >
						<tr>
						<td><label><strong>Deuda Total a Pagar de la Cuenta: </strong> 
						<fmt:setLocale value="en_US" scope="session" /> <fmt:formatNumber
											value="${sessionDeudaCtaMonedaA }" type="currency"
											maxFractionDigits="3" pattern="$#,##0.0##" />
											${nombreMonedaA}</label></td>
						
						<td><c:if test="${ estatusTipoCambio>'0'}"><label><strong>Deuda Total a Pagar de la Cuenta: </strong><fmt:setLocale value="en_US" scope="session" /> <fmt:formatNumber
											value="${sessionDeudaCtaMonedaB }" type="currency"
											maxFractionDigits="3" pattern="$#,##0.0##" /> ${nombreMonedaB}</label></c:if></td>
							</tr>
						</tbody>
						<tbody>
						<tr>
						<td><label><strong>Monto Pago Ingresado: </strong> 
						<fmt:setLocale value="en_US" scope="session" /> <fmt:formatNumber
											value="${montoMonedaA }" type="currency"
											maxFractionDigits="3" pattern="$#,##0.0##" />
											${nombreMonedaA}</label></td>
						<td><c:if test="${ estatusTipoCambio>'0'}"><label><strong>Monto Pago Ingresado: </strong><fmt:setLocale value="en_US" scope="session" /> <fmt:formatNumber
											value="${montoMonedaB }" type="currency"
											maxFractionDigits="3" pattern="$#,##0.0##" /> ${nombreMonedaB}</label></c:if></td>
							</tr>
						<tr>
						<td><label><strong>Monto de pago disponible a aplicar: </strong>
						<fmt:setLocale value="en_US" scope="session" /> <fmt:formatNumber
											value="${sessionMontoMonedaA }" type="currency"
											maxFractionDigits="3" pattern="$#,##0.0##" />
											${nombreMonedaA}</label></td>
						<td><c:if test="${ estatusTipoCambio>'0'}"><label><strong>Monto de pago disponible a aplicar: </strong> <fmt:setLocale value="en_US" scope="session" /> <fmt:formatNumber
											value="${sessionMontoMonedaB }" type="currency"
											maxFractionDigits="3" pattern="$#,##0.0##" /> ${nombreMonedaB}</label></c:if></td>
							</tr>
						</tbody>
					</table>
					<form:form id="simPago" action="${pageContext.request.contextPath.concat(path)}" modelAttribute="cuenta">
					<table style="width: 90%" id="test" class="tablePrincipal">
						<thead class="theadPrincipal">
							<tr class="letrathPrincipal">
								<th>Pagar Factura <input id="factura"
										type="checkbox" /></th>
								<th>N&uacute;mero Cliente</th>
								<th>Alias Cliente</th>
								<th>Nombre Cliente</th>
								<th>N&uacute;mero Factura</th>
								<th>Monto Factura</th>
								<th>Deuda Factura</th>
								<th>Monto Pagado Previo</th>
								<th>Monto Pagado Actual</th>
								<th>Moneda</th>
								<th>Monto Pagar</th>
								<th>Periodo</th>
								<th>Asignar</th>
								<th>Limpiar</th>
							</tr>
						</thead>
						<tbody id="fBody">
							<c:forEach var="listVar"
								items="${cuenta.unidadFacturacion.factura}" varStatus="status">
								<tr class="letraPrincipal">
									<td><form:checkbox  id="${status.index+1 }" path="unidadFacturacion.factura[${status.index}].facturaSelected" 
									class="${ listVar.estatusFactura}" disabled="${ listVar.estatusFactura=='2'}" ></form:checkbox></td>
									<td id="cuenta"><c:out value="${cuenta.numCuenta}" /></td>
									<td id="aliasCliente"><c:out
											value="${cuenta.aliasCliente}" /></td>
									<td id="nombreCliente"><c:out
											value="${cuenta.unidadFacturacion.datosFiscales.razonSocial}" /></td>
									<td id="numeroFactura"><label class="factura">
									<a <c:if test="${ listVar.estatusFactura=='1'}">href="${ pageContext.request.contextPath.concat('/pagos/custom/contratos/').concat(cuenta.numCuenta).concat('/').concat(listVar.numeroFactura)}" </c:if>>
									<strong><c:out value="${listVar.numeroFactura}" /></strong></a></label></td>
									<td><strong> <fmt:setLocale value="en_US"
												scope="session" /> <fmt:formatNumber
												value="${listVar.montoFactura}" type="currency"
												maxFractionDigits="3" pattern="$#,##0.0##" /></strong></td>
									<td><label class="restante"><fmt:setLocale value="en_US" scope="session" /> <fmt:formatNumber
											value="${listVar.sessionDeudaFactura}" type="currency"
											maxFractionDigits="3" pattern="$#,##0.0##" /></label></td>
									<td><fmt:setLocale value="en_US" scope="session" /> <fmt:formatNumber
											value="${listVar.pagosRecibidos.add(listVar.ajustesRecibidos)}" type="currency"
											maxFractionDigits="3" pattern="$#,##0.0##" /></td>
									<td><label class="lblMontoPagar"><fmt:setLocale value="en_US" scope="session" /> <fmt:formatNumber
											value="${listVar.montoPagar}" type="currency"
											maxFractionDigits="3" pattern="$#,##0.0##" /></label></td>
									<td><strong><label class="moneda"><c:out value="${listVar.moneda}" /></label></strong></td>				
									<td><form:input class="montoPago" placeholder="0" disabled="${ listVar.estatusFactura=='2'}" path="unidadFacturacion.factura[${status.index }].sessionMontoAsignado" type="text"></form:input></td>
									<td><c:out
											value="${fn:substring(listVar.fechaInicio,0,10).concat(' A ').concat(fn:substring(listVar.fechaFin,0,10))}" /></td>
									<td><button id="${status.index }" class="<c:if test='${ listVar.estatusFactura==1}'>btnSimularF</c:if>" type="button"
									<c:if test="${ listVar.estatusFactura=='2'}"> disabled="true"</c:if>>Asignar</button></td>
									<td><button type="button" class="btnLimpiarF" <c:if test="${ listVar.estatusFactura=='2'}"> disabled="true"</c:if>>Limpiar</button></td> 
								</tr>

							</c:forEach>
						</tbody>
					</table>
						<br/>
						<button <c:if test="${ isFacturasOpen || !isMontoPagarFacturaMayorCero}">disabled="true"</c:if> id="btnPagar" type="button" >Aplicar Pago</button>
						<button id="btnLimpiarTodoPrincipal" type="button" >Limpiar</button>
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