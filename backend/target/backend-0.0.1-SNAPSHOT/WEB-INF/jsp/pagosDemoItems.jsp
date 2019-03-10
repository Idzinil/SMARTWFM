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
<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
<script
	src="<c:url value="/js/facturacion/pantallaPrincipalBilling.js"/>"></script>
<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
</head>
<body>
	<%int index = 0;%>
	<jsp:include page="menu5.jsp" />
	<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">
			<div class="contenido">
				<div id="datos">
					<div id="datosForm1" style="width: auto;">

						<table style="width: 80%" class="tableFiltroColor">
							<tr class="letrathPrincipal">
								<td>Order Id:</td>
								<td><input id="orderID" class="resContratos" /></td>
								<td>Numero Item:</td>
								<td><input id="numeroItem" class="resContratos" /></td>
								<td>Fecha Inicio:</td>
								<td><input id="fechaInicio" class="resContratos" /></td>
								<td>Fecha Fin:</td>
								<td><input id="fechaFin" class="resContratos" /></td>

							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>
									<button id="btnBillginFiltroBuscarResumenContratos" />Buscar
									</button>
								</td>
								<td>&nbsp;</td>
								<td>
									<button id="btnBillgLimpiarFiltro" />Limpiar
									</button>
								</td>
							</tr>
							<tr>
								<td>
									<div id="errMsg"></div>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
				<form:form method="POST"
					action="${pageContext.request.contextPath}/actualizaDatosClienteFacturar/${contrato}"
					modelAttribute="billDataCuenta">
					<table style="width: 100%" id="test" class="tablePrincipal"
						align="center">
						<thead class="theadPrincipal">
							<tr class="letrathPrincipal">
								<th>Número Cliente</th>
								<th>Alias Cliente</th>
								<th>Nombre Cliente</th>
								<th>ID Contrato</th>
								<th>Agrupador Bill</th>
								<th>Order Id</th>
								<th>Capacidad</th>
								<th>Leyenda OT(Detalle)</th>
								<th>Monto Facturado</th>
								<th>Deuda</th>
								<th>Pagos Recibidos</th>
								<th>Moneda</th>
								<th>Tipo Cargo</th>
								<th>Numero Item</th>
								<th>Fecha Inicio</th>
								<th>Fecha Fin</th>

							</tr>
						</thead>
						<tbody id="fBody">
							<c:forEach var="listVar"
								items="${billDataCuenta.unidadFacturacion.compras}"
								varStatus="status">
								<c:forEach var="listVar2" items="${listVar.item}"
									varStatus="status">
									<tr class="letraPrincipal">
										<td><strong><c:out
													value="${billDataCuenta.numCuenta}" /></strong></td>
										<td><c:out value="${billDataCuenta.aliasCliente}" /></td>
										<td><c:out
												value="${billDataCuenta.unidadFacturacion.datosFiscales.razonSocial}" /></td>
										<td><strong><c:out value="${contrato}" /></strong></td>
										<td><c:out value="${listVar.agrupacionDeal.grupo}" /></td>
										<td id="orderID"><c:out value="${listVar.orderId}" /></td>
										<td><c:out value="${listVar.producto.capacidad}" /></td>
										<td><c:out
												value="${listVar.descripcionOverride==''?listVar.producto.descripcion:listVar.descripcionOverride}" /></td>
										<c:if test="${listVar2.montoItemImpuestos>0}">
											<td><strong> <fmt:setLocale value="en_US"
														scope="session" /> <fmt:formatNumber
														value="${listVar2.montoItemImpuestos}" type="currency"
														maxFractionDigits="3" pattern="$#,##0.0##" />
											</strong></td>
										</c:if>
										<c:if test="${listVar2.montoItemProrrateo>0}">
											<td><strong> <fmt:setLocale value="en_US"
														scope="session" /> <fmt:formatNumber
														value="${listVar2.montoItemProrrateo}" type="currency"
														maxFractionDigits="3" pattern="$#,##0.0##" />
											</strong></td>
										</c:if>
										<td><strong> <fmt:setLocale value="en_US"
													scope="session" /> <fmt:formatNumber
													value="${listVar2.deudaItem}" type="currency"
													maxFractionDigits="3" pattern="$#,##0.0##" />
										</strong></td>
										<td><strong> <fmt:setLocale value="en_US"
													scope="session" /> <fmt:formatNumber
													value="${listVar2.montoPagoItem}" type="currency"
													maxFractionDigits="3" pattern="$#,##0.0##" />
										</strong></td>
										<td>0.0</td>
										<td><c:out value="${listVar.moneda}" /></td>
										<td><c:out value="${listVar.producto.tipoCargo}" /></td>
										<td id="numeroItem"><strong><c:out
													value="${listVar2.numeroItem}" /></strong></td>
										<td id="fechaInicio"><c:out
												value="${fn:substring(listVar2.fechaInicio,0,10)}" /></td>
										<td id="fechaFin"><c:out
												value="${fn:substring(listVar2.fechaFin,0,10)}" /></td>
									</tr>
								</c:forEach>
							</c:forEach>
						</tbody>
					</table>
				</form:form>

			</div>
			<jsp:include page="divRegresarPrincipal.jsp" />

		</div>
	</div>

</body>
</html>