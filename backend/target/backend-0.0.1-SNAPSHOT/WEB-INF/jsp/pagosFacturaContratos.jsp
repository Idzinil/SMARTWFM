<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<jsp:include page="headPagos.jsp"></jsp:include>
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
				style="margin-left: 10px;"> <spring:message  code="label.tittlePay"/>
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
								<td>
								<input type="text"	class="grupo" id="grupo" /></td>
								<td><spring:message  code="label.PagosFactContFiltroIdCont"/>:</td>
								<td>
								<input type="text"	class="grupo" id="contrato" /></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td><button id="btnBillingFiltroGrupos"><spring:message  code="label.PagosFactContFiltroBuscar"/></button>
								</td>
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
			<table style="width: 80%" id="test" align="center" class="tablePrincipal">
					<thead class="theadPrincipal">
						<tr class="letrathPrincipal">
						<th><spring:message  code="label.PagosFactTBPagoCtaContNoClient"/></th>
						<th><spring:message  code="label.PagosFactTBPagoCtaContAliasClient"/></th>
						<th><spring:message  code="label.PagosFactTBPagoCtaContNombrClient"/></th>
						<th><spring:message  code="label.PagosFactTBPagoCtaContAgBill"/></th>
						<th><spring:message  code="label.PagosFactTBPagoCtaContIdCont"/></th>
						<th><spring:message  code="label.PagosFactTBPagoCtaContDesFact"/></th>
						<th><spring:message  code="label.PagosFactTBPagoCtaContMontoSum"/></th>
						<th><spring:message  code="label.PagosFactTBPagoCtaContPagoRe"/></th>
						<th><spring:message  code="label.PagosFactTBPagoCtaContRestante"/></th>
						<th><spring:message  code="label.PagosFactTBPagoCtaContMone"/></th>
					</tr>
				</thead>
			<tbody id="fBody">
				<c:forEach var="listVar" items="${contratos}" 
					varStatus="status">
								<tr class="letraPrincipal" >
							<td><strong><c:out value="${listVar.cuenta.numCuenta}" /></strong></td>
							<td><c:out value="${listVar.cuenta.aliasCliente}" /></td>
							<td><c:out value="${listVar.cuenta.unidadFacturacion.datosFiscales.razonSocial}" /></td>
							<td id="grupo">${listVar.grupo}</td>	
							<td id="contrato"><a href="${pageContext.request.contextPath}/pagos/items/${listVar.factura.numeroFactura}/${listVar.idContrato}/${listVar.grupo}">
								<strong><c:out value="${listVar.idContrato}" /></strong></a>
							</td>
							<td>
								<label>${listVar.leyendaContrato}</label>
							</td>
							<td>
							<strong>
								<fmt:setLocale value="en_US"  scope="session"/>
       							<fmt:formatNumber value="${listVar.monto}" type="currency" maxFractionDigits="3" pattern="$#,##0.0##"/>
       						</strong>
							</td>
							<td>
							<strong>
								<fmt:setLocale value="en_US"  scope="session"/>
       							<fmt:formatNumber value="${listVar.pagado}" type="currency" maxFractionDigits="3" pattern="$#,##0.0##"/>
       						</strong>
       						</td>
       						<td>
       							<fmt:setLocale value="en_US"  scope="session"/>
       							<fmt:formatNumber value="${listVar.restante	}" type="currency" maxFractionDigits="3" pattern="$#,##0.0##"/>
       						</td>
							<td>${listVar.moneda}</td>
						</tr>
				</c:forEach>
				</tbody>
			</table>
			<p></p>
			<br> <br>


		</div>

	</div>
	<jsp:include page="divRegresarPrincipal.jsp" />

</body>
</html>