<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<jsp:include page="headPagos.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btnPagar").on("click",function(){
			var restante = $("#montoPago").val();
			var moneda = $("#moneda").val();
			pagosCuentasFacturas.popSiguientePago("${cuenta.numCuenta}",restante,moneda,"${pageContext.request.contextPath.concat(pathPagar)}");
		}); 
		$("#btnSaldoFavor").on("click",function(){
			var restante = $("#montoPago").val();
			var moneda = $("#moneda").val();
			pagosCuentasFacturas.popSiguientePago("${cuenta.numCuenta}","${montoMonedaA}","","${pageContext.request.contextPath.concat(pathSaldoFavor)}");
		});
		

	});
</script>
</head>
<body>
<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    </div>
	<jsp:include page="menu5.jsp" />
	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero">
			<img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px"
				style="margin-left: 10px;"> <spring:message  code="label.tittlePay"/>
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
									<td><spring:message  code="label.PagosFactTBFiltroNoClient"/>:</td>
									<td><input id="cuenta" class="resFac" /></td>
									<td><spring:message  code="label.PagosFactTBFiltroAliasClient"/>:</td>
									<td><input id="aliasCliente" class="resFac" /></td>
									<td><spring:message  code="label.PagosFactTBFiltroNoFact"/>:</td>
									<td><input id="numeroFactura" class="resFac" /></td>
									<td><spring:message  code="label.PagosFactTBFiltroNombrClient"/>:</td>
									<td><input id="nombreCliente" class="resFac" /></td>

								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td><button id="btnBillginFiltroBuscarDatosFacturado"><spring:message  code="label.PagosFactContFiltroBuscar"/></button>
									</td>
									<td></td>
									<td><button id="btnBillgLimpiarFiltro"><spring:message  code="label.PagosFactContFiltroLimp"/></button></td>
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
							<tr  align="center">
									<td><label><spring:message  code="label.PagosFactTBPagoCuentaMontoPagar"/>:</label></td>
									<td><input id="montoPago" type="text" autocomplete="off" /></td>
									<td><label>Moneda</label>
									<select id="moneda"><c:forEach var="listVar" items="${divisa}" varStatus="status"><option>${listVar}</c:forEach></select>
									</td> 
									<td><spring:message code="label.PagosFactTBPagoCuentaBtnPagar" var="BtnPagar"></spring:message>
									<button	id="btnPagar"	class="w3-button w3-black w3-round-large"
									<c:if test="${!enableSaldoFavor}">disabled="true"</c:if>	style="font-size: 11px;" >${BtnPagar}</button></td>
								<td><spring:message  code="label.PagosFactTBPagoCuentaSaldoFav"/>: <strong> <fmt:setLocale
											value="en_US" scope="session" /> <fmt:formatNumber
											value="${montoMonedaA}" type="currency" maxFractionDigits="3"
											pattern="$#,##0.0##" /> ${nombreMonedaA }</strong>
								</td>
								<td><c:if test="${ estatusTipoCambio>'0'}">
								<spring:message  code="label.PagosFactTBPagoCuentaSaldoFav"/>: <strong> <fmt:setLocale
											value="en_US" scope="session" /> <fmt:formatNumber
											value="${montoMonedaB}" type="currency" maxFractionDigits="3"
											pattern="$#,##0.0##" />${nombreMonedaB }</strong></c:if>
								</td>
								<td>
										<spring:message code="label.PagosFactTBPagoCuentaBtnSaldoFav" var="BtnSaldo"></spring:message>
										<input id="btnSaldoFavor" type="button"
											<c:if test="${(enableSaldoFavor && montoMonedaA.unscaledValue() == 0) || (!enableSaldoFavor && !(montoMonedaA.unscaledValue() == 0))}">disabled="true"</c:if>
											class="w3-button w3-black w3-round-large"
											style="font-size: 11px;" value="${BtnSaldo }" />
									</td>
							</tr>
						</tbody>
					</table>
					<table style="width: 90%" id="test" class="tablePrincipal">
						<thead class="theadPrincipal">
							<tr class="letrathPrincipal">
								<th><spring:message  code="label.PagosFactTBPagoCuentaNoClient"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCuentaAliasClient"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCuentaNombClient"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCuentaNumFact"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCuentaMontoFact"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCuentaDeudaFact"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCuentaMontoPag"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCuentaPeriod"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCuentaMon"/></th>
							</tr>
						</thead>
						<tbody id="fBody">
							<c:forEach var="listVar"
								items="${cuenta.unidadFacturacion.factura}" varStatus="status">
								<tr class="letraPrincipal">
									<td id="cuenta"><c:out value="${cuenta.numCuenta}" /></td>
									<td id="aliasCliente"><c:out
											value="${cuenta.aliasCliente}" /></td>
									<td id="nombreCliente"><c:out
											value="${cuenta.unidadFacturacion.datosFiscales.razonSocial}" /></td>
									<td id="numeroFactura"><a
										href="${pageContext.request.contextPath.concat(path).concat(listVar.numeroFactura)}"><strong><c:out
													value="${listVar.numeroFactura}" /></strong></a></td>
									<td><strong> <fmt:setLocale value="en_US"
												scope="session" /> <fmt:formatNumber
												value="${listVar.montoFactura}" type="currency"
												maxFractionDigits="3" pattern="$#,##0.0##" /></strong></td>
									<td><fmt:setLocale value="en_US" scope="session" /> <fmt:formatNumber
											value="${listVar.deudaFactura.subtract(listVar.ajustesRecibidos)}" type="currency"
											maxFractionDigits="3" pattern="$#,##0.0##" /></td>
									<td><fmt:setLocale value="en_US" scope="session" /> <fmt:formatNumber
											value="${listVar.pagosRecibidos.add(listVar.ajustesRecibidos)}" type="currency"
											maxFractionDigits="3" pattern="$#,##0.0##" /></td>
									<td><c:out
											value="${fn:substring(listVar.fechaInicio,0,10).concat(' A ').concat(fn:substring(listVar.fechaFin,0,10))}" /></td>
									<td><c:out value="${listVar.moneda}" /></td>
								</tr>

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