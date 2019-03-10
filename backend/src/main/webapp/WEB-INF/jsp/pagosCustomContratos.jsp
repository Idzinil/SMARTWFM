<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<jsp:include page="headPagos.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	var buttons = {
			btn1 : "#btnGuardar",
			btn2 : ".btnSimular"
	};
	var montos = {
			"${moneda}":${montoDispoPago}
	};
	pagosCuentasFacturas.compareMontos("#test",".montoPago",buttons,montos,"restante");
	
	pagosCuentasFacturas.simulaItems(".btnSimular","${pageContext.request.contextPath.concat(path)}","#simPago");
	pagosCuentasFacturas.action("#btnGuardar","${pageContext.request.contextPath.concat(pathGuardar)}","#simPago");
	pagosCuentasFacturas.limpiaContrato("${numeroFactura}","idContrato","B");
	pagosCuentasFacturas.action("#btnLimpiarTodo","${pageContext.request.contextPath.concat(pathLimpiar)}","#simPago");
});
</script>
</head>
<body>
<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">

Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    </div>
	<%
		int fact = 0;
	%>
	<jsp:include page="menu5.jsp" />

	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero">
			<img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px"
				style="margin-left: 10px;"> <spring:message  code="label.PagosCustTittle"/>
		</div>
	</div>
	<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">
			<div class="contenido">
				<div id="datos">
					<div id="datosForm1">
						<table class="letrath tableFiltroColor">
							<tr class="letrathPrincipal">
								<td><spring:message  code="label.PagosFactContFiltroAgrupBill"/>:</td>
								<td><input type="text" class="grupo" id="grupo" /></td>
								<td><spring:message  code="label.PagosFactContFiltroIdCont"/>:</td>
								<td><input type="text" class="grupo" id="contrato" /></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td><button id="btnBillingFiltroGrupos"><spring:message  code="label.PagosFactContFiltroBuscar"/></button></td>
								<td>
									<button id="btnBillgLimpiarFiltro"><spring:message  code="label.PagosFactContFiltroLimp"/></button>
								</td>
							</tr>
							<tr>
								<td class="letrath" bgcolor="#2584A7">
									<div id="errMsg"></div>
								</td>
								<td class="letrath" bgcolor="#2584A7"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div id="divDos">
			<div id="datosForm" align="center">
			<jsp:include page="divMontoPagarPagosCustom.jsp"  />
				<table  id="test" style="width: 90%"  align="center"
					class="tablePrincipal">
					<thead class="theadPrincipal">
						<tr class="letrathPrincipal">
							<th><spring:message
									code="label.PagosFactTBPagosCtaContPayCont" /> <input
								id="factura" type="checkbox" /></th>
							<th><spring:message
									code="label.PagosFactTBPagoCtaContNoClient" /></th>
							<th><spring:message
									code="label.PagosFactTBPagoCtaContAliasClient" /></th>
							<th><spring:message
									code="label.PagosFactTBPagoCtaContNombrClient" /></th>
							<th><spring:message
									code="label.PagosFactTBPagoCtaContAgBill" /></th>
							<th class="tdWidthContrato"><spring:message
									code="label.PagosFactTBPagoCtaContIdCont" /></th>
							<th><spring:message
									code="label.PagosFactTBPagoCtaContDesFact" /></th>
							<th><spring:message
									code="label.PagosFactTBPagoCtaContMontoSum" /></th>
							<th><spring:message  code="label.PagosCustTBMontoPagado"/></th>		
							<th><spring:message  code="label.PagosCustTBMontoPagadoAct"/></th>
							<th><spring:message
									code="label.PagosFactTBPagoCtaContRestante" /></th>
							<th><spring:message code="label.PagosFactTBPagoCtaContMone" /></th>
							<th class="tdWidthMontoPagar"><spring:message
									code="label.PagosFactTBPagosCtaContMontoPay" /></th>
							<th><spring:message	code="label.PagosCustTBAsignBtn" /></th>
							<th><spring:message  code="label.PagosCustTBCleanBtn"/></th>
						</tr>
					</thead>
					<tbody id="fBody">
						<form:form	id="simPago" action="${pageContext.request.contextPath.concat(path)}"	modelAttribute="cuenta">
							<c:forEach var="listVar" items="${factura.contratosFactura}" varStatus="status">
								<tr class="letraPrincipal">
									<td><form:checkbox id="${status.index+1 }"	path="unidadFacturacion.factura[${factura.indexFactura }].contratosFactura[${status.index}].contratoSelected"											
									class="${ listVar.status}"></form:checkbox></td>
									<td><strong><c:out value="${cuenta.numCuenta}" /></strong></td>
									<td><c:out value="${cuenta.aliasCliente}" /></td>
									<td><c:out
											value="${cuenta.unidadFacturacion.datosFiscales.razonSocial}" /></td>
									<td id="grupo">${listVar.grupo}</td>
									<td id="contrato"><label class="idContrato"><a
										href="${pageContext.request.contextPath}/pagos/custom/items/${cuenta.numCuenta}/${numeroFactura}/${listVar.idContrato}">
											<strong><c:out value="${listVar.idContrato}" /></strong>
									</a></label></td>
									<td><label>${listVar.leyendaContrato}</label></td>
									<td><strong> <fmt:setLocale value="en_US"
												scope="session" /> <fmt:formatNumber
												value="${listVar.monto}" type="currency"
												maxFractionDigits="3" pattern="$#,##0.0##" />
									</strong></td>
									<td><strong> <fmt:setLocale value="en_US"
												scope="session" /> <fmt:formatNumber
												value="${listVar.pagado}" type="currency"
												maxFractionDigits="3" pattern="$#,##0.0##" /></strong></td>
									<td><label class="lblMontoPagar"><strong> <fmt:setLocale value="en_US"
												scope="session" /> <fmt:formatNumber
												value="${listVar.montoPagarContrato}" type="currency"
												maxFractionDigits="3" pattern="$#,##0.0##" /></strong></label></td>
									<td><label class="restante"><fmt:setLocale value="en_US" scope="session" /> 
									<fmt:formatNumber	value="${listVar.sessionRestante	}" type="currency"	maxFractionDigits="3" pattern="$#,##0.0##" /></label></td>
									<td><strong><label class="moneda">${listVar.moneda}</label></strong></td>
									<td><form:input type="text" class="montoPago" placeholder="0" disabled="${ listVar.status=='2'}"
											path="unidadFacturacion.factura[${factura.indexFactura }].contratosFactura[${status.index }].sessionMontoAsignado"></form:input></td>
									<td><button type="button" id="${status.index }" class="btnSimular" <c:if test="${ listVar.status=='2'}"> disabled="true"</c:if>><spring:message	code="label.PagosCustTBAsignBtn" /></button></td>
									<td><button type="button" id="${status.index }" class="btnLimpiar"><spring:message	code="label.PagosCustTBCleanBtn" /></button></td>
								</tr>
							</c:forEach>
							<tr class="tdRowColor">
																<form:hidden path="unidadFacturacion.factura[${factura.indexFactura }].numeroFactura"/>
									<form:hidden path="unidadFacturacion.factura[${factura.indexFactura }].estatusFactura"/>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><br/><button type="button" id="btnGuardar"><spring:message	code="label.PagosCustTBSaveBtn" /></button>
								<td><br/><button id="btnLimpiarTodo" type="button" ><spring:message	code="label.PagosCustTBCleanBtn" /></button></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</form:form>
					</tbody>
				</table>
			</div>
</div>
		</div>
		<jsp:include page="divRegresarPrincipal.jsp" />
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