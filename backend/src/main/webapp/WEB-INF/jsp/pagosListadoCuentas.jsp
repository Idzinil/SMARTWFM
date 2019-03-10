<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<table style="width: 80%" class="tablePrincipal" align="center">
	<thead class="theadPrincipal"> 
		<tr class="letrathPrincipal">
			<th><spring:message    code="label.PagosTBNumCliente" /></th>
			<th><spring:message    code="label.PagosTBAliasCli" /></th>
			<th><spring:message    code="label.PagosTBNombreClie" /></th>
			<th><spring:message    code="label.PagosTBDeparta" /></th>
		</tr>
	</thead>
	<c:forEach items="${cuentas}" var="cuenta" varStatus="status">
		<tr class="letraPrincipal">
			<td><a
				href="${ pageContext.request.contextPath.concat(path.concat(cuenta.numCuenta))}"><c:out
						value="${cuenta.numCuenta}" /></a></td>
			<td><c:out value="${cuenta.aliasCliente}" /></td>
			<td><c:out
					value="${cuenta.unidadFacturacion.datosFiscales.razonSocial}" /></td>
			<td><c:out value="${cuenta.region}" /></td>
		</tr>
	</c:forEach>
</table>