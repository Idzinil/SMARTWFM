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
<script type="text/javascript">
$(document).ready(function(){
	var buttons = {
			btn1 : "#btnGuardar",
			btn2: ".btnSimular"
	};
	var montos = {
			"${moneda}":${montoDispoPago}
	};
	pagosCuentasFacturas.simulaItems(".btnSimular","${pageContext.request.contextPath.concat(pathSimula)}","#simPago");
	pagosCuentasFacturas.action("#btnGuardar","${pageContext.request.contextPath.concat(path)}","#simPago");
	pagosCuentasFacturas.compareMontos("#test",".montoPago",buttons,montos,"restante");
	pagosCuentasFacturas.limpiaContrato("${numeroFactura}","idContrato","C");

});
</script>
</head>
<body>
<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">

Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    </div>
	<%
		int index = 0;
	%>
	<jsp:include page="menu5.jsp" />
	<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">
			<div class="contenido">
				<div id="datos">
					<div id="datosForm1" style="width: auto;">

						<table style="width: 80%" class="tableFiltroColor">
							<tr class="letrathPrincipal">
								<td><spring:message code="label.PagosFactContItTBOrderId" />:</td>
								<td><input id="orderID" class="resContratos" /></td>
								<td><spring:message code="label.PagosFactContItTBNoItem" />:</td>
								<td><input id="numeroItem" class="resContratos" /></td>
								<td><spring:message code="label.PagosFactContItTBFechIn" />:</td>
								<td><input id="fechaInicio" class="resContratos" /></td>
								<td><spring:message code="label.PagosFactContItTBFechFin" />:</td>
								<td><input id="fechaFin" class="resContratos" /></td>

							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>
									<button id="btnBillginFiltroBuscarResumenContratos" /> <spring:message
										code="label.PagosFactContFiltroBuscar" />
									</button>
								</td>
								<td>&nbsp;</td>
								<td>
									<button id="btnBillgLimpiarFiltro" /> <spring:message
										code="label.PagosFactContFiltroLimp" />
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
				<div id="datosForm" align="center">
				<table class="tablePrincipal"style="width: 100%" align="center"
	>
	<tbody>
		<tr>
			<td><strong><spring:message  code="label.PagosCustInfMontoPagoIngr"/> ${tipo} :</strong> <fmt:setLocale value="en_US"
						scope="session" /> <fmt:formatNumber value="${montoPagar}"
						type="currency" maxFractionDigits="3" pattern="$#,##0.0##" /> ${moneda}</td>
		</tr>
		<tr>
			<td><strong><spring:message  code="label.PagosCustInfoDeuda"/> ${tipo} : </strong><fmt:setLocale value="en_US"
						scope="session" /> <fmt:formatNumber value="${deuda}"
						type="currency" maxFractionDigits="3" pattern="$#,##0.0##" /> ${moneda}</td>
		</tr>
		<tr>
			<td><strong><spring:message  code="label.PagosCustInfMontoPagoDispo"/> :</strong> <fmt:setLocale value="en_US"
						scope="session" /> <fmt:formatNumber value="${montoDispoPago}"
						type="currency" maxFractionDigits="3" pattern="$#,##0.0##" /> ${moneda}</td>
		</tr>
	</tbody>
</table>
				<form:form id="simPago" method="POST"
					action="${pageContext.request.contextPath.concat(path)}"
					modelAttribute="billDataCuenta">
					<div id="dTPagos">
					
					<table style="width: 150%" id="test" class="tablePrincipal"
						align="center">
						<thead class="theadPrincipal">
							<tr class="letrathPrincipal">
								<th><spring:message
										code="label.PagosFactTBPagoCtaContItemNoClient" /></th>
								<th><spring:message
										code="label.PagosFactTBPagoCtaContItemAliasClient" /></th>
								<th><spring:message
										code="label.PagosFactTBPagoCtaContItemNombrClient" /></th>
								<th class="tdWidthContratoItem"><spring:message
										code="label.PagosFactTBPagoCtaContItemIdCont" /></th>
								<th><spring:message
										code="label.PagosFactTBPagoCtaContItemAgBill" /></th>
								<th><spring:message
										code="label.PagosFactTBPagoCtaContItemOrderId" /></th>
								<th><spring:message
										code="label.PagosFactTBPagoCtaContItemCap" /></th>
								<th><spring:message
										code="label.PagosFactTBPagoCtaContItemLeye" /></th>
								<th><spring:message
										code="label.PagosFactTBPagoCtaContItemMontFact" /></th>
								<th><spring:message
										code="label.PagosFactTBPagoCtaContItemDeuda" /></th>
								<th><spring:message  code="label.PagosCustTBMontoPagado"/></th>
								<th><spring:message  code="label.PagosCustTBMontoPagadoAct"/></th>
								<th><spring:message
										code="label.PagosFactTBPagoCtaContItemMone" /></th>		
								<th class="tdWidthMontoPagarItem"><spring:message  code="label.PagosCustTBMontoPagar"/></th>
								<th><spring:message
										code="label.PagosFactTBPagoCtaContItemTipCar" /></th>
								<th><spring:message
										code="label.PagosFactTBPagoCtaContItemNumItem" /></th>
								<th><spring:message
										code="label.PagosFactTBPagoCtaContItemFechInicio" /></th>
								<th><spring:message
										code="label.PagosFactTBPagoCtaContItemFechFin" /></th>
								<th><spring:message  code="label.PagosCustTBAsignBtn"/></th>
								<th><spring:message  code="label.PagosCustTBCleanBtn"/></th>		

							</tr>
						</thead>
						<tbody id="fBody">
							<c:forEach var="lisItem" items="${lisItem}" varStatus="status">
								<tr class="letraPrincipal">
									<td><strong><c:out
												value="${billDataCuenta.numCuenta}" /></strong></td>
									<td><c:out value="${billDataCuenta.aliasCliente}" /></td>
									<td><c:out
											value="${billDataCuenta.unidadFacturacion.datosFiscales.razonSocial}" /></td>
									<td><label class="idContrato"><strong><c:out
												value="${lisItem.compra.idContrato}" /></strong></label></td>
									<td><c:out value="${lisItem.compra.agrupacionDeal.grupo}" /></td>
									<td id="orderID"><c:out value="${lisItem.compra.orderId}" /></td>
									<td><c:out value="${lisItem.compra.producto.capacidad}" /></td>
									<td><c:out
											value="${lisItem.compra.descripcionOverride==''?lisItem.compra.producto.descripcion:lisItem.compra.descripcionOverride}" /></td>
									<c:if test="${lisItem.montoItemImpuestos>0}">
										<td><strong> <fmt:setLocale value="en_US"
													scope="session" /> <fmt:formatNumber
													value="${lisItem.montoItemImpuestos}" type="currency"
													maxFractionDigits="3" pattern="$#,##0.0##" />
										</strong></td>
									</c:if>
									<c:if test="${lisItem.montoItemProrrateo>0}">
										<td><strong> <fmt:setLocale value="en_US"
													scope="session" /> <fmt:formatNumber
													value="${lisItem.montoItemProrrateo}" type="currency"
													maxFractionDigits="3" pattern="$#,##0.0##" />
										</strong></td>
									</c:if>
									<td><label class="restante"><strong> <fmt:setLocale value="en_US"
												scope="session" /> <fmt:formatNumber
												value="${lisItem.sessionDeuda}" type="currency"
												maxFractionDigits="3" pattern="$#,##0.0##" />
									</strong></label></td>
									<td><strong> <fmt:setLocale value="en_US"
												scope="session" /> <fmt:formatNumber
												value="${lisItem.montoPagoItem}" type="currency"
												maxFractionDigits="3" pattern="$#,##0.0##" />
									</strong></td>
									<td><strong> <fmt:setLocale value="en_US"
												scope="session" /> <fmt:formatNumber
												value="${lisItem.montoPagarItem}" type="currency"
												maxFractionDigits="3" pattern="$#,##0.0##" />
									</strong></td>
									<td><strong><label class="moneda"><c:out value="${lisItem.compra.moneda}" /></label></strong></td>
									<td><form:input type="text" class="montoPago" disabled="${ lisItem.status=='2'}" placeholder="0"
											path="unidadFacturacion.factura[${indexFactura }].contratosFactura[${indexContrato }].items[${status.index }].sessionMontoAsignado"></form:input></td>
									<td><c:out value="${lisItem.compra.producto.tipoCargo}" /></td>
									<td id="numeroItem"><strong><c:out
												value="${lisItem.numeroItem}" /></strong></td>
									<td id="fechaInicio"><c:out
											value="${fn:substring(lisItem.fechaInicio,0,10)}" /></td>
									<td id="fechaFin"><c:out
											value="${fn:substring(lisItem.fechaFin,0,10)}" /></td>
									<td><button id="${status.index }" type="button" class="btnSimular" <c:if test="${ listVar.status=='2'}"> disabled="true"</c:if>><spring:message  code="label.PagosCustTBAsignBtn"/></button></td>
									<td><button id="${status.index }" type="button" class="btnLimpiar"><spring:message  code="label.PagosCustTBCleanBtn"/></button></td>						
								</tr>
							</c:forEach>
							<tr class="tdRowColor">
									<form:hidden path="unidadFacturacion.factura[${indexFactura }].numeroFactura"/>
									<form:hidden path="unidadFacturacion.factura[${indexFactura }].estatusFactura"/>
									<form:hidden path="unidadFacturacion.factura[${indexFactura }].contratosFactura[${indexContrato }].idContrato"/>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><br/><button type="submit" id="btnGuardar"><spring:message  code="label.PagosCustTBSaveBtn"/></button>
								<td><br/><button id="btnLimpiarTodo" type="button" ><spring:message  code="label.PagosCustTBCleanBtn"/></button></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
					</div>
				</form:form>
				</div>
			</div>
			<jsp:include page="divRegresarPrincipal.jsp" />

		</div>
	</div>

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