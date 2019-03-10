<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<jsp:include page="headPagos.jsp"></jsp:include>
</head>
<body>
<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    </div>
	<%int index = 0;%>
	<jsp:include page="menu5.jsp" />
	<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">
			<div class="contenido">
				<div id="datos">
					<div id="datosForm1" style="width: auto;">

						<table style="width: 80%" class="tableFiltroColor">
							<tr class="letrathPrincipal">
								<td><spring:message  code="label.PagosFactContItTBOrderId"/>:</td>
								<td><input id="orderID" class="resContratos" /></td>
								<td><spring:message  code="label.PagosFactContItTBNoItem"/>:</td>
								<td><input id="numeroItem" class="resContratos" /></td>
								<td><spring:message  code="label.PagosFactContItTBFechIn"/>:</td>
								<td><input id="fechaInicio" class="resContratos" /></td>
								<td><spring:message  code="label.PagosFactContItTBFechFin"/>:</td>
								<td><input id="fechaFin" class="resContratos" /></td>

							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>
									<button id="btnBillginFiltroBuscarResumenContratos" /><spring:message  code="label.PagosFactContFiltroBuscar"/>
									</button>
								</td>
								<td>&nbsp;</td>
								<td>
									<button id="btnBillgLimpiarFiltro" /><spring:message  code="label.PagosFactContFiltroLimp"/>
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
								<th><spring:message  code="label.PagosFactTBPagoCtaContItemNoClient"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCtaContItemAliasClient"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCtaContItemNombrClient"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCtaContItemIdCont"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCtaContItemAgBill"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCtaContItemOrderId"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCtaContItemCap"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCtaContItemLeye"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCtaContItemMontFact"/> </th>
								<th><spring:message  code="label.PagosFactTBPagoCtaContItemDeuda"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCtaContItemPagosRe"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCtaContItemMone"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCtaContItemTipCar"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCtaContItemNumItem"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCtaContItemFechInicio"/></th>
								<th><spring:message  code="label.PagosFactTBPagoCtaContItemFechFin"/></th>

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
										<td><strong><c:out value="${listVar.idContrato}" /></strong></td>
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