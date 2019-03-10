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
<script
	src="<c:url value="/js/facturacion/pantallaPrincipalBilling.js"/>"></script>
<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
</head>
<body>
	<%
		int fact = 0;
	%>
	<jsp:include page="menu5.jsp" />

	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero">
			<img src="/SmartBilling/img/das.png" width="16px" height="16px"
				style="margin-left: 10px;"> FACTURACIÓN
		</div>
	</div>
	<div id="tableroSmartBilling">
	<div id="ventanaSmartBilling">
		<div class="contenido">
				<div id="datos">
					<div id="datosForm1">
						<table class="letrath tableFiltroColor">
							<tr class="letrathPrincipal">
								<td>Agrupador Bill:</td>
								<td>
								<input type="text"	class="grupo" id="grupo" /></td>
								<td>ID Contrato:</td>
								<td>
								<input type="text"	class="grupo" id="contrato" /></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td><button id="btnBillingFiltroGrupos">Buscar</button>
								</td>
								<td>
										<button id="btnBillgLimpiarFiltro">Limpiar</button>
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
						<th>Número Cliente</th>
						<th>Alias Cliente</th>
						<th>Nombre Cliente</th>
						<th>Agrupador Bill</th>
						<th>ID Contrato</th>
						<th>Descripción Factura</th>
						<th>Monto Suma</th>
						<th>Pagos Recibidos</th>
						<th>Restante</th>
						<th>Moneda</th>
					</tr>
				</thead>
			<tbody id="fBody">
				<c:forEach var="listVar1" items="${cuenta.unidadFacturacion.factura}" varStatus="status">
					<c:forEach var="listVar" items="${listVar1.contratosFactura}" varStatus="status">
								<tr class="letraPrincipal" >
							<td><strong><c:out value="${cuenta.numCuenta}" /></strong></td>
							<td><c:out value="${cuenta.aliasCliente}" /></td>
							<td><c:out value="${cuenta.unidadFacturacion.datosFiscales.razonSocial}" /></td>
							<td id="grupo">${listVar.grupo}</td>	
							<td id="contrato"><a href="${pageContext.request.contextPath}/test/pagos/item/${cuenta.numCuenta}/${numeroFactura}/${listVar.idContrato}/${listVar.grupo}">
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
       							<fmt:formatNumber value="${listVar.monto	}" type="currency" maxFractionDigits="3" pattern="$#,##0.0##"/>
       						</td>
							<td>${listVar.moneda}</td>
						</tr>
					</c:forEach>	
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