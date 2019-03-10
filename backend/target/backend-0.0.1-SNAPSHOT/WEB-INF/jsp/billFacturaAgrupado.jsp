<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SMARTBILLING - Sytecso System</title>
<link href="<c:url value="/css/estiloSytecso.css" />"
	rel="stylesheet">
<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
<script src="<c:url value="/js/Sytecso/sytecso.js"/>"></script>
<script	src="<c:url value="/js/facturacion/pantallaPrincipalBilling.js"/>"></script>
<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	border-color: 1px #D8D8D8;
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
	font-size: 13px !important;
	color: #1C1C1C !important;
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
		'Lucida Sans', Arial, sans-serif;
}

.letrath {
				font-size: 14px;
				color:white !important;
				font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
				}

.letrap {
	font-size: 18px !important;
	color: #1C1C1C !important;
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
		'Lucida Sans', Arial, sans-serif;
}
</style>
</head>
<body>
      <div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
		Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
 	</div>
	<%
		int fact = 0;
	%>
	<jsp:include page="menu3.jsp" />

	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero">
			<img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px"
				style="margin-left: 10px;"> <spring:message  code="label.tittleFact"/>
		</div>
	</div>
	<div id="tableroSmartBilling">
	<div id="ventanaSmartBilling">
		<div class="contenido">
				<div id="datos">
					<div id="datosForm1">

						<table style="width: 100%" class="letrath" style="border:none;">

							<tr>
								<td class="letrath" bgcolor="#2584A7"><spring:message  code="label.FactBillFactAgrFact"/></td>
								<td class="letrath" bgcolor="#2584A7">
								<input type="text"	class="grupo" id="grupo" /></td>
								<td class="letrath" bgcolor="#2584A7"><spring:message  code="label.FactBillFactAgrIdAg"/></td>
								<td class="letrath" bgcolor="#2584A7">
								<input type="text"	class="grupo" id="contrato" /></td>
							</tr>
							<tr>
								<td class="letrath" bgcolor="#2584A7">&nbsp;</td>
								<td class="letrath" bgcolor="#2584A7">
								<button id="btnBillingFiltroGrupos"><spring:message  code="label.FactBillFactAgrBusca"/></button>
								</td>
								<td bgcolor="#2584A7">
										<button id="btnBillgLimpiarFiltro"><spring:message  code="label.FactBillFactAgrLimp"/></button>
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
		<p class="letrap">
			<n><spring:message  code="label.FactBillFactAgrFactCta"/></n>
		</p>
		<div id="divDos">
			<table style="width: 80%" id="test" align="center" class="letrath">
				<thead class="letrath">
					<tr class="letrath">
						<th><spring:message  code="label.FactBillFactAgrTbNoClient"/></th>
						<th><spring:message  code="label.FactBillFactAgrTbAlClien"/></th>
						<th><spring:message  code="label.FactBillFactAgrTbNomClien"/></th>
						<th><spring:message  code="label.FactBillFactAgrTbFact"/></th>
						<th><spring:message  code="label.FactBillFactAgrTbIdAg"/></th>
						<th><spring:message  code="label.FactBillFactAgrTbDesFact"/></th>
						<th><spring:message  code="label.FactBillFactAgrTbMonSum"/></th>
						<th><spring:message  code="label.FactBillFactAgrTbCurency"/></th>
						<c:if test="${isVisible }">
						<th><spring:message  code="label.FactBillFactAgrTbActDes"/></th>
						</c:if>
					</tr>
				</thead>
			<tbody id="fBody">
				<c:forEach var="listVar" items="${contratos}" varStatus="status">
					<form:form method="GET"
						action="${pageContext.request.contextPath.concat(path)}${listVar.idContrato}/${ listVar.grupo}"
						modelAttribute="unidad">
						<tr class=" letratd" style="color:  black;">
							<td><strong><c:out value="${listVar.cuenta.numCuenta}" /></strong></td>
							<td><c:out value="${listVar.cuenta.aliasCliente}" /></td>
							<td><c:out value="${listVar.cuenta.unidadFacturacion.datosFiscales.razonSocial}" /></td>
							<td id="grupo">${listVar.grupo}</td>
							<c:if test="${isVisible }">
							<td id="contrato">
							<c:if test="${verAgrupado}">
								<a href="${pageContext.request.contextPath}/verDatosAgrupados/${listVar.idContrato}/${listVar.grupo}">
							</c:if>								
								<strong><c:out value="${listVar.idContrato}" /></strong></a>
							</td>
							</c:if>	
							<c:if test="${!isVisible }">
							<td id="contrato"><a href="${pageContext.request.contextPath.concat(path).concat(listVar.idContrato).concat("/").concat(listVar.grupo)}">
								<strong><c:out value="${listVar.idContrato}" /></strong></a>
							</td>
							</c:if>
							<td>
								<label>${listVar.leyendaContrato}</label>
							</td>
							<td>
							<strong>
								<fmt:setLocale value="en_US"  scope="session"/>
       							<fmt:formatNumber value="${listVar.monto}" type="currency" maxFractionDigits="4" pattern="$#,##0.0###"/>
       						</strong>
							</td>
							<td>${listVar.moneda}</td>
							<c:if test="${isVisible }">
							<spring:message  code="label.FactBillFactAgrTbBtnAcgt" var="Act"/> 
								<td><input type="submit" value="${Act }" class="w3-button w3-black w3-round-large"></td>
							</c:if>
						</tr>
					</form:form>
				</c:forEach>
				</tbody>
			</table>
			<p></p>
			<br> <br>
		</div>

	</div>
	<div id="datosbotonesComp">
		<div id="botonBack">
				<div class="col-sm-6">
					<a href="${pageContext.request.contextPath.concat(pathRegresar)}"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar"/></a>
				</div>
			</div>
		<div id="botonHome">
				<div class="col-sm-6">
					<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/home.png"><spring:message  code="label.NavPrin"/></a>
				</div>
			</div>
		</div>
</body>
</html>